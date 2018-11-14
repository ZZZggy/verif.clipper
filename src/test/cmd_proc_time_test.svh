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

`ifndef CMD_PROC_TIME_TEST__SVH
`define CMD_PROC_TIME_TEST__SVH

// Class: cmd_proc_time_test
//
// Characterization testcase for THI command processing time field in FPGA2CPU frames.
// Emulates the ~cmd_proc_time~ use case by reading sequentially the MAC and Classifier IF stats register blocks
// and making sure that the reported command processing time matches the real command delay.
// Starts reading stats from interface port 1 and increments until port 6, then wraparound back to port 1.
// All along, aggressor loopback traffic (continuous 64B frames @ line rate) is generated in all interface ports
//
//--------------------------------------------------------------------------------------------------
// PLUSARGS:
// +NB_FLOW=<int>          Select how many ~cmd_proc_time_range~ configurations should be tested
//                         Valid values: 1 (only range 0x0, default) up to 4 (range 0x0 up to 0x3)
//
// +STIM_CNT_TIME_US=<int> Select number of stats read cycles in each ~cmd_proc_time_range~ config
//                         Valid values: 1 (default) to N
//--------------------------------------------------------------------------------------------------
class cmd_proc_time_test extends thi_cpu2fpga_test#(fsx_test_base);

    // Localparam: TRAFFIC_LEN
    // Length of aggressor traffic on/off state in number port read cycles
    localparam TRAFFIC_LEN = 9; // all ports (8) + 1 => sliding window

    // Variable: max_variation
    // Maximum variation in THI command processing time accepted in a same burst access type (same address and length)
    longint unsigned max_variation = 120; //TODO(CS): value must be verified with design team

    // Variable: run_traffic
    // State variable used to synchonize end of stats read loop and aggressor traffic generation
    bit run_traffic = '0;

    `uvm_component_utils(cmd_proc_time_test)

    // Constructor: new
    function new(string name="cmd_proc_time_test", uvm_component parent=null);
        super.new(name, parent);
        if (!cfg.randomize()) `randerr
        // Set port speeds for maximum supported class_stats bandwidth at 64B packets @ line rate
        cfg.port_speed[PORT_CPU]        = PS_1G;
        cfg.port_speed[PORT_AUX[0]]     = PS_1G;
        cfg.port_speed[PORT_AUX[1]]     = PS_1G;
        cfg.port_speed[PORT_AUX[2]]     = PS_10G; // 4x10G at higher interface indexes
        cfg.port_speed[PORT_AUX[3]]     = PS_10G;
        cfg.port_speed[PORT_TRAFFIC[0]] = PS_10G;
        cfg.port_speed[PORT_TRAFFIC[1]] = PS_10G;
        cfg.port_speed[PORT_TRAFFIC[2]] = PS_10G;
        cfg.port_speed[PORT_TRAFFIC[3]] = PS_10G;
        cfg.port_speed[PORT_MGMT]       = PS_1G;
        // Stimuli control
        cfg.nb_flow = 1;               // used as number of ~cmd_proc_time_range~ configs
        cfg.stim_cnt_time_us = 1;      // used as number of stats read cycles in each ~cmd_proc_time_range~ config
        // 1us end-of-test drain
        cfg.eot_win_cnt = 10;
        // Enable CLI overrides for test parameters
        parse_cli_test_cfg();
    endfunction

    //--------------------------------------------
    // Group: THI CPU2FPGA API implementation
    //--------------------------------------------

    virtual function uvm_sequencer#(ethernet_frame) get_sequencer();
        return env.rx_eth.agent[PORT_CPU].sequencer;
    endfunction

    virtual function uvm_reg_block get_regmodel(); return env.regmodel; endfunction

    virtual function uvm_reg_addr_t get_scratch_addr();
        return env.regmodel.globals.scratch.get_address();
    endfunction

    virtual function uvm_reg_addr_t get_unmapped_addr(); return uvm_reg_addr_t'(9); endfunction

    virtual function uvm_reg_block get_reg_block(); return null; endfunction

    virtual function uvm_reg_block get_burst_reg_block(); return null; endfunction

    virtual function int get_port_id(); return PORT_CPU; endfunction


    //---------------------------------------
    // Group: UVM phase overrides
    //---------------------------------------

    // Task: configure_phase
    // Configure input section for loopback
    virtual task configure_phase(uvm_phase phase);
        phase.raise_objection(this);
        super.configure_phase(phase);

        // Setup thi_cpu2fpga_test hooks
        sequencer = get_sequencer();
        regmodel = get_regmodel();

        // Enable scoreboard CSV report
        env.eth_sb[PORT_CPU].stats[SB_MATCH].cfg.csv_report_ena = '1;

        // Configure tolerance for CPU2FPGA timestamp
        env.predictor.cpu2x.cfg.tolerance_timestamp_fpga = 'h20; // ~7.45ns - empiric value for FSX 1.1

        // Disable PC engine
        disable_pce();

        // Configure loopback
        configure_insect();

        // Stimuli rate control enabled: traffic stopped
        env.rate_aggr.cfg.ena = '1;
        configure_traffic(run_traffic);

        // Configure testcase to wait for FPGA2CPU acknowledge event in THI accesses
        cfg_wait_ack = '1;

        // Enable ethernet THI path
        cfg.thi_ena = 1;
        ctrl_vif.thi_ena = '1;

        phase.drop_objection(this);
    endtask


    // Task: main_phase
    // Launch aggressor traffic in all interface ports and, in parallel,
    // continuously read TSE, XGMAC and Class_IF stats
    virtual task main_phase(uvm_phase phase);
        phase.raise_objection(this);

        fork
            // Stats
            stats_read_loop();

            // Traffic
            aggressor_traffic_loop();

        join

        phase.drop_objection(this);
    endtask


    // Task: pre_shutdown_phase
    // Disable ethernet THI path
    virtual task pre_shutdown_phase(uvm_phase phase);
        phase.raise_objection(this);
        super.pre_shutdown_phase(phase);
        ctrl_vif.thi_ena = '0;
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

        `uvm_info("TEST", read_flush_seq.convert2string(), UVM_LOW)

        phase.drop_objection(this);
    endtask

    // Function: check_phase
    // Check max allowed variation
    function void check_phase(uvm_phase phase);
        thi_scoreboard_stats#(acd_scoreboard_container#(ethernet_frame)) thi_stats;
        super.check_phase(phase);
        if(!$cast(thi_stats, env.eth_sb[PORT_CPU].stats[SB_MATCH])) `casterr
        foreach (thi_stats.burst_item_cnt[addr]) begin
            acd_uvm_pkg::acd_scoreboard_stats_entry_t burst_stats = thi_stats.get_burst_cmd_proc_time(addr);
            longint unsigned variation = burst_stats.max - burst_stats.min;
            if (variation > max_variation) begin
                `uvm_error("TEST:CHECK", $sformatf("Variation too big in cmd_proc_time: address=0x%0h  variation=%0d  max_allowed=%0d", addr, variation, max_variation))
            end else begin
                `uvm_info("TEST:CHECK", $sformatf("Variation OK in cmd_proc_time: address=0x%0h  max=%0d  min=%0d  variation=%0d  max_allowed=%0d",
                                                  addr, burst_stats.max, burst_stats.min, variation, max_variation), UVM_DEBUG)
            end
        end
    endfunction


    //---------------------------------------
    // Group: tasks
    //---------------------------------------

    // Task: disable_pce
    // Disable PC engine
    virtual task disable_pce();
        uvm_status_e status;
        env_cfg.pc_env_cfg.ena_eot_drain = 0;
        env.regmodel.packet_capture.cfg.ena.set(0);
        env.regmodel.packet_capture.cfg.keep_alive_ena.set(0);
        env.regmodel.packet_capture.cfg.update(status);
    endtask


    // Task: configure_insect
    // Configures Input Section: all interface ports in loopback
    virtual task configure_insect();

        class_action_type_pkg::action_st action;
        action.cpu    = class_action_type_pkg::ACT_DIS;
        action.fwd    = class_action_type_pkg::ACT_DIS;
        action.lpbk   = class_action_type_pkg::ACT_DIS;
        action.insp   = class_action_type_pkg::ACT_DIS;
        action.mon[0] = class_action_type_pkg::ACT_DIS;
        action.mon[1] = class_action_type_pkg::ACT_DIS;
        action.pc     = class_action_type_pkg::ACT_DIS;

        // For all interface ports
        for(shortint unsigned port_id = PORT_IF; port_id <= PORT_IF_LAST; port_id++) begin

            insect_fwd_cfg_vseq insect_cfg_seq = insect_fwd_cfg_vseq::type_id::create("insect_cfg_seq");
            insect_cfg_seq.regmodel = env.regmodel;

            if (!insect_cfg_seq.randomize() with {
                port           == local::port_id;
                domains        == (1 << class_action_type_pkg::DOM_IF);
                if_action      == action_type_pkg::ACT_IF_FWD_PHY;
                cpu_mon_action == local::action;
                outgoing_if    == local::port_id;
            }) `sranderr($sformatf("INSECT_CFG::PORT = %0d", port_id))

            `uvm_info("SEQ", insect_cfg_seq.convert2string(), UVM_LOW)
            insect_cfg_seq.start(null);
        end
    endtask

    // Task: configure_traffic
    // Configures Rate Control to stop traffic when enabled, line rate when disabled
    virtual task configure_traffic(bit run);
        rate_ctrl_cfg_vseq rate_ctrl_cfg_seq;
        group_id_e group_id[] = '{GROUP_AUX, GROUP_TRAFFIC};
        foreach(group_id[i]) begin
            env.rate_aggr.cfg.set_group_ena(group_id[i],  1);   // enable to apply rates
            env.rate_aggr.cfg.set_group_rate(group_id[i], 0);   // no traffic when enabled
            env.rate_aggr.apply_rates(group_id[i]);
            env.rate_aggr.cfg.set_group_ena(group_id[i], ~run); // final enable state
        end
    endtask


    // Task: stats_read_loop
    // Continuously read TSE, XGMAC and Class_IF stats
    virtual task stats_read_loop();

        // Number of ~cmd_proc_time_range~ values test: 1 to 4
        int nb_range = (cfg.nb_flow < 1) ? 1 :
                       (cfg.nb_flow > 4) ? 4 : cfg.nb_flow;

        // Number of stats read cycles: 1 to N
        int nb_cycles = (cfg.stim_cnt_time_us < 1) ? 1 : cfg.stim_cnt_time_us;

        // Traffic on/off cycles counter
        int traffic_cnt = 1;

        // Alias for reading class_stats_if in a loop
        uvm_reg_block class_stats_if[PORT_IF:PORT_IF_LAST];
        class_stats_if[1] = env.regmodel.class_stats.class_stats_if.p1;
        class_stats_if[2] = env.regmodel.class_stats.class_stats_if.p2;
        class_stats_if[3] = env.regmodel.class_stats.class_stats_if.p3;
        class_stats_if[4] = env.regmodel.class_stats.class_stats_if.p4;
        class_stats_if[5] = env.regmodel.class_stats.class_stats_if.p5;
        class_stats_if[6] = env.regmodel.class_stats.class_stats_if.p6;
        class_stats_if[7] = env.regmodel.class_stats.class_stats_if.p7;
        class_stats_if[8] = env.regmodel.class_stats.class_stats_if.p8;

        // CPU2FPGA register access, resulting in FPGA2CPU traffic
        // Read MAC and IF Classifier stats reg blocks continuously
        for (int range=0; range < nb_range; range++) begin
            byte range_reg[8] = '{default : 0};  // thi_reg_access task requires a byte array with LSB in byte 7
            string info_msg = $sformatf("CMD_PROC_TIME_RANGE=0x%0h (%0d/%0d)", range, (range+1), nb_range);
            `uvm_info("TEST", $sformatf("%0s - number of read cycles: %0d",info_msg, nb_cycles), UVM_LOW)

            // Configure tolerace for CPU2FPGA cmd_proc_time
            env.predictor.cpu2x.cfg.tolerance_cmd_proc_time = (range == 0) ? 'h3 : // increased tolerance for highest resolution
                                                                             'h1 ; // in others cases, just tolerate 1 unit for wraparound edges

            // Configure ~cmd_proc_time_range~ register
            env.regmodel.globals.cmd_proc_time_range.set(range); // mirror value to regmodel
            range_reg[7] = range;                                // write to DUT
            thi_reg_access(thi_uvm_pkg::THI_WR_ACK, env.regmodel.globals.cmd_proc_time_range.get_address(), range_reg, .burst_len(1), .wait_ack(1));

            // Read stats from interface ports
            for (int cycle = 0; cycle < nb_cycles; cycle++) begin
                int port_id = PORT_IF + (cycle % NB_IF_PORTS);

                // TSE MAC stats
                read_reg_block(env.regmodel.mac_if.tse_mac_stats[port_id]);

                // XGMAC stats
                read_reg_block(env.regmodel.mac10g_if[port_id-1].xgmac_rx_stats);
                read_reg_block(env.regmodel.mac10g_if[port_id-1].xgmac_tx_stats);

                // Read class stats
                read_reg_block(class_stats_if[port_id]);

                `uvm_info("TEST", $sformatf("%0s - read cycle %0d/%0d done", info_msg, cycle+1, nb_cycles), UVM_LOW)

                // Toggle traffic generation when achieved required number of read cycles
                if (traffic_cnt == TRAFFIC_LEN) begin
                    `uvm_info("TEST", "Toggle aggressor traffic generation", UVM_LOW)
                    run_traffic = ~run_traffic;
                    configure_traffic(run_traffic);
                    traffic_cnt = 1;
                end else begin
                    traffic_cnt++;
                end
            end
        end // for (int range=0; range < nb_range; range++)

    endtask // loop_stats_read


    // Task: aggressor_traffic_loop
    // Generate aggressor traffic (continuous 64B frames @ line rate) in all interface ports
    // Rate controller will gate burst vs void traffic
    virtual task aggressor_traffic_loop();
        valid_ethernet_seq_mixin#(ethernet_sequence_base) eth_seq[PORT_IF:PORT_IF_LAST];

        // Generate traffic in AUX and TRAFFIC ports
        foreach(eth_seq[i]) begin
            automatic int s=i;
            eth_seq[s] = valid_ethernet_seq_mixin#(ethernet_sequence_base)::type_id::create($sformatf("eth_seq%0d", s));

            fork
                forever begin
                    if (!eth_seq[s].randomize() with {
                        p_id           == local::s;
                        nb_item        == 1;
                        vtags_size_min == 0;
                        vtags_size_max == 0;
                        frame_size_min == 64;
                        frame_size_max == 64;
                    }) `sranderr(eth_seq[s].get_name())
                    eth_seq[s].start(env.rx_eth.agent[s].sequencer);
                end
            join_none

        end // foreach (eth_seq[i])
    endtask

endclass

`endif // CMD_PROC_TIME_TEST__SVH
