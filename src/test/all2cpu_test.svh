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

`ifndef ALL2CPU_TEST__SVH
`define ALL2CPU_TEST__SVH

// Class: all2cpu_test
//
// Combines the 3 flows towards the CPU: fpga2cpu + if2cpu + pc2cpu
//
// Tested paths: CPU2FPGA -> DUT -> FPGA2CPU
//               AUX(IF) -> DUT -> CPU
//               TRAFFIC(IF) -> DUT(Packet Capture Engine) -> CPU
//
// Configure_phase:
// - Configure Input Section to forward frames from TRAFFIC ports to the Packet Capture Engine
// - Configure Packet Capture Engine to pack frames and send to CPU port
// - Configure Input Section to forward frames from AUX ports to the CPU port
// - Configure Rate Controllers to shappe the input traffic (random within given boundaries) and avoid discards from N*10G IF to 1G CPU
// - Enable THI CPU2FPGA register access path
//
// Main_phase:
// - Generate random sized frames at all IF ports
// - Generate constant THI register accesses
//
// Check:
// - Correct behavoir of the system is checked by the PCE verification sub-environement (prediction + scoreboarding) and FSX top env (prediction + scoreboard)
//
class all2cpu_test extends thi_cpu2fpga_test#(fsx_test_base);
    `uvm_component_utils(all2cpu_test)

    // Constructor
    function new(string name="all2cpu_test", uvm_component parent=null);
        super.new(name, parent);
        if (!cfg.randomize()) `randerr
        cfg.stim_cnt_time_us = 200;
        cfg.size_min = 64;
        cfg.size_max = 10240;
        cfg.eot_win_cnt = 100;  // eot-drain after last activity: 10us
        // Enable CLI overrides for test parameters
        parse_cli_test_cfg();
    endfunction

    // Variable: if_rate_total
    // Traffic + AUX = 900 Mbps, leaving 100 Mbps for FPGA2CPU
    int unsigned if_rate_total = 900;

    //---------------------------------------
    // Group: API implementation
    //---------------------------------------

    virtual function uvm_sequencer#(ethernet_frame) get_sequencer();
        return env.rx_eth.agent[0].sequencer;
    endfunction

    virtual function uvm_reg_block get_regmodel();
        return env.regmodel;
    endfunction

    virtual function uvm_reg_addr_t get_scratch_addr();
        return env.regmodel.globals.scratch.get_address();
    endfunction

    virtual function uvm_reg_addr_t get_unmapped_addr();
        return uvm_reg_addr_t'(9);
    endfunction

    // Function: get_reg_block
    // Random access register block - small RW register block
    virtual function uvm_reg_block get_reg_block();
        return env.regmodel.bwp.profile_remap; // TODO(CS): ideally find a smaller block
    endfunction

    // Function: get_burst_reg_block
    // Burst access register block - RW register block
    virtual function uvm_reg_block get_burst_reg_block();
        return env.regmodel.bwp.profile_cfgs;
    endfunction

    virtual function int get_port_id();
        return 0;
    endfunction

    //--------------------------------------------------------------------------------
    // Group: UVM overrides
    //--------------------------------------------------------------------------------

    // Task: configure_phase
    // Configure stimuli rate control MACs, input section and packet capture engine
    // for the forwarding paths: AUX to CPU and TRAFFIC to PC
    virtual task configure_phase(uvm_phase phase);
        pc_test_cfg_vseq pc_test_cfg_seq;
        phase.raise_objection(this);
        super.configure_phase(phase);

        //-------------------------------------------------------------------
        // Configure IF to PC and CPU
        //-------------------------------------------------------------------
        pc_test_cfg_seq = pc_test_cfg_vseq#()::type_id::create("pc_test_cfg_seq", this);
        init_vseq(pc_test_cfg_seq);
        if (!$cast(pc_test_cfg_seq.test_cfg, cfg)) `uvm_fatal("CASTERR", "Test config cast failed")
        if (!$cast(pc_test_cfg_seq.rate_aggr, env.rate_aggr)) `uvm_fatal("CASTERR", "Rate controller cast failed")
        if (!pc_test_cfg_seq.randomize() with {
            //---------------------------
            // Enabled groups selection
            //---------------------------
            group_ena[GROUP_TRAFFIC] == '1;
            group_ena[GROUP_AUX]     == '1;

            //---------------------------
            // PC MTU / IF MRU
            //---------------------------
            pc_mtu dist { [pc_mtu_typ[0]  : pc_mtu_typ[$]-1]  :/ 30,   // [min : max)
                           pc_mtu_typ[$]                      := 70 }; // max - sw use case

            if_mru dist { [mac_mru_typ[0] : mac_mru_typ[1]]   :/ 30,   // [min : EtherSize_max]
                           mac_mru_typ[$]                     := 70 }; // max - sw use case

            //---------------------------
            // Rate control
            //---------------------------
            rate_ctrl_ena == '1;
            // Traffic
            rate_group_ena[GROUP_TRAFFIC] == '1;
            aggr_rate[GROUP_TRAFFIC] inside {[100:1000]}; // At least 100Mbps for TRAFFIC or AUX
            aggr_rate[GROUP_TRAFFIC] % 100 == 0;
            if_rate_dstr[GROUP_TRAFFIC]    == DSTR_RANDOM;
            if_rate_gran[GROUP_TRAFFIC]    == 50;
            burst_size_min[GROUP_TRAFFIC]  == 32  * 1024; //  32 KiB
            burst_size_max[GROUP_TRAFFIC]  == 256 * 1024; // 256 KiB - PC buffer space: 512 KiB
            burst_ratio[GROUP_TRAFFIC]     inside {[300:700]};
            burst_ratio[GROUP_TRAFFIC] % 100 == 0;
            // Aux
            rate_group_ena[GROUP_AUX] == '1;
            aggr_rate[GROUP_AUX] inside {[100:1000]};
            aggr_rate[GROUP_AUX] % 100 == 0;
            if_rate_dstr[GROUP_AUX]    == DSTR_RANDOM;
            if_rate_gran[GROUP_AUX]    == 50;
            burst_size_min[GROUP_AUX]  == 2 * 1024; // 2 KiB
            burst_size_max[GROUP_AUX]  == 4 * 1024; // 4 KiB - if2cpu buffer space: 64 KiB
            burst_ratio[GROUP_AUX]     inside {[300:700]};
            burst_ratio[GROUP_AUX] % 100 == 0;
            // Both
            aggr_rate.sum() == if_rate_total;


            //---------------------------
            // Input section
            //---------------------------
            // Traffic
            domains[GROUP_TRAFFIC]               == 5'b01111;    // ON: IF,CPU,MON1,MON2 - OFF: INSP
            if_action[GROUP_TRAFFIC]             == ACT_IF_NONE;
            cpu_mon_action[GROUP_TRAFFIC].cpu    == ACT_DIS;
            cpu_mon_action[GROUP_TRAFFIC].mon[0] == ACT_DIS;
            cpu_mon_action[GROUP_TRAFFIC].mon[1] == ACT_DIS;
            cpu_mon_action[GROUP_TRAFFIC].pc     == ACT_FWD;
            // Aux
            domains[GROUP_AUX]                   == 5'b01111;    // ON: IF,CPU,MON1,MON2 - OFF: INSP
            if_action[GROUP_AUX]                 == ACT_IF_NONE;
            cpu_mon_action[GROUP_AUX].cpu        == ACT_FWD;     // Only <cpu_mon_action.cpu> used in AUX ports

            //---------------------------
            // PCE
            //---------------------------
            // bad_pkt_ena   == random
            // long_pkt_ena  == random
            keep_alive_ena   == 1'b0;  // disabled due to CPU congestion
            cir_kbps         == 800_000;
            cbs_bytes        == 4096;

        }) `sranderr("PC_TEST_CFG")
        `uvm_info("TEST", pc_test_cfg_seq.convert2string(), UVM_LOW)
        pc_test_cfg_seq.start(null);

        phase.drop_objection(this);
    endtask

    // Task: main_phase
    // Send packets in TRAFFIC and AUX ports as well as launch CPU to FPGA register accesses
    virtual task main_phase(uvm_phase phase);
        valid_ethernet_seq_mixin#(ethernet_sequence_base) eth_seq[int];
        int unsigned nb_read_loop; // number of CPU2FPGA read iterations

        phase.raise_objection(this);

        //-------------------------------------------------------------------
        // Setup CPU to FPGA accesses
        //-------------------------------------------------------------------
        `uvm_info("TEST", "Enabling THI path", UVM_LOW)
        ctrl_vif.thi_ena = '1;

        // Configure testcase to wait for FPGA2CPU acknowledge event in THI accesses
        cfg_wait_ack = '1;

        // super.main_phase is not called to let register accesses run in parallel with traffic,
        // so set handles here
        sequencer = get_sequencer();
        regmodel = get_regmodel();

        // simple scratch test
        test_scratch_reg();

        //-------------------------------------------------------------------
        // Generate sequences for AUX and TRAFFIC ports
        //-------------------------------------------------------------------
        for(int i = PORT_IF; i <= PORT_IF_LAST; i++) begin
            eth_seq[i] = valid_ethernet_seq_mixin#(ethernet_sequence_base)::type_id::create($sformatf("eth_seq%0d", i));
        end

        //-------------------------------------------------------------------
        // Main traffic generation loop
        //-------------------------------------------------------------------
        fork begin

            // Generate traffic in AUX and TRAFFIC ports
            foreach(eth_seq[i]) begin
                automatic int s=i;
                fork
                    // Start sequence on Interface port agents
                    begin
                        automatic int gid = (s inside {PORT_AUX} ? GROUP_AUX : GROUP_TRAFFIC);
                        automatic real if_rate = real'(env.cfg.rate_aggr_cfg.group_cfg[gid].slave_cfg[s].target_rate);
                        automatic int unsigned frame_cnt = unsigned'(int'(cfg.stim_cnt_time_us * (if_rate / if_rate_total)));
                        automatic string port_type = (gid == GROUP_AUX ? "IF2CPU" : "IF2PC ");
                        `uvm_info("TEST", $sformatf("%0s port <%0d>: %0d frames at %0d Mbps", port_type, s, frame_cnt, if_rate), UVM_LOW)
                        if (!eth_seq[s].randomize() with {
                            p_id           == local::s;
                            nb_item        == local::frame_cnt;
                            frame_size_min == local::cfg.size_min;
                            frame_size_max == local::cfg.size_max;
                        }) `sranderr(eth_seq[s].get_name())
                        eth_seq[s].start(env.rx_eth.agent[s].sequencer);
                        `uvm_info("TEST", $sformatf("%0s port <%0d>: done", port_type, s), UVM_DEBUG)
                    end
                join_none
            end // foreach (eth_seq[i])

            // CPU to FPGA register access, resulting in FPGA to CPU traffic
            begin
                // Write random data in registers and read back
                string msg = $sformatf("CPU2FPGA RW iteration");
                `uvm_info("TEST", msg, UVM_LOW)
                test_reg_block(get_burst_reg_block(), .shuffle(0));
                `uvm_info("TEST", {msg," - done"}, UVM_DEBUG)
                // Re-read continuously the same registers
                nb_read_loop = cfg.stim_cnt_time_us/60;
                for (int i=1; i <= nb_read_loop; i++) begin
                    msg = $sformatf("CPU2FPGA READ iteration: %0d/%0d", i, nb_read_loop);
                    `uvm_info("TEST", msg, UVM_LOW)
                    read_reg_block(get_burst_reg_block(), .shuffle(0));
                    `uvm_info("TEST", {msg," - done"}, UVM_DEBUG)
                end
            end

            wait fork;
        end
        join

        // Disable ethernet THI path
        `uvm_info("TEST", "Disabling THI path", UVM_LOW)
        ctrl_vif.thi_ena = '0;

        phase.drop_objection(this);
    endtask // main_phase

endclass

`endif //ALL2CPU_TEST__SVH
