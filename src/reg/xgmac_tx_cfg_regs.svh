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
// Register definitions for xgmac_tx_cfg register block.
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
// Group: xgmac_tx_cfg
//---------------------------------------------------------

package xgmac_tx_cfg_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;

typedef class xgmac_tx_cfg_tx_config_reg_cover;

// Class: xgmac_tx_cfg_tx_config_reg
// Register xgmac_tx_cfg.tx_config: TX Configuration register
class xgmac_tx_cfg_tx_config_reg extends uvm_reg;

    // Variable: mtu
    // TX Maximum Transmit Unit (bytes) including Ethernet header and FCS. Default to 1518 bytes.  (not supported)
    rand uvm_reg_field mtu;
    // Variable: tx_fcs_insertion_disable
    // Prevent insertion of the FCS
    rand uvm_reg_field tx_fcs_insertion_disable;
    // Variable: tx_mac_client_preamble_enable
    // Allows the MAC client to pack/retrieve proprietary frame meta-data into/from a frame 7-byte Preamble/SFD
    rand uvm_reg_field tx_mac_client_preamble_enable;
    // Variable: tx_ipg
    // 
    rand uvm_reg_field tx_ipg;
    // Variable: tx_padding_disable
    // 
    rand uvm_reg_field tx_padding_disable;
    // Variable: tx_dic_diag_enable
    // Deficit Idle Count diagnostic enable  Allows to force the DIC process into either overflow or underflow state
    rand uvm_reg_field tx_dic_diag_enable;
    // Variable: tx_dic_diag_mode
    // 
    rand uvm_reg_field tx_dic_diag_mode;
    // Variable: tx_xgmii_diag_link_down
    // TX XGMII diagnostic link down  Allows to force a link down status when TX XGMII diagnostic mode is Enabled
    rand uvm_reg_field tx_xgmii_diag_link_down;
    // Variable: tx_xgmii_diag_mode
    // TX XGMII diagnostic mode  Allows the continuous generation of diagnostic characters / sequence ordered sets on the TX XGMII
    rand uvm_reg_field tx_xgmii_diag_mode;
    // Variable: tx_wan_mode_enable
    // TX WAN Mode enable
    rand uvm_reg_field tx_wan_mode_enable;
    // Variable: tx_flow_control_enable
    // TX Flow Control Enable
    rand uvm_reg_field tx_flow_control_enable;
    // Variable: tx_mac_enable
    // TX MAC enable
    rand uvm_reg_field tx_mac_enable;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_tx_cfg_tx_config_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_tx_cfg_tx_config_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_tx_cfg_reg_pkg::xgmac_tx_cfg_tx_config_reg)

    // Constructor: new
    function new(string name = "xgmac_tx_cfg_tx_config");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        mtu = uvm_reg_field::type_id::create("mtu", , get_full_name());
        tx_fcs_insertion_disable = uvm_reg_field::type_id::create("tx_fcs_insertion_disable", , get_full_name());
        tx_mac_client_preamble_enable = uvm_reg_field::type_id::create("tx_mac_client_preamble_enable", , get_full_name());
        tx_ipg = uvm_reg_field::type_id::create("tx_ipg", , get_full_name());
        tx_padding_disable = uvm_reg_field::type_id::create("tx_padding_disable", , get_full_name());
        tx_dic_diag_enable = uvm_reg_field::type_id::create("tx_dic_diag_enable", , get_full_name());
        tx_dic_diag_mode = uvm_reg_field::type_id::create("tx_dic_diag_mode", , get_full_name());
        tx_xgmii_diag_link_down = uvm_reg_field::type_id::create("tx_xgmii_diag_link_down", , get_full_name());
        tx_xgmii_diag_mode = uvm_reg_field::type_id::create("tx_xgmii_diag_mode", , get_full_name());
        tx_wan_mode_enable = uvm_reg_field::type_id::create("tx_wan_mode_enable", , get_full_name());
        tx_flow_control_enable = uvm_reg_field::type_id::create("tx_flow_control_enable", , get_full_name());
        tx_mac_enable = uvm_reg_field::type_id::create("tx_mac_enable", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        mtu.configure(this, 16, 16, "rw", 0, 'h5EE, 1, 1, 0);
        tx_fcs_insertion_disable.configure(this, 1, 11, "rw", 0, 'h0, 1, 1, 0);
        tx_mac_client_preamble_enable.configure(this, 1, 10, "rw", 0, 'h0, 1, 1, 0);
        tx_ipg.configure(this, 1, 9, "rw", 0, 'h0, 1, 1, 0);
        tx_padding_disable.configure(this, 1, 8, "rw", 0, 'h0, 1, 1, 0);
        tx_dic_diag_enable.configure(this, 1, 7, "rw", 0, 'h0, 1, 1, 0);
        tx_dic_diag_mode.configure(this, 1, 6, "rw", 0, 'h0, 1, 1, 0);
        tx_xgmii_diag_link_down.configure(this, 1, 5, "rw", 0, 'h0, 1, 1, 0);
        tx_xgmii_diag_mode.configure(this, 2, 3, "rw", 0, 'h0, 1, 1, 0);
        tx_wan_mode_enable.configure(this, 1, 2, "rw", 0, 'h0, 1, 1, 0);
        tx_flow_control_enable.configure(this, 1, 1, "rw", 0, 'h1, 1, 1, 0);
        tx_mac_enable.configure(this, 1, 0, "rw", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_tx_cfg_tx_config_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_tx_cfg_tx_config_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, mtu.get_name, mtu.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_fcs_insertion_disable.get_name, tx_fcs_insertion_disable.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_mac_client_preamble_enable.get_name, tx_mac_client_preamble_enable.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_ipg.get_name, tx_ipg.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_padding_disable.get_name, tx_padding_disable.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_dic_diag_enable.get_name, tx_dic_diag_enable.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_dic_diag_mode.get_name, tx_dic_diag_mode.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_xgmii_diag_link_down.get_name, tx_xgmii_diag_link_down.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_xgmii_diag_mode.get_name, tx_xgmii_diag_mode.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_wan_mode_enable.get_name, tx_wan_mode_enable.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_flow_control_enable.get_name, tx_flow_control_enable.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_mac_enable.get_name, tx_mac_enable.value);
        return s;
    endfunction

endclass


// Class: xgmac_tx_cfg_tx_config_reg_cover
// Register coverage object.
class xgmac_tx_cfg_tx_config_reg_cover extends uvm_object;

    static local xgmac_tx_cfg_tx_config_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_tx_cfg_tx_config_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        mtu_wr: coverpoint r.mtu.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        mtu_rd: coverpoint r.mtu.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        tx_fcs_insertion_disable_wr: coverpoint r.tx_fcs_insertion_disable.value iff (!is_read);
        tx_fcs_insertion_disable_rd: coverpoint r.tx_fcs_insertion_disable.value iff  (is_read);
        tx_mac_client_preamble_enable_wr: coverpoint r.tx_mac_client_preamble_enable.value iff (!is_read);
        tx_mac_client_preamble_enable_rd: coverpoint r.tx_mac_client_preamble_enable.value iff  (is_read);
        tx_ipg_wr: coverpoint r.tx_ipg.value iff (!is_read);
        tx_ipg_rd: coverpoint r.tx_ipg.value iff  (is_read);
        tx_padding_disable_wr: coverpoint r.tx_padding_disable.value iff (!is_read);
        tx_padding_disable_rd: coverpoint r.tx_padding_disable.value iff  (is_read);
        tx_dic_diag_enable_wr: coverpoint r.tx_dic_diag_enable.value iff (!is_read);
        tx_dic_diag_enable_rd: coverpoint r.tx_dic_diag_enable.value iff  (is_read);
        tx_dic_diag_mode_wr: coverpoint r.tx_dic_diag_mode.value iff (!is_read);
        tx_dic_diag_mode_rd: coverpoint r.tx_dic_diag_mode.value iff  (is_read);
        tx_xgmii_diag_link_down_wr: coverpoint r.tx_xgmii_diag_link_down.value iff (!is_read);
        tx_xgmii_diag_link_down_rd: coverpoint r.tx_xgmii_diag_link_down.value iff  (is_read);
        tx_xgmii_diag_mode_wr: coverpoint r.tx_xgmii_diag_mode.value iff (!is_read);
        tx_xgmii_diag_mode_rd: coverpoint r.tx_xgmii_diag_mode.value iff  (is_read);
        tx_wan_mode_enable_wr: coverpoint r.tx_wan_mode_enable.value iff (!is_read);
        tx_wan_mode_enable_rd: coverpoint r.tx_wan_mode_enable.value iff  (is_read);
        tx_flow_control_enable_wr: coverpoint r.tx_flow_control_enable.value iff (!is_read);
        tx_flow_control_enable_rd: coverpoint r.tx_flow_control_enable.value iff  (is_read);
        tx_mac_enable_wr: coverpoint r.tx_mac_enable.value iff (!is_read);
        tx_mac_enable_rd: coverpoint r.tx_mac_enable.value iff  (is_read);
    endgroup

    `uvm_object_utils(xgmac_tx_cfg_reg_pkg::xgmac_tx_cfg_tx_config_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_tx_cfg_tx_config_reg_cover");
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
    static function xgmac_tx_cfg_tx_config_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_tx_cfg_tx_config_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_tx_cfg_tx_config_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_tx_cfg_vlan_2nd_cfg_reg_cover;

// Class: xgmac_tx_cfg_vlan_2nd_cfg_reg
// Register xgmac_tx_cfg.vlan_2nd_cfg: TX Second VLAN Ethertype
class xgmac_tx_cfg_vlan_2nd_cfg_reg extends uvm_reg;

    // Variable: vlan_88a8_en
    // TX value of the second VLAN 0x88A8 enable.
    rand uvm_reg_field vlan_88a8_en;
    // Variable: vlan_9100_en
    // TX value of the second VLAN 0x9100 enable.
    rand uvm_reg_field vlan_9100_en;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_tx_cfg_vlan_2nd_cfg_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_tx_cfg_vlan_2nd_cfg_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_tx_cfg_reg_pkg::xgmac_tx_cfg_vlan_2nd_cfg_reg)

    // Constructor: new
    function new(string name = "xgmac_tx_cfg_vlan_2nd_cfg");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        vlan_88a8_en = uvm_reg_field::type_id::create("vlan_88a8_en", , get_full_name());
        vlan_9100_en = uvm_reg_field::type_id::create("vlan_9100_en", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        vlan_88a8_en.configure(this, 1, 18, "RW", 0, 'h0, 1, 1, 0);
        vlan_9100_en.configure(this, 1, 17, "RW", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_tx_cfg_vlan_2nd_cfg_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_tx_cfg_vlan_2nd_cfg_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, vlan_88a8_en.get_name, vlan_88a8_en.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, vlan_9100_en.get_name, vlan_9100_en.value);
        return s;
    endfunction

endclass


// Class: xgmac_tx_cfg_vlan_2nd_cfg_reg_cover
// Register coverage object.
class xgmac_tx_cfg_vlan_2nd_cfg_reg_cover extends uvm_object;

    static local xgmac_tx_cfg_vlan_2nd_cfg_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_tx_cfg_vlan_2nd_cfg_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        vlan_88a8_en_wr: coverpoint r.vlan_88a8_en.value iff (!is_read);
        vlan_88a8_en_rd: coverpoint r.vlan_88a8_en.value iff  (is_read);
        vlan_9100_en_wr: coverpoint r.vlan_9100_en.value iff (!is_read);
        vlan_9100_en_rd: coverpoint r.vlan_9100_en.value iff  (is_read);
    endgroup

    `uvm_object_utils(xgmac_tx_cfg_reg_pkg::xgmac_tx_cfg_vlan_2nd_cfg_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_tx_cfg_vlan_2nd_cfg_reg_cover");
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
    static function xgmac_tx_cfg_vlan_2nd_cfg_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_tx_cfg_vlan_2nd_cfg_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_tx_cfg_vlan_2nd_cfg_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_tx_cfg_tx_large_threshold_reg_cover;

// Class: xgmac_tx_cfg_tx_large_threshold_reg
// Register xgmac_tx_cfg.tx_large_threshold: TX Large frame size Threshold
class xgmac_tx_cfg_tx_large_threshold_reg extends uvm_reg;

    // Variable: tx_large_threshold
    // TX Frame size to compare against (greater or equal) and increment dedicated statistics counter.
    rand uvm_reg_field tx_large_threshold;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_tx_cfg_tx_large_threshold_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_tx_cfg_tx_large_threshold_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_tx_cfg_reg_pkg::xgmac_tx_cfg_tx_large_threshold_reg)

    // Constructor: new
    function new(string name = "xgmac_tx_cfg_tx_large_threshold");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        tx_large_threshold = uvm_reg_field::type_id::create("tx_large_threshold", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        tx_large_threshold.configure(this, 16, 0, "rw", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_tx_cfg_tx_large_threshold_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_tx_cfg_tx_large_threshold_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_large_threshold.get_name, tx_large_threshold.value);
        return s;
    endfunction

endclass


// Class: xgmac_tx_cfg_tx_large_threshold_reg_cover
// Register coverage object.
class xgmac_tx_cfg_tx_large_threshold_reg_cover extends uvm_object;

    static local xgmac_tx_cfg_tx_large_threshold_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_tx_cfg_tx_large_threshold_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        tx_large_threshold_wr: coverpoint r.tx_large_threshold.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        tx_large_threshold_rd: coverpoint r.tx_large_threshold.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_tx_cfg_reg_pkg::xgmac_tx_cfg_tx_large_threshold_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_tx_cfg_tx_large_threshold_reg_cover");
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
    static function xgmac_tx_cfg_tx_large_threshold_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_tx_cfg_tx_large_threshold_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_tx_cfg_tx_large_threshold_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_tx_cfg_reserved_reg_cover;

// Class: xgmac_tx_cfg_reserved_reg
// Register xgmac_tx_cfg.reserved: Reserved for future use
class xgmac_tx_cfg_reserved_reg extends uvm_reg;


    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_tx_cfg_reserved_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_tx_cfg_reserved_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_tx_cfg_reg_pkg::xgmac_tx_cfg_reserved_reg)

    // Constructor: new
    function new(string name = "xgmac_tx_cfg_reserved");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})


        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
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
                cg = xgmac_tx_cfg_reserved_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_tx_cfg_reserved_reg_cover::get();
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
        return s;
    endfunction

endclass


// Class: xgmac_tx_cfg_reserved_reg_cover
// Register coverage object.
class xgmac_tx_cfg_reserved_reg_cover extends uvm_object;

    static local xgmac_tx_cfg_reserved_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_tx_cfg_reserved_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
    endgroup

    `uvm_object_utils(xgmac_tx_cfg_reg_pkg::xgmac_tx_cfg_reserved_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_tx_cfg_reserved_reg_cover");
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
    static function xgmac_tx_cfg_reserved_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_tx_cfg_reserved_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_tx_cfg_reserved_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_tx_cfg_tx_mac_source_address_lo_reg_cover;

// Class: xgmac_tx_cfg_tx_mac_source_address_lo_reg
// Register xgmac_tx_cfg.tx_mac_source_address_lo: TX MAC Source Address LO
class xgmac_tx_cfg_tx_mac_source_address_lo_reg extends uvm_reg;

    // Variable: tx_mac_source_address_lo
    // TX MAC Source Address lower 32 bits [31:0] of the 48-bit MAC Address to be used as Source Address of TX Pause frames.
    rand uvm_reg_field tx_mac_source_address_lo;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_tx_cfg_tx_mac_source_address_lo_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_tx_cfg_tx_mac_source_address_lo_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_tx_cfg_reg_pkg::xgmac_tx_cfg_tx_mac_source_address_lo_reg)

    // Constructor: new
    function new(string name = "xgmac_tx_cfg_tx_mac_source_address_lo");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        tx_mac_source_address_lo = uvm_reg_field::type_id::create("tx_mac_source_address_lo", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        tx_mac_source_address_lo.configure(this, 32, 0, "rw", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_tx_cfg_tx_mac_source_address_lo_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_tx_cfg_tx_mac_source_address_lo_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_mac_source_address_lo.get_name, tx_mac_source_address_lo.value);
        return s;
    endfunction

endclass


// Class: xgmac_tx_cfg_tx_mac_source_address_lo_reg_cover
// Register coverage object.
class xgmac_tx_cfg_tx_mac_source_address_lo_reg_cover extends uvm_object;

    static local xgmac_tx_cfg_tx_mac_source_address_lo_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_tx_cfg_tx_mac_source_address_lo_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        tx_mac_source_address_lo_wr: coverpoint r.tx_mac_source_address_lo.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        tx_mac_source_address_lo_rd: coverpoint r.tx_mac_source_address_lo.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_tx_cfg_reg_pkg::xgmac_tx_cfg_tx_mac_source_address_lo_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_tx_cfg_tx_mac_source_address_lo_reg_cover");
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
    static function xgmac_tx_cfg_tx_mac_source_address_lo_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_tx_cfg_tx_mac_source_address_lo_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_tx_cfg_tx_mac_source_address_lo_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_tx_cfg_tx_mac_source_address_hi_reg_cover;

// Class: xgmac_tx_cfg_tx_mac_source_address_hi_reg
// Register xgmac_tx_cfg.tx_mac_source_address_hi: TX MAC Source Address HI
class xgmac_tx_cfg_tx_mac_source_address_hi_reg extends uvm_reg;

    // Variable: tx_mac_source_address_hi
    // TX MAC Source Address upper 16 bits [47:32] of the 48-bit MAC Address to be used as Source Address of TX Pause frames.
    rand uvm_reg_field tx_mac_source_address_hi;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_tx_cfg_tx_mac_source_address_hi_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_tx_cfg_tx_mac_source_address_hi_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_tx_cfg_reg_pkg::xgmac_tx_cfg_tx_mac_source_address_hi_reg)

    // Constructor: new
    function new(string name = "xgmac_tx_cfg_tx_mac_source_address_hi");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        tx_mac_source_address_hi = uvm_reg_field::type_id::create("tx_mac_source_address_hi", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        tx_mac_source_address_hi.configure(this, 16, 0, "rw", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_tx_cfg_tx_mac_source_address_hi_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_tx_cfg_tx_mac_source_address_hi_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_mac_source_address_hi.get_name, tx_mac_source_address_hi.value);
        return s;
    endfunction

endclass


// Class: xgmac_tx_cfg_tx_mac_source_address_hi_reg_cover
// Register coverage object.
class xgmac_tx_cfg_tx_mac_source_address_hi_reg_cover extends uvm_object;

    static local xgmac_tx_cfg_tx_mac_source_address_hi_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_tx_cfg_tx_mac_source_address_hi_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        tx_mac_source_address_hi_wr: coverpoint r.tx_mac_source_address_hi.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        tx_mac_source_address_hi_rd: coverpoint r.tx_mac_source_address_hi.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_tx_cfg_reg_pkg::xgmac_tx_cfg_tx_mac_source_address_hi_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_tx_cfg_tx_mac_source_address_hi_reg_cover");
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
    static function xgmac_tx_cfg_tx_mac_source_address_hi_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_tx_cfg_tx_mac_source_address_hi_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_tx_cfg_tx_mac_source_address_hi_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass





// Class: xgmac_tx_cfg_reg_block
// Register Block .xgmac_tx_cfg: 
class xgmac_tx_cfg_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand xgmac_tx_cfg_tx_config_reg tx_config;
    rand xgmac_tx_cfg_vlan_2nd_cfg_reg vlan_2nd_cfg;
    rand xgmac_tx_cfg_tx_large_threshold_reg tx_large_threshold;
    rand xgmac_tx_cfg_reserved_reg reserved;
    rand xgmac_tx_cfg_tx_mac_source_address_lo_reg tx_mac_source_address_lo;
    rand xgmac_tx_cfg_tx_mac_source_address_hi_reg tx_mac_source_address_hi;

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(xgmac_tx_cfg_reg_pkg::xgmac_tx_cfg_reg_block)

    // Constructor: new
    function new(string name = "xgmac_tx_cfg_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})


        tx_config = xgmac_tx_cfg_tx_config_reg::type_id::create("tx_config", , get_full_name());
        vlan_2nd_cfg = xgmac_tx_cfg_vlan_2nd_cfg_reg::type_id::create("vlan_2nd_cfg", , get_full_name());
        tx_large_threshold = xgmac_tx_cfg_tx_large_threshold_reg::type_id::create("tx_large_threshold", , get_full_name());
        reserved = xgmac_tx_cfg_reserved_reg::type_id::create("reserved", , get_full_name());
        tx_mac_source_address_lo = xgmac_tx_cfg_tx_mac_source_address_lo_reg::type_id::create("tx_mac_source_address_lo", , get_full_name());
        tx_mac_source_address_hi = xgmac_tx_cfg_tx_mac_source_address_hi_reg::type_id::create("tx_mac_source_address_hi", , get_full_name());

        tx_config.configure(this);
        vlan_2nd_cfg.configure(this);
        tx_large_threshold.configure(this);
        reserved.configure(this);
        tx_mac_source_address_lo.configure(this);
        tx_mac_source_address_hi.configure(this);

        tx_config.build();
        vlan_2nd_cfg.build();
        tx_large_threshold.build();
        reserved.build();
        tx_mac_source_address_lo.build();
        tx_mac_source_address_hi.build();

        // define default map
        default_map = create_map("xgmac_tx_cfg_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        this.default_map.add_reg(tx_config, 'h0, "RW");
        this.default_map.add_reg(vlan_2nd_cfg, 'h1, "RW");
        this.default_map.add_reg(tx_large_threshold, 'h2, "RW");
        this.default_map.add_reg(reserved, 'h3, "RW");
        this.default_map.add_reg(tx_mac_source_address_lo, 'h4, "RW");
        this.default_map.add_reg(tx_mac_source_address_hi, 'h5, "RW");

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
        tx_config.enable_coverage(is_on, this.cg_per_instance);
        vlan_2nd_cfg.enable_coverage(is_on, this.cg_per_instance);
        tx_large_threshold.enable_coverage(is_on, this.cg_per_instance);
        reserved.enable_coverage(is_on, this.cg_per_instance);
        tx_mac_source_address_lo.enable_coverage(is_on, this.cg_per_instance);
        tx_mac_source_address_hi.enable_coverage(is_on, this.cg_per_instance);
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