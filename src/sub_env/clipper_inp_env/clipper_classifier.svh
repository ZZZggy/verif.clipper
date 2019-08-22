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
//-----------------------------------------------------------------------------

// Note that these implementations only need to provide register-model specific
// details.
class clipper_classifier extends classifier_base#(c1lt_reg_block);
    `uvm_component_utils(clipper_classifier)
    function new(string name="clipper_classifier", uvm_component parent=null);
        super.new(name, parent);
    endfunction

    /**
     * @Override
     */
    virtual function void build_phase(uvm_phase phase);
        `uvm_info("CLIPPER_CLASSIFIER", "Entering build_phase", UVM_LOW)
        set_type_override_by_type(class_action_filter#(c1lt_reg_block)::get_type(), clipper_class_action_filter::get_type(), 0);
        set_type_override_by_type(class_rule_action#(c1lt_reg_block)::get_type(), clipper_class_rule_action::get_type(), 0);
        set_type_override_by_type(bwp_model#(c1lt_reg_block)::get_type(), clipper_bwp_model::get_type(), 0);
        set_type_override_by_type(class_action_router#(c1lt_reg_block)::get_type(), clipper_class_action_router::get_type(), 0);

        super.build_phase(phase);
        `uvm_info("CLIPPER_CLASSIFIER", "Exiting build_phase", UVM_LOW)
    endfunction

    /**
     * @Implement
     */
    virtual function int unsigned get_last_rule_idx(ethernet_frame_t t, int domain_idx);
        case(domain_idx)
            DOM_CPU:  `REG_PRT(return, 2**regmodel.action_map_tables.p, t.p_id,.priority_index[0].cpu_action_index.get_n_bits()-1)
            DOM_IF:   `REG_PRT(return, 2**regmodel.action_map_tables.p, t.p_id,.priority_index[0].if_action_index.get_n_bits()-1)
            DOM_MON1: `REG_PRT(return, 2**regmodel.action_map_tables.p, t.p_id,.priority_index[0].mon1_action_index.get_n_bits()-1)
            DOM_MON2: `REG_PRT(return, 2**regmodel.action_map_tables.p, t.p_id,.priority_index[0].mon2_action_index.get_n_bits()-1)
            default:  begin
                `uvm_error("IDXERR", $sformatf("Unknown domain index %0d to get last rule index.", domain_idx))
                return 0;
            end
        endcase
    endfunction

    /**
     * @Implement
     */
    virtual function int unsigned get_last_prio_idx(ethernet_frame_t t);
        case(t.p_id)
            1:  return $size(regmodel.action_map_tables.p1.priority_index)-1;
            2:  return $size(regmodel.action_map_tables.p2.priority_index)-1;
            3:  return $size(regmodel.action_map_tables.p3.priority_index)-1;
            4:  return $size(regmodel.action_map_tables.p4.priority_index)-1;
            5:  return $size(regmodel.action_map_tables.p5.priority_index)-1;
            6:  return $size(regmodel.action_map_tables.p6.priority_index)-1;
            7:  return $size(regmodel.action_map_tables.p7.priority_index)-1;
            8:  return $size(regmodel.action_map_tables.p8.priority_index)-1;
            9:  return $size(regmodel.action_map_tables.p9.priority_index)-1;
            10: return $size(regmodel.action_map_tables.p10.priority_index)-1;
            11: return $size(regmodel.action_map_tables.p11.priority_index)-1;
            12: return $size(regmodel.action_map_tables.p12.priority_index)-1;
            default: begin
                `uvm_fatal("PORTERR", $sformatf("Port %0d undefined user port index to get last prio index.", t.p_id))
            end
        endcase
    endfunction

    /**
     * @Implement
     */
    virtual function int unsigned priority2action_map(ethernet_frame_t t, int domain_idx, int prio_idx);
        case(domain_idx)
            DOM_CPU:  `REG_PRT(return, regmodel.action_map_tables.p, t.p_id,.priority_index[prio_idx].cpu_action_index.get())
            DOM_IF:   `REG_PRT(return, regmodel.action_map_tables.p, t.p_id,.priority_index[prio_idx].if_action_index.get())
            DOM_MON1: `REG_PRT(return, regmodel.action_map_tables.p, t.p_id,.priority_index[prio_idx].mon1_action_index.get())
            DOM_MON2: `REG_PRT(return, regmodel.action_map_tables.p, t.p_id,.priority_index[prio_idx].mon2_action_index.get())
            default:  begin
                `uvm_error("IDXERR", $sformatf("Unknown domain index %0d to map priority to action.", domain_idx))
                return 0;
            end
        endcase
    endfunction

    /**
     * @Implement
     * TODO implement check_all
     */
    virtual task verify_stats(bit check_all=0);
        bit [1:0] cpu_mode;
        pkt_stat_t count;
        uvm_status_e status;
        bit res;

        foreach(stats[i]) begin
            if ((i == 0) || (i > NB_IF_PORTS)) continue;

            //--------------------
            // CPU
            //--------------------
            count = 0;
            // get mode
            case(i)
                1: cpu_mode = regmodel.globals.class_stats_cpu_cfg.count_mode1.get();
                2: cpu_mode = regmodel.globals.class_stats_cpu_cfg.count_mode2.get();
                3: cpu_mode = regmodel.globals.class_stats_cpu_cfg.count_mode3.get();
                4: cpu_mode = regmodel.globals.class_stats_cpu_cfg.count_mode4.get();
                5: cpu_mode = regmodel.globals.class_stats_cpu_cfg.count_mode5.get();
                6: cpu_mode = regmodel.globals.class_stats_cpu_cfg.count_mode6.get();
                7: cpu_mode = regmodel.globals.class_stats_cpu_cfg.count_mode7.get();
                8: cpu_mode = regmodel.globals.class_stats_cpu_cfg.count_mode8.get();
                9: cpu_mode = regmodel.globals.class_stats_cpu_cfg.count_mode9.get();
                10: cpu_mode = regmodel.globals.class_stats_cpu_cfg.count_mode10.get();
                11: cpu_mode = regmodel.globals.class_stats_cpu_cfg.count_mode11.get();
                12: cpu_mode = regmodel.globals.class_stats_cpu_cfg.count_mode12.get();
                default: `uvm_error("PORTERR", $sformatf("Unknown port for stats: %0d", i))
            endcase
            // predict based on mode
            foreach(stats[i].axn_cpu[j]) begin
                case(cpu_mode)
                    2'b10: begin
                        // FWD
                        count = stats[i].axn_cpu[j].fwd;
                    end
                    2'b11: begin
                        // DIS
                        count = stats[i].axn_cpu[j].dis;
                    end
                    default: begin
                        // ALL
                        // TODO Will this sum work piecewise?
                        count = stats[i].axn_cpu[j].fwd + stats[i].axn_cpu[j].dis;
                    end
                endcase

                res = regmodel.class_stats.class_stats_cpu[i-1].stat[j].packet_count.predict(count.packets_good + count.packets_bad);
//                res = regmodel.class_stats.class_stats_cpu[i].stat[j].byte_count.predict(count.bytes_good + count.bytes_bad);
                regmodel.class_stats.class_stats_cpu[i-1].stat[j].mirror(status, .check(UVM_CHECK));

            end

            //--------------------
            // IF
            //--------------------
            foreach(stats[i].axn_if[j]) begin
                count = stats[i].axn_if[j].fwd + stats[i].axn_if[j].dis;

                `REG_PRT(res = ,regmodel.class_stats.class_stats_if.p, i, .stat[j].packet_count.predict(count.packets_good + count.packets_bad))
                `REG_PRT(res = ,regmodel.class_stats.class_stats_if.p, i, .stat[j].byte_count.predict(count.bytes_good + count.bytes_bad))
                `REG_PRT(,regmodel.class_stats.class_stats_if.p, i, .stat[j].mirror(status, .check(UVM_CHECK)))

            end
        end

    endtask

    // TBD : 
    function bit get_lpdb_rule_ttl_flag(const ref ethernet_frame_t t, const ref bit clear);
    endfunction
    
endclass

