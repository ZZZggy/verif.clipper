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
// Register definitions for xgmac_rx_cfg register block.
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
// Group: xgmac_rx_cfg
//---------------------------------------------------------

package xgmac_rx_cfg_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;

typedef class xgmac_rx_cfg_rx_config_reg_cover;

// Class: xgmac_rx_cfg_rx_config_reg
// Register xgmac_rx_cfg.rx_config: RX Configuration register
class xgmac_rx_cfg_rx_config_reg extends uvm_reg;

    // Variable: mru
    // RX Maximum Receive Unit (bytes) including Ethernet header and FCS. Default to 1518 bytes.
    rand uvm_reg_field mru;
    // Variable: rx_keep_fcs
    // Keep the FCS appended at the end of the frame 
    rand uvm_reg_field rx_keep_fcs;
    // Variable: rx_mac_client_preamble_enable
    // Allows the MAC client to pack/retrieve proprietary frame meta-data into/from a frame 7-byte Preamble/SFD
    rand uvm_reg_field rx_mac_client_preamble_enable;
    // Variable: rx_ieee_length_enforcement_enable
    // 
    rand uvm_reg_field rx_ieee_length_enforcement_enable;
    // Variable: rx_ieee_preamble_enforcement_enable
    // 
    rand uvm_reg_field rx_ieee_preamble_enforcement_enable;
    // Variable: rx_promiscuous_mode_enable
    // RX promiscuous mode enable
    rand uvm_reg_field rx_promiscuous_mode_enable;
    // Variable: rx_pause_forwarding_enable
    // RX Forward pause frames to the client application
    rand uvm_reg_field rx_pause_forwarding_enable;
    // Variable: rx_flow_control_enable
    // RX processes pause frames
    rand uvm_reg_field rx_flow_control_enable;
    // Variable: rx_mac_enable
    // RX MAC Enable
    rand uvm_reg_field rx_mac_enable;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_cfg_rx_config_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_cfg_rx_config_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_rx_config_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_cfg_rx_config");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        mru = uvm_reg_field::type_id::create("mru", , get_full_name());
        rx_keep_fcs = uvm_reg_field::type_id::create("rx_keep_fcs", , get_full_name());
        rx_mac_client_preamble_enable = uvm_reg_field::type_id::create("rx_mac_client_preamble_enable", , get_full_name());
        rx_ieee_length_enforcement_enable = uvm_reg_field::type_id::create("rx_ieee_length_enforcement_enable", , get_full_name());
        rx_ieee_preamble_enforcement_enable = uvm_reg_field::type_id::create("rx_ieee_preamble_enforcement_enable", , get_full_name());
        rx_promiscuous_mode_enable = uvm_reg_field::type_id::create("rx_promiscuous_mode_enable", , get_full_name());
        rx_pause_forwarding_enable = uvm_reg_field::type_id::create("rx_pause_forwarding_enable", , get_full_name());
        rx_flow_control_enable = uvm_reg_field::type_id::create("rx_flow_control_enable", , get_full_name());
        rx_mac_enable = uvm_reg_field::type_id::create("rx_mac_enable", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        mru.configure(this, 16, 16, "rw", 0, 'h5EE, 1, 1, 0);
        rx_keep_fcs.configure(this, 1, 7, "rw", 0, 'h0, 1, 1, 0);
        rx_mac_client_preamble_enable.configure(this, 1, 6, "rw", 0, 'h0, 1, 1, 0);
        rx_ieee_length_enforcement_enable.configure(this, 1, 5, "rw", 0, 'h0, 1, 1, 0);
        rx_ieee_preamble_enforcement_enable.configure(this, 1, 4, "rw", 0, 'h1, 1, 1, 0);
        rx_promiscuous_mode_enable.configure(this, 1, 3, "rw", 0, 'h0, 1, 1, 0);
        rx_pause_forwarding_enable.configure(this, 1, 2, "rw", 0, 'h0, 1, 1, 0);
        rx_flow_control_enable.configure(this, 1, 1, "rw", 0, 'h1, 1, 1, 0);
        rx_mac_enable.configure(this, 1, 0, "rw", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_cfg_rx_config_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_cfg_rx_config_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, mru.get_name, mru.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_keep_fcs.get_name, rx_keep_fcs.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_mac_client_preamble_enable.get_name, rx_mac_client_preamble_enable.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_ieee_length_enforcement_enable.get_name, rx_ieee_length_enforcement_enable.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_ieee_preamble_enforcement_enable.get_name, rx_ieee_preamble_enforcement_enable.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_promiscuous_mode_enable.get_name, rx_promiscuous_mode_enable.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_pause_forwarding_enable.get_name, rx_pause_forwarding_enable.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_flow_control_enable.get_name, rx_flow_control_enable.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_mac_enable.get_name, rx_mac_enable.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_cfg_rx_config_reg_cover
// Register coverage object.
class xgmac_rx_cfg_rx_config_reg_cover extends uvm_object;

    static local xgmac_rx_cfg_rx_config_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_cfg_rx_config_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        mru_wr: coverpoint r.mru.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        mru_rd: coverpoint r.mru.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        rx_keep_fcs_wr: coverpoint r.rx_keep_fcs.value iff (!is_read);
        rx_keep_fcs_rd: coverpoint r.rx_keep_fcs.value iff  (is_read);
        rx_mac_client_preamble_enable_wr: coverpoint r.rx_mac_client_preamble_enable.value iff (!is_read);
        rx_mac_client_preamble_enable_rd: coverpoint r.rx_mac_client_preamble_enable.value iff  (is_read);
        rx_ieee_length_enforcement_enable_wr: coverpoint r.rx_ieee_length_enforcement_enable.value iff (!is_read);
        rx_ieee_length_enforcement_enable_rd: coverpoint r.rx_ieee_length_enforcement_enable.value iff  (is_read);
        rx_ieee_preamble_enforcement_enable_wr: coverpoint r.rx_ieee_preamble_enforcement_enable.value iff (!is_read);
        rx_ieee_preamble_enforcement_enable_rd: coverpoint r.rx_ieee_preamble_enforcement_enable.value iff  (is_read);
        rx_promiscuous_mode_enable_wr: coverpoint r.rx_promiscuous_mode_enable.value iff (!is_read);
        rx_promiscuous_mode_enable_rd: coverpoint r.rx_promiscuous_mode_enable.value iff  (is_read);
        rx_pause_forwarding_enable_wr: coverpoint r.rx_pause_forwarding_enable.value iff (!is_read);
        rx_pause_forwarding_enable_rd: coverpoint r.rx_pause_forwarding_enable.value iff  (is_read);
        rx_flow_control_enable_wr: coverpoint r.rx_flow_control_enable.value iff (!is_read);
        rx_flow_control_enable_rd: coverpoint r.rx_flow_control_enable.value iff  (is_read);
        rx_mac_enable_wr: coverpoint r.rx_mac_enable.value iff (!is_read);
        rx_mac_enable_rd: coverpoint r.rx_mac_enable.value iff  (is_read);
    endgroup

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_rx_config_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_cfg_rx_config_reg_cover");
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
    static function xgmac_rx_cfg_rx_config_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_cfg_rx_config_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_cfg_rx_config_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_cfg_vlan_2nd_cfg_reg_cover;

// Class: xgmac_rx_cfg_vlan_2nd_cfg_reg
// Register xgmac_rx_cfg.vlan_2nd_cfg: RX Second VLAN Ethertype coniguration
class xgmac_rx_cfg_vlan_2nd_cfg_reg extends uvm_reg;

    // Variable: vlan_88a8_en
    // RX value of the second VLAN 0x88A8 enable.
    rand uvm_reg_field vlan_88a8_en;
    // Variable: vlan_9100_en
    // RX value of the second VLAN 0x9100 enable.
    rand uvm_reg_field vlan_9100_en;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_cfg_vlan_2nd_cfg_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_cfg_vlan_2nd_cfg_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_vlan_2nd_cfg_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_cfg_vlan_2nd_cfg");
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
                cg = xgmac_rx_cfg_vlan_2nd_cfg_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_cfg_vlan_2nd_cfg_reg_cover::get();
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


// Class: xgmac_rx_cfg_vlan_2nd_cfg_reg_cover
// Register coverage object.
class xgmac_rx_cfg_vlan_2nd_cfg_reg_cover extends uvm_object;

    static local xgmac_rx_cfg_vlan_2nd_cfg_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_cfg_vlan_2nd_cfg_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        vlan_88a8_en_wr: coverpoint r.vlan_88a8_en.value iff (!is_read);
        vlan_88a8_en_rd: coverpoint r.vlan_88a8_en.value iff  (is_read);
        vlan_9100_en_wr: coverpoint r.vlan_9100_en.value iff (!is_read);
        vlan_9100_en_rd: coverpoint r.vlan_9100_en.value iff  (is_read);
    endgroup

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_vlan_2nd_cfg_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_cfg_vlan_2nd_cfg_reg_cover");
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
    static function xgmac_rx_cfg_vlan_2nd_cfg_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_cfg_vlan_2nd_cfg_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_cfg_vlan_2nd_cfg_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_cfg_rx_large_threshold_reg_cover;

// Class: xgmac_rx_cfg_rx_large_threshold_reg
// Register xgmac_rx_cfg.rx_large_threshold: RX Large frame size Threshold
class xgmac_rx_cfg_rx_large_threshold_reg extends uvm_reg;

    // Variable: rx_large_threshold
    // RX Frame size to compare against (greater or equal) and increment dedicated statistics counter.
    rand uvm_reg_field rx_large_threshold;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_cfg_rx_large_threshold_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_cfg_rx_large_threshold_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_rx_large_threshold_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_cfg_rx_large_threshold");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_large_threshold = uvm_reg_field::type_id::create("rx_large_threshold", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_large_threshold.configure(this, 16, 0, "rw", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_cfg_rx_large_threshold_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_cfg_rx_large_threshold_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_large_threshold.get_name, rx_large_threshold.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_cfg_rx_large_threshold_reg_cover
// Register coverage object.
class xgmac_rx_cfg_rx_large_threshold_reg_cover extends uvm_object;

    static local xgmac_rx_cfg_rx_large_threshold_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_cfg_rx_large_threshold_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_large_threshold_wr: coverpoint r.rx_large_threshold.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_large_threshold_rd: coverpoint r.rx_large_threshold.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_rx_large_threshold_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_cfg_rx_large_threshold_reg_cover");
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
    static function xgmac_rx_cfg_rx_large_threshold_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_cfg_rx_large_threshold_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_cfg_rx_large_threshold_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_cfg_rx_mac_address_0_lo_reg_cover;

// Class: xgmac_rx_cfg_rx_mac_address_0_lo_reg
// Register xgmac_rx_cfg.rx_mac_address_0_lo: RX MAC Address 0 LO
class xgmac_rx_cfg_rx_mac_address_0_lo_reg extends uvm_reg;

    // Variable: rx_mac_address_0_lo
    // RX MAC Address 0 lower 32 bits [31:0] of the 48-bit MAC Address used in the non-promiscuous mode RX filtering.
    rand uvm_reg_field rx_mac_address_0_lo;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_cfg_rx_mac_address_0_lo_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_cfg_rx_mac_address_0_lo_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_rx_mac_address_0_lo_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_cfg_rx_mac_address_0_lo");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_mac_address_0_lo = uvm_reg_field::type_id::create("rx_mac_address_0_lo", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_mac_address_0_lo.configure(this, 32, 0, "rw", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_cfg_rx_mac_address_0_lo_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_cfg_rx_mac_address_0_lo_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_mac_address_0_lo.get_name, rx_mac_address_0_lo.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_cfg_rx_mac_address_0_lo_reg_cover
// Register coverage object.
class xgmac_rx_cfg_rx_mac_address_0_lo_reg_cover extends uvm_object;

    static local xgmac_rx_cfg_rx_mac_address_0_lo_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_cfg_rx_mac_address_0_lo_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_mac_address_0_lo_wr: coverpoint r.rx_mac_address_0_lo.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_mac_address_0_lo_rd: coverpoint r.rx_mac_address_0_lo.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_rx_mac_address_0_lo_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_cfg_rx_mac_address_0_lo_reg_cover");
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
    static function xgmac_rx_cfg_rx_mac_address_0_lo_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_cfg_rx_mac_address_0_lo_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_cfg_rx_mac_address_0_lo_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_cfg_rx_mac_address_0_hi_reg_cover;

// Class: xgmac_rx_cfg_rx_mac_address_0_hi_reg
// Register xgmac_rx_cfg.rx_mac_address_0_hi: RX MAC Address 0 HI
class xgmac_rx_cfg_rx_mac_address_0_hi_reg extends uvm_reg;

    // Variable: rx_mac_address_0_hi
    // RX MAC Address 0 upper 16 bits [47:32] of the 48-bit MAC Address used in the non-promiscuous mode RX filtering.
    rand uvm_reg_field rx_mac_address_0_hi;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_cfg_rx_mac_address_0_hi_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_cfg_rx_mac_address_0_hi_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_rx_mac_address_0_hi_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_cfg_rx_mac_address_0_hi");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_mac_address_0_hi = uvm_reg_field::type_id::create("rx_mac_address_0_hi", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_mac_address_0_hi.configure(this, 16, 0, "rw", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_cfg_rx_mac_address_0_hi_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_cfg_rx_mac_address_0_hi_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_mac_address_0_hi.get_name, rx_mac_address_0_hi.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_cfg_rx_mac_address_0_hi_reg_cover
// Register coverage object.
class xgmac_rx_cfg_rx_mac_address_0_hi_reg_cover extends uvm_object;

    static local xgmac_rx_cfg_rx_mac_address_0_hi_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_cfg_rx_mac_address_0_hi_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_mac_address_0_hi_wr: coverpoint r.rx_mac_address_0_hi.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_mac_address_0_hi_rd: coverpoint r.rx_mac_address_0_hi.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_rx_mac_address_0_hi_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_cfg_rx_mac_address_0_hi_reg_cover");
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
    static function xgmac_rx_cfg_rx_mac_address_0_hi_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_cfg_rx_mac_address_0_hi_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_cfg_rx_mac_address_0_hi_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_cfg_rx_mac_address_1_lo_reg_cover;

// Class: xgmac_rx_cfg_rx_mac_address_1_lo_reg
// Register xgmac_rx_cfg.rx_mac_address_1_lo: RX MAC Address 1 LO
class xgmac_rx_cfg_rx_mac_address_1_lo_reg extends uvm_reg;

    // Variable: rx_mac_address_1_lo
    // RX MAC Address 1 lower 32 bits [31:0] of the 48-bit MAC Address used in the non-promiscuous mode RX filtering.
    rand uvm_reg_field rx_mac_address_1_lo;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_cfg_rx_mac_address_1_lo_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_cfg_rx_mac_address_1_lo_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_rx_mac_address_1_lo_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_cfg_rx_mac_address_1_lo");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_mac_address_1_lo = uvm_reg_field::type_id::create("rx_mac_address_1_lo", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_mac_address_1_lo.configure(this, 32, 0, "rw", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_cfg_rx_mac_address_1_lo_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_cfg_rx_mac_address_1_lo_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_mac_address_1_lo.get_name, rx_mac_address_1_lo.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_cfg_rx_mac_address_1_lo_reg_cover
// Register coverage object.
class xgmac_rx_cfg_rx_mac_address_1_lo_reg_cover extends uvm_object;

    static local xgmac_rx_cfg_rx_mac_address_1_lo_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_cfg_rx_mac_address_1_lo_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_mac_address_1_lo_wr: coverpoint r.rx_mac_address_1_lo.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_mac_address_1_lo_rd: coverpoint r.rx_mac_address_1_lo.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_rx_mac_address_1_lo_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_cfg_rx_mac_address_1_lo_reg_cover");
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
    static function xgmac_rx_cfg_rx_mac_address_1_lo_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_cfg_rx_mac_address_1_lo_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_cfg_rx_mac_address_1_lo_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_cfg_rx_mac_address_1_hi_reg_cover;

// Class: xgmac_rx_cfg_rx_mac_address_1_hi_reg
// Register xgmac_rx_cfg.rx_mac_address_1_hi: RX MAC Address 1 HI
class xgmac_rx_cfg_rx_mac_address_1_hi_reg extends uvm_reg;

    // Variable: rx_mac_address_1_hi
    // RX MAC Address 1 upper 16 bits [47:32] of the 48-bit MAC Address used in the non-promiscuous mode RX filtering.
    rand uvm_reg_field rx_mac_address_1_hi;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_cfg_rx_mac_address_1_hi_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_cfg_rx_mac_address_1_hi_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_rx_mac_address_1_hi_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_cfg_rx_mac_address_1_hi");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_mac_address_1_hi = uvm_reg_field::type_id::create("rx_mac_address_1_hi", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_mac_address_1_hi.configure(this, 16, 0, "rw", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_cfg_rx_mac_address_1_hi_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_cfg_rx_mac_address_1_hi_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_mac_address_1_hi.get_name, rx_mac_address_1_hi.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_cfg_rx_mac_address_1_hi_reg_cover
// Register coverage object.
class xgmac_rx_cfg_rx_mac_address_1_hi_reg_cover extends uvm_object;

    static local xgmac_rx_cfg_rx_mac_address_1_hi_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_cfg_rx_mac_address_1_hi_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_mac_address_1_hi_wr: coverpoint r.rx_mac_address_1_hi.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_mac_address_1_hi_rd: coverpoint r.rx_mac_address_1_hi.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_rx_mac_address_1_hi_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_cfg_rx_mac_address_1_hi_reg_cover");
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
    static function xgmac_rx_cfg_rx_mac_address_1_hi_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_cfg_rx_mac_address_1_hi_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_cfg_rx_mac_address_1_hi_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_cfg_rx_mac_address_2_lo_reg_cover;

// Class: xgmac_rx_cfg_rx_mac_address_2_lo_reg
// Register xgmac_rx_cfg.rx_mac_address_2_lo: RX MAC Address 2 LO
class xgmac_rx_cfg_rx_mac_address_2_lo_reg extends uvm_reg;

    // Variable: rx_mac_address_2_lo
    // RX MAC Address 2 lower 32 bits [31:0] of the 48-bit MAC Address used in the non-promiscuous mode RX filtering.
    rand uvm_reg_field rx_mac_address_2_lo;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_cfg_rx_mac_address_2_lo_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_cfg_rx_mac_address_2_lo_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_rx_mac_address_2_lo_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_cfg_rx_mac_address_2_lo");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_mac_address_2_lo = uvm_reg_field::type_id::create("rx_mac_address_2_lo", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_mac_address_2_lo.configure(this, 32, 0, "rw", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_cfg_rx_mac_address_2_lo_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_cfg_rx_mac_address_2_lo_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_mac_address_2_lo.get_name, rx_mac_address_2_lo.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_cfg_rx_mac_address_2_lo_reg_cover
// Register coverage object.
class xgmac_rx_cfg_rx_mac_address_2_lo_reg_cover extends uvm_object;

    static local xgmac_rx_cfg_rx_mac_address_2_lo_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_cfg_rx_mac_address_2_lo_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_mac_address_2_lo_wr: coverpoint r.rx_mac_address_2_lo.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_mac_address_2_lo_rd: coverpoint r.rx_mac_address_2_lo.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_rx_mac_address_2_lo_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_cfg_rx_mac_address_2_lo_reg_cover");
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
    static function xgmac_rx_cfg_rx_mac_address_2_lo_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_cfg_rx_mac_address_2_lo_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_cfg_rx_mac_address_2_lo_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_cfg_rx_mac_address_2_hi_reg_cover;

// Class: xgmac_rx_cfg_rx_mac_address_2_hi_reg
// Register xgmac_rx_cfg.rx_mac_address_2_hi: RX MAC Address 2 HI
class xgmac_rx_cfg_rx_mac_address_2_hi_reg extends uvm_reg;

    // Variable: rx_mac_address_2_hi
    // RX MAC Address 2 upper 16 bits [47:32] of the 48-bit MAC Address used in the non-promiscuous mode RX filtering.
    rand uvm_reg_field rx_mac_address_2_hi;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_cfg_rx_mac_address_2_hi_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_cfg_rx_mac_address_2_hi_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_rx_mac_address_2_hi_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_cfg_rx_mac_address_2_hi");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_mac_address_2_hi = uvm_reg_field::type_id::create("rx_mac_address_2_hi", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_mac_address_2_hi.configure(this, 16, 0, "rw", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_cfg_rx_mac_address_2_hi_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_cfg_rx_mac_address_2_hi_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_mac_address_2_hi.get_name, rx_mac_address_2_hi.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_cfg_rx_mac_address_2_hi_reg_cover
// Register coverage object.
class xgmac_rx_cfg_rx_mac_address_2_hi_reg_cover extends uvm_object;

    static local xgmac_rx_cfg_rx_mac_address_2_hi_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_cfg_rx_mac_address_2_hi_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_mac_address_2_hi_wr: coverpoint r.rx_mac_address_2_hi.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_mac_address_2_hi_rd: coverpoint r.rx_mac_address_2_hi.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_rx_mac_address_2_hi_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_cfg_rx_mac_address_2_hi_reg_cover");
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
    static function xgmac_rx_cfg_rx_mac_address_2_hi_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_cfg_rx_mac_address_2_hi_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_cfg_rx_mac_address_2_hi_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_cfg_rx_mac_address_3_lo_reg_cover;

// Class: xgmac_rx_cfg_rx_mac_address_3_lo_reg
// Register xgmac_rx_cfg.rx_mac_address_3_lo: RX MAC Address 3 LO
class xgmac_rx_cfg_rx_mac_address_3_lo_reg extends uvm_reg;

    // Variable: rx_mac_address_3_lo
    // RX MAC Address 3 lower 32 bits [31:0] of the 48-bit MAC Address used in the non-promiscuous mode RX filtering.
    rand uvm_reg_field rx_mac_address_3_lo;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_cfg_rx_mac_address_3_lo_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_cfg_rx_mac_address_3_lo_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_rx_mac_address_3_lo_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_cfg_rx_mac_address_3_lo");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_mac_address_3_lo = uvm_reg_field::type_id::create("rx_mac_address_3_lo", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_mac_address_3_lo.configure(this, 32, 0, "rw", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_cfg_rx_mac_address_3_lo_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_cfg_rx_mac_address_3_lo_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_mac_address_3_lo.get_name, rx_mac_address_3_lo.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_cfg_rx_mac_address_3_lo_reg_cover
// Register coverage object.
class xgmac_rx_cfg_rx_mac_address_3_lo_reg_cover extends uvm_object;

    static local xgmac_rx_cfg_rx_mac_address_3_lo_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_cfg_rx_mac_address_3_lo_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_mac_address_3_lo_wr: coverpoint r.rx_mac_address_3_lo.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_mac_address_3_lo_rd: coverpoint r.rx_mac_address_3_lo.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_rx_mac_address_3_lo_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_cfg_rx_mac_address_3_lo_reg_cover");
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
    static function xgmac_rx_cfg_rx_mac_address_3_lo_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_cfg_rx_mac_address_3_lo_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_cfg_rx_mac_address_3_lo_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_cfg_rx_mac_address_3_hi_reg_cover;

// Class: xgmac_rx_cfg_rx_mac_address_3_hi_reg
// Register xgmac_rx_cfg.rx_mac_address_3_hi: RX MAC Address 3 HI
class xgmac_rx_cfg_rx_mac_address_3_hi_reg extends uvm_reg;

    // Variable: rx_mac_address_3_hi
    // RX MAC Address 3 upper 16 bits [47:32] of the 48-bit MAC Address used in the non-promiscuous mode RX filtering.
    rand uvm_reg_field rx_mac_address_3_hi;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_cfg_rx_mac_address_3_hi_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_cfg_rx_mac_address_3_hi_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_rx_mac_address_3_hi_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_cfg_rx_mac_address_3_hi");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_mac_address_3_hi = uvm_reg_field::type_id::create("rx_mac_address_3_hi", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_mac_address_3_hi.configure(this, 16, 0, "rw", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_cfg_rx_mac_address_3_hi_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_cfg_rx_mac_address_3_hi_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_mac_address_3_hi.get_name, rx_mac_address_3_hi.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_cfg_rx_mac_address_3_hi_reg_cover
// Register coverage object.
class xgmac_rx_cfg_rx_mac_address_3_hi_reg_cover extends uvm_object;

    static local xgmac_rx_cfg_rx_mac_address_3_hi_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_cfg_rx_mac_address_3_hi_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_mac_address_3_hi_wr: coverpoint r.rx_mac_address_3_hi.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_mac_address_3_hi_rd: coverpoint r.rx_mac_address_3_hi.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_rx_mac_address_3_hi_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_cfg_rx_mac_address_3_hi_reg_cover");
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
    static function xgmac_rx_cfg_rx_mac_address_3_hi_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_cfg_rx_mac_address_3_hi_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_cfg_rx_mac_address_3_hi_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_cfg_rx_mac_address_4_lo_reg_cover;

// Class: xgmac_rx_cfg_rx_mac_address_4_lo_reg
// Register xgmac_rx_cfg.rx_mac_address_4_lo: RX MAC Address 4 LO
class xgmac_rx_cfg_rx_mac_address_4_lo_reg extends uvm_reg;

    // Variable: rx_mac_address_4_lo
    // RX MAC Address 4 lower 32 bits [31:0] of the 48-bit MAC Address used in the non-promiscuous mode RX filtering.
    rand uvm_reg_field rx_mac_address_4_lo;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_cfg_rx_mac_address_4_lo_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_cfg_rx_mac_address_4_lo_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_rx_mac_address_4_lo_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_cfg_rx_mac_address_4_lo");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_mac_address_4_lo = uvm_reg_field::type_id::create("rx_mac_address_4_lo", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_mac_address_4_lo.configure(this, 32, 0, "rw", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_cfg_rx_mac_address_4_lo_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_cfg_rx_mac_address_4_lo_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_mac_address_4_lo.get_name, rx_mac_address_4_lo.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_cfg_rx_mac_address_4_lo_reg_cover
// Register coverage object.
class xgmac_rx_cfg_rx_mac_address_4_lo_reg_cover extends uvm_object;

    static local xgmac_rx_cfg_rx_mac_address_4_lo_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_cfg_rx_mac_address_4_lo_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_mac_address_4_lo_wr: coverpoint r.rx_mac_address_4_lo.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_mac_address_4_lo_rd: coverpoint r.rx_mac_address_4_lo.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_rx_mac_address_4_lo_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_cfg_rx_mac_address_4_lo_reg_cover");
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
    static function xgmac_rx_cfg_rx_mac_address_4_lo_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_cfg_rx_mac_address_4_lo_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_cfg_rx_mac_address_4_lo_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_cfg_rx_mac_address_4_hi_reg_cover;

// Class: xgmac_rx_cfg_rx_mac_address_4_hi_reg
// Register xgmac_rx_cfg.rx_mac_address_4_hi: RX MAC Address 4 HI
class xgmac_rx_cfg_rx_mac_address_4_hi_reg extends uvm_reg;

    // Variable: rx_mac_address_4_hi
    // RX MAC Address 4 upper 16 bits [47:32] of the 48-bit MAC Address used in the non-promiscuous mode RX filtering.
    rand uvm_reg_field rx_mac_address_4_hi;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_cfg_rx_mac_address_4_hi_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_cfg_rx_mac_address_4_hi_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_rx_mac_address_4_hi_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_cfg_rx_mac_address_4_hi");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_mac_address_4_hi = uvm_reg_field::type_id::create("rx_mac_address_4_hi", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_mac_address_4_hi.configure(this, 16, 0, "rw", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_cfg_rx_mac_address_4_hi_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_cfg_rx_mac_address_4_hi_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_mac_address_4_hi.get_name, rx_mac_address_4_hi.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_cfg_rx_mac_address_4_hi_reg_cover
// Register coverage object.
class xgmac_rx_cfg_rx_mac_address_4_hi_reg_cover extends uvm_object;

    static local xgmac_rx_cfg_rx_mac_address_4_hi_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_cfg_rx_mac_address_4_hi_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_mac_address_4_hi_wr: coverpoint r.rx_mac_address_4_hi.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_mac_address_4_hi_rd: coverpoint r.rx_mac_address_4_hi.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_rx_mac_address_4_hi_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_cfg_rx_mac_address_4_hi_reg_cover");
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
    static function xgmac_rx_cfg_rx_mac_address_4_hi_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_cfg_rx_mac_address_4_hi_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_cfg_rx_mac_address_4_hi_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_cfg_rx_mac_address_5_lo_reg_cover;

// Class: xgmac_rx_cfg_rx_mac_address_5_lo_reg
// Register xgmac_rx_cfg.rx_mac_address_5_lo: RX MAC Address 5 LO
class xgmac_rx_cfg_rx_mac_address_5_lo_reg extends uvm_reg;

    // Variable: rx_mac_address_5_lo
    // RX MAC Address 5 lower 32 bits [31:0] of the 48-bit MAC Address used in the non-promiscuous mode RX filtering.
    rand uvm_reg_field rx_mac_address_5_lo;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_cfg_rx_mac_address_5_lo_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_cfg_rx_mac_address_5_lo_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_rx_mac_address_5_lo_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_cfg_rx_mac_address_5_lo");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_mac_address_5_lo = uvm_reg_field::type_id::create("rx_mac_address_5_lo", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_mac_address_5_lo.configure(this, 32, 0, "rw", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_cfg_rx_mac_address_5_lo_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_cfg_rx_mac_address_5_lo_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_mac_address_5_lo.get_name, rx_mac_address_5_lo.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_cfg_rx_mac_address_5_lo_reg_cover
// Register coverage object.
class xgmac_rx_cfg_rx_mac_address_5_lo_reg_cover extends uvm_object;

    static local xgmac_rx_cfg_rx_mac_address_5_lo_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_cfg_rx_mac_address_5_lo_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_mac_address_5_lo_wr: coverpoint r.rx_mac_address_5_lo.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_mac_address_5_lo_rd: coverpoint r.rx_mac_address_5_lo.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_rx_mac_address_5_lo_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_cfg_rx_mac_address_5_lo_reg_cover");
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
    static function xgmac_rx_cfg_rx_mac_address_5_lo_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_cfg_rx_mac_address_5_lo_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_cfg_rx_mac_address_5_lo_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_cfg_rx_mac_address_5_hi_reg_cover;

// Class: xgmac_rx_cfg_rx_mac_address_5_hi_reg
// Register xgmac_rx_cfg.rx_mac_address_5_hi: RX MAC Address 5 HI
class xgmac_rx_cfg_rx_mac_address_5_hi_reg extends uvm_reg;

    // Variable: rx_mac_address_5_hi
    // RX MAC Address 5 upper 16 bits [47:32] of the 48-bit MAC Address used in the non-promiscuous mode RX filtering.
    rand uvm_reg_field rx_mac_address_5_hi;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_cfg_rx_mac_address_5_hi_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_cfg_rx_mac_address_5_hi_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_rx_mac_address_5_hi_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_cfg_rx_mac_address_5_hi");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_mac_address_5_hi = uvm_reg_field::type_id::create("rx_mac_address_5_hi", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_mac_address_5_hi.configure(this, 16, 0, "rw", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_cfg_rx_mac_address_5_hi_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_cfg_rx_mac_address_5_hi_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_mac_address_5_hi.get_name, rx_mac_address_5_hi.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_cfg_rx_mac_address_5_hi_reg_cover
// Register coverage object.
class xgmac_rx_cfg_rx_mac_address_5_hi_reg_cover extends uvm_object;

    static local xgmac_rx_cfg_rx_mac_address_5_hi_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_cfg_rx_mac_address_5_hi_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_mac_address_5_hi_wr: coverpoint r.rx_mac_address_5_hi.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_mac_address_5_hi_rd: coverpoint r.rx_mac_address_5_hi.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_rx_mac_address_5_hi_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_cfg_rx_mac_address_5_hi_reg_cover");
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
    static function xgmac_rx_cfg_rx_mac_address_5_hi_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_cfg_rx_mac_address_5_hi_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_cfg_rx_mac_address_5_hi_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_cfg_rx_mac_address_6_lo_reg_cover;

// Class: xgmac_rx_cfg_rx_mac_address_6_lo_reg
// Register xgmac_rx_cfg.rx_mac_address_6_lo: RX MAC Address 6 LO
class xgmac_rx_cfg_rx_mac_address_6_lo_reg extends uvm_reg;

    // Variable: rx_mac_address_6_lo
    // RX MAC Address 6 lower 32 bits [31:0] of the 48-bit MAC Address used in the non-promiscuous mode RX filtering.
    rand uvm_reg_field rx_mac_address_6_lo;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_cfg_rx_mac_address_6_lo_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_cfg_rx_mac_address_6_lo_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_rx_mac_address_6_lo_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_cfg_rx_mac_address_6_lo");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_mac_address_6_lo = uvm_reg_field::type_id::create("rx_mac_address_6_lo", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_mac_address_6_lo.configure(this, 32, 0, "rw", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_cfg_rx_mac_address_6_lo_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_cfg_rx_mac_address_6_lo_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_mac_address_6_lo.get_name, rx_mac_address_6_lo.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_cfg_rx_mac_address_6_lo_reg_cover
// Register coverage object.
class xgmac_rx_cfg_rx_mac_address_6_lo_reg_cover extends uvm_object;

    static local xgmac_rx_cfg_rx_mac_address_6_lo_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_cfg_rx_mac_address_6_lo_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_mac_address_6_lo_wr: coverpoint r.rx_mac_address_6_lo.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_mac_address_6_lo_rd: coverpoint r.rx_mac_address_6_lo.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_rx_mac_address_6_lo_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_cfg_rx_mac_address_6_lo_reg_cover");
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
    static function xgmac_rx_cfg_rx_mac_address_6_lo_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_cfg_rx_mac_address_6_lo_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_cfg_rx_mac_address_6_lo_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_cfg_rx_mac_address_6_hi_reg_cover;

// Class: xgmac_rx_cfg_rx_mac_address_6_hi_reg
// Register xgmac_rx_cfg.rx_mac_address_6_hi: RX MAC Address 6 HI
class xgmac_rx_cfg_rx_mac_address_6_hi_reg extends uvm_reg;

    // Variable: rx_mac_address_6_hi
    // RX MAC Address 6 upper 16 bits [47:32] of the 48-bit MAC Address used in the non-promiscuous mode RX filtering.
    rand uvm_reg_field rx_mac_address_6_hi;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_cfg_rx_mac_address_6_hi_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_cfg_rx_mac_address_6_hi_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_rx_mac_address_6_hi_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_cfg_rx_mac_address_6_hi");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_mac_address_6_hi = uvm_reg_field::type_id::create("rx_mac_address_6_hi", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_mac_address_6_hi.configure(this, 16, 0, "rw", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_cfg_rx_mac_address_6_hi_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_cfg_rx_mac_address_6_hi_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_mac_address_6_hi.get_name, rx_mac_address_6_hi.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_cfg_rx_mac_address_6_hi_reg_cover
// Register coverage object.
class xgmac_rx_cfg_rx_mac_address_6_hi_reg_cover extends uvm_object;

    static local xgmac_rx_cfg_rx_mac_address_6_hi_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_cfg_rx_mac_address_6_hi_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_mac_address_6_hi_wr: coverpoint r.rx_mac_address_6_hi.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_mac_address_6_hi_rd: coverpoint r.rx_mac_address_6_hi.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_rx_mac_address_6_hi_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_cfg_rx_mac_address_6_hi_reg_cover");
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
    static function xgmac_rx_cfg_rx_mac_address_6_hi_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_cfg_rx_mac_address_6_hi_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_cfg_rx_mac_address_6_hi_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_cfg_rx_mac_address_7_lo_reg_cover;

// Class: xgmac_rx_cfg_rx_mac_address_7_lo_reg
// Register xgmac_rx_cfg.rx_mac_address_7_lo: RX MAC Address 7 LO
class xgmac_rx_cfg_rx_mac_address_7_lo_reg extends uvm_reg;

    // Variable: rx_mac_address_7_lo
    // RX MAC Address 0 lower 32 bits [31:0] of the 48-bit MAC Address used in the non-promiscuous mode RX filtering.
    rand uvm_reg_field rx_mac_address_7_lo;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_cfg_rx_mac_address_7_lo_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_cfg_rx_mac_address_7_lo_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_rx_mac_address_7_lo_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_cfg_rx_mac_address_7_lo");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_mac_address_7_lo = uvm_reg_field::type_id::create("rx_mac_address_7_lo", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_mac_address_7_lo.configure(this, 32, 0, "rw", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_cfg_rx_mac_address_7_lo_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_cfg_rx_mac_address_7_lo_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_mac_address_7_lo.get_name, rx_mac_address_7_lo.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_cfg_rx_mac_address_7_lo_reg_cover
// Register coverage object.
class xgmac_rx_cfg_rx_mac_address_7_lo_reg_cover extends uvm_object;

    static local xgmac_rx_cfg_rx_mac_address_7_lo_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_cfg_rx_mac_address_7_lo_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_mac_address_7_lo_wr: coverpoint r.rx_mac_address_7_lo.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_mac_address_7_lo_rd: coverpoint r.rx_mac_address_7_lo.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_rx_mac_address_7_lo_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_cfg_rx_mac_address_7_lo_reg_cover");
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
    static function xgmac_rx_cfg_rx_mac_address_7_lo_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_cfg_rx_mac_address_7_lo_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_cfg_rx_mac_address_7_lo_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_cfg_rx_mac_address_7_hi_reg_cover;

// Class: xgmac_rx_cfg_rx_mac_address_7_hi_reg
// Register xgmac_rx_cfg.rx_mac_address_7_hi: RX MAC Address 7 HI
class xgmac_rx_cfg_rx_mac_address_7_hi_reg extends uvm_reg;

    // Variable: rx_mac_address_7_hi
    // RX MAC Address 7 upper 16 bits [47:32] of the 48-bit MAC Address used in the non-promiscuous mode RX filtering.
    rand uvm_reg_field rx_mac_address_7_hi;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_cfg_rx_mac_address_7_hi_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_cfg_rx_mac_address_7_hi_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_rx_mac_address_7_hi_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_cfg_rx_mac_address_7_hi");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_mac_address_7_hi = uvm_reg_field::type_id::create("rx_mac_address_7_hi", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_mac_address_7_hi.configure(this, 16, 0, "rw", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_cfg_rx_mac_address_7_hi_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_cfg_rx_mac_address_7_hi_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_mac_address_7_hi.get_name, rx_mac_address_7_hi.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_cfg_rx_mac_address_7_hi_reg_cover
// Register coverage object.
class xgmac_rx_cfg_rx_mac_address_7_hi_reg_cover extends uvm_object;

    static local xgmac_rx_cfg_rx_mac_address_7_hi_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_cfg_rx_mac_address_7_hi_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_mac_address_7_hi_wr: coverpoint r.rx_mac_address_7_hi.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_mac_address_7_hi_rd: coverpoint r.rx_mac_address_7_hi.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_rx_mac_address_7_hi_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_cfg_rx_mac_address_7_hi_reg_cover");
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
    static function xgmac_rx_cfg_rx_mac_address_7_hi_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_cfg_rx_mac_address_7_hi_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_cfg_rx_mac_address_7_hi_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_cfg_rx_mac_address_multicast_hash_table_lo_reg_cover;

// Class: xgmac_rx_cfg_rx_mac_address_multicast_hash_table_lo_reg
// Register xgmac_rx_cfg.rx_mac_address_multicast_hash_table_lo: RX MAC Address MultiCast Hash Table LO
class xgmac_rx_cfg_rx_mac_address_multicast_hash_table_lo_reg extends uvm_reg;

    // Variable: rx_mac_address_multicast_hash_table_lo
    // RX MAC Address Multicast Hash Table lower 32 bits [31:0] used in the non-promiscuous mode RX filtering of Multicast frames.
    rand uvm_reg_field rx_mac_address_multicast_hash_table_lo;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_cfg_rx_mac_address_multicast_hash_table_lo_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_cfg_rx_mac_address_multicast_hash_table_lo_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_rx_mac_address_multicast_hash_table_lo_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_cfg_rx_mac_address_multicast_hash_table_lo");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_mac_address_multicast_hash_table_lo = uvm_reg_field::type_id::create("rx_mac_address_multicast_hash_table_lo", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_mac_address_multicast_hash_table_lo.configure(this, 32, 0, "rw", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_cfg_rx_mac_address_multicast_hash_table_lo_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_cfg_rx_mac_address_multicast_hash_table_lo_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_mac_address_multicast_hash_table_lo.get_name, rx_mac_address_multicast_hash_table_lo.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_cfg_rx_mac_address_multicast_hash_table_lo_reg_cover
// Register coverage object.
class xgmac_rx_cfg_rx_mac_address_multicast_hash_table_lo_reg_cover extends uvm_object;

    static local xgmac_rx_cfg_rx_mac_address_multicast_hash_table_lo_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_cfg_rx_mac_address_multicast_hash_table_lo_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_mac_address_multicast_hash_table_lo_wr: coverpoint r.rx_mac_address_multicast_hash_table_lo.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_mac_address_multicast_hash_table_lo_rd: coverpoint r.rx_mac_address_multicast_hash_table_lo.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_rx_mac_address_multicast_hash_table_lo_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_cfg_rx_mac_address_multicast_hash_table_lo_reg_cover");
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
    static function xgmac_rx_cfg_rx_mac_address_multicast_hash_table_lo_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_cfg_rx_mac_address_multicast_hash_table_lo_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_cfg_rx_mac_address_multicast_hash_table_lo_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_cfg_rx_mac_address_multicast_hash_table_hi_reg_cover;

// Class: xgmac_rx_cfg_rx_mac_address_multicast_hash_table_hi_reg
// Register xgmac_rx_cfg.rx_mac_address_multicast_hash_table_hi: RX MAC Address MultiCast Hash Table HI
class xgmac_rx_cfg_rx_mac_address_multicast_hash_table_hi_reg extends uvm_reg;

    // Variable: rx_mac_address_multicast_hash_table_hi
    // RX MAC Address Multicast Hash Table upper 32 bits [63:32] used in the non-promiscuous mode RX filtering of Multicast frames.
    rand uvm_reg_field rx_mac_address_multicast_hash_table_hi;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_cfg_rx_mac_address_multicast_hash_table_hi_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_cfg_rx_mac_address_multicast_hash_table_hi_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_rx_mac_address_multicast_hash_table_hi_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_cfg_rx_mac_address_multicast_hash_table_hi");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_mac_address_multicast_hash_table_hi = uvm_reg_field::type_id::create("rx_mac_address_multicast_hash_table_hi", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_mac_address_multicast_hash_table_hi.configure(this, 32, 0, "rw", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_cfg_rx_mac_address_multicast_hash_table_hi_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_cfg_rx_mac_address_multicast_hash_table_hi_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_mac_address_multicast_hash_table_hi.get_name, rx_mac_address_multicast_hash_table_hi.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_cfg_rx_mac_address_multicast_hash_table_hi_reg_cover
// Register coverage object.
class xgmac_rx_cfg_rx_mac_address_multicast_hash_table_hi_reg_cover extends uvm_object;

    static local xgmac_rx_cfg_rx_mac_address_multicast_hash_table_hi_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_cfg_rx_mac_address_multicast_hash_table_hi_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_mac_address_multicast_hash_table_hi_wr: coverpoint r.rx_mac_address_multicast_hash_table_hi.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_mac_address_multicast_hash_table_hi_rd: coverpoint r.rx_mac_address_multicast_hash_table_hi.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_rx_mac_address_multicast_hash_table_hi_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_cfg_rx_mac_address_multicast_hash_table_hi_reg_cover");
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
    static function xgmac_rx_cfg_rx_mac_address_multicast_hash_table_hi_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_cfg_rx_mac_address_multicast_hash_table_hi_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_cfg_rx_mac_address_multicast_hash_table_hi_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass





// Class: xgmac_rx_cfg_reg_block
// Register Block .xgmac_rx_cfg: 
class xgmac_rx_cfg_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand xgmac_rx_cfg_rx_config_reg rx_config;
    rand xgmac_rx_cfg_vlan_2nd_cfg_reg vlan_2nd_cfg;
    rand xgmac_rx_cfg_rx_large_threshold_reg rx_large_threshold;
    rand xgmac_rx_cfg_rx_mac_address_0_lo_reg rx_mac_address_0_lo;
    rand xgmac_rx_cfg_rx_mac_address_0_hi_reg rx_mac_address_0_hi;
    rand xgmac_rx_cfg_rx_mac_address_1_lo_reg rx_mac_address_1_lo;
    rand xgmac_rx_cfg_rx_mac_address_1_hi_reg rx_mac_address_1_hi;
    rand xgmac_rx_cfg_rx_mac_address_2_lo_reg rx_mac_address_2_lo;
    rand xgmac_rx_cfg_rx_mac_address_2_hi_reg rx_mac_address_2_hi;
    rand xgmac_rx_cfg_rx_mac_address_3_lo_reg rx_mac_address_3_lo;
    rand xgmac_rx_cfg_rx_mac_address_3_hi_reg rx_mac_address_3_hi;
    rand xgmac_rx_cfg_rx_mac_address_4_lo_reg rx_mac_address_4_lo;
    rand xgmac_rx_cfg_rx_mac_address_4_hi_reg rx_mac_address_4_hi;
    rand xgmac_rx_cfg_rx_mac_address_5_lo_reg rx_mac_address_5_lo;
    rand xgmac_rx_cfg_rx_mac_address_5_hi_reg rx_mac_address_5_hi;
    rand xgmac_rx_cfg_rx_mac_address_6_lo_reg rx_mac_address_6_lo;
    rand xgmac_rx_cfg_rx_mac_address_6_hi_reg rx_mac_address_6_hi;
    rand xgmac_rx_cfg_rx_mac_address_7_lo_reg rx_mac_address_7_lo;
    rand xgmac_rx_cfg_rx_mac_address_7_hi_reg rx_mac_address_7_hi;
    rand xgmac_rx_cfg_rx_mac_address_multicast_hash_table_lo_reg rx_mac_address_multicast_hash_table_lo;
    rand xgmac_rx_cfg_rx_mac_address_multicast_hash_table_hi_reg rx_mac_address_multicast_hash_table_hi;

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(xgmac_rx_cfg_reg_pkg::xgmac_rx_cfg_reg_block)

    // Constructor: new
    function new(string name = "xgmac_rx_cfg_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})


        rx_config = xgmac_rx_cfg_rx_config_reg::type_id::create("rx_config", , get_full_name());
        vlan_2nd_cfg = xgmac_rx_cfg_vlan_2nd_cfg_reg::type_id::create("vlan_2nd_cfg", , get_full_name());
        rx_large_threshold = xgmac_rx_cfg_rx_large_threshold_reg::type_id::create("rx_large_threshold", , get_full_name());
        rx_mac_address_0_lo = xgmac_rx_cfg_rx_mac_address_0_lo_reg::type_id::create("rx_mac_address_0_lo", , get_full_name());
        rx_mac_address_0_hi = xgmac_rx_cfg_rx_mac_address_0_hi_reg::type_id::create("rx_mac_address_0_hi", , get_full_name());
        rx_mac_address_1_lo = xgmac_rx_cfg_rx_mac_address_1_lo_reg::type_id::create("rx_mac_address_1_lo", , get_full_name());
        rx_mac_address_1_hi = xgmac_rx_cfg_rx_mac_address_1_hi_reg::type_id::create("rx_mac_address_1_hi", , get_full_name());
        rx_mac_address_2_lo = xgmac_rx_cfg_rx_mac_address_2_lo_reg::type_id::create("rx_mac_address_2_lo", , get_full_name());
        rx_mac_address_2_hi = xgmac_rx_cfg_rx_mac_address_2_hi_reg::type_id::create("rx_mac_address_2_hi", , get_full_name());
        rx_mac_address_3_lo = xgmac_rx_cfg_rx_mac_address_3_lo_reg::type_id::create("rx_mac_address_3_lo", , get_full_name());
        rx_mac_address_3_hi = xgmac_rx_cfg_rx_mac_address_3_hi_reg::type_id::create("rx_mac_address_3_hi", , get_full_name());
        rx_mac_address_4_lo = xgmac_rx_cfg_rx_mac_address_4_lo_reg::type_id::create("rx_mac_address_4_lo", , get_full_name());
        rx_mac_address_4_hi = xgmac_rx_cfg_rx_mac_address_4_hi_reg::type_id::create("rx_mac_address_4_hi", , get_full_name());
        rx_mac_address_5_lo = xgmac_rx_cfg_rx_mac_address_5_lo_reg::type_id::create("rx_mac_address_5_lo", , get_full_name());
        rx_mac_address_5_hi = xgmac_rx_cfg_rx_mac_address_5_hi_reg::type_id::create("rx_mac_address_5_hi", , get_full_name());
        rx_mac_address_6_lo = xgmac_rx_cfg_rx_mac_address_6_lo_reg::type_id::create("rx_mac_address_6_lo", , get_full_name());
        rx_mac_address_6_hi = xgmac_rx_cfg_rx_mac_address_6_hi_reg::type_id::create("rx_mac_address_6_hi", , get_full_name());
        rx_mac_address_7_lo = xgmac_rx_cfg_rx_mac_address_7_lo_reg::type_id::create("rx_mac_address_7_lo", , get_full_name());
        rx_mac_address_7_hi = xgmac_rx_cfg_rx_mac_address_7_hi_reg::type_id::create("rx_mac_address_7_hi", , get_full_name());
        rx_mac_address_multicast_hash_table_lo = xgmac_rx_cfg_rx_mac_address_multicast_hash_table_lo_reg::type_id::create("rx_mac_address_multicast_hash_table_lo", , get_full_name());
        rx_mac_address_multicast_hash_table_hi = xgmac_rx_cfg_rx_mac_address_multicast_hash_table_hi_reg::type_id::create("rx_mac_address_multicast_hash_table_hi", , get_full_name());

        rx_config.configure(this);
        vlan_2nd_cfg.configure(this);
        rx_large_threshold.configure(this);
        rx_mac_address_0_lo.configure(this);
        rx_mac_address_0_hi.configure(this);
        rx_mac_address_1_lo.configure(this);
        rx_mac_address_1_hi.configure(this);
        rx_mac_address_2_lo.configure(this);
        rx_mac_address_2_hi.configure(this);
        rx_mac_address_3_lo.configure(this);
        rx_mac_address_3_hi.configure(this);
        rx_mac_address_4_lo.configure(this);
        rx_mac_address_4_hi.configure(this);
        rx_mac_address_5_lo.configure(this);
        rx_mac_address_5_hi.configure(this);
        rx_mac_address_6_lo.configure(this);
        rx_mac_address_6_hi.configure(this);
        rx_mac_address_7_lo.configure(this);
        rx_mac_address_7_hi.configure(this);
        rx_mac_address_multicast_hash_table_lo.configure(this);
        rx_mac_address_multicast_hash_table_hi.configure(this);

        rx_config.build();
        vlan_2nd_cfg.build();
        rx_large_threshold.build();
        rx_mac_address_0_lo.build();
        rx_mac_address_0_hi.build();
        rx_mac_address_1_lo.build();
        rx_mac_address_1_hi.build();
        rx_mac_address_2_lo.build();
        rx_mac_address_2_hi.build();
        rx_mac_address_3_lo.build();
        rx_mac_address_3_hi.build();
        rx_mac_address_4_lo.build();
        rx_mac_address_4_hi.build();
        rx_mac_address_5_lo.build();
        rx_mac_address_5_hi.build();
        rx_mac_address_6_lo.build();
        rx_mac_address_6_hi.build();
        rx_mac_address_7_lo.build();
        rx_mac_address_7_hi.build();
        rx_mac_address_multicast_hash_table_lo.build();
        rx_mac_address_multicast_hash_table_hi.build();

        // define default map
        default_map = create_map("xgmac_rx_cfg_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        this.default_map.add_reg(rx_config, 'h0, "RW");
        this.default_map.add_reg(vlan_2nd_cfg, 'h1, "RW");
        this.default_map.add_reg(rx_large_threshold, 'h2, "RW");
        this.default_map.add_reg(rx_mac_address_0_lo, 'h4, "RW");
        this.default_map.add_reg(rx_mac_address_0_hi, 'h5, "RW");
        this.default_map.add_reg(rx_mac_address_1_lo, 'h6, "RW");
        this.default_map.add_reg(rx_mac_address_1_hi, 'h7, "RW");
        this.default_map.add_reg(rx_mac_address_2_lo, 'h8, "RW");
        this.default_map.add_reg(rx_mac_address_2_hi, 'h9, "RW");
        this.default_map.add_reg(rx_mac_address_3_lo, 'hA, "RW");
        this.default_map.add_reg(rx_mac_address_3_hi, 'hB, "RW");
        this.default_map.add_reg(rx_mac_address_4_lo, 'hC, "RW");
        this.default_map.add_reg(rx_mac_address_4_hi, 'hD, "RW");
        this.default_map.add_reg(rx_mac_address_5_lo, 'hE, "RW");
        this.default_map.add_reg(rx_mac_address_5_hi, 'hF, "RW");
        this.default_map.add_reg(rx_mac_address_6_lo, 'h10, "RW");
        this.default_map.add_reg(rx_mac_address_6_hi, 'h11, "RW");
        this.default_map.add_reg(rx_mac_address_7_lo, 'h12, "RW");
        this.default_map.add_reg(rx_mac_address_7_hi, 'h13, "RW");
        this.default_map.add_reg(rx_mac_address_multicast_hash_table_lo, 'h14, "RW");
        this.default_map.add_reg(rx_mac_address_multicast_hash_table_hi, 'h15, "RW");

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
        rx_config.enable_coverage(is_on, this.cg_per_instance);
        vlan_2nd_cfg.enable_coverage(is_on, this.cg_per_instance);
        rx_large_threshold.enable_coverage(is_on, this.cg_per_instance);
        rx_mac_address_0_lo.enable_coverage(is_on, this.cg_per_instance);
        rx_mac_address_0_hi.enable_coverage(is_on, this.cg_per_instance);
        rx_mac_address_1_lo.enable_coverage(is_on, this.cg_per_instance);
        rx_mac_address_1_hi.enable_coverage(is_on, this.cg_per_instance);
        rx_mac_address_2_lo.enable_coverage(is_on, this.cg_per_instance);
        rx_mac_address_2_hi.enable_coverage(is_on, this.cg_per_instance);
        rx_mac_address_3_lo.enable_coverage(is_on, this.cg_per_instance);
        rx_mac_address_3_hi.enable_coverage(is_on, this.cg_per_instance);
        rx_mac_address_4_lo.enable_coverage(is_on, this.cg_per_instance);
        rx_mac_address_4_hi.enable_coverage(is_on, this.cg_per_instance);
        rx_mac_address_5_lo.enable_coverage(is_on, this.cg_per_instance);
        rx_mac_address_5_hi.enable_coverage(is_on, this.cg_per_instance);
        rx_mac_address_6_lo.enable_coverage(is_on, this.cg_per_instance);
        rx_mac_address_6_hi.enable_coverage(is_on, this.cg_per_instance);
        rx_mac_address_7_lo.enable_coverage(is_on, this.cg_per_instance);
        rx_mac_address_7_hi.enable_coverage(is_on, this.cg_per_instance);
        rx_mac_address_multicast_hash_table_lo.enable_coverage(is_on, this.cg_per_instance);
        rx_mac_address_multicast_hash_table_hi.enable_coverage(is_on, this.cg_per_instance);
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