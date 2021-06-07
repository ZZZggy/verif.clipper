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
//
//-----------------------------------------------------------------------------
// Description:
// Testcase for verifying hidden rules with random config and random stimulus.
// Use +NB_PORT to configure/test over mode ports.
//------------------------------------------------------------------------------

import hidden_rule_frame_pkg::*;

class hidden_rule_test extends clipper_test_base;
    `uvm_component_utils(hidden_rule_test)

    //---------------------------------------------------------------------------------
    // Variables
    //---------------------------------------------------------------------------------
    clipper_hard_rule_cfg_reg_seq hard_rule_cfg_seq;
    hidden_rule_reg_seq_t         hidden_rule_reg_seq;
    domain_catchall_cfg_seq       complex_reg_seq;

    int unsigned test_cfg_nb_ports;

    function new(string name = "hidden_rule_test", uvm_component parent=null);
        super.new(name,parent);

        cfg.stim_cnt_time_us = 100;
        cfg.size_min = 80;
        cfg.size_max = 80;
        cfg.nb_flow  = 80; // use as enable distribution
        test_cfg_nb_ports = 12;
        parse_cli_test_cfg();
        cli.get_cli_uint("+NB_PORT=", test_cfg_nb_ports);
    endfunction

    /**
     * @Override
     * Enable and randomize some rules.
     */
    virtual task configure_phase(uvm_phase phase);
        uvm_status_e status;

        super.configure_phase(phase);
        phase.raise_objection(this);

        hard_rule_cfg_seq = clipper_hard_rule_cfg_reg_seq::type_id::create("hard_rule_cfg_seq", this);
        hard_rule_cfg_seq.regmodel = env.regmodel;

        hidden_rule_reg_seq = hidden_rule_reg_seq_t::type_id::create("hidden_rule_reg_seq", this);
        hidden_rule_reg_seq.regmodel = env.regmodel;

        complex_reg_seq = domain_catchall_cfg_seq::type_id::create("complex_reg_seq", this);
        complex_reg_seq.regmodel = env.regmodel;

//        for (int i=1; i< test_cfg_nb_ports; i++) begin
            //---------------------------------------------------------------------------------
            // Hidden rule config
            //---------------------------------------------------------------------------------
            if (!hidden_rule_reg_seq.randomize with {
                port_id  inside {[1:test_cfg_nb_ports]};
                ena_dist == cfg.nb_flow; // used as enable distribution
                user_vlan inside {[0:37]}; // do not set user VLAN to a known one
            }) `uvm_fatal(get_name, "Randomization failed!")
            hidden_rule_reg_seq.start(env.reg_sequencer);

            //---------------------------------------------------------------------------------
            // Hardcoded rule index/bucket config (static)
            //---------------------------------------------------------------------------------
            hard_rule_cfg_seq.input_port_id = hidden_rule_reg_seq.port_id;
            hard_rule_cfg_seq.start(env.reg_sequencer);

//            //---------------------------------------------------------------------------------
//            // Complex rule config
//            //---------------------------------------------------------------------------------
//            if (!complex_reg_seq.randomize with {
//                port          == i;
//                domains       == 1;
//                outgoing_if     == i;
//                if_is_logical   == 0;
//            }) `uvm_fatal(get_name, "Randomization failed!")
//            complex_reg_seq.start(env.reg_sequencer);
//        end

//        //---------------------------------------------------------------------------------
//        // Timebase
//        //---------------------------------------------------------------------------------
//        // set timbase increment
//        if (!env.regmodel.timebase.ts_incr.mode_add_fraction.randomize() with {
//            value inside {['h11200000:'h112fffff]}; // nominally 'h112e0be8
//        }) `uvm_fatal(get_name, "Randomization failed.")
//        env.regmodel.timebase.ts_incr.update(status, .parent(null));
//        // set timebase "date"
//        if (!env.regmodel.timebase.ts_updt.value.randomize()) `uvm_fatal(get_name, "Randomization failed.")
//        env.regmodel.timebase.ts_updt.lsb.set(1);
//        env.regmodel.timebase.ts_updt.msb.set(0);
//        env.regmodel.timebase.ts_updt.update(status, .parent(null));
//        if (!env.regmodel.timebase.ts_updt.value.randomize()) `uvm_fatal(get_name, "Randomization failed.")
//        env.regmodel.timebase.ts_updt.lsb.set(0);
//        env.regmodel.timebase.ts_updt.msb.set(1);
//        env.regmodel.timebase.ts_updt.update(status, .parent(null));

        phase.drop_objection(this);
    endtask


    /**
     * @Override
     */
    virtual task main_phase(uvm_phase phase);
        clipper_hidden_rule_random_seq seq;
        uvm_status_e status;
        bit [31:0] data;
//        seq = new[test_cfg_nb_ports];

        phase.raise_objection(this);

//
//        fork begin : thread_frk
//            // Create isolated thread for wait fork to apply only to this thread
//            foreach(seq[i]) begin
//                // Required re-assignment since cannot pass by reference i inside for-join block(LRM 9.3.2)
//                automatic int s = i;
//                fork begin : thread_seq
                    seq = clipper_hidden_rule_random_seq::type_id::create($sformatf("seq%0d",hidden_rule_reg_seq.port_id));
                    if (!seq.randomize() with {
                        id          == hidden_rule_reg_seq.port_id;
                        frame_count == cfg.stim_cnt_time_us;
                        size_min    == cfg.size_min;
                        size_max    == cfg.size_max;
                    }) `uvm_fatal(get_name, "Randomization failed!")
                    seq.regmodel = env.regmodel;
                    seq.start(env.rx_eth.agent[hidden_rule_reg_seq.port_id].sequencer);
//                end
//                join_none // To spawn concurrent thread
//            end
//            wait fork; // Wait for all to complete
//        end
//        join

        phase.drop_objection(this);
    endtask

    /**
     * @Override
     * Additional drain time.
     */
    virtual task shutdown_phase(uvm_phase phase);
        super.shutdown_phase(phase);
        #10us;
    endtask

endclass

