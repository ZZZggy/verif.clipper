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

`ifndef IF2ALL_TEST__SVH
`define IF2ALL_TEST__SVH

// Class: if2all_test
// DEBUG TESTCASE
// Classifiers configured to caltchall with all domains enabled and all forwarding enabled.
class if2all_test extends fsx_test_base;
    `uvm_component_utils(if2all_test)

    // Constructor
    function new(string name="if2all_test", uvm_component parent=null);
        super.new(name, parent);
        if (!cfg.randomize()) `uvm_fatal("RNDERR", "test_cfg")
        cfg.stim_cnt_time_us = 100;
        cfg.size_min = 64;
        cfg.size_max = 128;
        // Enable CLI overrides for test parameters
        parse_cli_test_cfg();
    endfunction

    // Configure and send packets
    task main_phase(uvm_phase phase);
        domain_catchall_cfg_seq catch_cfg_seq;
        valid_ethernet_seq_mixin#(ethernet_sequence_base) seq[PORT_IF : PORT_IF_LAST+1];

        phase.raise_objection(this);

        // Allow discard once traffic rate is not limited
        if (!cfg.rate_ctrl) begin
            foreach (env.eth_sb[i]) begin
                env.eth_sb[i].cfg.allow_discard = '1;
                env.eth_sb[i].reporter[SB_LOST].cfg.ena = 0;
            end
        end

        //-------------------------------------------------------------------
        // Configure
        //-------------------------------------------------------------------
        catch_cfg_seq = domain_catchall_cfg_seq::type_id::create("catch_cfg_seq", this);
        init_vseq(catch_cfg_seq);
        for(int i=1; i<=NB_IF_PORTS; i++) begin
            if (!catch_cfg_seq.randomize() with {
                port == i;
                foreach(domains[j]) domains[j] == 1;
                dom_capture == 1;
            }) `uvm_fatal("RNDERR", "cfg")
            `uvm_info("TEST", catch_cfg_seq.convert2string(), UVM_MEDIUM)
            catch_cfg_seq.start(null);
        end

        //-------------------------------------------------------------------
        // Validate that traffic passes
        //-------------------------------------------------------------------
        foreach(seq[i]) begin
            seq[i] = valid_ethernet_seq_mixin#(ethernet_sequence_base)::type_id::create($sformatf("seq%0d", i));
            if (!seq[i].randomize() with {
                p_id           == local::i;
                nb_item        == local::cfg.stim_cnt_time_us;
                frame_size_min == local::cfg.size_min;
                frame_size_max == local::cfg.size_max;
            }) `uvm_fatal("RNDERR", seq[i].get_name)
        end

        fork begin
            foreach(seq[i]) begin
                automatic int s=i;
                fork
                    // Start sequence on Interface port agents
                    begin
                        seq[s].start(env.rx_eth.agent[s].sequencer);
                    end
                join_none
            end
            wait fork;
        end
        join

        phase.drop_objection(this);
    endtask

    //-------------------------------------------------------------------------------
    // TODO (CS): check_phase
    // Validate lost packet counters from scoreboards againts DUT statistics
    //-------------------------------------------------------------------------------

endclass

`endif //IF2ALL_TEST__SVH
