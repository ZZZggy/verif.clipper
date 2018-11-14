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

`ifndef SANITY_TEST_BASE__SVH
`define SANITY_TEST_BASE__SVH

// Class: fsx_test_base
// The testbench environment.
class sanity_test extends clipper_test_base;
    `uvm_component_utils(sanity_test)

    // Constructor
    function new(string name="sanity_test", uvm_component parent=null);
        super.new(name, parent);
        // Configure TRF ports 10Gbps
        cfg.port_speed[5:8] = '{PS_10G, PS_10G, PS_10G, PS_10G};
        cfg.eot_win_cnt = 100; // 10us drain
        // Enable CLI overrides for test parameters
        parse_cli_test_cfg();
    endfunction

    // Send a packet per USER interface
    task main_phase(uvm_phase phase);
        uvm_status_e status;
        mac_frame_good_traffic_sequence_t seq[5:5];
        acd_mm_raw_reg_sequence raw_seq;
        int unsigned wr_data = 'h1234;
        int unsigned scratch_addr = env.regmodel.globals.scratch.get_address();

        phase.raise_objection(this);

        //-------------------------------------------------------------------
        // Validate scratchpad register(s)
        //-------------------------------------------------------------------
        raw_seq = acd_mm_raw_reg_sequence::type_id::create("raw_seq", this);

        // Read current scratch value
        raw_seq.kind = acd_mm_rw::READ;
        raw_seq.addr = scratch_addr;
        raw_seq.start(env.acd_mm.agent.sequencer);

        // Write scratch
        raw_seq.kind = acd_mm_rw::WRITE;
        raw_seq.addr = scratch_addr;
        raw_seq.data = wr_data;
        raw_seq.start(env.acd_mm.agent.sequencer);

        // Read new scratch value
        raw_seq.kind = acd_mm_rw::READ;
        raw_seq.addr = scratch_addr;
        raw_seq.start(env.acd_mm.agent.sequencer);

        if (raw_seq.data == wr_data) begin
            `uvm_info("TEST", "Wrote/Read Scratch pad register successfully", UVM_NONE)
        end else begin
            `uvm_error("TEST", $sformatf("Scratch pad register access failed. Wrote 0x%0h, but read 0x%0h", wr_data, raw_seq.data))
        end

        // Setup action map table to avoid index 0
        env.regmodel.action_map_tables.p5.priority_index[2048].if_action_index.set(0);
        env.regmodel.action_map_tables.p5.priority_index[2048].update(status);
        env.regmodel.cos_action.p5.action_index[0].cfg1.outgoing_interface.set(6);
        env.regmodel.cos_action.p5.action_index[0].cfg1.interface_rule.set(2);
        env.regmodel.cos_action.p5.action_index[0].cfg1.update(status);
        
        env.regmodel.action_map_tables.p6.priority_index[2048].if_action_index.set(0);
        env.regmodel.action_map_tables.p6.priority_index[2048].update(status);
        env.regmodel.cos_action.p6.action_index[0].cfg1.outgoing_interface.set(6);
        env.regmodel.cos_action.p6.action_index[0].cfg1.interface_rule.set(2);
        env.regmodel.cos_action.p6.action_index[0].cfg1.update(status);

        env.regmodel.action_map_tables.p7.priority_index[1024].if_action_index.set(0);
        env.regmodel.action_map_tables.p7.priority_index[1024].update(status);
        env.regmodel.cos_action.p7.action_index[0].cfg1.outgoing_interface.set(6);
        env.regmodel.cos_action.p7.action_index[0].cfg1.interface_rule.set(2);
        env.regmodel.cos_action.p7.action_index[0].cfg1.update(status);

        env.regmodel.action_map_tables.p8.priority_index[1024].if_action_index.set(0);
        env.regmodel.action_map_tables.p8.priority_index[1024].update(status);
        env.regmodel.cos_action.p8.action_index[0].cfg1.outgoing_interface.set(6);
        env.regmodel.cos_action.p8.action_index[0].cfg1.interface_rule.set(2);
        env.regmodel.cos_action.p8.action_index[0].cfg1.update(status);

        // By default the port shaper are closed
        env.regmodel.tm.shaper.shaper_group_0.params_cir[0].cbs.set(4);
        env.regmodel.tm.shaper.shaper_group_0.params_cir[0].cir.set(80000);
        env.regmodel.tm.shaper.shaper_group_0.params_cir[0].cir_max.set(80000);
        env.regmodel.tm.shaper.shaper_group_0.params_cir[0].cir_ena.set(0);
        env.regmodel.tm.shaper.shaper_group_0.params_cir[0].update(status);

        //-------------------------------------------------------------------
        // Validate that traffic passes
        //-------------------------------------------------------------------
        foreach(seq[i]) begin
            seq[i] = mac_frame_good_traffic_sequence_t::type_id::create($sformatf("seq%0d", i));
            if (!seq[i].randomize() with {
                id               == i;
                frame_count      == 100000;
                max_payload_size == 62;
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

endclass

`endif
