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
        cfg.stim_cnt_time_us = 3;
        cfg.size_min = 64;
        cfg.size_max = 64;
        // Enable CLI overrides for test parameters
        parse_cli_test_cfg();
    endfunction

    // Configure and send packets
    task main_phase(uvm_phase phase);
        thi_cpu2if_seq_t cpu2if_seq[0:6];
        domain_catchall_cfg_seq catch_cfg_seq;
        l2_untagged_64_bytes_sequence_t seq[0 : 7];
        uvm_status_e status;

        phase.raise_objection(this);

        
        //-------------------------------------------------------------------
        // Disable PC
        //-------------------------------------------------------------------
        env_cfg.pc_env_cfg.ena_eot_drain = 0;
        env.regmodel.packet_capture.cfg.ena.set(0);
        env.regmodel.packet_capture.cfg.keep_alive_ena.set(0);
        env.regmodel.packet_capture.cfg.update(status);

        //-------------------------------------------------------------------
        // Configure
        //-------------------------------------------------------------------
        catch_cfg_seq = domain_catchall_cfg_seq::type_id::create("catch_cfg_seq", this);
        init_vseq(catch_cfg_seq);
        for(int i=1; i<=NB_IF_PORTS; i++) begin
            if (!catch_cfg_seq.randomize() with {
                port == i;
                domains[0] == 0;
                domains[1] == 1;
                domains[2] == 0;
                domains[3] == 0;
                domains[4] == 0;
            }) `uvm_fatal("RNDERR", "cfg")
            `uvm_info("TEST", catch_cfg_seq.convert2string(), UVM_MEDIUM)
            catch_cfg_seq.start(null);
        end

        //-------------------------------------------------------------------
        // Validate that traffic passes
        //-------------------------------------------------------------------
        foreach(seq[i]) begin
            seq[i] = l2_untagged_64_bytes_sequence_t::type_id::create($sformatf("seq%0d", i));
            if (!seq[i].randomize() with {
                id               == i;
                frame_count      == 1;
                max_payload_size inside {[cfg.size_min:cfg.size_max]};
            }) `uvm_fatal("RNDERR", seq[i].get_name)
        end

        fork begin
            foreach(seq[i]) begin
                automatic int s=i;
                // Start sequence on Interface port agents
                begin
                    seq[s].start(env.rx_eth.agent[s].sequencer);
                end
            end
        end
        join

        // Launch sequence
        ctrl_vif.thi_ena = '1;
        foreach(cpu2if_seq[i]) begin
            cpu2if_seq[i] = thi_cpu2if_seq_t::type_id::create($sformatf("cpu2if_seq%0d", i));
            cpu2if_seq[i].NUM_USR_PRTS = 8;
            if (!cpu2if_seq[i].randomize() with {
                frame_count     == 1;
                if_dest         == i+1;
            }) `uvm_fatal("RNDERR", cpu2if_seq[i].get_name)
        end
    
        foreach(cpu2if_seq[i]) begin
            automatic int s=i;
            // Start sequence on Interface port agents
            begin
                cpu2if_seq[s].start(env.rx_eth.agent[PORT_CPU].sequencer);
            end
        end

        phase.drop_objection(this);
    endtask


    virtual task pre_shutdown_phase(uvm_phase phase);
        super.pre_shutdown_phase(phase);
        phase.raise_objection(phase);
        // Give register access back to acd_mm agent
        ctrl_vif.thi_ena = '0;
        phase.drop_objection(phase);
    endtask
endclass

`endif //IF2ALL_TEST__SVH

