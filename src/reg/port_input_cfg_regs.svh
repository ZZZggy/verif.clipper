//------------------------------------------------------------------------------
// ACCEDIAN NETWORKS
// High Performance Service Assurance (TM)
//
// Accedian Networks, Inc.
// 4878 Levy, suite 202
// Saint-Laurent, Quebec Canada H4R 2P1
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
//
//------------------------------------------------------------------------------
// !!! AUTO-GENERATED FILE !!!
// Register definitions for port_input_cfg register block.
//
// To enable per-instance coverage: regmodel...set_per_instance_coverage(1, UVM_(NO_)HIER);
// To enable singleton coverage:    regmodel...set_per_instance_coverage(0, UVM_(NO_)HIER);
// To enable coverage:              void'(regmodel...set_coverage(1));
// To enable hierarchical coverage: void'(regmodel...set_coverage(UVM_CVR_ALL));
//
// TODO: <field>.configure: need to replace:has_reset => actual, individually_accessible => byte lane accessible
// TODO: add address coverage to register blocks
// TODO: for memories in blocks, n_bits and access should be configured somehow
//       mem = new("mem", addressRange, `UVM_REG_DATA_WIDTH, "RW", UVM_NO_COVERAGE); // mem_type::type_id::create("mem", , get_full_name());
// TODO: for block default_map, specify actual n_bytes, endian-ness, byte_addressing
//------------------------------------------------------------------------------

`include "uvm_macros.svh"

//---------------------------------------------------------
// Group: port_input_cfg
//---------------------------------------------------------

package port_input_cfg_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;

typedef class port_input_cfg_cfg0_reg_cover;

// Class: port_input_cfg_cfg0_reg
// Register port_input_cfg.cfg0: Port Hidden CPU Rules &amp; other Classifier configuration register
class port_input_cfg_cfg0_reg extends uvm_reg;

    // Variable: port_mip_md_level
    // Used in CFM_Multicast2 CPU Hidden Rule
    rand uvm_reg_field port_mip_md_level;
    // Variable: port_mep_md_level
    // Used in R_APS &amp; CFM_Multicast1 CPU Hidden Rules
    rand uvm_reg_field port_mep_md_level;
    // Variable: protection_state_bypass_for_loopback
    // Allow to bypass the protection table, in case of loopback
    rand uvm_reg_field protection_state_bypass_for_loopback;
    // Variable: vid_table_mode
    // When set, Vlan2 is used for the vid table (Inner Vlan mode). Otherwise, it is Vlan1 (Outer Vlan mode).
    rand uvm_reg_field vid_table_mode;
    // Variable: other_mac_address
    // MAC address 4 LSBs from LAG (protection mode enabled).  MAC adress 4 LSBs of current port (protection mode disabled)
    rand uvm_reg_field other_mac_address;
    // Variable: l2pt_ena
    // L2PT enable used in L2PT CPU Hidden Rule
    rand uvm_reg_field l2pt_ena;
    // Variable: acd_src_only
    // Accedian OUI source only used in PTP_Ethernet, PTP_IPv4, PTP_IPv6, Broadcast &amp; IPv6_Discovery CPU Hidden Rules
    rand uvm_reg_field acd_src_only;
    // Variable: port_blocking_ena
    // Port blocking enable. Allows to block forwarding from this port.
    rand uvm_reg_field port_blocking_ena;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static port_input_cfg_cfg0_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    port_input_cfg_cfg0_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(port_input_cfg_reg_pkg::port_input_cfg_cfg0_reg)

    // Constructor: new
    function new(string name = "port_input_cfg_cfg0");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        port_mip_md_level = uvm_reg_field::type_id::create("port_mip_md_level", , get_full_name());
        port_mep_md_level = uvm_reg_field::type_id::create("port_mep_md_level", , get_full_name());
        protection_state_bypass_for_loopback = uvm_reg_field::type_id::create("protection_state_bypass_for_loopback", , get_full_name());
        vid_table_mode = uvm_reg_field::type_id::create("vid_table_mode", , get_full_name());
        other_mac_address = uvm_reg_field::type_id::create("other_mac_address", , get_full_name());
        l2pt_ena = uvm_reg_field::type_id::create("l2pt_ena", , get_full_name());
        acd_src_only = uvm_reg_field::type_id::create("acd_src_only", , get_full_name());
        port_blocking_ena = uvm_reg_field::type_id::create("port_blocking_ena", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        port_mip_md_level.configure(this, 3, 0, "RW", 0, 'h7, 1, 1, 0);
        port_mep_md_level.configure(this, 3, 3, "RW", 0, 'h7, 1, 1, 0);
        protection_state_bypass_for_loopback.configure(this, 1, 6, "RW", 0, 'h1, 1, 1, 0);
        vid_table_mode.configure(this, 1, 7, "RW", 0, 'h0, 1, 1, 0);
        other_mac_address.configure(this, 4, 8, "RW", 0, 'h1, 1, 1, 0);
        l2pt_ena.configure(this, 1, 12, "RW", 0, 'h0, 1, 1, 0);
        acd_src_only.configure(this, 1, 13, "RW", 0, 'h0, 1, 1, 0);
        port_blocking_ena.configure(this, 1, 14, "RW", 0, 'h0, 1, 1, 0);
    endfunction


    // Function: RMW
    // Helper task for read-modify-write based on mask.
    // Ones in the mask position indicate bits to modify.
    task RMW(output uvm_status_e status, input uvm_reg_data_t data, input uvm_reg_data_t mask);
        uvm_reg_data_t tmp;

        // read
        read(status, tmp);
        // modify
        tmp &= ~mask;
        tmp |= data & mask;
        //write
        write(status, tmp);
    endtask


    // Function: post_write
    // Add message after access.
    virtual task post_write(uvm_reg_item rw);
        super.post_write(rw);
        is_read = 0;
        `uvm_info("REG", $sformatf("%0s WRITE=0x%0h ADDR=0x%0h%0s", this.get_full_name(), this.get(), this.get_address(), this.fields2string()), UVM_MEDIUM)
        sample_values();
    endtask


    // Function: post_read
    // Add message after access.
    virtual task post_read(uvm_reg_item rw);
        super.post_read(rw);
        is_read = 1;
        `uvm_info("REG", $sformatf("%0s READ=0x%0h ADDR=0x%0h%0s", this.get_full_name(), this.get(), this.get_address(), this.fields2string()), UVM_MEDIUM)
        sample_values();
    endtask


    // Function: enable_coverage
    // Build coverage object if it doesn't already exist.
    function void enable_coverage(uvm_reg_cvr_t models, bit cg_per_instance=0);
        if (cg_per_instance) begin
            if (cg == null) begin
                //$info("Creating instance coverage object: %0s", {this.get_full_name(), ".cg"});
                cg = port_input_cfg_cfg0_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = port_input_cfg_cfg0_reg_cover::get();
        end
        this.add_coverage(models);
    endfunction


    // Function: sample_values
    // Called in post-actions
    virtual function void sample_values();
        // Sample only if coverage object has been created
        if(cg != null) begin
            cg.sample(this, is_read);
        end
        if (cg_all != null) begin
            cg_all.sample(this, is_read);
        end
    endfunction


    // Function: sample
    // Sample the raw transaction
    //function void sample(uvm_reg_data_t data, uvm_reg_data_t byte_en, bit is_read, uvm_reg_map map);


    // Function: has_params
    function int unsigned has_params();
        has_params = 0;
        has_params += 0;
    endfunction

    // Function: fields2string
    // Stringify fields.
    virtual function string fields2string();
        string s="";
        $swrite(s, "%0s\n%24s=0x%0h", s, port_mip_md_level.get_name, port_mip_md_level.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port_mep_md_level.get_name, port_mep_md_level.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, protection_state_bypass_for_loopback.get_name, protection_state_bypass_for_loopback.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, vid_table_mode.get_name, vid_table_mode.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, other_mac_address.get_name, other_mac_address.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, l2pt_ena.get_name, l2pt_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, acd_src_only.get_name, acd_src_only.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port_blocking_ena.get_name, port_blocking_ena.value);
        return s;
    endfunction

endclass


// Class: port_input_cfg_cfg0_reg_cover
// Register coverage object.
class port_input_cfg_cfg0_reg_cover extends uvm_object;

    static local port_input_cfg_cfg0_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    port_input_cfg_cfg0_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        port_mip_md_level_wr: coverpoint r.port_mip_md_level.value iff (!is_read);
        port_mip_md_level_rd: coverpoint r.port_mip_md_level.value iff  (is_read);
        port_mep_md_level_wr: coverpoint r.port_mep_md_level.value iff (!is_read);
        port_mep_md_level_rd: coverpoint r.port_mep_md_level.value iff  (is_read);
        protection_state_bypass_for_loopback_wr: coverpoint r.protection_state_bypass_for_loopback.value iff (!is_read);
        protection_state_bypass_for_loopback_rd: coverpoint r.protection_state_bypass_for_loopback.value iff  (is_read);
        vid_table_mode_wr: coverpoint r.vid_table_mode.value iff (!is_read);
        vid_table_mode_rd: coverpoint r.vid_table_mode.value iff  (is_read);
        other_mac_address_wr: coverpoint r.other_mac_address.value iff (!is_read);
        other_mac_address_rd: coverpoint r.other_mac_address.value iff  (is_read);
        l2pt_ena_wr: coverpoint r.l2pt_ena.value iff (!is_read);
        l2pt_ena_rd: coverpoint r.l2pt_ena.value iff  (is_read);
        acd_src_only_wr: coverpoint r.acd_src_only.value iff (!is_read);
        acd_src_only_rd: coverpoint r.acd_src_only.value iff  (is_read);
        port_blocking_ena_wr: coverpoint r.port_blocking_ena.value iff (!is_read);
        port_blocking_ena_rd: coverpoint r.port_blocking_ena.value iff  (is_read);
    endgroup

    `uvm_object_utils(port_input_cfg_reg_pkg::port_input_cfg_cfg0_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="port_input_cfg_cfg0_reg_cover");
        super.new(name);
        cg = new(/*name*/);
    endfunction


    // Function: set_name
    // Override function to set name of covergroup.
    virtual function void set_name(string name);
        super.set_name(name);
        cg.option.name = name;
    endfunction


    // Function: get
    // Get the coverage object singleton.
    static function port_input_cfg_cfg0_reg_cover get();
        if (m_inst == null) begin
            m_inst = port_input_cfg_cfg0_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(port_input_cfg_cfg0_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class port_input_cfg_cfg1_reg_cover;

// Class: port_input_cfg_cfg1_reg
// Register port_input_cfg.cfg1: Port Hidden CPU Rules enable configuration register
class port_input_cfg_cfg1_reg extends uvm_reg;

    // Variable: drop_self_rule_ena
    // Drop_Self CPU Hidden Rule enable
    rand uvm_reg_field drop_self_rule_ena;
    // Variable: acterna_hello_rule_ena
    // Acterna_Hello CPU Hidden Rule enable
    rand uvm_reg_field acterna_hello_rule_ena;
    // Variable: soam_lbm_rule_ena
    // SOAM_LBM CPU Hidden Rule enable
    rand uvm_reg_field soam_lbm_rule_ena;
    // Variable: acd_lbm_rule_ena
    // ACD_LBM CPU Hidden Rule enable
    rand uvm_reg_field acd_lbm_rule_ena;
    // Variable: acd_lbr_tst_leak_rule_ena
    // ACD_LBR_TST_Leak CPU Hidden Rule enable
    rand uvm_reg_field acd_lbr_tst_leak_rule_ena;
    // Variable: r_aps_rule_ena
    // R_APS CPU Hidden Rule enable
    rand uvm_reg_field r_aps_rule_ena;
    // Variable: cfm_multicast2_rule_ena
    // CFM_Multicast2 CPU Hidden Rule enable
    rand uvm_reg_field cfm_multicast2_rule_ena;
    // Variable: cfm_multicast1_123_rule_ena
    // CFM_Multicast1 CPU Hidden Rule sub-rules 1,2,3 enable
    rand uvm_reg_field cfm_multicast1_123_rule_ena;
    // Variable: cfm_multicast1_rule_ena
    // CFM_Multicast1 CPU Hidden Rule sub-rule 4 enable
    rand uvm_reg_field cfm_multicast1_rule_ena;
    // Variable: cfm_unicast_123_rule_ena
    // CFM_Unicast CPU Hidden Rule sub-rules 1,2,3 enable
    rand uvm_reg_field cfm_unicast_123_rule_ena;
    // Variable: cfm_unicast_rule_ena
    // CFM_Unicast CPU Hidden Rule sub-rule 4 enable
    rand uvm_reg_field cfm_unicast_rule_ena;
    // Variable: acp_rule_ena
    // ACP CPU Hidden Rule enable
    rand uvm_reg_field acp_rule_ena;
    // Variable: acp_layer3_rule_ena
    // ACP_Layer3 CPU Hidden Rule enable
    rand uvm_reg_field acp_layer3_rule_ena;
    // Variable: mgmt_bridge_rule_ena
    // CPU Hidden Rule enable
    rand uvm_reg_field mgmt_bridge_rule_ena;
    // Variable: paa_discovery_rule_ena
    // PAA_Discovery CPU Hidden Rule enable
    rand uvm_reg_field paa_discovery_rule_ena;
    // Variable: acd_broadcast_rule_ena
    // ACD_Broadcast CPU Hidden Rule enable
    rand uvm_reg_field acd_broadcast_rule_ena;
    // Variable: acd_tunneling_rule_ena
    // ACD_Tunneling CPU Hidden Rule enable
    rand uvm_reg_field acd_tunneling_rule_ena;
    // Variable: cisco_tunneling_rule_ena
    // Cisco_Tunneling CPU Hidden Rule enable
    rand uvm_reg_field cisco_tunneling_rule_ena;
    // Variable: lacp_rule_ena
    // LACP CPU Hidden Rule enable
    rand uvm_reg_field lacp_rule_ena;
    // Variable: lldp_rule_ena
    // LLDP CPU Hidden Rule enable
    rand uvm_reg_field lldp_rule_ena;
    // Variable: link_oam_rule_ena
    // Link_OAM CPU Hidden Rule enable
    rand uvm_reg_field link_oam_rule_ena;
    // Variable: ptp_ethernet_rule_ena
    // PTP_Ethernet CPU Hidden Rule enable
    rand uvm_reg_field ptp_ethernet_rule_ena;
    // Variable: ptp_ipv4_rule_ena
    // PTP_IPv4 CPU Hidden Rule enable
    rand uvm_reg_field ptp_ipv4_rule_ena;
    // Variable: ptp_ipv6_rule_ena
    // PTP IPv6 CPU Hidden Rule enable
    rand uvm_reg_field ptp_ipv6_rule_ena;
    // Variable: l2pt_rule_ena
    // L2PT CPU Hidden Rule enable
    rand uvm_reg_field l2pt_rule_ena;
    // Variable: paa_layer2_rule_ena
    // PAA_Layer2 CPU Hidden Rule enable
    rand uvm_reg_field paa_layer2_rule_ena;
    // Variable: twamp_reflector_rule_ena
    // TWAMP_Reflector CPU Hidden Rule enable
    rand uvm_reg_field twamp_reflector_rule_ena;
    // Variable: general_purpose_unicast_rule_ena
    // General_Purpose_Unicast CPU Hidden Rule enable
    rand uvm_reg_field general_purpose_unicast_rule_ena;
    // Variable: broadcast_rule_ena
    // Broadcast CPU Hidden Rule enable
    rand uvm_reg_field broadcast_rule_ena;
    // Variable: ipv6_discovery_rule_ena
    // IPv6_Discovery CPU Hidden Rule enable
    rand uvm_reg_field ipv6_discovery_rule_ena;
    // Variable: untagged_bridge_local_rule_ena
    // Untagged_Bridge_Local CPU Hidden Rule enable
    rand uvm_reg_field untagged_bridge_local_rule_ena;
    // Variable: untagged_bridge_remote_rule_ena
    // Untagged_Bridge_Remote CPU Hidden Rule enable
    rand uvm_reg_field untagged_bridge_remote_rule_ena;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static port_input_cfg_cfg1_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    port_input_cfg_cfg1_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(port_input_cfg_reg_pkg::port_input_cfg_cfg1_reg)

    // Constructor: new
    function new(string name = "port_input_cfg_cfg1");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        drop_self_rule_ena = uvm_reg_field::type_id::create("drop_self_rule_ena", , get_full_name());
        acterna_hello_rule_ena = uvm_reg_field::type_id::create("acterna_hello_rule_ena", , get_full_name());
        soam_lbm_rule_ena = uvm_reg_field::type_id::create("soam_lbm_rule_ena", , get_full_name());
        acd_lbm_rule_ena = uvm_reg_field::type_id::create("acd_lbm_rule_ena", , get_full_name());
        acd_lbr_tst_leak_rule_ena = uvm_reg_field::type_id::create("acd_lbr_tst_leak_rule_ena", , get_full_name());
        r_aps_rule_ena = uvm_reg_field::type_id::create("r_aps_rule_ena", , get_full_name());
        cfm_multicast2_rule_ena = uvm_reg_field::type_id::create("cfm_multicast2_rule_ena", , get_full_name());
        cfm_multicast1_123_rule_ena = uvm_reg_field::type_id::create("cfm_multicast1_123_rule_ena", , get_full_name());
        cfm_multicast1_rule_ena = uvm_reg_field::type_id::create("cfm_multicast1_rule_ena", , get_full_name());
        cfm_unicast_123_rule_ena = uvm_reg_field::type_id::create("cfm_unicast_123_rule_ena", , get_full_name());
        cfm_unicast_rule_ena = uvm_reg_field::type_id::create("cfm_unicast_rule_ena", , get_full_name());
        acp_rule_ena = uvm_reg_field::type_id::create("acp_rule_ena", , get_full_name());
        acp_layer3_rule_ena = uvm_reg_field::type_id::create("acp_layer3_rule_ena", , get_full_name());
        mgmt_bridge_rule_ena = uvm_reg_field::type_id::create("mgmt_bridge_rule_ena", , get_full_name());
        paa_discovery_rule_ena = uvm_reg_field::type_id::create("paa_discovery_rule_ena", , get_full_name());
        acd_broadcast_rule_ena = uvm_reg_field::type_id::create("acd_broadcast_rule_ena", , get_full_name());
        acd_tunneling_rule_ena = uvm_reg_field::type_id::create("acd_tunneling_rule_ena", , get_full_name());
        cisco_tunneling_rule_ena = uvm_reg_field::type_id::create("cisco_tunneling_rule_ena", , get_full_name());
        lacp_rule_ena = uvm_reg_field::type_id::create("lacp_rule_ena", , get_full_name());
        lldp_rule_ena = uvm_reg_field::type_id::create("lldp_rule_ena", , get_full_name());
        link_oam_rule_ena = uvm_reg_field::type_id::create("link_oam_rule_ena", , get_full_name());
        ptp_ethernet_rule_ena = uvm_reg_field::type_id::create("ptp_ethernet_rule_ena", , get_full_name());
        ptp_ipv4_rule_ena = uvm_reg_field::type_id::create("ptp_ipv4_rule_ena", , get_full_name());
        ptp_ipv6_rule_ena = uvm_reg_field::type_id::create("ptp_ipv6_rule_ena", , get_full_name());
        l2pt_rule_ena = uvm_reg_field::type_id::create("l2pt_rule_ena", , get_full_name());
        paa_layer2_rule_ena = uvm_reg_field::type_id::create("paa_layer2_rule_ena", , get_full_name());
        twamp_reflector_rule_ena = uvm_reg_field::type_id::create("twamp_reflector_rule_ena", , get_full_name());
        general_purpose_unicast_rule_ena = uvm_reg_field::type_id::create("general_purpose_unicast_rule_ena", , get_full_name());
        broadcast_rule_ena = uvm_reg_field::type_id::create("broadcast_rule_ena", , get_full_name());
        ipv6_discovery_rule_ena = uvm_reg_field::type_id::create("ipv6_discovery_rule_ena", , get_full_name());
        untagged_bridge_local_rule_ena = uvm_reg_field::type_id::create("untagged_bridge_local_rule_ena", , get_full_name());
        untagged_bridge_remote_rule_ena = uvm_reg_field::type_id::create("untagged_bridge_remote_rule_ena", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        drop_self_rule_ena.configure(this, 1, 0, "RW", 0, 'h0, 1, 1, 0);
        acterna_hello_rule_ena.configure(this, 1, 1, "RW", 0, 'h1, 1, 1, 0);
        soam_lbm_rule_ena.configure(this, 1, 2, "RW", 0, 'h1, 1, 1, 0);
        acd_lbm_rule_ena.configure(this, 1, 3, "RW", 0, 'h1, 1, 1, 0);
        acd_lbr_tst_leak_rule_ena.configure(this, 1, 4, "RW", 0, 'h1, 1, 1, 0);
        r_aps_rule_ena.configure(this, 1, 5, "RW", 0, 'h0, 1, 1, 0);
        cfm_multicast2_rule_ena.configure(this, 1, 6, "RW", 0, 'h0, 1, 1, 0);
        cfm_multicast1_123_rule_ena.configure(this, 1, 7, "RW", 0, 'h0, 1, 1, 0);
        cfm_multicast1_rule_ena.configure(this, 1, 8, "RW", 0, 'h0, 1, 1, 0);
        cfm_unicast_123_rule_ena.configure(this, 1, 9, "RW", 0, 'h1, 1, 1, 0);
        cfm_unicast_rule_ena.configure(this, 1, 10, "RW", 0, 'h1, 1, 1, 0);
        acp_rule_ena.configure(this, 1, 11, "RW", 0, 'h0, 1, 1, 0);
        acp_layer3_rule_ena.configure(this, 1, 12, "RW", 0, 'h1, 1, 1, 0);
        mgmt_bridge_rule_ena.configure(this, 1, 13, "RW", 0, 'h0, 1, 1, 0);
        paa_discovery_rule_ena.configure(this, 1, 14, "RW", 0, 'h1, 1, 1, 0);
        acd_broadcast_rule_ena.configure(this, 1, 15, "RW", 0, 'h1, 1, 1, 0);
        acd_tunneling_rule_ena.configure(this, 1, 16, "RW", 0, 'h0, 1, 1, 0);
        cisco_tunneling_rule_ena.configure(this, 1, 17, "RW", 0, 'h0, 1, 1, 0);
        lacp_rule_ena.configure(this, 1, 18, "RW", 0, 'h0, 1, 1, 0);
        lldp_rule_ena.configure(this, 1, 19, "RW", 0, 'h0, 1, 1, 0);
        link_oam_rule_ena.configure(this, 1, 20, "RW", 0, 'h1, 1, 1, 0);
        ptp_ethernet_rule_ena.configure(this, 1, 21, "RW", 0, 'h0, 1, 1, 0);
        ptp_ipv4_rule_ena.configure(this, 1, 22, "RW", 0, 'h0, 1, 1, 0);
        ptp_ipv6_rule_ena.configure(this, 1, 23, "RW", 0, 'h0, 1, 1, 0);
        l2pt_rule_ena.configure(this, 1, 24, "RW", 0, 'h1, 1, 1, 0);
        paa_layer2_rule_ena.configure(this, 1, 25, "RW", 0, 'h1, 1, 1, 0);
        twamp_reflector_rule_ena.configure(this, 1, 26, "RW", 0, 'h1, 1, 1, 0);
        general_purpose_unicast_rule_ena.configure(this, 1, 27, "RW", 0, 'h1, 1, 1, 0);
        broadcast_rule_ena.configure(this, 1, 28, "RW", 0, 'h1, 1, 1, 0);
        ipv6_discovery_rule_ena.configure(this, 1, 29, "RW", 0, 'h0, 1, 1, 0);
        untagged_bridge_local_rule_ena.configure(this, 1, 30, "RW", 0, 'h0, 1, 1, 0);
        untagged_bridge_remote_rule_ena.configure(this, 1, 31, "RW", 0, 'h0, 1, 1, 0);
    endfunction


    // Function: RMW
    // Helper task for read-modify-write based on mask.
    // Ones in the mask position indicate bits to modify.
    task RMW(output uvm_status_e status, input uvm_reg_data_t data, input uvm_reg_data_t mask);
        uvm_reg_data_t tmp;

        // read
        read(status, tmp);
        // modify
        tmp &= ~mask;
        tmp |= data & mask;
        //write
        write(status, tmp);
    endtask


    // Function: post_write
    // Add message after access.
    virtual task post_write(uvm_reg_item rw);
        super.post_write(rw);
        is_read = 0;
        `uvm_info("REG", $sformatf("%0s WRITE=0x%0h ADDR=0x%0h%0s", this.get_full_name(), this.get(), this.get_address(), this.fields2string()), UVM_MEDIUM)
        sample_values();
    endtask


    // Function: post_read
    // Add message after access.
    virtual task post_read(uvm_reg_item rw);
        super.post_read(rw);
        is_read = 1;
        `uvm_info("REG", $sformatf("%0s READ=0x%0h ADDR=0x%0h%0s", this.get_full_name(), this.get(), this.get_address(), this.fields2string()), UVM_MEDIUM)
        sample_values();
    endtask


    // Function: enable_coverage
    // Build coverage object if it doesn't already exist.
    function void enable_coverage(uvm_reg_cvr_t models, bit cg_per_instance=0);
        if (cg_per_instance) begin
            if (cg == null) begin
                //$info("Creating instance coverage object: %0s", {this.get_full_name(), ".cg"});
                cg = port_input_cfg_cfg1_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = port_input_cfg_cfg1_reg_cover::get();
        end
        this.add_coverage(models);
    endfunction


    // Function: sample_values
    // Called in post-actions
    virtual function void sample_values();
        // Sample only if coverage object has been created
        if(cg != null) begin
            cg.sample(this, is_read);
        end
        if (cg_all != null) begin
            cg_all.sample(this, is_read);
        end
    endfunction


    // Function: sample
    // Sample the raw transaction
    //function void sample(uvm_reg_data_t data, uvm_reg_data_t byte_en, bit is_read, uvm_reg_map map);


    // Function: has_params
    function int unsigned has_params();
        has_params = 0;
        has_params += 0;
    endfunction

    // Function: fields2string
    // Stringify fields.
    virtual function string fields2string();
        string s="";
        $swrite(s, "%0s\n%24s=0x%0h", s, drop_self_rule_ena.get_name, drop_self_rule_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, acterna_hello_rule_ena.get_name, acterna_hello_rule_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, soam_lbm_rule_ena.get_name, soam_lbm_rule_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, acd_lbm_rule_ena.get_name, acd_lbm_rule_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, acd_lbr_tst_leak_rule_ena.get_name, acd_lbr_tst_leak_rule_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, r_aps_rule_ena.get_name, r_aps_rule_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, cfm_multicast2_rule_ena.get_name, cfm_multicast2_rule_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, cfm_multicast1_123_rule_ena.get_name, cfm_multicast1_123_rule_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, cfm_multicast1_rule_ena.get_name, cfm_multicast1_rule_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, cfm_unicast_123_rule_ena.get_name, cfm_unicast_123_rule_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, cfm_unicast_rule_ena.get_name, cfm_unicast_rule_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, acp_rule_ena.get_name, acp_rule_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, acp_layer3_rule_ena.get_name, acp_layer3_rule_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, mgmt_bridge_rule_ena.get_name, mgmt_bridge_rule_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, paa_discovery_rule_ena.get_name, paa_discovery_rule_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, acd_broadcast_rule_ena.get_name, acd_broadcast_rule_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, acd_tunneling_rule_ena.get_name, acd_tunneling_rule_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, cisco_tunneling_rule_ena.get_name, cisco_tunneling_rule_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, lacp_rule_ena.get_name, lacp_rule_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, lldp_rule_ena.get_name, lldp_rule_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, link_oam_rule_ena.get_name, link_oam_rule_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, ptp_ethernet_rule_ena.get_name, ptp_ethernet_rule_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, ptp_ipv4_rule_ena.get_name, ptp_ipv4_rule_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, ptp_ipv6_rule_ena.get_name, ptp_ipv6_rule_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, l2pt_rule_ena.get_name, l2pt_rule_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, paa_layer2_rule_ena.get_name, paa_layer2_rule_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, twamp_reflector_rule_ena.get_name, twamp_reflector_rule_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, general_purpose_unicast_rule_ena.get_name, general_purpose_unicast_rule_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, broadcast_rule_ena.get_name, broadcast_rule_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, ipv6_discovery_rule_ena.get_name, ipv6_discovery_rule_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, untagged_bridge_local_rule_ena.get_name, untagged_bridge_local_rule_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, untagged_bridge_remote_rule_ena.get_name, untagged_bridge_remote_rule_ena.value);
        return s;
    endfunction

endclass


// Class: port_input_cfg_cfg1_reg_cover
// Register coverage object.
class port_input_cfg_cfg1_reg_cover extends uvm_object;

    static local port_input_cfg_cfg1_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    port_input_cfg_cfg1_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        drop_self_rule_ena_wr: coverpoint r.drop_self_rule_ena.value iff (!is_read);
        drop_self_rule_ena_rd: coverpoint r.drop_self_rule_ena.value iff  (is_read);
        acterna_hello_rule_ena_wr: coverpoint r.acterna_hello_rule_ena.value iff (!is_read);
        acterna_hello_rule_ena_rd: coverpoint r.acterna_hello_rule_ena.value iff  (is_read);
        soam_lbm_rule_ena_wr: coverpoint r.soam_lbm_rule_ena.value iff (!is_read);
        soam_lbm_rule_ena_rd: coverpoint r.soam_lbm_rule_ena.value iff  (is_read);
        acd_lbm_rule_ena_wr: coverpoint r.acd_lbm_rule_ena.value iff (!is_read);
        acd_lbm_rule_ena_rd: coverpoint r.acd_lbm_rule_ena.value iff  (is_read);
        acd_lbr_tst_leak_rule_ena_wr: coverpoint r.acd_lbr_tst_leak_rule_ena.value iff (!is_read);
        acd_lbr_tst_leak_rule_ena_rd: coverpoint r.acd_lbr_tst_leak_rule_ena.value iff  (is_read);
        r_aps_rule_ena_wr: coverpoint r.r_aps_rule_ena.value iff (!is_read);
        r_aps_rule_ena_rd: coverpoint r.r_aps_rule_ena.value iff  (is_read);
        cfm_multicast2_rule_ena_wr: coverpoint r.cfm_multicast2_rule_ena.value iff (!is_read);
        cfm_multicast2_rule_ena_rd: coverpoint r.cfm_multicast2_rule_ena.value iff  (is_read);
        cfm_multicast1_123_rule_ena_wr: coverpoint r.cfm_multicast1_123_rule_ena.value iff (!is_read);
        cfm_multicast1_123_rule_ena_rd: coverpoint r.cfm_multicast1_123_rule_ena.value iff  (is_read);
        cfm_multicast1_rule_ena_wr: coverpoint r.cfm_multicast1_rule_ena.value iff (!is_read);
        cfm_multicast1_rule_ena_rd: coverpoint r.cfm_multicast1_rule_ena.value iff  (is_read);
        cfm_unicast_123_rule_ena_wr: coverpoint r.cfm_unicast_123_rule_ena.value iff (!is_read);
        cfm_unicast_123_rule_ena_rd: coverpoint r.cfm_unicast_123_rule_ena.value iff  (is_read);
        cfm_unicast_rule_ena_wr: coverpoint r.cfm_unicast_rule_ena.value iff (!is_read);
        cfm_unicast_rule_ena_rd: coverpoint r.cfm_unicast_rule_ena.value iff  (is_read);
        acp_rule_ena_wr: coverpoint r.acp_rule_ena.value iff (!is_read);
        acp_rule_ena_rd: coverpoint r.acp_rule_ena.value iff  (is_read);
        acp_layer3_rule_ena_wr: coverpoint r.acp_layer3_rule_ena.value iff (!is_read);
        acp_layer3_rule_ena_rd: coverpoint r.acp_layer3_rule_ena.value iff  (is_read);
        mgmt_bridge_rule_ena_wr: coverpoint r.mgmt_bridge_rule_ena.value iff (!is_read);
        mgmt_bridge_rule_ena_rd: coverpoint r.mgmt_bridge_rule_ena.value iff  (is_read);
        paa_discovery_rule_ena_wr: coverpoint r.paa_discovery_rule_ena.value iff (!is_read);
        paa_discovery_rule_ena_rd: coverpoint r.paa_discovery_rule_ena.value iff  (is_read);
        acd_broadcast_rule_ena_wr: coverpoint r.acd_broadcast_rule_ena.value iff (!is_read);
        acd_broadcast_rule_ena_rd: coverpoint r.acd_broadcast_rule_ena.value iff  (is_read);
        acd_tunneling_rule_ena_wr: coverpoint r.acd_tunneling_rule_ena.value iff (!is_read);
        acd_tunneling_rule_ena_rd: coverpoint r.acd_tunneling_rule_ena.value iff  (is_read);
        cisco_tunneling_rule_ena_wr: coverpoint r.cisco_tunneling_rule_ena.value iff (!is_read);
        cisco_tunneling_rule_ena_rd: coverpoint r.cisco_tunneling_rule_ena.value iff  (is_read);
        lacp_rule_ena_wr: coverpoint r.lacp_rule_ena.value iff (!is_read);
        lacp_rule_ena_rd: coverpoint r.lacp_rule_ena.value iff  (is_read);
        lldp_rule_ena_wr: coverpoint r.lldp_rule_ena.value iff (!is_read);
        lldp_rule_ena_rd: coverpoint r.lldp_rule_ena.value iff  (is_read);
        link_oam_rule_ena_wr: coverpoint r.link_oam_rule_ena.value iff (!is_read);
        link_oam_rule_ena_rd: coverpoint r.link_oam_rule_ena.value iff  (is_read);
        ptp_ethernet_rule_ena_wr: coverpoint r.ptp_ethernet_rule_ena.value iff (!is_read);
        ptp_ethernet_rule_ena_rd: coverpoint r.ptp_ethernet_rule_ena.value iff  (is_read);
        ptp_ipv4_rule_ena_wr: coverpoint r.ptp_ipv4_rule_ena.value iff (!is_read);
        ptp_ipv4_rule_ena_rd: coverpoint r.ptp_ipv4_rule_ena.value iff  (is_read);
        ptp_ipv6_rule_ena_wr: coverpoint r.ptp_ipv6_rule_ena.value iff (!is_read);
        ptp_ipv6_rule_ena_rd: coverpoint r.ptp_ipv6_rule_ena.value iff  (is_read);
        l2pt_rule_ena_wr: coverpoint r.l2pt_rule_ena.value iff (!is_read);
        l2pt_rule_ena_rd: coverpoint r.l2pt_rule_ena.value iff  (is_read);
        paa_layer2_rule_ena_wr: coverpoint r.paa_layer2_rule_ena.value iff (!is_read);
        paa_layer2_rule_ena_rd: coverpoint r.paa_layer2_rule_ena.value iff  (is_read);
        twamp_reflector_rule_ena_wr: coverpoint r.twamp_reflector_rule_ena.value iff (!is_read);
        twamp_reflector_rule_ena_rd: coverpoint r.twamp_reflector_rule_ena.value iff  (is_read);
        general_purpose_unicast_rule_ena_wr: coverpoint r.general_purpose_unicast_rule_ena.value iff (!is_read);
        general_purpose_unicast_rule_ena_rd: coverpoint r.general_purpose_unicast_rule_ena.value iff  (is_read);
        broadcast_rule_ena_wr: coverpoint r.broadcast_rule_ena.value iff (!is_read);
        broadcast_rule_ena_rd: coverpoint r.broadcast_rule_ena.value iff  (is_read);
        ipv6_discovery_rule_ena_wr: coverpoint r.ipv6_discovery_rule_ena.value iff (!is_read);
        ipv6_discovery_rule_ena_rd: coverpoint r.ipv6_discovery_rule_ena.value iff  (is_read);
        untagged_bridge_local_rule_ena_wr: coverpoint r.untagged_bridge_local_rule_ena.value iff (!is_read);
        untagged_bridge_local_rule_ena_rd: coverpoint r.untagged_bridge_local_rule_ena.value iff  (is_read);
        untagged_bridge_remote_rule_ena_wr: coverpoint r.untagged_bridge_remote_rule_ena.value iff (!is_read);
        untagged_bridge_remote_rule_ena_rd: coverpoint r.untagged_bridge_remote_rule_ena.value iff  (is_read);
    endgroup

    `uvm_object_utils(port_input_cfg_reg_pkg::port_input_cfg_cfg1_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="port_input_cfg_cfg1_reg_cover");
        super.new(name);
        cg = new(/*name*/);
    endfunction


    // Function: set_name
    // Override function to set name of covergroup.
    virtual function void set_name(string name);
        super.set_name(name);
        cg.option.name = name;
    endfunction


    // Function: get
    // Get the coverage object singleton.
    static function port_input_cfg_cfg1_reg_cover get();
        if (m_inst == null) begin
            m_inst = port_input_cfg_cfg1_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(port_input_cfg_cfg1_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class port_input_cfg_cfg2_reg_cover;

// Class: port_input_cfg_cfg2_reg
// Register port_input_cfg.cfg2: Port Hidden CPU Rules enable configuration register
class port_input_cfg_cfg2_reg extends uvm_reg;

    // Variable: ld_rule_ena
    // Loopback Detection (LD) CPU Hidden Rule enable
    rand uvm_reg_field ld_rule_ena;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static port_input_cfg_cfg2_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    port_input_cfg_cfg2_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(port_input_cfg_reg_pkg::port_input_cfg_cfg2_reg)

    // Constructor: new
    function new(string name = "port_input_cfg_cfg2");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        ld_rule_ena = uvm_reg_field::type_id::create("ld_rule_ena", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        ld_rule_ena.configure(this, 1, 0, "RW", 0, 'h0, 1, 1, 0);
    endfunction


    // Function: RMW
    // Helper task for read-modify-write based on mask.
    // Ones in the mask position indicate bits to modify.
    task RMW(output uvm_status_e status, input uvm_reg_data_t data, input uvm_reg_data_t mask);
        uvm_reg_data_t tmp;

        // read
        read(status, tmp);
        // modify
        tmp &= ~mask;
        tmp |= data & mask;
        //write
        write(status, tmp);
    endtask


    // Function: post_write
    // Add message after access.
    virtual task post_write(uvm_reg_item rw);
        super.post_write(rw);
        is_read = 0;
        `uvm_info("REG", $sformatf("%0s WRITE=0x%0h ADDR=0x%0h%0s", this.get_full_name(), this.get(), this.get_address(), this.fields2string()), UVM_MEDIUM)
        sample_values();
    endtask


    // Function: post_read
    // Add message after access.
    virtual task post_read(uvm_reg_item rw);
        super.post_read(rw);
        is_read = 1;
        `uvm_info("REG", $sformatf("%0s READ=0x%0h ADDR=0x%0h%0s", this.get_full_name(), this.get(), this.get_address(), this.fields2string()), UVM_MEDIUM)
        sample_values();
    endtask


    // Function: enable_coverage
    // Build coverage object if it doesn't already exist.
    function void enable_coverage(uvm_reg_cvr_t models, bit cg_per_instance=0);
        if (cg_per_instance) begin
            if (cg == null) begin
                //$info("Creating instance coverage object: %0s", {this.get_full_name(), ".cg"});
                cg = port_input_cfg_cfg2_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = port_input_cfg_cfg2_reg_cover::get();
        end
        this.add_coverage(models);
    endfunction


    // Function: sample_values
    // Called in post-actions
    virtual function void sample_values();
        // Sample only if coverage object has been created
        if(cg != null) begin
            cg.sample(this, is_read);
        end
        if (cg_all != null) begin
            cg_all.sample(this, is_read);
        end
    endfunction


    // Function: sample
    // Sample the raw transaction
    //function void sample(uvm_reg_data_t data, uvm_reg_data_t byte_en, bit is_read, uvm_reg_map map);


    // Function: has_params
    function int unsigned has_params();
        has_params = 0;
        has_params += 0;
    endfunction

    // Function: fields2string
    // Stringify fields.
    virtual function string fields2string();
        string s="";
        $swrite(s, "%0s\n%24s=0x%0h", s, ld_rule_ena.get_name, ld_rule_ena.value);
        return s;
    endfunction

endclass


// Class: port_input_cfg_cfg2_reg_cover
// Register coverage object.
class port_input_cfg_cfg2_reg_cover extends uvm_object;

    static local port_input_cfg_cfg2_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    port_input_cfg_cfg2_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        ld_rule_ena_wr: coverpoint r.ld_rule_ena.value iff (!is_read);
        ld_rule_ena_rd: coverpoint r.ld_rule_ena.value iff  (is_read);
    endgroup

    `uvm_object_utils(port_input_cfg_reg_pkg::port_input_cfg_cfg2_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="port_input_cfg_cfg2_reg_cover");
        super.new(name);
        cg = new(/*name*/);
    endfunction


    // Function: set_name
    // Override function to set name of covergroup.
    virtual function void set_name(string name);
        super.set_name(name);
        cg.option.name = name;
    endfunction


    // Function: get
    // Get the coverage object singleton.
    static function port_input_cfg_cfg2_reg_cover get();
        if (m_inst == null) begin
            m_inst = port_input_cfg_cfg2_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(port_input_cfg_cfg2_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class port_input_cfg_cfg3_reg_cover;

// Class: port_input_cfg_cfg3_reg
// Register port_input_cfg.cfg3: Port MGMT_Bridge CPU Hidden rule configuration register
class port_input_cfg_cfg3_reg extends uvm_reg;

    // Variable: vlan2_id
    // Second (inner) Vlan ID 
    rand uvm_reg_field vlan2_id;
    // Variable: vlan2_type
    // Second (inner) Vlan Type (0 = C-Tag(8100) ; 1 = S-Tag(88A8) ; 2 = S-Tag(9100) ; 3 = S-Tag(USER config))
    rand uvm_reg_field vlan2_type;
    // Variable: vlan2_ena
    // Enable the usage of the second (inner) Vlan
    rand uvm_reg_field vlan2_ena;
    // Variable: vlan1_id
    // First (outer) Vlan id 
    rand uvm_reg_field vlan1_id;
    // Variable: vlan1_type
    // First (outer) Vlan Type (0 = C-Tag(8100) ; 1 = S-Tag(88A8) ; 2 = S-Tag(9100) ; 3 = S-Tag(USER config))
    rand uvm_reg_field vlan1_type;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static port_input_cfg_cfg3_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    port_input_cfg_cfg3_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(port_input_cfg_reg_pkg::port_input_cfg_cfg3_reg)

    // Constructor: new
    function new(string name = "port_input_cfg_cfg3");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        vlan2_id = uvm_reg_field::type_id::create("vlan2_id", , get_full_name());
        vlan2_type = uvm_reg_field::type_id::create("vlan2_type", , get_full_name());
        vlan2_ena = uvm_reg_field::type_id::create("vlan2_ena", , get_full_name());
        vlan1_id = uvm_reg_field::type_id::create("vlan1_id", , get_full_name());
        vlan1_type = uvm_reg_field::type_id::create("vlan1_type", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        vlan2_id.configure(this, 12, 0, "RW", 0, 'h0, 1, 1, 0);
        vlan2_type.configure(this, 2, 12, "RW", 0, 'h0, 1, 1, 0);
        vlan2_ena.configure(this, 1, 14, "RW", 0, 'h0, 1, 1, 0);
        vlan1_id.configure(this, 12, 16, "RW", 0, 'h0, 1, 1, 0);
        vlan1_type.configure(this, 2, 28, "RW", 0, 'h0, 1, 1, 0);
    endfunction


    // Function: RMW
    // Helper task for read-modify-write based on mask.
    // Ones in the mask position indicate bits to modify.
    task RMW(output uvm_status_e status, input uvm_reg_data_t data, input uvm_reg_data_t mask);
        uvm_reg_data_t tmp;

        // read
        read(status, tmp);
        // modify
        tmp &= ~mask;
        tmp |= data & mask;
        //write
        write(status, tmp);
    endtask


    // Function: post_write
    // Add message after access.
    virtual task post_write(uvm_reg_item rw);
        super.post_write(rw);
        is_read = 0;
        `uvm_info("REG", $sformatf("%0s WRITE=0x%0h ADDR=0x%0h%0s", this.get_full_name(), this.get(), this.get_address(), this.fields2string()), UVM_MEDIUM)
        sample_values();
    endtask


    // Function: post_read
    // Add message after access.
    virtual task post_read(uvm_reg_item rw);
        super.post_read(rw);
        is_read = 1;
        `uvm_info("REG", $sformatf("%0s READ=0x%0h ADDR=0x%0h%0s", this.get_full_name(), this.get(), this.get_address(), this.fields2string()), UVM_MEDIUM)
        sample_values();
    endtask


    // Function: enable_coverage
    // Build coverage object if it doesn't already exist.
    function void enable_coverage(uvm_reg_cvr_t models, bit cg_per_instance=0);
        if (cg_per_instance) begin
            if (cg == null) begin
                //$info("Creating instance coverage object: %0s", {this.get_full_name(), ".cg"});
                cg = port_input_cfg_cfg3_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = port_input_cfg_cfg3_reg_cover::get();
        end
        this.add_coverage(models);
    endfunction


    // Function: sample_values
    // Called in post-actions
    virtual function void sample_values();
        // Sample only if coverage object has been created
        if(cg != null) begin
            cg.sample(this, is_read);
        end
        if (cg_all != null) begin
            cg_all.sample(this, is_read);
        end
    endfunction


    // Function: sample
    // Sample the raw transaction
    //function void sample(uvm_reg_data_t data, uvm_reg_data_t byte_en, bit is_read, uvm_reg_map map);


    // Function: has_params
    function int unsigned has_params();
        has_params = 0;
        has_params += 0;
    endfunction

    // Function: fields2string
    // Stringify fields.
    virtual function string fields2string();
        string s="";
        $swrite(s, "%0s\n%24s=0x%0h", s, vlan2_id.get_name, vlan2_id.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, vlan2_type.get_name, vlan2_type.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, vlan2_ena.get_name, vlan2_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, vlan1_id.get_name, vlan1_id.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, vlan1_type.get_name, vlan1_type.value);
        return s;
    endfunction

endclass


// Class: port_input_cfg_cfg3_reg_cover
// Register coverage object.
class port_input_cfg_cfg3_reg_cover extends uvm_object;

    static local port_input_cfg_cfg3_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    port_input_cfg_cfg3_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        vlan2_id_wr: coverpoint r.vlan2_id.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        vlan2_id_rd: coverpoint r.vlan2_id.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        vlan2_type_wr: coverpoint r.vlan2_type.value iff (!is_read);
        vlan2_type_rd: coverpoint r.vlan2_type.value iff  (is_read);
        vlan2_ena_wr: coverpoint r.vlan2_ena.value iff (!is_read);
        vlan2_ena_rd: coverpoint r.vlan2_ena.value iff  (is_read);
        vlan1_id_wr: coverpoint r.vlan1_id.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        vlan1_id_rd: coverpoint r.vlan1_id.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        vlan1_type_wr: coverpoint r.vlan1_type.value iff (!is_read);
        vlan1_type_rd: coverpoint r.vlan1_type.value iff  (is_read);
    endgroup

    `uvm_object_utils(port_input_cfg_reg_pkg::port_input_cfg_cfg3_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="port_input_cfg_cfg3_reg_cover");
        super.new(name);
        cg = new(/*name*/);
    endfunction


    // Function: set_name
    // Override function to set name of covergroup.
    virtual function void set_name(string name);
        super.set_name(name);
        cg.option.name = name;
    endfunction


    // Function: get
    // Get the coverage object singleton.
    static function port_input_cfg_cfg3_reg_cover get();
        if (m_inst == null) begin
            m_inst = port_input_cfg_cfg3_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(port_input_cfg_cfg3_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass





// Class: port_input_cfg_reg_block
// Register Block .port_input_cfg: 
class port_input_cfg_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand port_input_cfg_cfg0_reg cfg0;
    rand port_input_cfg_cfg1_reg cfg1;
    rand port_input_cfg_cfg2_reg cfg2;
    rand port_input_cfg_cfg3_reg cfg3;

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(port_input_cfg_reg_pkg::port_input_cfg_reg_block)

    // Constructor: new
    function new(string name = "port_input_cfg_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})


        cfg0 = port_input_cfg_cfg0_reg::type_id::create("cfg0", , get_full_name());
        cfg1 = port_input_cfg_cfg1_reg::type_id::create("cfg1", , get_full_name());
        cfg2 = port_input_cfg_cfg2_reg::type_id::create("cfg2", , get_full_name());
        cfg3 = port_input_cfg_cfg3_reg::type_id::create("cfg3", , get_full_name());

        cfg0.configure(this);
        cfg1.configure(this);
        cfg2.configure(this);
        cfg3.configure(this);

        cfg0.build();
        cfg1.build();
        cfg2.build();
        cfg3.build();

        // define default map
        default_map = create_map("port_input_cfg_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        this.default_map.add_reg(cfg0, 'h0, "RW");
        this.default_map.add_reg(cfg1, 'h1, "RW");
        this.default_map.add_reg(cfg2, 'h2, "RW");
        this.default_map.add_reg(cfg3, 'h3, "RW");

        // Recursively lock register model and build the address map to enable
        // uvm_reg_map::get_reg_by_offset() and uvm_reg_map::get_mem_by_offset() methods.
        // It is impossible to unlock a model.
        lock_model();
    endfunction


     // Function: set_per_instance_coverage
     // Enable or disable instance coverage, otherwise singleton coverage.
     virtual function void set_per_instance_coverage(bit per_inst, uvm_hier_e hier=UVM_HIER);
         this.cg_per_instance = per_inst;

        // Use UVM_CVR_ALL for hierarchical enabling.
        if(hier == UVM_HIER) begin
        end
     endfunction


    // Function: set_coverage
    // Override base function to create covergroups for all registers in this block.
    //
    // In order to enable hierarchical creation, use UVM_CVR_ALL.
    virtual function uvm_reg_cvr_t set_coverage(uvm_reg_cvr_t is_on);
        //void'(uvm_config_db#(bit)::get(null, get_full_name(), "cg_per_instance", cg_per_instance));
        set_coverage = super.set_coverage(is_on);
        cfg0.enable_coverage(is_on, this.cg_per_instance);
        cfg1.enable_coverage(is_on, this.cg_per_instance);
        cfg2.enable_coverage(is_on, this.cg_per_instance);
        cfg3.enable_coverage(is_on, this.cg_per_instance);
        // Use UVM_CVR_ALL for hierarchical enabling.
        if(is_on == UVM_CVR_ALL) begin
        end
        return set_coverage;
    endfunction


    // Function: fields2string
    // Stringify.
    virtual function string convert2string();
        string s = "";
        uvm_reg regs[$];
        uvm_reg_field fields[$];

        get_registers(regs, UVM_HIER);
        $swrite(s, "\nUVM_REG_BLOCK::%0s (%0d registers)\n", get_name, regs.size());
        foreach (regs[m]) begin
            $swrite(s, "%0s    %0s=0x%16h\n", s, regs[m].get_full_name, regs[m].get());
            // Getting the fields is optional might be too verbose
            //fields.delete();
            //regs[m].get_fields(fields);
            //foreach (fields[n]) begin
                //$swrite(s, "%0s        %0s=0x%0h\n", s, fields[n].get_full_name, fields[n].value);
            //end
        end
        return s;
    endfunction


    // Function: regs2update
    // Stringifying only regmodel registers that need updating. Useful after randomization.
    virtual function string regs2update();
        string s = "";
        uvm_reg regs[$];
        uvm_reg_field fields[$];

        get_registers(regs, UVM_HIER);
        $swrite(s, "\nRegisters requiring update in UVM_REG_BLOCK::%0s\n", get_name);
        foreach (regs[m]) begin
            if (regs[m].needs_update()) begin
                $swrite(s, "%0s    %0s=0x%16h\n", s, regs[m].get_full_name, regs[m].get());
                // Getting the fields is optional might be too verbose
                fields.delete();
                regs[m].get_fields(fields);
                foreach (fields[n]) begin
                    $swrite(s, "%0s        %0s=0x%0h\n", s, fields[n].get_full_name, fields[n].value);
                end
            end
        end
        return s;
    endfunction

endclass

endpackage