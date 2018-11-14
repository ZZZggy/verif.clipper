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

`ifndef IF2PC_TEST__SVH
`define IF2PC_TEST__SVH

// Class: if2pc_test
//
// Test path: TRAFFIC(IF) -> Packet Capture Engine -> CPU
//
// - Configure Input Section to forward frames from TRAFFIC port to the Packet Capture Engine
// - Configure Packet Capture Engine to pack frames and send to CPU port
// - Configure Rate Controllers to shappe the input traffic (random within given boundaries) and avoid discards from 20G TRAFFIC to 1G CPU
// - Generate random sized frames at all TRAFFIC ports
// - Correct behavoir of the system is checked by the PCE verification sub-environement (prediction + scoreboarding)
//
class if2pc_test extends fsx_test_base;

    // Variable: if_rate_total
    // Traffic = 1000 Mbps
    int unsigned if_rate_total = 1000;

    // Variable: pc_cir_kbps
    int unsigned pc_cir_kbps = 800_000;

    `uvm_component_utils(if2pc_test)

    // Constructor
    function new(string name="if2pc_test", uvm_component parent=null);
        super.new(name, parent);
        if (!cfg.randomize()) `randerr
        cfg.stim_cnt_time_us = 200;
        cfg.size_min = 64;
        cfg.size_max = 10240;
        cfg.eot_win_cnt = 100;  // eot-drain after last activity: 10us
        // Enable CLI overrides for test parameters
        parse_cli_test_cfg();
    endfunction

    //--------------------------------------------------------------------------------
    // Group: UVM overrides
    //--------------------------------------------------------------------------------

    // Task: configure_phase
    // Configure stimuli rate control MACs, input section and packet capture engine.
    virtual task configure_phase(uvm_phase phase);
        pc_test_cfg_vseq pc_test_cfg_seq;

        phase.raise_objection(this);
        super.configure_phase(phase);

        //-------------------------------------------------------------------
        // Configure IF to PC
        //-------------------------------------------------------------------
        pc_test_cfg_seq = pc_test_cfg_vseq#()::type_id::create("pc_test_cfg_seq", this);
        init_vseq(pc_test_cfg_seq);
        pc_test_cfg_seq.test_cfg = cfg;
        pc_test_cfg_seq.rate_aggr = env.rate_aggr;
        if (!pc_test_cfg_seq.randomize() with {
            //---------------------------
            // Enabled groups selection
            //---------------------------
            group_ena[GROUP_TRAFFIC] == '1;
            group_ena[GROUP_AUX]     == '0;

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
            rate_ctrl_ena                  == '1;
            rate_group_ena[GROUP_TRAFFIC]  == '1;
            aggr_rate[GROUP_TRAFFIC]       == if_rate_total;
            if_rate_dstr[GROUP_TRAFFIC]    == DSTR_RANDOM;
            if_rate_gran[GROUP_TRAFFIC]    == 50;
            burst_size_min[GROUP_TRAFFIC]  == 32  * 1024;     // 32 KiB
            burst_size_max[GROUP_TRAFFIC]  == 256 * 1024;     // 256 KiB - PC buffer space: 512 KiB
            burst_ratio[GROUP_TRAFFIC]     inside {[300:700]};
            burst_ratio[GROUP_TRAFFIC] % 100 == 0;

            //---------------------------
            // Input section
            //---------------------------
            domains[GROUP_TRAFFIC]               == 5'b01111;    // ON: IF,CPU,MON1,MON2 - OFF: INSP
            if_action[GROUP_TRAFFIC]             == ACT_IF_NONE;
            cpu_mon_action[GROUP_TRAFFIC].cpu    == ACT_DIS;
            cpu_mon_action[GROUP_TRAFFIC].mon[0] == ACT_DIS;
            cpu_mon_action[GROUP_TRAFFIC].mon[1] == ACT_DIS;
            cpu_mon_action[GROUP_TRAFFIC].pc     == ACT_FWD;

            //---------------------------
            // PCE
            //---------------------------
            // bad_pkt_ena  == random
            // long_pkt_ena == random
            cir_kbps        == pc_cir_kbps;
            cbs_bytes       == 4096;

        }) `randerr
        `uvm_info("TEST", pc_test_cfg_seq.convert2string(), UVM_LOW)
        pc_test_cfg_seq.start(null);

        #45us;

        phase.drop_objection(this);
    endtask

    // Task: main_phase
    // Send packets in TRAFFIC ports
    virtual task main_phase(uvm_phase phase);
        valid_ethernet_seq_mixin#(ethernet_sequence_base) eth_seq[int];

        phase.raise_objection(this);

        //-------------------------------------------------------------------
        // Send frames at traffic ports
        //-------------------------------------------------------------------
        foreach(PORT_TRAFFIC[i]) begin
            int pid = PORT_TRAFFIC[i];
            eth_seq[pid] = valid_ethernet_seq_mixin#(ethernet_sequence_base)::type_id::create($sformatf("eth_seq%0d", pid));
        end

        fork begin
            foreach(eth_seq[i]) begin
                automatic int s=i;
                fork
                    // Start sequence on Interface port agents
                    begin
                        automatic real if_rate = real'(env.cfg.rate_aggr_cfg.group_cfg[GROUP_TRAFFIC].slave_cfg[s].target_rate);
                        automatic int unsigned frame_cnt = unsigned'(int'(cfg.stim_cnt_time_us * (if_rate / if_rate_total)));
                        `uvm_info("TEST", $sformatf("Port <%0d>: %0d frames at %0d Mbps", s, frame_cnt, if_rate), UVM_LOW)
                        if (!eth_seq[s].randomize() with {
                            p_id           == local::s;
                            nb_item        == local::frame_cnt;
                            frame_size_min == local::cfg.size_min;
                            frame_size_max == local::cfg.size_max;
                        }) `sranderr(eth_seq[s].get_name())
                        eth_seq[s].start(env.rx_eth.agent[s].sequencer);
                    end
                join_none
            end
            wait fork;
        end
        join

        phase.drop_objection(this);
    endtask

endclass

`endif //IF2PC_TEST__SVH
