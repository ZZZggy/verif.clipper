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

`ifndef INP_PROVISION_TEST__SVH
`define INP_PROVISION_TEST__SVH

// Class: inp_provision_test
// Configure multiple filter priorities and actions.
class inp_provision_test extends fsx_test_base;

    domain_catchall_cfg_seq catch_cfg_seq;
    int unsigned prov_idx;
    int unsigned prov_step = 8;

    `uvm_component_utils(inp_provision_test)

    // Constructor
    function new(string name="inp_provision_test", uvm_component parent=null);
        super.new(name, parent);
        if (!cfg.randomize()) `uvm_fatal("RNDERR", "test_cfg")
        cfg.stim_cnt_time_us = 10;
        cfg.size_min = 64;
        cfg.size_max = 128;
        // Enable CLI overrides for test parameters
        parse_cli_test_cfg();
    endfunction


    //-------------------------------------------------------------------
    // Validate that traffic passes
    //-------------------------------------------------------------------
    virtual task main_phase(uvm_phase phase);
        uvm_status_e status;
        intf_error_ethernet_seq_mixin#(ethernet_sequence_base) seq[PORT_IF : PORT_IF_LAST+1];
        int unsigned rule_max;
        int unsigned prio_max;
        int unsigned act_if_max;
        int unsigned act_cpu_max;

        phase.raise_objection(this);

        // Testcase required extra IF2CPU timestamp tolerance
        env_cfg.predictor_cfg.x2cpu_cfg.tolerance_timestamp_if = 'h400;// ~238.4ns - empiric value for FSX 1.1
        
        // Allow discard once traffic rate is not limited
        foreach (env.eth_sb[i]) begin
            env.eth_sb[i].cfg.allow_discard = '1;
        end


        catch_cfg_seq = domain_catchall_cfg_seq::type_id::create("catch_cfg_seq", this);
        init_vseq(catch_cfg_seq);


        repeat(16) begin
            for(int i=1; i<=NB_IF_PORTS; i++) begin
                rule_max    = env.regmodel.classifiers.p[i-1].pe[0].rule.size();
                prio_max    = `FSX_REG_PRT_ARRAY_MAX(env.regmodel.action_map_tables.p, i, .priority_index);
                act_if_max  = `FSX_REG_PRT_ARRAY_MAX(env.regmodel.cos_action.p, i, .action_index);
                act_cpu_max = `FSX_REG_PRT_ARRAY_MAX(env.regmodel.cpu_monitor_action.p, i, .cpu_action);

                `uvm_info("TEST", $sformatf("\n\n--- PROVISION %0d to %0d ---\nMAX Port=%2d rule=%3d prio=%3d act_if=%3d act_cpu=%3d",
                    prov_idx, prov_idx+prov_step, i, rule_max, prio_max, act_if_max, act_cpu_max), UVM_LOW)

                for(int j=prov_idx; j<prov_idx+prov_step; j++) begin
                    if (!catch_cfg_seq.randomize() with {
                        port == i;
                        foreach(domains[k]) domains[k] == 1;
                        dom_capture == 1;
                        pe    == 0;
                        rule  == j % local::rule_max;
                        field == j % local::rule_max;
                        prio  == j % local::prio_max;
                        actions[DOM_IF] == j % act_if_max;
                        actions[DOM_CPU] == j % act_cpu_max;
                    }) `randerr
                    catch_cfg_seq.start(null);
                    // Change opcode to match MAC DA LSB
                    env.regmodel.classifiers.p[i-1].pe[0].field[j % rule_max].opcode_a.set(8'b01000011);
                    env.regmodel.classifiers.p[i-1].pe[0].field[j % rule_max].data_a.set(j % prov_step);
                    env.regmodel.classifiers.p[i-1].pe[0].field[j % rule_max].key_addr_lsb.set(0);
                    env.regmodel.classifiers.p[i-1].pe[0].field[j % rule_max].key_addr_msb.set(0);
                    env.regmodel.classifiers.p[i-1].pe[0].field[j % rule_max].key_offset_a.set(1);
                    env.regmodel.classifiers.p[i-1].pe[0].field[j % rule_max].key_offset_b.set(0);
                    env.regmodel.classifiers.p[i-1].pe[0].field[j % rule_max].update(status);
                end
                env.regmodel.classifiers.p[i-1].rule_info.cfg[0].rt_start_addr.set(prov_idx % rule_max);
                env.regmodel.classifiers.p[i-1].rule_info.cfg[0].nb_rules_to_scan.set(prov_step-1);
                env.regmodel.classifiers.p[i-1].rule_info.cfg[0].update(status);
                env.regmodel.classifiers.p[i-1].rule_info.cfg_status[0].mirror(status, .check(UVM_NO_CHECK));
                env.regmodel.classifiers.p[i-1].rule_info.cfg_update.request.set(1);
                env.regmodel.classifiers.p[i-1].rule_info.cfg_update.write(status, 1);
            end
            prov_idx += prov_step;


            foreach(seq[i]) begin
                seq[i] = intf_error_ethernet_seq_mixin#(ethernet_sequence_base)::type_id::create($sformatf("seq%0d", i));
                if (!seq[i].randomize() with {
                    p_id           == local::i;
                    nb_item        == local::cfg.stim_cnt_time_us;
                    frame_size_min == local::cfg.size_min;
                    frame_size_max == local::cfg.size_max;
                    err_dist       inside{[10:20]};
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
        end

        phase.drop_objection(this);
    endtask

    //-------------------------------------------------------------------------------
    // TODO (CS): check_phase
    // Validate lost packet counters from scoreboards againts DUT statistics
    //-------------------------------------------------------------------------------

endclass

`endif //INP_PROVISION_TEST__SVH

