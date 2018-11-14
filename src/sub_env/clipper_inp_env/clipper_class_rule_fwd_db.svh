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
class clipper_class_rule_fwd_db extends class_rule_fwd_db#(c1lt_reg_block);
    `uvm_object_utils(clipper_class_rule_fwd_db)
    function new(string name="clipper_class_rule_fwd_db");
        super.new(name);
    endfunction


    function int get_fwd_domain(ethernet_frame_t t, bit[11:0] vid);
        //return regmodel.fwd_db.fwd_vid.info[vid].ring0_fwd_domain.get();
        return 0;
    endfunction

    function bit[15:0] get_vlan_type(ethernet_frame_t t, bit[11:0] vid);
        //case(regmodel.fwd_db.fwd_vid.info[vid].ring0_vlan_type.get())
        //    0: return 'h8100;
        //    1: return 'h88A8;
        //    2: return 'h9100;
        //    3: return regmodel.globals.global_input_cfg_0.user_vlan_ethertype.get();
        //    default: `uvm_error("TYPEERR", "Unknown VLAN/TPID type.")
        //endcase
        return 0;
    endfunction

    function fwd_domain_mode_e get_domain_mode(ethernet_frame_t t, int domain);
        //uvm_reg_data_t data;
        //data = regmodel.fwd_db.fwd_domain.domain[domain].fwd_domain_mode.get();
        //return fwd_domain_mode_e'(data);
        return fwd_domain_mode_e'(0);
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

    function bit domain_is_g8032(ethernet_frame_t t, int domain);
        return (get_domain_mode(t, domain) inside {
            G8032_DOM_RING2RING,
            G8032_DOM_RING2LDROP,
            G8032_DOM_RINGX2RINGY,
            G8032_DOM_APS_VID,
            G8032_DOM_RING_DROP_CONT}) ? 1 : 0;
    endfunction

    function int get_fwd_inst_nbr(ethernet_frame_t t, int domain);
        //return regmodel.fwd_db.fwd_domain.domain[domain].erp_instance_number.get();
        return 0;
    endfunction

    function int get_fwd_inst_status(ethernet_frame_t t, int inst_nbr);
        //return regmodel.fwd_db.fwd_inst.info[inst_nbr].status.get();
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

    function void set_fwd_dom_learning_dest(ethernet_frame_t t, int domain, int dom_learning_dest);
        //regmodel.fwd_db.fwd_domain.domain[domain].learning_dest.set(dom_learning_dest);
    endfunction

    function void set_fwd_dom_learning_state(ethernet_frame_t t, int domain, int dom_learning_state);
        //regmodel.fwd_db.fwd_domain.domain[domain].learning_state.set(dom_learning_state);
    endfunction

    function void set_fwd_dom_learning_flapping_error(ethernet_frame_t t, int domain, int dom_learning_flapping_error);
        //regmodel.fwd_db.fwd_domain.domain[domain].learning_flapping_error.set(dom_learning_flapping_error);
    endfunction

    function void set_fwd_dom_rx_blocking_error(ethernet_frame_t t, int domain, int dom_rx_blocking_error);
        //regmodel.fwd_db.fwd_domain.domain[domain].rx_blocking_error.set(dom_rx_blocking_error);
    endfunction


    virtual function bit rule_ena(input ethernet_frame_t t);
        return 1'b1;
    endfunction
endclass

