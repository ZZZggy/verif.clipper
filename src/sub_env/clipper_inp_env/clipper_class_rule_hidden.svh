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

// Description:
// Note that these implementations only need to provide register-model specific
// details.


/********************************************************************************************/
// Macros to reduce boilerplate when adding rules.
/********************************************************************************************/
`define RULE_BEGIN(NAME)\
class clipper_class_rule_``NAME`` extends class_rule_``NAME``#(c1lt_reg_block);\
    `uvm_object_utils(clipper_class_rule_``NAME``)\
    function new(string name=`"clipper_class_rule_``NAME```");\
        super.new(name);\
    endfunction


`define RULE_END\
endclass


`define RULE_ENA(RULE_ENA)\
function bit rule_ena(ethernet_frame_t t);\
    return regmodel.globals.port_input_cfg[t.p_id-1].cfg1.``RULE_ENA``_rule_ena.get();\
endfunction


`define IS_SYS_MAC_ADDR\
function bit is_sys_mac_addr(address_t addr);\
    address_t sys_addr = get_sys_mac_addr();\
    return (addr inside {[sys_addr:sys_addr+address_t'(15)]});\
endfunction


`define IS_SYS_BASE_MAC_ADDR\
function bit is_sys_base_mac_addr(address_t addr);\
    address_t sys_addr = get_sys_mac_addr();\
    return (addr == sys_addr);\
endfunction


`define GET_SYS_MAC_ADDR\
function address_t get_sys_mac_addr();\
    address_t addr = 48'h0015ad000000 | (48'h000000ffffff & regmodel.globals.mac_base_addr.nic.get());\
    return addr;\
endfunction


`define IS_PORT_MAC_ADDR\
function bit is_port_mac_addr(shortint unsigned port=0, address_t addr);\
    address_t sys_addr = get_sys_mac_addr();\
    if ((sys_addr + address_t'(port)) == addr) return 1;\
    return 0;\
endfunction


`define IS_SW_UP_SOAM\
function bit is_sw_up_soam(ethernet_frame_t t);\
    address_t addr;\
    // check if desitnation MAC is in the system and is a valid port number\
    if (!is_sys_mac_addr(t.da)) return 0;\
    addr = (t.da[2:0]-1) & 'h07;\
    if (!(addr inside {[0:7]})) return 0;\
    // FIXME\
    // !isInternalLoopbackActive\
    case(t.p_id)\
        1: return ~regmodel.globals.tlcs.port1_loopback_ena.get();\
        2: return ~regmodel.globals.tlcs.port2_loopback_ena.get();\
        3: return ~regmodel.globals.tlcs.port3_loopback_ena.get();\
        4: return ~regmodel.globals.tlcs.port4_loopback_ena.get();\
        5: return ~regmodel.globals.tlcs.port5_loopback_ena.get();\
        6: return ~regmodel.globals.tlcs.port6_loopback_ena.get();\
        7: return ~regmodel.globals.tlcs.port7_loopback_ena.get();\
        8: return ~regmodel.globals.tlcs.port8_loopback_ena.get();\
        default: `uvm_fatal("PORTERR", $sformatf("Unknown user port: %0d", t.p_id))\
    endcase\
    //if ((regmodel.np_if.np_if_ctrl[addr].port_local_in_ena.port_int_lpbk_in_ena.get() == 1)\
    //    && (regmodel.np_if.np_if_ctrl[addr].port_local_out_ena.port_int_lpbk_out_ena.get() == 1)\
    //    && ((regmodel.np_if.np_if_ctrl[addr].port_local_out_map.port_tx_mac_out_map.get() & 'h02) == 2))\
    //    return 0;\
    //else\
    //    return 1;\
endfunction


`define GET_MD_LVL(LVL)\
function bit unsigned [3:0] get_``LVL``_lvl(shortint unsigned port=0);\
    return regmodel.globals.port_input_cfg[port-1].cfg0.port_``LVL``_md_level.get();\
endfunction


`define GET_SYS_MD_LVL(LVL)\
function bit unsigned [3:0] get_``LVL``_lvl(shortint unsigned port=0);\
    return regmodel.globals.global_input_cfg_0.system_``LVL``_md_level.get();\
endfunction


// Flags are TPID agnostic
`define IS_L2_TUNNELING_FLAG\
function bit is_l2_tunneling_flag(shortint unsigned port=0, bit[11:0] vid);\
    `REG_PRT(return , regmodel.vid_table.p, port, .idx[vid].cpu_l2pt_tunneling_flag.get())\
endfunction


// Flags are TPID agnostic
`define IS_BCAST_MGMT_FLAG\
function bit is_bcast_mgmt_flag(shortint unsigned port=0, bit[11:0] vid);\
    `REG_PRT(return , regmodel.vid_table.p, port, .idx[vid].cpu_membership.get())\
endfunction


// Flags are TPID agnostic
`define IS_CFM_FLAG\
function bit is_cfm_flag(shortint unsigned port=0, bit[11:0] vid);\
    `REG_PRT(return , regmodel.vid_table.p, port, .idx[vid].cpu_cfm_membership.get())\
endfunction


`define GET_LOGICAL_PORT\
function shortint get_logical_port(shortint unsigned port=0);\
    return regmodel.globals.port_input_cfg[port-1].cfg0.other_mac_address.get();\
endfunction


`define IS_LP_MAC_ADDR\
function bit is_lp_mac_addr(shortint unsigned port=0, address_t addr);\
    address_t sys_addr = get_sys_mac_addr();\
    bit is_enslaved;\
    // system base address takes precedence, is not recognized as LP MAC\
    if (addr == sys_addr) return 0;\
    // try to match physical port MAC address\
    if ((sys_addr + address_t'(port)) == addr) return 1;\
    // try to match logical port MAC address\
    is_enslaved = address_t'(get_logical_port(port)) == port ? 1'b0 : 1'b1;\
    if (is_enslaved && (address_t'(get_logical_port(port)) + (sys_addr & 48'hFFFFFFFFFFF0) == addr)) return 1;\
    return 0;\
endfunction


`define IS_LP_RING\
function bit is_lp_ring(shortint unsigned port=0);\
    // use logical port 0 to get state of port\
    //return regmodel.protection_tbl.logical_port[0].physical_port[port-1].mode_bridge.mode.get();\
    return (1'b0);\
endfunction


`define IS_ACD_SRC_ONLY\
function bit is_acd_src_only(ethernet_frame_t t);\
    return regmodel.globals.port_input_cfg[t.p_id-1].cfg0.acd_src_only.get();\
endfunction


`define IS_VLAN_AWARE(RULE)\
function bit is_vlan_aware(ethernet_frame_t t);\
    return regmodel.globals.global_input_cfg_0.``RULE``_rule_vlan_aware_ena.get();\
endfunction


// TBD : 
`define IS_NP_MAC_ADDR\
function bit is_np_mac_addr(shortint unsigned port=0, address_t addr);\
endfunction

// TBD : 
`define SW_UP_SOAM_ENA\
function bit sw_up_soam_ena();\
endfunction

`define IS_FT_DROP_MATCH\
function bit is_ft_drop_match(ethernet_frame_t t);\
    //int domain, inst_nbr, vlan_type;\
    //bit [11:0] vid;\
    //bit [15:0] tpid;\
    //fwd_domain_mode_e domain_mode;\
    //vid = (t.vtags.size() == 0) ? 0 : t.vtags[0].tci.vid;\
    //domain = regmodel.fwd_db.fwd_vid.info[vid].ring0_fwd_domain.get();\
    //// If no VTAGs are present, VLAN agnostic\
    //if (t.vtags.size()) begin\
        //// validate VLAN/TPID type, otherwise return domain 0\
        //vlan_type = regmodel.fwd_db.fwd_vid.info[vid].ring0_vlan_type.get();\
        //case(vlan_type)\
            //0: tpid = 16'h8100;\
            //1: tpid = 16'h88a8;\
            //2: tpid = 16'h9100;\
            //3: tpid = regmodel.globals.global_input_cfg_0.user_vlan_ethertype.get();\
            //default: `uvm_fatal("TYPEERR", $sformatf("Unknown vlan_type encoding: %0d", vlan_type))\
        //endcase\
        //domain = (tpid == t.vtags[0].tpid) ? domain : 0;\
    //end\
    //domain_mode = fwd_domain_mode_e'(regmodel.fwd_db.fwd_domain.domain[domain].fwd_domain_mode.get());\
 //$display("   domain_mode=%0s", domain_mode.name);\
    //return (domain_mode == G8032_DOM_RING2LDROP) ? 1'b1 : 1'b0;\
    return (1'b0);\
endfunction


`define IS_TWAMP_REFLECTOR_UDP_PORT\
function bit is_twamp_reflector_udp_port(bit[15:0] port);\
    return (regmodel.globals.global_input_cfg_1.twamp_reflector_dport.get() & 64'h00000000_0000ffff) == port ? 1'b1 : 1'b0;\
endfunction

`define RULE_LBM_PRIORITY 4

`define GET_LBM_IF_RULE_INDEX\
function int unsigned get_lbm_if_rule_index(ethernet_frame_t t);\
    return `RULE_LBM_PRIORITY;\
endfunction

/********************************************************************************************/
// GENERIC RULE
// Special generic rule that implements all functions
/********************************************************************************************/
import ethernet_pkg::*;

class clipper_class_rule_generic extends class_rule_base#(c1lt_reg_block);
    uvm_reg_field rule_ena_field;
    uvm_reg_field vlan_aware_field;

    `uvm_object_utils(clipper_class_rule_generic)
    function new(string name=`"clipper_class_rule_generic`");
        super.new(name);
    endfunction


    protected function bit rule_ena(ethernet_frame_t t);
        return rule_ena_field.get();
    endfunction

    function bit is_vlan_aware(ethernet_frame_t t);
        if (vlan_aware_field == null) return '1;
        return vlan_aware_field.get();
    endfunction

    // Configure rule enable
    task set_rule_ena(bit ena);
        uvm_status_e status;
        uvm_reg p_reg;

        rule_ena_field.set(ena);
        p_reg = rule_ena_field.get_parent();
        p_reg.update(status);
    endtask
`GET_SYS_MAC_ADDR
`IS_SYS_BASE_MAC_ADDR
`IS_PORT_MAC_ADDR
`IS_LP_MAC_ADDR
`GET_LOGICAL_PORT
`IS_LP_RING
`IS_CFM_FLAG
`IS_L2_TUNNELING_FLAG
`IS_BCAST_MGMT_FLAG
`IS_FT_DROP_MATCH
`GET_MD_LVL(mip)
`GET_MD_LVL(mep)
`GET_SYS_MD_LVL(acp)

    // Report the state of the functions
    protected function bit hit(ethernet_frame_t t);
        bit [15:0] tpid;
        bit [11:0] vid;
        bit unsigned [2:0] md_lvl;
        string s="\nHIDDEN RULE CONFIG ";
        if (t.vtags.size()) tpid = t.vtags[0].tpid;
        if (t.vtags.size()) vid = t.vtags[0].tci.vid;
        md_lvl = (t.payload[0] >> 5) & 'h07;
        s=  {s, $sformatf("with TPID=0x%4h, VID=0x%3h (%0d):", tpid, vid, vid)};

        s = {s, $sformatf("\n sys_mac_addr         = 0x%0h", get_sys_mac_addr())};
        s = {s, $sformatf("\n is_sys_mac_addr      = %0b", is_sys_base_mac_addr(t.da))};
        s = {s, $sformatf("\n is_port_mac_addr(DA) = %0b", is_port_mac_addr(t.p_id, t.da))};
        s = {s, $sformatf("\n is_port_mac_addr(SA) = %0b", is_port_mac_addr(t.p_id, t.sa))};
        s = {s, $sformatf("\n is_lp_mac_addr(DA)   = %0b", is_lp_mac_addr(t.p_id, t.da))};
        s = {s, $sformatf("\n is_lp_mac_addr(SA)   = %0b", is_lp_mac_addr(t.p_id, t.sa))};
        s = {s, $sformatf("\n logical_port         = %0d", get_logical_port(t.p_id))};
        s = {s, $sformatf("\n is_lp_ring           = %0b", is_lp_ring(t.p_id))};
        s = {s, $sformatf("\n is_ft_drop_match     = %0b", is_ft_drop_match(t), tpid, vid)};
        s = {s, $sformatf("\n is_l2_tunneling_flag = %0b", is_l2_tunneling_flag(t.p_id, vid))};
        s = {s, $sformatf("\n is_cfm_flag          = %0b", is_cfm_flag(t.p_id, vid))};
        s = {s, $sformatf("\n is_bcast_mgmt_flag   = %0b", is_bcast_mgmt_flag(t.p_id, vid))};
        s = {s, $sformatf("\n pkt_md_lvl           = 0x%0h", md_lvl)};
        s = {s, $sformatf("\n port_mep_lvl         = 0x%0h", get_mep_lvl(t.p_id))};
        s = {s, $sformatf("\n port_mip_lvl         = 0x%0h", get_mip_lvl(t.p_id))};
        s = {s, $sformatf("\n sys_acp_lvl          = 0x%0h", get_acp_lvl(t.p_id))};
        s = {s, $sformatf("\n payload[0:1]         = 0x%4h", {t.payload[0], t.payload[1]})};
        `uvm_info(get_name(), s, UVM_DEBUG)
        return 1'b0;
    endfunction
`RULE_END

/********************************************************************************************/
// RULE IMPLEMENTATIONS
/********************************************************************************************/
import class_rule_hidden_pkg::*;

`RULE_BEGIN(drop_self)
`RULE_ENA(drop_self)
`IS_LP_MAC_ADDR
`GET_SYS_MAC_ADDR
`GET_LOGICAL_PORT
`IS_LP_RING
`RULE_END


`RULE_BEGIN(acterna_hello)
`RULE_ENA(acterna_hello)
`RULE_END


`RULE_BEGIN(soam_lbm)
`RULE_ENA(soam_lbm)
`GET_SYS_MAC_ADDR
`IS_SYS_MAC_ADDR
`IS_LP_MAC_ADDR
`IS_LP_RING
`IS_CFM_FLAG
`IS_FT_DROP_MATCH
`IS_VLAN_AWARE(soam_lbm)
`IS_NP_MAC_ADDR
`SW_UP_SOAM_ENA
`IS_SW_UP_SOAM
`GET_LOGICAL_PORT
`RULE_END


`RULE_BEGIN(accedian_lbm)
`RULE_ENA(acd_lbm)
`IS_VLAN_AWARE(acd_lbm)
`GET_SYS_MAC_ADDR
`IS_LP_MAC_ADDR
`IS_LP_RING
`GET_LOGICAL_PORT
`IS_FT_DROP_MATCH
`RULE_END


`RULE_BEGIN(acd_lbr_tst_leak_prevention)
`RULE_ENA(acd_lbr_tst_leak)
`IS_VLAN_AWARE(acd_lbr_tst_leak)
`GET_SYS_MAC_ADDR
`IS_LP_MAC_ADDR
`IS_LP_RING
`GET_LOGICAL_PORT
`IS_FT_DROP_MATCH
`RULE_END


`RULE_BEGIN(r_aps)
`RULE_ENA(r_aps)
`GET_MD_LVL(mep)
`IS_LP_RING
`RULE_END


`RULE_BEGIN(cfm_multicast2)
`RULE_ENA(cfm_multicast2)
`GET_MD_LVL(mip)
`IS_CFM_FLAG
`RULE_END


`RULE_BEGIN(cfm_multicast1_ccm)
`RULE_ENA(cfm_multicast1_123)
`IS_CFM_FLAG
`GET_MD_LVL(mep)
`RULE_END

`RULE_BEGIN(cfm_multicast1_dmm_slm)
`RULE_ENA(cfm_multicast1_123)
`IS_CFM_FLAG
`GET_MD_LVL(mep)
`RULE_END

`RULE_BEGIN(cfm_multicast1_lbm_csf)
`RULE_ENA(cfm_multicast1_123)
`IS_CFM_FLAG
`GET_MD_LVL(mep)
`RULE_END

`RULE_BEGIN(cfm_multicast1_other)
`RULE_ENA(cfm_multicast1)
`IS_CFM_FLAG
`GET_MD_LVL(mep)
`RULE_END

`RULE_BEGIN(cfm_unicast_ccm_dmr_slr)
`RULE_ENA(cfm_unicast_123)
`GET_SYS_MAC_ADDR
`IS_LP_MAC_ADDR
`IS_LP_RING
`IS_CFM_FLAG
`IS_FT_DROP_MATCH
`IS_VLAN_AWARE(cfm_unicast_123)
`IS_NP_MAC_ADDR
`SW_UP_SOAM_ENA
`GET_LOGICAL_PORT
`RULE_END

`RULE_BEGIN(cfm_unicast_ccm_dmm_slm_vsm)
`RULE_ENA(cfm_unicast_123)
`GET_SYS_MAC_ADDR
`IS_LP_MAC_ADDR
`IS_LP_RING
`IS_CFM_FLAG
`IS_FT_DROP_MATCH
`IS_VLAN_AWARE(cfm_unicast_123)
`IS_NP_MAC_ADDR
`SW_UP_SOAM_ENA
`GET_LOGICAL_PORT
`RULE_END

`RULE_BEGIN(cfm_unicast_slow_support)
`RULE_ENA(cfm_unicast_123)
`GET_SYS_MAC_ADDR
`IS_SYS_MAC_ADDR
`IS_LP_MAC_ADDR
`IS_LP_RING
`IS_CFM_FLAG
`IS_FT_DROP_MATCH
`IS_VLAN_AWARE(cfm_unicast_123)
`IS_NP_MAC_ADDR
`SW_UP_SOAM_ENA
`IS_SW_UP_SOAM
`GET_LOGICAL_PORT
`RULE_END

`RULE_BEGIN(cfm_unicast_other)
`RULE_ENA(cfm_unicast)
`GET_SYS_MAC_ADDR
`IS_SYS_MAC_ADDR
`IS_LP_MAC_ADDR
`IS_LP_RING
`IS_CFM_FLAG
`IS_FT_DROP_MATCH
`IS_VLAN_AWARE(cfm_unicast)
`IS_NP_MAC_ADDR
`SW_UP_SOAM_ENA
`IS_SW_UP_SOAM
`GET_LOGICAL_PORT
`RULE_END


`RULE_BEGIN(acp)
`RULE_ENA(acp)
`GET_SYS_MD_LVL(acp)
`IS_LP_RING
`RULE_END


`RULE_BEGIN(acp_l3)
`RULE_ENA(acp_layer3)
`RULE_END


`RULE_BEGIN(mgmt_bridge)
typedef enum bit[1:0] {
  C_TAG  = 2'b00,
  S_TAG0 = 2'b01,
  S_TAG1 = 2'b10,
  U_TAG  = 2'b11
} vlan_type_e;
`RULE_ENA(mgmt_bridge)
function bit mgmt_match_vlan2(shortint unsigned port=0);
    return regmodel.globals.port_input_cfg[port-1].cfg3.vlan2_ena.get();
endfunction
function bit[15:0] conv_tpid(vlan_type_e t);
    case(t)
        C_TAG:   return 16'h8100;
        S_TAG0:  return 16'h88a8;
        S_TAG1:  return 16'h9100;
        default: return 16'h0000;
    endcase
endfunction
function bit[15:0] get_mgmt_tpid0(shortint unsigned port=0);
    vlan_type_e t;
    t = vlan_type_e'(regmodel.globals.port_input_cfg[port-1].cfg3.vlan1_type.get());
    return conv_tpid(t);
endfunction
function bit[15:0] get_mgmt_tpid1(shortint unsigned port=0);
    vlan_type_e t;
    t = vlan_type_e'(regmodel.globals.port_input_cfg[port-1].cfg3.vlan2_type.get());
    return conv_tpid(t);
endfunction
function bit[11:0] get_mgmt_vid0(shortint unsigned port=0);
    return regmodel.globals.port_input_cfg[port-1].cfg3.vlan1_id.get();
endfunction
function bit[11:0] get_mgmt_vid1(shortint unsigned port=0);
    return regmodel.globals.port_input_cfg[port-1].cfg3.vlan2_id.get();
endfunction
`GET_SYS_MAC_ADDR
`IS_SYS_MAC_ADDR
`IS_LP_RING
`RULE_END


`RULE_BEGIN(paa_disco)
`RULE_ENA(paa_discovery)
`IS_VLAN_AWARE(paa_discovery)
`IS_LP_RING
`IS_FT_DROP_MATCH
`RULE_END


`RULE_BEGIN(acd_broadcast)
`RULE_ENA(acd_broadcast)
`RULE_END


`RULE_BEGIN(acd_tunneling)
`RULE_ENA(acd_tunneling)
`IS_L2_TUNNELING_FLAG
`RULE_END


`RULE_BEGIN(cisco_tunneling)
`RULE_ENA(cisco_tunneling)
`IS_L2_TUNNELING_FLAG
`RULE_END


`RULE_BEGIN(lacp)
`RULE_ENA(lacp)
`RULE_END


`RULE_BEGIN(lldp)
`RULE_ENA(lldp)
`RULE_END


`RULE_BEGIN(link_oam)
`RULE_ENA(link_oam)
`RULE_END


`RULE_BEGIN(l2pt_enabled)
`RULE_ENA(l2pt)
function bit is_l2pt_ena(shortint unsigned port=0);
    return regmodel.globals.port_input_cfg[port-1].cfg0.l2pt_ena.get();
endfunction
`RULE_END

`RULE_BEGIN(l2pt_disabled)
`RULE_ENA(l2pt)
function bit is_l2pt_ena(shortint unsigned port=0);
    return regmodel.globals.port_input_cfg[port-1].cfg0.l2pt_ena.get();
endfunction
`RULE_END


`RULE_BEGIN(acd_unicast_paa_l2_fwd_cpu)
`RULE_ENA(paa_layer2)
`IS_VLAN_AWARE(paa_layer2)
`IS_LP_RING
`GET_SYS_MAC_ADDR
`IS_LP_MAC_ADDR
`GET_LOGICAL_PORT
`IS_FT_DROP_MATCH
`RULE_END


`RULE_BEGIN(acd_unicast_paa_l2_discard_cpu)
`RULE_ENA(paa_layer2)
`IS_VLAN_AWARE(paa_layer2)
`IS_LP_RING
`GET_SYS_MAC_ADDR
`IS_LP_MAC_ADDR
`GET_LOGICAL_PORT
`IS_FT_DROP_MATCH
`RULE_END


`RULE_BEGIN(acd_unicast_twamp_reflector)
`RULE_ENA(twamp_reflector)
`IS_VLAN_AWARE(twamp_reflector)
`IS_LP_RING
`GET_SYS_MAC_ADDR
`IS_LP_MAC_ADDR
`GET_LOGICAL_PORT
`IS_TWAMP_REFLECTOR_UDP_PORT
`IS_BCAST_MGMT_FLAG
`IS_FT_DROP_MATCH
`RULE_END


`RULE_BEGIN(gen_purp_unicast)
`RULE_ENA(general_purpose_unicast)
`IS_VLAN_AWARE(general_purpose_unicast)
`IS_LP_RING
`GET_SYS_MAC_ADDR
`IS_LP_MAC_ADDR
`GET_LOGICAL_PORT
`IS_BCAST_MGMT_FLAG
`IS_FT_DROP_MATCH
`RULE_END


`RULE_BEGIN(gen_purp_broadcast)
`RULE_ENA(broadcast)
`IS_BCAST_MGMT_FLAG
`IS_ACD_SRC_ONLY
`RULE_END


`RULE_BEGIN(ipv6_neigh_discov)
`RULE_ENA(ipv6_discovery)
`IS_BCAST_MGMT_FLAG
`IS_ACD_SRC_ONLY
`RULE_END


`RULE_BEGIN(ptp_ethernet)
`RULE_ENA(ptp_ethernet)
`IS_BCAST_MGMT_FLAG
`IS_ACD_SRC_ONLY
`RULE_END


`RULE_BEGIN(ptp_ipv4)
`RULE_ENA(ptp_ipv4)
`IS_BCAST_MGMT_FLAG
`IS_ACD_SRC_ONLY
`RULE_END


`RULE_BEGIN(ptp_ipv6)
`RULE_ENA(ptp_ipv6)
`IS_BCAST_MGMT_FLAG
`IS_ACD_SRC_ONLY
`RULE_END


`RULE_BEGIN(untagged_bridge_local)
`RULE_ENA(untagged_bridge_local)
`IS_SYS_BASE_MAC_ADDR
`GET_SYS_MAC_ADDR
`RULE_END


`RULE_BEGIN(untagged_bridge_remote)
`RULE_ENA(untagged_bridge_remote)
`RULE_END
