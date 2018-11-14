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
class clipper_class_action_router extends class_action_router#(c1lt_reg_block);

    // We use the rule_fwd_db type only because we want to access the same
    // usefull functions.  We could break this object to have a fwd_db object
    // which is basically the xfer function of fwd_db.  Then use this object
    // in rule_fwd_db which is an extension of a rule.  The rule is an object
    // not related with the xfer functions.
    clipper_class_rule_fwd_db action_fwd_db;


    `uvm_component_utils(clipper_class_action_router)
    // Constructor: new
    function new(string name="clipper_class_action_router", uvm_component parent=null);
        super.new(name, parent);
    endfunction

    function act_if_rule_e get_if_rule(ethernet_frame_t t, int rule_idx);
        uvm_reg_data_t data;
        `REG_PRT(data = , regmodel.cos_action.p, t.p_id, .action_index[rule_idx].cfg1.interface_rule.get())
        return act_if_rule_e'(data);
    endfunction

    // NOTE: We are stripping the FWD_DB request bit here, to get that information, use "need_fwd_db_req()"
    function int unsigned get_out_if(ethernet_frame_t t, int rule_idx);
        uvm_reg_data_t data;
        `REG_PRT(data = , regmodel.cos_action.p, t.p_id, .action_index[rule_idx].cfg1.outgoing_interface.get())
        return data & 'h0F;
    endfunction

    function bit need_fwd_db_req(ethernet_frame_t t, int rule_idx);
        //uvm_reg_data_t data;
        //`REG_PRT(data = , regmodel.cos_action.p, t.p_id, .action_index[rule_idx].cfg1.outgoing_interface.get())
        //return (data > 8) ? 1 : 0;
        return 0;
    endfunction

    function int unsigned get_out_qset(ethernet_frame_t t, int rule_idx);
        `REG_PRT(return, regmodel.cos_action.p, t.p_id, .action_index[rule_idx].cfg2.outgoing_qset.get())
    endfunction

    function bit is_cos_mapping_enable(ethernet_frame_t t, int rule_idx);
        `REG_PRT(return, regmodel.cos_action.p, t.p_id, .action_index[rule_idx].cfg1.cos_mapping_enable.get())
    endfunction

    function int unsigned get_default_cos_pattern_address(ethernet_frame_t t, int rule_idx);
        `REG_PRT(return, regmodel.cos_action.p, t.p_id, .action_index[rule_idx].cfg0.default_cos_pattern_address.get())
    endfunction

    function int unsigned get_int_cos(ethernet_frame_t t, int cos_pat_addr);
        `REG_PRT(return, regmodel.cos_pattern_tables.p, t.p_id, .pattern[cos_pat_addr].cos_internal.get())
    endfunction

    function protection_mode_e get_protection_mode(int log_port, int phy_port);
        //uvm_reg_data_t data;
        //data = regmodel.protection_tbl.logical_port[log_port].physical_port[phy_port-1].mode_bridge.mode.get();
        //return protection_mode_e'(data);
        return PROTECT_MODE_LINEAR;
    endfunction

    function protection_select_e get_protection_select(int log_port, int phy_port);
        //uvm_reg_data_t data;
        //data = regmodel.protection_tbl.logical_port[log_port].physical_port[phy_port-1].mode_bridge.select_bridge.get();
        //return protection_select_e'(data);
        return PROTECT_SEL_LOG_P0;
    endfunction

    function bit get_protection_state_bypass(ethernet_frame_t t);
        return regmodel.globals.port_input_cfg[t.p_id-1].cfg0.protection_state_bypass_for_loopback.get();
    endfunction

    function int get_q_mapping(int out_if, int out_qset, int int_cos);
        //if (!(out_if inside {[1:8]})) begin
        //    `uvm_error("PORTERR", $sformatf("Unknown physical interface number %0d", out_if))
        //    return 0;
        //end
        //return regmodel.q_mapping_table.outgoing_port[out_if-1].outgoing_qset[out_qset].cos_internal[int_cos].q.outgoing_q.get();
        return 0;
    endfunction

    function void port_log2phy(int log_port, ref int phys[]);
        phys = new[2];
        if (!(log_port inside {[1:4]})) begin
            `uvm_error("PORTERR", $sformatf("Logical port %0d does not exist!", log_port))
        end
        foreach(phys[i]) phys[i] = (log_port-1)*2 + 1 + i;
    endfunction

    function int get_fwd_domain(ethernet_frame_t t, bit[11:0] vid);
        //return regmodel.fwd_db.fwd_vid.info[vid].ring0_fwd_domain.get();
        return 0;
    endfunction

    function int get_fwd_domain_vlan_type(ethernet_frame_t t, bit[11:0] vid);
        //int vlan_type;
        //vlan_type = regmodel.fwd_db.fwd_vid.info[vid].ring0_vlan_type.get();
        //case(vlan_type)
        //    0: return 16'h8100;
        //    1: return 16'h88a8;
        //    2: return 16'h9100;
        //    3: return regmodel.globals.global_input_cfg_0.user_vlan_ethertype.get();
        //    default: `uvm_fatal(get_name, $sformatf("Unknown vlan_type encoding: %0d", vlan_type))
        //endcase
        return 16'hFFFF;
    endfunction

    function int get_fwd_inst_nbr(ethernet_frame_t t, int domain);
        //return regmodel.fwd_db.fwd_domain.domain[domain].erp_instance_number.get();
        return 0;
    endfunction

    function int get_fwd_dom_learning_state(ethernet_frame_t t, int domain);
        //return regmodel.fwd_db.fwd_domain.domain[domain].learning_state.get();
        return 0;
    endfunction

    function int get_fwd_dom_learning_dest(ethernet_frame_t t, int domain);
        //return regmodel.fwd_db.fwd_domain.domain[domain].learning_dest.get();
        return 0;
    endfunction

    function int get_fwd_inst_learning_state(ethernet_frame_t t, int inst_nbr);
        //return regmodel.fwd_db.fwd_inst.info[inst_nbr].learning_state.get();
        return 0;
    endfunction

    function int get_fwd_inst_flooding_mode(ethernet_frame_t t, int inst_nbr);
        //return regmodel.fwd_db.fwd_inst.info[inst_nbr].flooding_mode.get();
        return 0;
    endfunction

    function int get_fwd_inst_status(ethernet_frame_t t, int inst_nbr);
        //return regmodel.fwd_db.fwd_inst.info[inst_nbr].status.get();
        return 0;
    endfunction

endclass

