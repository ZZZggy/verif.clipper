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
class clipper_class_rule_action extends class_rule_action#(c1lt_reg_block);
    `uvm_component_utils(clipper_class_rule_action)
    function new(string name="clipper_class_rule_action", uvm_component parent=null);
        super.new(name, parent);
    endfunction

    function bit is_dscp_remark_ena(ethernet_frame_t t, int rule_idx);
        //`REG_PRT(return,regmodel.inp_globals.dscp_remarking.port,t.p_id,_ena.get())
        // TODO
        // FIXME R7.1 no more DSCP remarking (?)
        return 1'b0;
    endfunction

    function bit[5:0] get_dscp_remark(ethernet_frame_t t, int rule_idx);
        //return regmodel.inp_globals.dscp_remarking_bgp_value.bgp_value.get();
        // TODO
        // FIXME R7.1 no more DSCP remarking (?)
        return 0;
    endfunction

    function bit get_oam_action_mode(ethernet_frame_t t, int rule_idx);
        `REG_PRT(return, regmodel.cos_action.p, t.p_id, .action_index[rule_idx].cfg1.oam_action_mode.get())
    endfunction

    function bit[2:0] get_oam_action(ethernet_frame_t t, int rule_idx);
        `REG_PRT(return , regmodel.cos_action.p, t.p_id, .action_index[rule_idx].cfg1.oam_action.get())
    endfunction

    function void get_action_vtags(ethernet_frame_t t, int rule_idx, ref vlan_tag_t vtag1, ref vlan_tag_t vtag2);
        uvm_reg_data_t data;
        `REG_PRT(data =  , regmodel.cos_action.p, t.p_id, .action_index[rule_idx].cfg0.push_vlan1_type.get())
        case(data)
            0: vtag1.tpid = 'h8100;
            1: vtag1.tpid = 'h88A8;
            2: vtag1.tpid = 'h9100;
            3: vtag1.tpid = regmodel.globals.global_input_cfg_0.user_vlan_ethertype.get();
            default: `uvm_error("TYPEERR", "Unknown VLAN/TPID type.")
        endcase
        `REG_PRT(data =  , regmodel.cos_action.p, t.p_id, .action_index[rule_idx].cfg0.push_vlan1_value.get())
        vtag1.tci.vid = data;

        // TODO: COS-P
        //vtag1.tci.pcp = data;

        `REG_PRT(data =  , regmodel.cos_action.p, t.p_id, .action_index[rule_idx].cfg2.push_vlan2_type.get())
        case(data)
            0: vtag2.tpid = 'h8100;
            1: vtag2.tpid = 'h88A8;
            2: vtag2.tpid = 'h9100;
            3: vtag2.tpid = regmodel.globals.global_input_cfg_0.user_vlan_ethertype.get();
            default: `uvm_error("TYPEERR", "Unknown VLAN/TPID type.")
        endcase
        `REG_PRT(data =  , regmodel.cos_action.p, t.p_id, .action_index[rule_idx].cfg2.push_vlan2_value.get())
        vtag2.tci.vid = data;


        // TODO: COS-M
        //vtag2.tci.pcp = data;
    endfunction

    function address_t get_sys_mac_addr();
        address_t addr = 48'h0015ad000000 | (48'h000000FFFFFF & regmodel.globals.mac_base_addr.nic.get());
        return addr;
    endfunction

    function void decode_execute_actions(input bit [7:0] p_pkt_in [], mod_eng2_prt::usr_prt_t usr, output bit [7:0] p_pkt_out [], int ins_hdr);
        // TBD : 
        p_pkt_out = p_pkt_in;
    endfunction
    
    function bit [1:0] decode_tpid(bit[15:0] tpid);
        // TBD 
    endfunction
    
    function bit[9:0] get_vlan_actions(ethernet_frame_t t, int rule_idx);
        bit [4:0] act1, act2;
        `REG_PRT(act1 =  , regmodel.cos_action.p, t.p_id, .action_index[rule_idx].cfg2.vlan1_action.get())
        `REG_PRT(act2 =  , regmodel.cos_action.p, t.p_id, .action_index[rule_idx].cfg2.vlan2_action.get())
        return {act1, act2};
    endfunction

    function act_if_rule_e get_if_rule(ethernet_frame_t t, int rule_idx);
        uvm_reg_data_t data;
        `REG_PRT(data =  , regmodel.cos_action.p, t.p_id, .action_index[rule_idx].cfg1.interface_rule.get())
        return act_if_rule_e'(data);
    endfunction

    function act_mon_rule_e get_mon_rule(ethernet_frame_t t, int rule_idx, int mon_idx);
        uvm_reg_data_t data;
// FIXME
        //`REG_PRT(data =  , regmodel.cos_action.p, t.p_id, .action_index[rule_idx].cfg1.monitor_action.get())
        //return act_mon_rule_e'(data);
        return act_mon_rule_e'(0);
    endfunction

    function bit[1:0] get_mon_ena();
        get_mon_ena[0] = regmodel.globals.mon_cfg.mon1_ena.get();
        get_mon_ena[1] = regmodel.globals.mon_cfg.mon2_ena.get();
        return get_mon_ena;
    endfunction

    function void get_mon_ports(ref shortint unsigned ports[2]);
        ports[0] = 8;
        ports[1] = 12;
    endfunction

    function bit cpu_fwd_ena(ethernet_frame_t t, int rule_idx);
        return (regmodel.cpu_monitor_action[t.p_id].cpu_action[rule_idx].cpu_forwarding.get() & 1'b1);
    endfunction

    function bit mon_fwd_ena(ethernet_frame_t t, int rule_idx, int mon_idx);
        case(mon_idx)
            0      : return (regmodel.cpu_monitor_action[t.p_id].mon1_action[rule_idx].monitor1_forwarding.get() & 1'b1);
            default: return (regmodel.cpu_monitor_action[t.p_id].mon2_action[rule_idx].monitor2_forwarding.get() & 1'b1);
        endcase
    endfunction

    function bit pc_fwd_ena(ethernet_frame_t t, int rule_idx);
        // TBD 
    endfunction

    function bit is_cos_mapping_enable(ethernet_frame_t t, int rule_idx);
        `REG_PRT(return, regmodel.cos_action.p, t.p_id, .action_index[rule_idx].cfg1.cos_mapping_enable.get())
    endfunction

    function int unsigned get_default_cos_pattern_address(ethernet_frame_t t, int rule_idx);
        `REG_PRT(return, regmodel.cos_action.p, t.p_id, .action_index[rule_idx].cfg0.default_cos_pattern_address.get())
    endfunction

    function bit bwp_profile_ena(ethernet_frame_t t, int cos_pat_addr);
        `REG_PRT(return, regmodel.cos_pattern_tables.p, t.p_id, .pattern[cos_pat_addr].bwp_profile_ena.get())
    endfunction

    function int unsigned get_bwp_profile_base(ethernet_frame_t t, int rule_idx);
        `REG_PRT(return, regmodel.cos_action.p, t.p_id, .action_index[rule_idx].cfg0.bwp_profile_base_index.get())
    endfunction

    function int unsigned get_bwp_profile_offset(ethernet_frame_t t, int cos_pat_addr);
        `REG_PRT(return, regmodel.cos_pattern_tables.p, t.p_id, .pattern[cos_pat_addr].bwp_profile_offset.get())
    endfunction

    function int unsigned get_nb_bwp(ethernet_frame_t t);
        return 1024;
    endfunction

    function act_cos_color_e get_pre_color(ethernet_frame_t t, int cos_pat_addr);
        uvm_reg_data_t data;
        bit [1:0] pre_color;
        `REG_PRT(data=, regmodel.cos_pattern_tables.p, t.p_id, .pattern[cos_pat_addr].bwp_pre_color0.get())
        pre_color[0] = data[0];
        `REG_PRT(data=, regmodel.cos_pattern_tables.p, t.p_id, .pattern[cos_pat_addr].bwp_pre_color1.get())
        pre_color[1] = data[0];
        return act_cos_color_e'(pre_color);
    endfunction

    function bit[1:0] get_vlan_is_de(ethernet_frame_t t, int rule_idx);
        uvm_reg_data_t data;
        bit [1:0] de;
        `REG_PRT(data =, regmodel.cos_action.p, t.p_id, .action_index[rule_idx].cfg1.incomming_vlan1_is_de.get())
        de[0] = data[0];
        `REG_PRT(data =, regmodel.cos_action.p, t.p_id, .action_index[rule_idx].cfg1.incomming_vlan2_is_de.get())
        de[1] = data[0];
        return de;
    endfunction

    function int unsigned get_out_port(ethernet_frame_t t, int rule_idx);
        uvm_reg_data_t data;
        act_if_rule_e if_rule = get_if_rule(t, rule_idx);

        `REG_PRT(data = , regmodel.cos_action.p, t.p_id, .action_index[rule_idx].cfg1.outgoing_interface.get())
        data = data & 'h0F;

        if (if_rule == ACT_IF_FWD_LOG) data = port_log2phy(int'(data));
        return data;
    endfunction

    function bit[3:0] get_pattern_green_pcp_bits(ethernet_frame_t t, int cos_pat_addr);
        `REG_PRT(return, regmodel.cos_pattern_tables.p, t.p_id, .pattern[cos_pat_addr].green_pcp_bits.get())
    endfunction

    function bit[3:0] get_pattern_yellow_pcp_bits(ethernet_frame_t t, int cos_pat_addr);
        `REG_PRT(return, regmodel.cos_pattern_tables.p, t.p_id, .pattern[cos_pat_addr].yellow_pcp_bits.get())
    endfunction

    function bit[3:0] get_mark_green_pcp_bits(int port, bit[3:0] pcp_cfi);
        if (port inside {[1:NB_IF_PORTS]}) begin
            return regmodel.cos_mark_table_port.port[port-1].cfi_pcp[pcp_cfi].vlan1_mark.green_pcp_bits.get();
        end
        `uvm_info(get_name, $sformatf("Unknown port (%0d) for CoS mark table lookup, returning zero.", port), UVM_MEDIUM)
        return 0;
    endfunction

    function bit[3:0] get_mark_yellow_pcp_bits(int port, bit[3:0] pcp_cfi);
        if (port inside {[1:NB_IF_PORTS]}) begin
            return regmodel.cos_mark_table_port.port[port-1].cfi_pcp[pcp_cfi].vlan1_mark.yellow_pcp_bits.get();
        end
        `uvm_info(get_name, $sformatf("Unknown port (%0d) for CoS mark table lookup, returning zero.", port), UVM_MEDIUM)
        return 0;
    endfunction

    function int port_log2phy(int log_port);
        if (!(log_port inside {[1:4]})) begin
            `uvm_error("PORTERR", $sformatf("Logical port %0d does not exist!", log_port))
        end
        return (log_port-1)*2 + 1;
    endfunction

    /*
     Task for validating register stats with model.
     TODO: Stats are not collected for frames that are discarded. Need to find a way
     to handle this in transfer function/model.
     */
    task verify_stats(bit check_all=0);
        uvm_status_e status;
        uvm_check_e check = check_all ? UVM_CHECK : UVM_NO_CHECK;

        `uvm_info(get_name, $sformatf("BWP model stats:\n\t%0p", bwp.bwp_stats), UVM_DEBUG)

        foreach(bwp.bwp_stats[i]) begin
            if (bwp.bwp_stats[i].grn) begin
                void'(regmodel.bwp.profile_stats_grn.profile_ndx[i].profile_stats.packet_count.predict(bwp.bwp_stats[i].grn.pkts));
                void'(regmodel.bwp.profile_stats_grn.profile_ndx[i].profile_stats.byte_count.predict(bwp.bwp_stats[i].grn.bytes));
                regmodel.bwp.profile_stats_grn.profile_ndx[i].profile_stats.mirror(.status(status), .check(check), .parent(null));
            end
            if (bwp.bwp_stats[i].yel) begin
                void'(regmodel.bwp.profile_stats_yel.profile_ndx[i].profile_stats.packet_count.predict(bwp.bwp_stats[i].yel.pkts));
                void'(regmodel.bwp.profile_stats_yel.profile_ndx[i].profile_stats.byte_count.predict(bwp.bwp_stats[i].yel.bytes));
                regmodel.bwp.profile_stats_yel.profile_ndx[i].profile_stats.mirror(.status(status), .check(check), .parent(null));
            end
            if (bwp.bwp_stats[i].red) begin
                void'(regmodel.bwp.profile_stats_red.profile_ndx[i].profile_stats.packet_count.predict(bwp.bwp_stats[i].red.pkts));
                void'(regmodel.bwp.profile_stats_red.profile_ndx[i].profile_stats.byte_count.predict(bwp.bwp_stats[i].red.bytes));
                regmodel.bwp.profile_stats_red.profile_ndx[i].profile_stats.mirror(.status(status), .check(check), .parent(null));
            end
        end
    endtask

endclass

