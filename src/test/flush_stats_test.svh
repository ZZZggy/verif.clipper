//------------------------------------------------------------------------------
// ACCEDIAN NETWORKS
// High Performance Service Assurance (TM)
//
// Accedian Networks, Inc.
// 2351 Alfred-Nobel Blvd., Suite N-410
// Saint-Laurent (Montreal), Quebec
// H4S 2A9
// Canada
// E-mail: support@accedian.com
// Website: www.accedian.com
//
// ACCEDIAN PROPRIETARY
//
// COPYRIGHT (c) BY ACCEDIAN CORPORATION. ALL RIGHTS RESERVED. NO
// PART OF THIS PROGRAM OR PUBLICATION MAY BE REPRODUCED, TRANSMITTED,
// TRANSCRIBED, STORED IN A RETRIEVAL SYSTEM, OR TRANSLATED INTO ANY LANGUAGE
// OR COMPUTER LANGUAGE IN ANY FORM OR BY ANY MEANS, ELECTRONIC, MECHANICAL,
// MAGNETIC, OPTICAL, CHEMICAL, MANUAL, OR OTHERWISE, WITHOUT THE PRIOR
// WRITTEN PERMISSION OF ACCEDIAN INC.
//------------------------------------------------------------------------------

`ifndef FLUSH_STATS_TEST__SVH
`define FLUSH_STATS_TEST__SVH

// Class: flush_stats_test
//
// Force frame discards to increment flush stats registers.
//
// Send pause frame to all interfaces with maximum pause quanta.
// Send initial 10KiB frames on IF ports and 1518B in CPU port to fill buffers.
// Finally send configurable number of 64B frames back-to-back.
// Compare at the check phase the flush stats read from DUT and the Lost stats from the Scoreboards.
//
//--------------------------------------------------------------------------------------------------
// PLUSARGS:
// +STIM_CNT_TIME_US=<int>  Number of 64B to be sent in each port
//--------------------------------------------------------------------------------------------------
class flush_stats_test extends pause_frame_test;

    // Constant: MAX_IF_FRAME
    // Maximum frame sent to interface ports
    const bit[13:0] MAX_IF_FRAME = 10240;

    // Variable: flush_stats
    // Flush stats values read from regmodel
    reg_info_t flush_stats;

    `uvm_component_utils(flush_stats_test)

    // Constructor: new
    function new(string name="flush_stats_test", uvm_component parent=null);
        super.new(name, parent);
        if (!cfg.randomize()) `randerr
        // Set port speeds to maximum supported
        cfg.port_speed[PORT_CPU]        = PS_1G;
        cfg.port_speed[PORT_AUX[0]]     = PS_10G;  // to avoid stats update error, send line rate 64B packets in up to 4 x 10G interfaces
        cfg.port_speed[PORT_AUX[1]]     = PS_10G;
        cfg.port_speed[PORT_AUX[2]]     = PS_10G;
        cfg.port_speed[PORT_AUX[3]]     = PS_10G;
        cfg.port_speed[PORT_TRAFFIC[0]] = PS_10G;
        cfg.port_speed[PORT_TRAFFIC[1]] = PS_10G;
        cfg.port_speed[PORT_MGMT]       = PS_1G;
        // Stimuli control
        cfg.stim_cnt_time_us = 30;
        // 10us end-of-test drain
        cfg.eot_win_cnt = 100;
        // Enable CLI overrides for test parameters
        parse_cli_test_cfg();
    endfunction


    //---------------------------------------
    // Group: UVM phase overrides
    //---------------------------------------

    // Task: configure_phase
    // Configure input section for loopback
    virtual task configure_phase(uvm_phase phase);
        phase.raise_objection(this);
        super.configure_phase(phase);

        // Disable PC engine
        disable_pce();

        // Configure Input Section
        configure_insect(.cross_traffic(0), .mon_fwd(1), .cpu_fwd(1));


        // Allow large IF2CPU(MTU) and MGMT(MRU) frames
        begin
            uvm_status_e status;
            env.regmodel.globals.cpu_mtu_size.set(MAX_IF_FRAME);
            env.regmodel.globals.cpu_mtu_size.update(status);
            env.regmodel.mac_if.tse_mac[PORT_MGMT].rx.cfg.mru.set(MAX_IF_FRAME); //FIXME(CS): Max MGMT MRU may be actually 4k, but still with 10K, flush is exercised
            env.regmodel.mac_if.tse_mac[PORT_MGMT].rx.cfg.update(status);
        end

        // Mask out timestamp comparison due to congestion
        env.predictor.x2cpu.cfg.compensation_ena = '1;
        env.predictor.x2cpu.cfg.tolerance_timestamp_if = acd_uvm_pkg::MAX_TOLERANCE;

        // Force timebase to zero also to avoid timestamp errors
        ctrl_vif.timebase_force = '1;
        ctrl_vif.timebase_time = 'h0;

        // Scoreboard config
        foreach (env.eth_sb[i]) begin
            env.eth_sb[i].cfg.allow_discard = 1;
            env.eth_sb[i].reporter[SB_LOST].cfg.ena = 0;
        end

        phase.drop_objection(this);
    endtask


    // Task: main_phase
    // Send inital pause frames in all interfaces
    // Next send large packets to fill the TBBs
    // Finaly send many 64B packets to increment flush stats
    virtual task main_phase(uvm_phase phase);
        phase.raise_objection(this);

        // Pause interfaces
        pause_gen(16'hFFFF);

        fork
            // IF Traffic
            begin
                if_traffic(MAX_IF_FRAME, 8);
                if_traffic(64, cfg.stim_cnt_time_us, '{PORT_AUX[0], PORT_AUX[1], PORT_TRAFFIC[0], PORT_TRAFFIC[1]});
                pause_gen(16'hFFFF);  // reinforce pause

                configure_insect(.cross_traffic(1));
                if_traffic(MAX_IF_FRAME, 8);
                if_traffic(64, cfg.stim_cnt_time_us, '{PORT_AUX[2], PORT_AUX[3], PORT_TRAFFIC[0], PORT_TRAFFIC[1]});
            end

            // CPU2IF - single source: CPU Port - multiple destinations
            begin
                cpu2if_traffic(1518, 4);                   // ports 1 to 6 + MGMT
                cpu2if_traffic(1518, 12, 7, 1);            // port MGMT only (16KiB buffer for CPU->MGMT)
                cpu2if_traffic(80, cfg.stim_cnt_time_us);  // ports 1 to 6 + MGMT, frame size = 64B + 16B THI overhead
            end
        join

        // Release Pause
        pause_gen(16'h0001);

        phase.drop_objection(this);
    endtask


    // Task: shutdown_phase
    // Read flush stats and display results
    virtual task shutdown_phase(uvm_phase phase);
        read_flush_stats_vseq read_flush_seq;
        phase.raise_objection(this);
        super.shutdown_phase(phase);

        read_flush_seq = read_flush_stats_vseq::type_id::create("read_flush_seq");
        read_flush_seq.reg_block = env.regmodel.tm_c2.tm_c2_flush_stats;
        init_vseq(read_flush_seq);

        // Read from DUT
        read_flush_seq.start(null);
        flush_stats = read_flush_seq.get_flush_stats();

        `uvm_info("TEST", {"Read Flush Stats:", read_flush_seq.convert2string()}, UVM_HIGH)

        phase.drop_objection(this);
    endtask

    // Function: check_phase
    // Compare Read flush stats with Scoreboard stats
    virtual function void check_phase(uvm_phase phase);
        // Expected flush stats
        struct {
            string label;
            longint value;
        } exp_stats[$];
        // Total expected flush in MON paths
        longint total_flush_mon[1:2];
        // MON flush values read from regmodel
        longint p5_to_mon[1:2]; // Port 5 to MON 1 / 2
        longint p6_to_mon[1:2]; // Port 6 to MON 1 / 2
        longint p7_to_mon[1:2]; // Port 7 to MON 1 / 2
        longint p8_to_mon[1:2]; // Port 8 to MON 1 / 2
        longint mon_to_p[1:2];  // MON 1 to Port 1 / 2


        phase.raise_objection(this);
        super.check_phase(phase);

        // Expected total MON flush from scoreboard
        total_flush_mon[1] = env.eth_sb[1].stats[SB_LOST].get_flow_item_cnt(5)
                           + env.eth_sb[1].stats[SB_LOST].get_flow_item_cnt(6)
                           + env.eth_sb[1].stats[SB_LOST].get_flow_item_cnt(7)
                           + env.eth_sb[1].stats[SB_LOST].get_flow_item_cnt(8);
        total_flush_mon[2] = env.eth_sb[2].stats[SB_LOST].get_flow_item_cnt(5)
                           + env.eth_sb[2].stats[SB_LOST].get_flow_item_cnt(6)
                           + env.eth_sb[2].stats[SB_LOST].get_flow_item_cnt(7)
                           + env.eth_sb[2].stats[SB_LOST].get_flow_item_cnt(8);

        // Regmodel MON flush
        // FIXME Are these mappings correct???
        `define FLUSH_STATS_ADDR(INDEX) env.regmodel.tm_c2.tm_c2_flush_stats.flush_stats_``INDEX``.get_address()
        mon_to_p[1] = flush_stats[`FLUSH_STATS_ADDR(01)].value;
        mon_to_p[2] = flush_stats[`FLUSH_STATS_ADDR(04)].value;
        p5_to_mon[1] = flush_stats[`FLUSH_STATS_ADDR(19)].value;
        p6_to_mon[1] = flush_stats[`FLUSH_STATS_ADDR(1a)].value;
        p7_to_mon[1] = flush_stats[`FLUSH_STATS_ADDR(1b)].value;
        p8_to_mon[1] = flush_stats[`FLUSH_STATS_ADDR(1c)].value;
        p5_to_mon[2] = flush_stats[`FLUSH_STATS_ADDR(1d)].value;
        p6_to_mon[2] = flush_stats[`FLUSH_STATS_ADDR(1e)].value;
        p7_to_mon[2] = flush_stats[`FLUSH_STATS_ADDR(1f)].value;
        p8_to_mon[2] = flush_stats[`FLUSH_STATS_ADDR(20)].value;

        // Read expected flush stats from lost scoreboad
        // 0x000e8100 flush_stats_00
        exp_stats.push_back('{"CPU2IF - Port1 from Cpu", env.eth_sb[1].stats[SB_LOST].get_flow_item_cnt(PORT_CPU)});
        // 0x000e8101 flush_stats_01 (config MON1 = TRF Ports)
        exp_stats.push_back('{"IF2IF  - Port1 from Mon1", total_flush_mon[1] - p5_to_mon[1] - p6_to_mon[1] - p7_to_mon[1] - p8_to_mon[1]});
        // 0x000e8102 flush_stats_02
        exp_stats.push_back('{"IF2IF  - Port1 from Port1", env.eth_sb[1].stats[SB_LOST].get_flow_item_cnt(1)});
        // 0x000e8103 flush_stats_03
        exp_stats.push_back('{"CPU2IF - Port2 from Cpu", env.eth_sb[2].stats[SB_LOST].get_flow_item_cnt(PORT_CPU)});
        // 0x000e8104 flush_stats_04 (config MON2 = TRF Ports)
        exp_stats.push_back('{"IF2IF  - Port2 from Mon2", total_flush_mon[2] - p5_to_mon[2] - p6_to_mon[2] - p7_to_mon[2] - p8_to_mon[2]});
        // 0x000e8105 flush_stats_05
        exp_stats.push_back('{"IF2IF  - Port2 from Port2", env.eth_sb[2].stats[SB_LOST].get_flow_item_cnt(2)});
        // 0x000e8106 flush_stats_06
        exp_stats.push_back('{"CPU2IF - Port3 from Cpu", env.eth_sb[3].stats[SB_LOST].get_flow_item_cnt(PORT_CPU)});
        // 0x000e8107 flush_stats_07
        exp_stats.push_back('{"IF2IF  - Port3 from Packet Capture (DFT)", 0}); // never flushes
        // 0x000e8108 flush_stats_08
        exp_stats.push_back('{"IF2IF  - Port3 from Port3", env.eth_sb[3].stats[SB_LOST].get_flow_item_cnt(3)});
        // 0x000e8109 flush_stats_09
        exp_stats.push_back('{"CPU2IF - Port4 from Cpu", env.eth_sb[4].stats[SB_LOST].get_flow_item_cnt(PORT_CPU)});
        // 0x000e810a flush_stats_0a
        exp_stats.push_back('{"IF2IF  - Reserved for future", 0}); // reserved
        // 0x000e810b flush_stats_0b
        exp_stats.push_back('{"IF2IF  - Port4 from Port4", env.eth_sb[4].stats[SB_LOST].get_flow_item_cnt(4)});
        // 0x000e810c flush_stats_0c
        exp_stats.push_back('{"CPU2IF - Port5 from Cpu", env.eth_sb[5].stats[SB_LOST].get_flow_item_cnt(PORT_CPU)});
        // 0x000e810d flush_stats_0d
        exp_stats.push_back('{"IF2IF  - Port5 from Port6", env.eth_sb[5].stats[SB_LOST].get_flow_item_cnt(6)});
        // 0x000e810e flush_stats_0e
        exp_stats.push_back('{"IF2IF  - Port5 from Port5", env.eth_sb[5].stats[SB_LOST].get_flow_item_cnt(5)});
        // 0x000e810f flush_stats_0f
        exp_stats.push_back('{"CPU2IF - Port6 from Cpu", env.eth_sb[6].stats[SB_LOST].get_flow_item_cnt(PORT_CPU)});
        // 0x000e8110 flush_stats_10
        exp_stats.push_back('{"IF2IF  - Port6 from Port5", env.eth_sb[6].stats[SB_LOST].get_flow_item_cnt(5)});
        // 0x000e8111 flush_stats_11
        exp_stats.push_back('{"IF2IF  - Port6 from Port6", env.eth_sb[6].stats[SB_LOST].get_flow_item_cnt(6)});
        // 0x000e8112 flush_stats_12
        exp_stats.push_back('{"CPU2IF - Port7 from Cpu", env.eth_sb[7].stats[SB_LOST].get_flow_item_cnt(PORT_CPU)});
        // 0x000e8113 flush_stats_13
        exp_stats.push_back('{"IF2IF  - Port7 from Port8", env.eth_sb[7].stats[SB_LOST].get_flow_item_cnt(8)});
        // 0x000e8114 flush_stats_14
        exp_stats.push_back('{"IF2IF  - Port7 from Port7", env.eth_sb[7].stats[SB_LOST].get_flow_item_cnt(7)});
        // 0x000e8112 flush_stats_15
        exp_stats.push_back('{"CPU2IF - Port8 from Cpu", env.eth_sb[8].stats[SB_LOST].get_flow_item_cnt(PORT_CPU)});
        // 0x000e8113 flush_stats_16
        exp_stats.push_back('{"IF2IF  - Port8 from Port7", env.eth_sb[8].stats[SB_LOST].get_flow_item_cnt(7)});
        // 0x000e8114 flush_stats_17
        exp_stats.push_back('{"IF2IF  - Port8 from Port8", env.eth_sb[8].stats[SB_LOST].get_flow_item_cnt(8)});

        // 0x000e8112 flush_stats_18
        exp_stats.push_back('{"CPU2IF - MGMT from Cpu", env.eth_sb[PORT_MGMT].stats[SB_LOST].get_flow_item_cnt(PORT_CPU)});

        // 0x000e8113 flush_stats_19
        exp_stats.push_back('{"IF2MON - MON1 from Port5", total_flush_mon[1] - mon_to_p[1] - p6_to_mon[1] - p7_to_mon[1] - p8_to_mon[1]});
        // 0x000e8114 flush_stats_1a
        exp_stats.push_back('{"IF2MON - MON1 from Port6", total_flush_mon[1] - mon_to_p[1] - p5_to_mon[1] - p7_to_mon[1] - p8_to_mon[1]});
        // 0x000e8113 flush_stats_1b
        exp_stats.push_back('{"IF2MON - MON1 from Port7", total_flush_mon[1] - mon_to_p[1] - p5_to_mon[1] - p6_to_mon[1] - p8_to_mon[1]});
        // 0x000e8114 flush_stats_1c
        exp_stats.push_back('{"IF2MON - MON1 from Port8", total_flush_mon[1] - mon_to_p[1] - p5_to_mon[1] - p6_to_mon[1] - p7_to_mon[1]});

        // 0x000e8113 flush_stats_1d
        exp_stats.push_back('{"IF2MON - MON2 from Port5", total_flush_mon[2] - mon_to_p[2] - p6_to_mon[2] - p7_to_mon[2] - p8_to_mon[2]});
        // 0x000e8114 flush_stats_1e
        exp_stats.push_back('{"IF2MON - MON2 from Port6", total_flush_mon[2] - mon_to_p[2] - p5_to_mon[2] - p7_to_mon[2] - p8_to_mon[2]});
        // 0x000e8113 flush_stats_1f
        exp_stats.push_back('{"IF2MON - MON2 from Port7", total_flush_mon[2] - mon_to_p[2] - p5_to_mon[2] - p6_to_mon[2] - p8_to_mon[2]});
        // 0x000e8114 flush_stats_20
        exp_stats.push_back('{"IF2MON - MON2 from Port8", total_flush_mon[2] - mon_to_p[2] - p5_to_mon[2] - p6_to_mon[2] - p7_to_mon[2]});


        // 0x000e8117 flush_stats_21
        exp_stats.push_back('{"IF2CPU - CPU from Port1", env.eth_sb[PORT_CPU].stats[SB_LOST].get_flow_item_cnt(1)});
        // 0x000e8118 flush_stats_22
        exp_stats.push_back('{"IF2CPU - CPU from Port2", env.eth_sb[PORT_CPU].stats[SB_LOST].get_flow_item_cnt(2)});
        // 0x000e8119 flush_stats_23
        exp_stats.push_back('{"IF2CPU - CPU from Port3", env.eth_sb[PORT_CPU].stats[SB_LOST].get_flow_item_cnt(3)});
        // 0x000e811a flush_stats_24
        exp_stats.push_back('{"IF2CPU - CPU from Port4", env.eth_sb[PORT_CPU].stats[SB_LOST].get_flow_item_cnt(4)});
        // 0x000e811b flush_stats_25
        exp_stats.push_back('{"IF2CPU - CPU from Port5", env.eth_sb[PORT_CPU].stats[SB_LOST].get_flow_item_cnt(5)});
        // 0x000e811c flush_stats_26
        exp_stats.push_back('{"IF2CPU - CPU from Port6", env.eth_sb[PORT_CPU].stats[SB_LOST].get_flow_item_cnt(6)});
        // 0x000e811b flush_stats_27
        exp_stats.push_back('{"IF2CPU - CPU from Port7", env.eth_sb[PORT_CPU].stats[SB_LOST].get_flow_item_cnt(7)});
        // 0x000e811c flush_stats_28
        exp_stats.push_back('{"IF2CPU - CPU from Port8", env.eth_sb[PORT_CPU].stats[SB_LOST].get_flow_item_cnt(8)});

        // 0x000e811d flush_stats_29
        exp_stats.push_back('{"IF2CPU - CPU from MGMT", env.eth_sb[PORT_CPU].stats[SB_LOST].get_flow_item_cnt(PORT_MGMT_PHY)}); // MGMT_PHY index must be used as flow index

        // Compare Lost and Flush stats
        begin
            longint diff_stats[$];
            // Print table
            string flush_table = "\nAddr\t\tName\t\tFlush\tLost\tDiff\tLabel";
            int i = 0;
            foreach (flush_stats[addr]) begin
                diff_stats.push_back(flush_stats[addr].value - exp_stats[i].value);
                $swrite(flush_table, "%0s\n0x%8h\t%0s\t%0d\t%0d\t%0d\t%0s", flush_table,
                        addr, flush_stats[addr].name, flush_stats[addr].value, exp_stats[i].value, diff_stats[i], exp_stats[i].label);
                i++;
            end
            `uvm_info("TEST::CHECK", flush_table, UVM_LOW)
            // Print errors
            i = 0;
            foreach (flush_stats[addr]) begin
                if (diff_stats[i] != 0) begin
                    `uvm_error("TEST::CHECK", $sformatf("%0s (0x%8h) : %0s : REG=%0d  SB_LOST=%0d",
                               flush_stats[addr].name, addr, exp_stats[i].label, flush_stats[addr].value, exp_stats[i].value))
                end
                i++;
            end
        end
        phase.drop_objection(this);
    endfunction

    //---------------------------------------
    // Group: Custom methods
    //---------------------------------------

    // Task: cpu2if_traffic
    // Generate CPU2IF frames
    virtual task cpu2if_traffic(int unsigned size, int unsigned cnt, int unsigned first_port = PORT_IF, int unsigned nb_ports = NB_IF_PORTS + 1 /*MGMT*/);
        thi_cpu2if_seq_t thi_seq = thi_cpu2if_seq_t::type_id::create("thi_seq", this);
        thi_seq.NUM_USR_PRTS = nb_ports;

        `uvm_info("TEST::CPU2IF", $sformatf("size=%0d  cnt=%0d  first_port=%0d  nb_ports=%0d", size, cnt, first_port, nb_ports), UVM_LOW)

        // Launch sequence
        if (!thi_seq.randomize() with {
            frame_count == local::cnt * local::nb_ports;
            foreach(if_dst[i]) { if_dst[i] == local::first_port + i % local::nb_ports; }
            vtags_size_min == 0;
            vtags_size_max == 0;
            frame_size_min == local::size;
            frame_size_max == local::size;
        }) `randerr
        `uvm_info("TEST::CPU2IF", thi_seq.convert2string(), UVM_LOW)
        thi_seq.start(env.rx_eth.agent[PORT_CPU].sequencer);

    endtask

endclass

`endif // FLUSH_STATS_TEST__SVH
