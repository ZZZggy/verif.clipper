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

import domain_priority_pkg::*;

/**
 * Classify based on a list of hidden rules.
 */
virtual class clipper_class_rule_filter_hidden extends uvm_component implements class_rule_filter_ifc;
    c1lt_reg_block regmodel;
    class_rule_base#(c1lt_reg_block) rules[];
    hidden_rule_ver_e ver;

    `uvm_component_utils(clipper_class_rule_filter_hidden)
    // Constructor: new
    function new(string name="clipper_class_rule_filter_hidden", uvm_component parent=null);
        super.new(name, parent);
    endfunction

    // Get regmodel
    virtual function void build_phase(uvm_phase phase);
        // get configuration
        if (!uvm_config_db#(c1lt_reg_block)::get(this, "", "regmodel", regmodel))
            `uvm_fatal(get_name(), "Failed to get regmodel.")
    endfunction

    // Implement interface class method
    virtual function domain_priority_item classify(ethernet_frame_t t);
        domain_priority_item dom_prio = domain_priority_item::type_id::create("dom_prio", this);
        foreach(rules[i]) begin
            if (rules[i].is_hit(t)) begin
                rules[i].get_domains(t, dom_prio);
                rules[i].rule_priorities_cg.sample();
                rules[i].sample(t);
                `uvm_info("PREDICT::HIDDEN", $sformatf("Rule %0s (index %0d) hit with %0s", rules[i].get_name(), i, dom_prio.convert2string()), UVM_HIGH)
                return dom_prio;
            end
        end
        return dom_prio;
    endfunction

    // Implement interface class method
    function string get_name();
        return "clipper_class_rule_filter_hidden";
    endfunction
endclass

// Macro for setting up a hidden rule
`define ADD_DOMAIN_INFO(RULE, TYPE, DOM_IF_PRIO, DOM_CPU_PRIO)\
    rules[``RULE``] = clipper_class_rule_``TYPE``::type_id::create(`"clipper_class_rule_``TYPE```", this);\
    rules[``RULE``].regmodel = this.regmodel;\
    d.prio[DOM_CPU] = ``DOM_CPU_PRIO``;\
    d.prio[DOM_IF] = ``DOM_IF_PRIO``;\
    rules[``RULE``].set_domains(d);\
    rules[``RULE``].ver = ver;\
    rules[``RULE``].id = ``RULE``;



/**
 * Hidden rules v2.2
 */
class clipper_class_rule_filter_hidden_2_2 extends clipper_class_rule_filter_hidden;
    `uvm_component_utils(clipper_class_rule_filter_hidden_2_2)

    function void build_phase(uvm_phase phase);
        domain_priority_item d;

        super.build_phase(phase);

        d = domain_priority_item::type_id::create("d", this);
        rules = new[39];
        //                   IDX  NAME                             IF  CPU
        `ADD_DOMAIN_INFO( 0, generic,                         -1, -1) // DEBUG RULE
        `ADD_DOMAIN_INFO( 1, drop_self,                       12, -1)
        `ADD_DOMAIN_INFO( 2, acterna_hello,                   -1, 13)
        `ADD_DOMAIN_INFO( 3, soam_lbm,                        14, 14)
        `ADD_DOMAIN_INFO( 4, accedian_lbm,                    15, 15)
        `ADD_DOMAIN_INFO( 5, acd_lbr_tst_leak_prevention,     18, 18)
        `ADD_DOMAIN_INFO( 6, r_aps,                           -1, 19)
        `ADD_DOMAIN_INFO( 7, cfm_multicast2,                  20, 20)
        `ADD_DOMAIN_INFO( 8, cfm_multicast1_ccm,              21, 21)
        `ADD_DOMAIN_INFO( 9, cfm_multicast1_dmm_slm,          22, 22)
        `ADD_DOMAIN_INFO(10, cfm_multicast1_lbm_csf,          23, 23)
        `ADD_DOMAIN_INFO(11, cfm_multicast1_other,            24, 24)
        `ADD_DOMAIN_INFO(12, cfm_unicast_ccm_dmr_slr,         25, 25)
        `ADD_DOMAIN_INFO(13, cfm_unicast_ccm_dmm_slm_vsm,     26, 26)
        `ADD_DOMAIN_INFO(14, cfm_unicast_slow_support,        27, 27)
        `ADD_DOMAIN_INFO(15, cfm_unicast_other,               28, 28)
        `ADD_DOMAIN_INFO(16, acp,                             31, 31)
        `ADD_DOMAIN_INFO(17, acp_l3,                          -1, 32)
        `ADD_DOMAIN_INFO(18, mgmt_bridge,                     33, 33)
        `ADD_DOMAIN_INFO(19, paa_disco,                       -1, 34)
        `ADD_DOMAIN_INFO(20, acd_broadcast,                   -1, 35)
        `ADD_DOMAIN_INFO(21, acd_tunneling,                   36, 36)
        `ADD_DOMAIN_INFO(22, cisco_tunneling,                 37, 37)
        `ADD_DOMAIN_INFO(23, lacp,                            38, 38)
        `ADD_DOMAIN_INFO(24, lldp,                            39, 39)
        `ADD_DOMAIN_INFO(25, link_oam,                        40, 40)
        `ADD_DOMAIN_INFO(26, ptp_ethernet,                    -1, 41)
        `ADD_DOMAIN_INFO(27, ptp_ipv4,                        -1, 42)
        `ADD_DOMAIN_INFO(28, ptp_ipv6,                        -1, 43)
        `ADD_DOMAIN_INFO(29, l2pt_enabled,                    44, 44)
        `ADD_DOMAIN_INFO(30, l2pt_disabled,                   45, 45)
        `ADD_DOMAIN_INFO(31, acd_unicast_paa_l2_fwd_cpu,      46, 46)
        `ADD_DOMAIN_INFO(32, acd_unicast_paa_l2_discard_cpu,  -1, 47)
        `ADD_DOMAIN_INFO(33, acd_unicast_twamp_reflector,     48, 48)
        `ADD_DOMAIN_INFO(34, gen_purp_unicast,                49, 49)
        `ADD_DOMAIN_INFO(35, gen_purp_broadcast,              -1, 50)
        `ADD_DOMAIN_INFO(36, ipv6_neigh_discov,               -1, 51)
        `ADD_DOMAIN_INFO(37, untagged_bridge_local,           52, 52)
        `ADD_DOMAIN_INFO(38, untagged_bridge_remote,          53, 53)
    endfunction

    // Constructor: new
    function new(string name="clipper_class_rule_filter_hidden_2_2", uvm_component parent=null);
        super.new(name, parent);
        ver = HR_VER_2_2;
    endfunction
endclass
