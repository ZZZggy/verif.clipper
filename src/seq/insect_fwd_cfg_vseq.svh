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

`ifndef INSECT_FWD_CFG_VSEQ__SVH
`define INSECT_FWD_CFG_VSEQ__SVH

// Class: insect_fwd_cfg_vseq
// Sequence for configuring input section with a catchall rule that will forward
// packets to the given domains and apply the given actions.
class insect_fwd_cfg_vseq extends clipper_base_vseq;

    //------------------------------------
    // Group: Knobs
    //------------------------------------

    rand int unsigned port;

    // Matching domains
    rand bit[4:0] domains;

    // Interface domain forwarding action
    rand action_type_pkg::act_if_rule_e if_action;

    // CPU and MON domains forwarding actions
    rand class_action_type_pkg::action_st cpu_mon_action;

    // Forwarding destination
    rand shortint unsigned outgoing_if;

    //------------------------------------
    // Group: Secondary Knobs
    //------------------------------------
    rand int unsigned prio;

    rand int unsigned actions[4];

    // The following knobs can probably be left alone...
    rand int unsigned pe;
    rand int unsigned rule;
    rand int unsigned field;

    // The following knobs are given soft constraints based on the port index
    rand int unsigned qset;
    rand int unsigned cos_pat;
    rand int unsigned cos_int;
    rand int unsigned queue;
    rand int unsigned bwp_idx;
    rand int unsigned bwp_remap;

    // Local randomization helpers
    local int unsigned max_cpu_action[NB_IF_PORTS];
    local int unsigned max_mon1_action[NB_IF_PORTS];
    local int unsigned max_mon2_action[NB_IF_PORTS];

    constraint c_ports {
        solve port before outgoing_if;

        port inside {[1:NB_IF_PORTS]};

        // Traffic ports are full mesh forwarding
        if (port inside {PORT_TRAFFIC}) {
            outgoing_if inside {PORT_TRAFFIC};
        }
    }

    constraint c_prios {
        prio inside {[0:get_size_priority_index(port)-1]};
    }

    constraint c_actions {
        actions[DOM_IF]   inside {[0:get_size_if_action(port)-1]};
        actions[DOM_CPU]  inside {[0:max_cpu_action[port-1]-1]};
        actions[DOM_MON1] inside {[0:max_mon1_action[port-1]-1]};
        actions[DOM_MON2] inside {[0:max_mon2_action[port-1]-1]};
    }

    constraint c_classifier {
        solve port before pe;
        solve port before rule;
        solve port before field;

        pe    inside {[0:$size(regmodel.classifiers.p[port].pe)-1]};
        rule  inside {[0:$size(regmodel.classifiers.p[port].pe[0].rule)-1]};
        field inside {[0:$size(regmodel.classifiers.p[port].pe[0].field)-1]};
    }

    constraint c_out_mapping {
        soft qset      == port-1;
        soft cos_pat   == port-1;
        soft cos_int   == port-1;
        soft queue     == 0;
        soft bwp_idx   == (port-1)%4;
        soft bwp_remap == port-1;
    }

    `uvm_object_utils(insect_fwd_cfg_vseq)
    // Constructor: new
    function new(string name="insect_fwd_cfg_vseq");
        super.new(name);
    endfunction

    function void pre_randomize();

        max_cpu_action[0]  = $size(regmodel.cpu_monitor_action[0].cpu_action);
        max_cpu_action[1]  = $size(regmodel.cpu_monitor_action[1].cpu_action);
        max_cpu_action[2]  = $size(regmodel.cpu_monitor_action[2].cpu_action);
        max_cpu_action[3]  = $size(regmodel.cpu_monitor_action[3].cpu_action);
        max_cpu_action[4]  = $size(regmodel.cpu_monitor_action[4].cpu_action);
        max_cpu_action[5]  = $size(regmodel.cpu_monitor_action[5].cpu_action);
        max_cpu_action[6]  = $size(regmodel.cpu_monitor_action[6].cpu_action);
        max_cpu_action[7]  = $size(regmodel.cpu_monitor_action[7].cpu_action);
        max_cpu_action[8]  = $size(regmodel.cpu_monitor_action[8].cpu_action);
        max_cpu_action[9]  = $size(regmodel.cpu_monitor_action[9].cpu_action);
        max_cpu_action[10] = $size(regmodel.cpu_monitor_action[10].cpu_action);
        max_cpu_action[11] = $size(regmodel.cpu_monitor_action[11].cpu_action);

        max_mon1_action[0]  = $size(regmodel.cpu_monitor_action[0].mon1_action);
        max_mon1_action[1]  = $size(regmodel.cpu_monitor_action[1].mon1_action);
        max_mon1_action[2]  = $size(regmodel.cpu_monitor_action[2].mon1_action);
        max_mon1_action[3]  = $size(regmodel.cpu_monitor_action[3].mon1_action);
        max_mon1_action[4]  = $size(regmodel.cpu_monitor_action[4].mon1_action);
        max_mon1_action[5]  = $size(regmodel.cpu_monitor_action[5].mon1_action);
        max_mon1_action[6]  = $size(regmodel.cpu_monitor_action[6].mon1_action);
        max_mon1_action[7]  = $size(regmodel.cpu_monitor_action[7].mon1_action);
        max_mon1_action[8]  = $size(regmodel.cpu_monitor_action[8].mon1_action);
        max_mon1_action[9]  = $size(regmodel.cpu_monitor_action[9].mon1_action);
        max_mon1_action[10] = $size(regmodel.cpu_monitor_action[10].mon1_action);
        max_mon1_action[11] = $size(regmodel.cpu_monitor_action[11].mon1_action);

        max_mon2_action[0]  = $size(regmodel.cpu_monitor_action[0].mon2_action);
        max_mon2_action[1]  = $size(regmodel.cpu_monitor_action[1].mon2_action);
        max_mon2_action[2]  = $size(regmodel.cpu_monitor_action[2].mon2_action);
        max_mon2_action[3]  = $size(regmodel.cpu_monitor_action[3].mon2_action);
        max_mon2_action[4]  = $size(regmodel.cpu_monitor_action[4].mon2_action);
        max_mon2_action[5]  = $size(regmodel.cpu_monitor_action[5].mon2_action);
        max_mon2_action[6]  = $size(regmodel.cpu_monitor_action[6].mon2_action);
        max_mon2_action[7]  = $size(regmodel.cpu_monitor_action[7].mon2_action);
        max_mon2_action[8]  = $size(regmodel.cpu_monitor_action[8].mon2_action);
        max_mon2_action[9]  = $size(regmodel.cpu_monitor_action[9].mon2_action);
        max_mon2_action[10] = $size(regmodel.cpu_monitor_action[10].mon2_action);
        max_mon2_action[11] = $size(regmodel.cpu_monitor_action[11].mon2_action);
    endfunction

    // Helper functions for constraints
    `GET_REG_PRT_ARRAY_SIZE(priority_index, regmodel.action_map_tables.p, .priority_index)
    `GET_REG_PRT_ARRAY_SIZE(if_action, regmodel.cos_action.p, .action_index)

    // Apply configuration to regmodel
    virtual task body();
        uvm_status_e status;

        $display("Port %0d, pe %0d, rule %0d", port, pe, rule);

        // Classifier
        regmodel.classifiers.p[port-1].pe[pe].rule[rule].priority_index.set(prio   );
        regmodel.classifiers.p[port-1].pe[pe].rule[rule].domain.set        (domains);
        regmodel.classifiers.p[port-1].pe[pe].rule[rule].ft_start_addr.set (field  );
        regmodel.classifiers.p[port-1].pe[pe].rule[rule].nb_comp.set       (0      );
        regmodel.classifiers.p[port-1].pe[pe].rule[rule].last_key_addr.set (1      ); // anything with MAC addresses
        regmodel.classifiers.p[port-1].pe[pe].rule[rule].prefilter.set     (0      );
        regmodel.classifiers.p[port-1].pe[pe].rule[rule].update(status);

        regmodel.classifiers.p[port-1].pe[pe].field[field].opcode_a.set(0);
        regmodel.classifiers.p[port-1].pe[pe].field[field].opcode_b.set(0);
        regmodel.classifiers.p[port-1].pe[pe].field[field].data_a.set  (0);
        regmodel.classifiers.p[port-1].pe[pe].field[field].data_b.set  (0);
        regmodel.classifiers.p[port-1].pe[pe].field[field].update(status);

        regmodel.classifiers.p[port-1].rule_info.cfg[pe].rt_start_addr.set   (rule   );
        regmodel.classifiers.p[port-1].rule_info.cfg[pe].nb_rules_to_scan.set(0      );
        regmodel.classifiers.p[port-1].rule_info.cfg[pe].early_exit_ena.set  (0      );
        regmodel.classifiers.p[port-1].rule_info.cfg[pe].domains.set         (domains);
        regmodel.classifiers.p[port-1].rule_info.cfg[pe].update(status);

        regmodel.classifiers.p[port-1].rule_info.cfg_status[pe].mirror(status, .check(UVM_NO_CHECK));

        regmodel.classifiers.p[port-1].rule_info.cfg_update.request.set(1);
        regmodel.classifiers.p[port-1].rule_info.cfg_update.update(status);

        // Priority to action mapping
        `REG_PRT(, regmodel.action_map_tables.p, port, .priority_index[prio].if_action_index.set  (actions[DOM_IF]  ))
        `REG_PRT(, regmodel.action_map_tables.p, port, .priority_index[prio].cpu_action_index.set (actions[DOM_CPU] ))
        `REG_PRT(, regmodel.action_map_tables.p, port, .priority_index[prio].mon1_action_index.set(actions[DOM_MON1]))
        `REG_PRT(, regmodel.action_map_tables.p, port, .priority_index[prio].mon2_action_index.set(actions[DOM_MON2]))
        `REG_PRT(, regmodel.action_map_tables.p, port, .priority_index[prio].update(status))

        // CoS'n Action CPU, MON
        regmodel.cpu_monitor_action[port-1].cpu_action[actions[DOM_CPU]].cpu_forwarding.set       (cpu_mon_action.cpu   );
        regmodel.cpu_monitor_action[port-1].cpu_action[actions[DOM_CPU]].update(status);

        regmodel.cpu_monitor_action[port-1].mon1_action[actions[DOM_MON1]].monitor1_forwarding.set(cpu_mon_action.mon[0]);
        regmodel.cpu_monitor_action[port-1].mon1_action[actions[DOM_MON1]].update(status);

        regmodel.cpu_monitor_action[port-1].mon2_action[actions[DOM_MON2]].monitor2_forwarding.set(cpu_mon_action.mon[1]);
        regmodel.cpu_monitor_action[port-1].mon2_action[actions[DOM_MON2]].update(status);

        regmodel.globals.mon_cfg.mon1_ena.set(1);
        regmodel.globals.mon_cfg.mon2_ena.set(1);
        regmodel.globals.mon_cfg.update(status);

        // CoS'n Action IF
        `REG_PRT(,regmodel.cos_action.p, port, .action_index[actions[DOM_IF]].cfg1.interface_rule.set    (if_action  ))
        `REG_PRT(,regmodel.cos_action.p, port, .action_index[actions[DOM_IF]].cfg1.outgoing_interface.set(outgoing_if))
        `REG_PRT(,regmodel.cos_action.p, port, .action_index[actions[DOM_IF]].cfg1.update(status))

        `REG_PRT(,regmodel.cos_action.p, port, .action_index[actions[DOM_IF]].cfg0.default_cos_pattern_address.set(cos_pat))
        `REG_PRT(,regmodel.cos_action.p, port, .action_index[actions[DOM_IF]].cfg0.bwp_profile_base_index.set     (bwp_idx))
        `REG_PRT(,regmodel.cos_action.p, port, .action_index[actions[DOM_IF]].cfg0.update(status))

        `REG_PRT(,regmodel.cos_action.p, port, .action_index[actions[DOM_IF]].cfg2.outgoing_qset.set(qset))
        `REG_PRT(,regmodel.cos_action.p, port, .action_index[actions[DOM_IF]].cfg2.update(status))

        // Cost pattern
        `REG_PRT(,regmodel.cos_pattern_tables.p, port, .pattern[cos_pat].bwp_pre_color1.set    (0      ));
        `REG_PRT(,regmodel.cos_pattern_tables.p, port, .pattern[cos_pat].bwp_profile_ena.set   (0      ));
        `REG_PRT(,regmodel.cos_pattern_tables.p, port, .pattern[cos_pat].bwp_pre_color0.set    (0      ));
        `REG_PRT(,regmodel.cos_pattern_tables.p, port, .pattern[cos_pat].bwp_profile_offset.set(0      ));
        `REG_PRT(,regmodel.cos_pattern_tables.p, port, .pattern[cos_pat].cos_internal.set      (cos_int));
        `REG_PRT(,regmodel.cos_pattern_tables.p, port, .pattern[cos_pat].yellow_pcp_bits.set   (0      ));
        `REG_PRT(,regmodel.cos_pattern_tables.p, port, .pattern[cos_pat].green_pcp_bits.set    (0      ));
        `REG_PRT(,regmodel.cos_pattern_tables.p, port, .pattern[cos_pat].update(status));

        // BWP
        regmodel.bwp.profile_remap.class2bwp_profile_ndx[bwp_idx].profile_remap.profile_ndx.set(bwp_idx);
        regmodel.bwp.profile_remap.class2bwp_profile_ndx[bwp_idx].profile_remap.update(status);

        regmodel.bwp.bwp_shaper[bwp_idx].rank_page_0[bwp_idx].shaper_ndx.set(bwp_idx);
        regmodel.bwp.bwp_shaper[bwp_idx].rank_page_0[bwp_idx].rank.set      (1      );
        regmodel.bwp.bwp_shaper[bwp_idx].rank_page_0[bwp_idx].update(status);

        regmodel.bwp.bwp_shaper[bwp_idx].cfg.global_rank_page_ndx.set(0  );
        regmodel.bwp.bwp_shaper[bwp_idx].cfg.last_rank.set           (255);
        regmodel.bwp.bwp_shaper[bwp_idx].cfg.update(status);

        regmodel.bwp.bwp_shaper[bwp_idx].params_cir[bwp_idx].cbs.set    (10  );
        regmodel.bwp.bwp_shaper[bwp_idx].params_cir[bwp_idx].cir.set    (8000);
        regmodel.bwp.bwp_shaper[bwp_idx].params_cir[bwp_idx].cir_max.set(8000);
        regmodel.bwp.bwp_shaper[bwp_idx].params_cir[bwp_idx].cir_ena.set(0   );
        regmodel.bwp.bwp_shaper[bwp_idx].params_cir[bwp_idx].update(status);

        regmodel.bwp.bwp_shaper[bwp_idx].params_eir[bwp_idx].ebs.set    (10  );
        regmodel.bwp.bwp_shaper[bwp_idx].params_eir[bwp_idx].eir.set    (8000);
        regmodel.bwp.bwp_shaper[bwp_idx].params_eir[bwp_idx].eir_max.set(8000);
        regmodel.bwp.bwp_shaper[bwp_idx].params_eir[bwp_idx].eir_ena.set(0   );
        regmodel.bwp.bwp_shaper[bwp_idx].params_eir[bwp_idx].update(status);

        // TBD :
        //regmodel.q_mapping_table.outgoing_port[outgoing_if-1].outgoing_qset[qset].cos_internal[cos_int].q.set(queue);
        //regmodel.q_mapping_table.outgoing_port[outgoing_if-1].outgoing_qset[qset].cos_internal[cos_int].q.update(status);
        //regmodel.protection_tbl.logical_port[0].physical_port[port-1].mode_bridge.select_bridge.set(1);
        //regmodel.protection_tbl.logical_port[0].physical_port[port-1].mode_bridge.update(status);
    endtask

    virtual function string convert2string();
        string s="\nINSECT_FWD:";
        $swrite(s, "%0s\n port          = %0d", s, port);
        $swrite(s, "%0s\n domains       = %5b", s, domains);
        $swrite(s, "%0s\n if_action     = %0s", s, if_action.name);
        $swrite(s, "%0s\n cpu_action    = %0s", s, cpu_mon_action.cpu.name);
        $swrite(s, "%0s\n pc_action     = %0s", s, cpu_mon_action.pc.name);
        $swrite(s, "%0s\n mon1_action   = %0s", s, cpu_mon_action.mon[0].name);
        $swrite(s, "%0s\n mon2_action   = %0s", s, cpu_mon_action.mon[1].name);
        $swrite(s, "%0s\n outgoing_if   = %0d", s, outgoing_if);
        $swrite(s, "%0s\n prio          = %0d", s, prio);
        $swrite(s, "%0s\n actions[IF]   = %0d", s, actions[DOM_IF]);
        $swrite(s, "%0s\n actions[CPU]  = %0d", s, actions[DOM_CPU]);
        $swrite(s, "%0s\n actions[MON1] = %0d", s, actions[DOM_MON1]);
        $swrite(s, "%0s\n actions[MON2] = %0d", s, actions[DOM_MON2]);
        return s;
    endfunction

endclass

`endif // INSECT_FWD_CFG_VSEQ__SVH
