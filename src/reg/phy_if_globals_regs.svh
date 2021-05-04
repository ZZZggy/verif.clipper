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
// Register definitions for phy_if_globals register block.
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
// Group: phy_if_globals
//---------------------------------------------------------

package phy_if_globals_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;

typedef class phy_if_global_registers_rgmii_reg_cover;

// Class: phy_if_global_registers_rgmii_reg
// Register phy_if_global_registers.rgmii: Rgmii speeds
class phy_if_global_registers_rgmii_reg extends uvm_reg;

    // Variable: mgmt_rgmii_speed
    // 
    rand uvm_reg_field mgmt_rgmii_speed;
    // Variable: cpu_rgmii_speed
    // 
    rand uvm_reg_field cpu_rgmii_speed;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static phy_if_global_registers_rgmii_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    phy_if_global_registers_rgmii_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(phy_if_globals_reg_pkg::phy_if_global_registers_rgmii_reg)

    // Constructor: new
    function new(string name = "phy_if_global_registers_rgmii");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        mgmt_rgmii_speed = uvm_reg_field::type_id::create("mgmt_rgmii_speed", , get_full_name());
        cpu_rgmii_speed = uvm_reg_field::type_id::create("cpu_rgmii_speed", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        mgmt_rgmii_speed.configure(this, 2, 0, "RO", 0, 'h0, 1, 1, 0);
        cpu_rgmii_speed.configure(this, 2, 2, "RO", 0, 'h0, 1, 1, 0);
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
                cg = phy_if_global_registers_rgmii_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = phy_if_global_registers_rgmii_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, mgmt_rgmii_speed.get_name, mgmt_rgmii_speed.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, cpu_rgmii_speed.get_name, cpu_rgmii_speed.value);
        return s;
    endfunction

endclass


// Class: phy_if_global_registers_rgmii_reg_cover
// Register coverage object.
class phy_if_global_registers_rgmii_reg_cover extends uvm_object;

    static local phy_if_global_registers_rgmii_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    phy_if_global_registers_rgmii_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        mgmt_rgmii_speed_wr: coverpoint r.mgmt_rgmii_speed.value iff (!is_read);
        mgmt_rgmii_speed_rd: coverpoint r.mgmt_rgmii_speed.value iff  (is_read);
        cpu_rgmii_speed_wr: coverpoint r.cpu_rgmii_speed.value iff (!is_read);
        cpu_rgmii_speed_rd: coverpoint r.cpu_rgmii_speed.value iff  (is_read);
    endgroup

    `uvm_object_utils(phy_if_globals_reg_pkg::phy_if_global_registers_rgmii_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="phy_if_global_registers_rgmii_reg_cover");
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
    static function phy_if_global_registers_rgmii_reg_cover get();
        if (m_inst == null) begin
            m_inst = phy_if_global_registers_rgmii_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(phy_if_global_registers_rgmii_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class phy_if_global_registers_led_link_reg_cover;

// Class: phy_if_global_registers_led_link_reg
// Register phy_if_global_registers.led_link: phy_1g_led_link
class phy_if_global_registers_led_link_reg extends uvm_reg;

    // Variable: sfp_1g_led_link
    // From tbi interface link pin.
    rand uvm_reg_field sfp_1g_led_link;
    // Variable: sfp_1g_led_an
    // From tbi interface an pin.
    rand uvm_reg_field sfp_1g_led_an;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static phy_if_global_registers_led_link_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    phy_if_global_registers_led_link_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(phy_if_globals_reg_pkg::phy_if_global_registers_led_link_reg)

    // Constructor: new
    function new(string name = "phy_if_global_registers_led_link");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        sfp_1g_led_link = uvm_reg_field::type_id::create("sfp_1g_led_link", , get_full_name());
        sfp_1g_led_an = uvm_reg_field::type_id::create("sfp_1g_led_an", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        sfp_1g_led_link.configure(this, 12, 0, "RO", 0, 'h0, 1, 1, 0);
        sfp_1g_led_an.configure(this, 12, 16, "RO", 0, 'h0, 1, 1, 0);
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
                cg = phy_if_global_registers_led_link_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = phy_if_global_registers_led_link_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp_1g_led_link.get_name, sfp_1g_led_link.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp_1g_led_an.get_name, sfp_1g_led_an.value);
        return s;
    endfunction

endclass


// Class: phy_if_global_registers_led_link_reg_cover
// Register coverage object.
class phy_if_global_registers_led_link_reg_cover extends uvm_object;

    static local phy_if_global_registers_led_link_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    phy_if_global_registers_led_link_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        sfp_1g_led_link_wr: coverpoint r.sfp_1g_led_link.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        sfp_1g_led_link_rd: coverpoint r.sfp_1g_led_link.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        sfp_1g_led_an_wr: coverpoint r.sfp_1g_led_an.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        sfp_1g_led_an_rd: coverpoint r.sfp_1g_led_an.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(phy_if_globals_reg_pkg::phy_if_global_registers_led_link_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="phy_if_global_registers_led_link_reg_cover");
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
    static function phy_if_global_registers_led_link_reg_cover get();
        if (m_inst == null) begin
            m_inst = phy_if_global_registers_led_link_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(phy_if_global_registers_led_link_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class phy_if_global_registers_pll_10g_status_reg_cover;

// Class: phy_if_global_registers_pll_10g_status_reg
// Register phy_if_global_registers.pll_10g_status: pll_status
class phy_if_global_registers_pll_10g_status_reg extends uvm_reg;

    // Variable: pll10g_lock
    // phy 1g/10g pll locked (all ports)
    rand uvm_reg_field pll10g_lock;
    // Variable: rx_block_lock_10g
    // synchronizer block lock for phy10g and phy 1g/10g
    rand uvm_reg_field rx_block_lock_10g;
    // Variable: rx_data_ready_10g
    // PHY 10g and 1g/10g is ready to receive data from MAC
    rand uvm_reg_field rx_data_ready_10g;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static phy_if_global_registers_pll_10g_status_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    phy_if_global_registers_pll_10g_status_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(phy_if_globals_reg_pkg::phy_if_global_registers_pll_10g_status_reg)

    // Constructor: new
    function new(string name = "phy_if_global_registers_pll_10g_status");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        pll10g_lock = uvm_reg_field::type_id::create("pll10g_lock", , get_full_name());
        rx_block_lock_10g = uvm_reg_field::type_id::create("rx_block_lock_10g", , get_full_name());
        rx_data_ready_10g = uvm_reg_field::type_id::create("rx_data_ready_10g", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        pll10g_lock.configure(this, 1, 0, "RO", 0, 'h0, 1, 1, 0);
        rx_block_lock_10g.configure(this, 12, 4, "RO", 0, 'h0, 1, 1, 0);
        rx_data_ready_10g.configure(this, 12, 16, "RO", 0, 'h0, 1, 1, 0);
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
                cg = phy_if_global_registers_pll_10g_status_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = phy_if_global_registers_pll_10g_status_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, pll10g_lock.get_name, pll10g_lock.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_block_lock_10g.get_name, rx_block_lock_10g.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_data_ready_10g.get_name, rx_data_ready_10g.value);
        return s;
    endfunction

endclass


// Class: phy_if_global_registers_pll_10g_status_reg_cover
// Register coverage object.
class phy_if_global_registers_pll_10g_status_reg_cover extends uvm_object;

    static local phy_if_global_registers_pll_10g_status_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    phy_if_global_registers_pll_10g_status_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        pll10g_lock_wr: coverpoint r.pll10g_lock.value iff (!is_read);
        pll10g_lock_rd: coverpoint r.pll10g_lock.value iff  (is_read);
        rx_block_lock_10g_wr: coverpoint r.rx_block_lock_10g.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_block_lock_10g_rd: coverpoint r.rx_block_lock_10g.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        rx_data_ready_10g_wr: coverpoint r.rx_data_ready_10g.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_data_ready_10g_rd: coverpoint r.rx_data_ready_10g.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(phy_if_globals_reg_pkg::phy_if_global_registers_pll_10g_status_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="phy_if_global_registers_pll_10g_status_reg_cover");
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
    static function phy_if_global_registers_pll_10g_status_reg_cover get();
        if (m_inst == null) begin
            m_inst = phy_if_global_registers_pll_10g_status_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(phy_if_global_registers_pll_10g_status_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class phy_if_global_registers_pll_1g_status_reg_cover;

// Class: phy_if_global_registers_pll_1g_status_reg
// Register phy_if_global_registers.pll_1g_status: pll_status
class phy_if_global_registers_pll_1g_status_reg extends uvm_reg;

    // Variable: pll1g_lock
    // phy1g only locked (all ports)
    rand uvm_reg_field pll1g_lock;
    // Variable: tx_ready_1g
    // Tx ready for PHY 1g only
    rand uvm_reg_field tx_ready_1g;
    // Variable: rx_ready_1g
    // Rx ready for PHY 1g only
    rand uvm_reg_field rx_ready_1g;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static phy_if_global_registers_pll_1g_status_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    phy_if_global_registers_pll_1g_status_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(phy_if_globals_reg_pkg::phy_if_global_registers_pll_1g_status_reg)

    // Constructor: new
    function new(string name = "phy_if_global_registers_pll_1g_status");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        pll1g_lock = uvm_reg_field::type_id::create("pll1g_lock", , get_full_name());
        tx_ready_1g = uvm_reg_field::type_id::create("tx_ready_1g", , get_full_name());
        rx_ready_1g = uvm_reg_field::type_id::create("rx_ready_1g", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        pll1g_lock.configure(this, 1, 0, "RO", 0, 'h0, 1, 1, 0);
        tx_ready_1g.configure(this, 12, 4, "RO", 0, 'h0, 1, 1, 0);
        rx_ready_1g.configure(this, 12, 16, "RO", 0, 'h0, 1, 1, 0);
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
                cg = phy_if_global_registers_pll_1g_status_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = phy_if_global_registers_pll_1g_status_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, pll1g_lock.get_name, pll1g_lock.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_ready_1g.get_name, tx_ready_1g.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_ready_1g.get_name, rx_ready_1g.value);
        return s;
    endfunction

endclass


// Class: phy_if_global_registers_pll_1g_status_reg_cover
// Register coverage object.
class phy_if_global_registers_pll_1g_status_reg_cover extends uvm_object;

    static local phy_if_global_registers_pll_1g_status_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    phy_if_global_registers_pll_1g_status_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        pll1g_lock_wr: coverpoint r.pll1g_lock.value iff (!is_read);
        pll1g_lock_rd: coverpoint r.pll1g_lock.value iff  (is_read);
        tx_ready_1g_wr: coverpoint r.tx_ready_1g.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        tx_ready_1g_rd: coverpoint r.tx_ready_1g.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        rx_ready_1g_wr: coverpoint r.rx_ready_1g.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_ready_1g_rd: coverpoint r.rx_ready_1g.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(phy_if_globals_reg_pkg::phy_if_global_registers_pll_1g_status_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="phy_if_global_registers_pll_1g_status_reg_cover");
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
    static function phy_if_global_registers_pll_1g_status_reg_cover get();
        if (m_inst == null) begin
            m_inst = phy_if_global_registers_pll_1g_status_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(phy_if_global_registers_pll_1g_status_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class phy_if_global_registers_poll_status_inf1_reg_cover;

// Class: phy_if_global_registers_poll_status_inf1_reg
// Register phy_if_global_registers.poll_status_inf1: Results of polling engine
class phy_if_global_registers_poll_status_inf1_reg extends uvm_reg;

    // Variable: poll_link_1000bx
    // phy1g: register 0x1 value bit 2 link status
    rand uvm_reg_field poll_link_1000bx;
    // Variable: poll_link_anena
    // phy1g: register 0x0 value bit 12 (autoneg enable) 
    rand uvm_reg_field poll_link_anena;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static phy_if_global_registers_poll_status_inf1_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    phy_if_global_registers_poll_status_inf1_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(phy_if_globals_reg_pkg::phy_if_global_registers_poll_status_inf1_reg)

    // Constructor: new
    function new(string name = "phy_if_global_registers_poll_status_inf1");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        poll_link_1000bx = uvm_reg_field::type_id::create("poll_link_1000bx", , get_full_name());
        poll_link_anena = uvm_reg_field::type_id::create("poll_link_anena", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        poll_link_1000bx.configure(this, 12, 0, "ro", 0, 'h0, 1, 1, 0);
        poll_link_anena.configure(this, 12, 16, "ro", 0, 'h0, 1, 1, 0);
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
                cg = phy_if_global_registers_poll_status_inf1_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = phy_if_global_registers_poll_status_inf1_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, poll_link_1000bx.get_name, poll_link_1000bx.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, poll_link_anena.get_name, poll_link_anena.value);
        return s;
    endfunction

endclass


// Class: phy_if_global_registers_poll_status_inf1_reg_cover
// Register coverage object.
class phy_if_global_registers_poll_status_inf1_reg_cover extends uvm_object;

    static local phy_if_global_registers_poll_status_inf1_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    phy_if_global_registers_poll_status_inf1_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        poll_link_1000bx_wr: coverpoint r.poll_link_1000bx.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        poll_link_1000bx_rd: coverpoint r.poll_link_1000bx.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        poll_link_anena_wr: coverpoint r.poll_link_anena.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        poll_link_anena_rd: coverpoint r.poll_link_anena.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(phy_if_globals_reg_pkg::phy_if_global_registers_poll_status_inf1_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="phy_if_global_registers_poll_status_inf1_reg_cover");
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
    static function phy_if_global_registers_poll_status_inf1_reg_cover get();
        if (m_inst == null) begin
            m_inst = phy_if_global_registers_poll_status_inf1_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(phy_if_global_registers_poll_status_inf1_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class phy_if_global_registers_poll_status_inf2_reg_cover;

// Class: phy_if_global_registers_poll_status_inf2_reg
// Register phy_if_global_registers.poll_status_inf2: Results of polling engine
class phy_if_global_registers_poll_status_inf2_reg extends uvm_reg;

    // Variable: poll_link_is_sgmii
    // phy1g: sgmii enable reg 0x6 bit 0
    rand uvm_reg_field poll_link_is_sgmii;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static phy_if_global_registers_poll_status_inf2_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    phy_if_global_registers_poll_status_inf2_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(phy_if_globals_reg_pkg::phy_if_global_registers_poll_status_inf2_reg)

    // Constructor: new
    function new(string name = "phy_if_global_registers_poll_status_inf2");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        poll_link_is_sgmii = uvm_reg_field::type_id::create("poll_link_is_sgmii", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        poll_link_is_sgmii.configure(this, 12, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = phy_if_global_registers_poll_status_inf2_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = phy_if_global_registers_poll_status_inf2_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, poll_link_is_sgmii.get_name, poll_link_is_sgmii.value);
        return s;
    endfunction

endclass


// Class: phy_if_global_registers_poll_status_inf2_reg_cover
// Register coverage object.
class phy_if_global_registers_poll_status_inf2_reg_cover extends uvm_object;

    static local phy_if_global_registers_poll_status_inf2_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    phy_if_global_registers_poll_status_inf2_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        poll_link_is_sgmii_wr: coverpoint r.poll_link_is_sgmii.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        poll_link_is_sgmii_rd: coverpoint r.poll_link_is_sgmii.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(phy_if_globals_reg_pkg::phy_if_global_registers_poll_status_inf2_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="phy_if_global_registers_poll_status_inf2_reg_cover");
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
    static function phy_if_global_registers_poll_status_inf2_reg_cover get();
        if (m_inst == null) begin
            m_inst = phy_if_global_registers_poll_status_inf2_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(phy_if_global_registers_poll_status_inf2_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class phy_if_global_registers_poll_status_inf3_reg_cover;

// Class: phy_if_global_registers_poll_status_inf3_reg
// Register phy_if_global_registers.poll_status_inf3: Results of polling engine
class phy_if_global_registers_poll_status_inf3_reg extends uvm_reg;

    // Variable: result_poll_link
    // result of poll link that will be sent to soft
    rand uvm_reg_field result_poll_link;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static phy_if_global_registers_poll_status_inf3_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    phy_if_global_registers_poll_status_inf3_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(phy_if_globals_reg_pkg::phy_if_global_registers_poll_status_inf3_reg)

    // Constructor: new
    function new(string name = "phy_if_global_registers_poll_status_inf3");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        result_poll_link = uvm_reg_field::type_id::create("result_poll_link", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        result_poll_link.configure(this, 12, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = phy_if_global_registers_poll_status_inf3_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = phy_if_global_registers_poll_status_inf3_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, result_poll_link.get_name, result_poll_link.value);
        return s;
    endfunction

endclass


// Class: phy_if_global_registers_poll_status_inf3_reg_cover
// Register coverage object.
class phy_if_global_registers_poll_status_inf3_reg_cover extends uvm_object;

    static local phy_if_global_registers_poll_status_inf3_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    phy_if_global_registers_poll_status_inf3_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        result_poll_link_wr: coverpoint r.result_poll_link.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        result_poll_link_rd: coverpoint r.result_poll_link.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(phy_if_globals_reg_pkg::phy_if_global_registers_poll_status_inf3_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="phy_if_global_registers_poll_status_inf3_reg_cover");
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
    static function phy_if_global_registers_poll_status_inf3_reg_cover get();
        if (m_inst == null) begin
            m_inst = phy_if_global_registers_poll_status_inf3_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(phy_if_global_registers_poll_status_inf3_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class phy_if_global_registers_poll_ctrl_reg_cover;

// Class: phy_if_global_registers_poll_ctrl_reg
// Register phy_if_global_registers.poll_ctrl: polling for sgmii copper phy altera
class phy_if_global_registers_poll_ctrl_reg extends uvm_reg;

    // Variable: enable_poll
    // The poll enable for status in pcs and xcvr.  This allows the FPGA to perform polling.
    rand uvm_reg_field enable_poll;
    // Variable: misc_ctrl
    // bit 0: disable avalon timeout, other bits not used.
    rand uvm_reg_field misc_ctrl;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static phy_if_global_registers_poll_ctrl_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    phy_if_global_registers_poll_ctrl_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(phy_if_globals_reg_pkg::phy_if_global_registers_poll_ctrl_reg)

    // Constructor: new
    function new(string name = "phy_if_global_registers_poll_ctrl");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        enable_poll = uvm_reg_field::type_id::create("enable_poll", , get_full_name());
        misc_ctrl = uvm_reg_field::type_id::create("misc_ctrl", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        enable_poll.configure(this, 1, 0, "rw", 0, 'h0, 1, 1, 0);
        misc_ctrl.configure(this, 4, 8, "rw", 0, 'h0, 1, 1, 0);
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
                cg = phy_if_global_registers_poll_ctrl_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = phy_if_global_registers_poll_ctrl_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, enable_poll.get_name, enable_poll.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, misc_ctrl.get_name, misc_ctrl.value);
        return s;
    endfunction

endclass


// Class: phy_if_global_registers_poll_ctrl_reg_cover
// Register coverage object.
class phy_if_global_registers_poll_ctrl_reg_cover extends uvm_object;

    static local phy_if_global_registers_poll_ctrl_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    phy_if_global_registers_poll_ctrl_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        enable_poll_wr: coverpoint r.enable_poll.value iff (!is_read);
        enable_poll_rd: coverpoint r.enable_poll.value iff  (is_read);
        misc_ctrl_wr: coverpoint r.misc_ctrl.value iff (!is_read);
        misc_ctrl_rd: coverpoint r.misc_ctrl.value iff  (is_read);
    endgroup

    `uvm_object_utils(phy_if_globals_reg_pkg::phy_if_global_registers_poll_ctrl_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="phy_if_global_registers_poll_ctrl_reg_cover");
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
    static function phy_if_global_registers_poll_ctrl_reg_cover get();
        if (m_inst == null) begin
            m_inst = phy_if_global_registers_poll_ctrl_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(phy_if_global_registers_poll_ctrl_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class phy_if_global_registers_poll_status_reg_cover;

// Class: phy_if_global_registers_poll_status_reg
// Register phy_if_global_registers.poll_status: polling for sgmii copper phy altera
class phy_if_global_registers_poll_status_reg extends uvm_reg;

    // Variable: poll_active
    // Polling activity bit. This bit will always return a 0 since to peform a read to the FPGA, the polling must be terminated so the activity is 0.
    rand uvm_reg_field poll_active;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static phy_if_global_registers_poll_status_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    phy_if_global_registers_poll_status_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(phy_if_globals_reg_pkg::phy_if_global_registers_poll_status_reg)

    // Constructor: new
    function new(string name = "phy_if_global_registers_poll_status");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        poll_active = uvm_reg_field::type_id::create("poll_active", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        poll_active.configure(this, 1, 4, "ro", 0, 'h0, 1, 1, 0);
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
                cg = phy_if_global_registers_poll_status_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = phy_if_global_registers_poll_status_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, poll_active.get_name, poll_active.value);
        return s;
    endfunction

endclass


// Class: phy_if_global_registers_poll_status_reg_cover
// Register coverage object.
class phy_if_global_registers_poll_status_reg_cover extends uvm_object;

    static local phy_if_global_registers_poll_status_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    phy_if_global_registers_poll_status_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        poll_active_wr: coverpoint r.poll_active.value iff (!is_read);
        poll_active_rd: coverpoint r.poll_active.value iff  (is_read);
    endgroup

    `uvm_object_utils(phy_if_globals_reg_pkg::phy_if_global_registers_poll_status_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="phy_if_global_registers_poll_status_reg_cover");
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
    static function phy_if_global_registers_poll_status_reg_cover get();
        if (m_inst == null) begin
            m_inst = phy_if_global_registers_poll_status_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(phy_if_global_registers_poll_status_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class phy_if_global_registers_phy_reset_reg_cover;

// Class: phy_if_global_registers_phy_reset_reg
// Register phy_if_global_registers.phy_reset: Reset phy
class phy_if_global_registers_phy_reset_reg extends uvm_reg;

    // Variable: ports
    // Individual reset for each port
    rand uvm_reg_field ports;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static phy_if_global_registers_phy_reset_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    phy_if_global_registers_phy_reset_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(phy_if_globals_reg_pkg::phy_if_global_registers_phy_reset_reg)

    // Constructor: new
    function new(string name = "phy_if_global_registers_phy_reset");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        ports = uvm_reg_field::type_id::create("ports", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        ports.configure(this, 12, 0, "rw", 0, 'h0, 1, 1, 0);
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
                cg = phy_if_global_registers_phy_reset_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = phy_if_global_registers_phy_reset_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, ports.get_name, ports.value);
        return s;
    endfunction

endclass


// Class: phy_if_global_registers_phy_reset_reg_cover
// Register coverage object.
class phy_if_global_registers_phy_reset_reg_cover extends uvm_object;

    static local phy_if_global_registers_phy_reset_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    phy_if_global_registers_phy_reset_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        ports_wr: coverpoint r.ports.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        ports_rd: coverpoint r.ports.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(phy_if_globals_reg_pkg::phy_if_global_registers_phy_reset_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="phy_if_global_registers_phy_reset_reg_cover");
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
    static function phy_if_global_registers_phy_reset_reg_cover get();
        if (m_inst == null) begin
            m_inst = phy_if_global_registers_phy_reset_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(phy_if_global_registers_phy_reset_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class phy_if_global_registers_force_local_link_fault_reg_cover;

// Class: phy_if_global_registers_force_local_link_fault_reg
// Register phy_if_global_registers.force_local_link_fault: force local link fault
class phy_if_global_registers_force_local_link_fault_reg extends uvm_reg;

    // Variable: port
    // Individual force local link fault for each port. 
    rand uvm_reg_field port;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static phy_if_global_registers_force_local_link_fault_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    phy_if_global_registers_force_local_link_fault_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(phy_if_globals_reg_pkg::phy_if_global_registers_force_local_link_fault_reg)

    // Constructor: new
    function new(string name = "phy_if_global_registers_force_local_link_fault");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        port = uvm_reg_field::type_id::create("port", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        port.configure(this, 12, 0, "rw", 0, 'h0, 1, 1, 0);
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
                cg = phy_if_global_registers_force_local_link_fault_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = phy_if_global_registers_force_local_link_fault_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, port.get_name, port.value);
        return s;
    endfunction

endclass


// Class: phy_if_global_registers_force_local_link_fault_reg_cover
// Register coverage object.
class phy_if_global_registers_force_local_link_fault_reg_cover extends uvm_object;

    static local phy_if_global_registers_force_local_link_fault_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    phy_if_global_registers_force_local_link_fault_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        port_wr: coverpoint r.port.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        port_rd: coverpoint r.port.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(phy_if_globals_reg_pkg::phy_if_global_registers_force_local_link_fault_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="phy_if_global_registers_force_local_link_fault_reg_cover");
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
    static function phy_if_global_registers_force_local_link_fault_reg_cover get();
        if (m_inst == null) begin
            m_inst = phy_if_global_registers_force_local_link_fault_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(phy_if_global_registers_force_local_link_fault_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class phy_if_global_registers_reconfig_ctrl_reg_cover;

// Class: phy_if_global_registers_reconfig_ctrl_reg
// Register phy_if_global_registers.reconfig_ctrl: reconfiguration of 1g/10g ports
class phy_if_global_registers_reconfig_ctrl_reg extends uvm_reg;

    // Variable: port_reconfig
    // shutdown polling
    rand uvm_reg_field port_reconfig;
    // Variable: port_typespeed_sel
    // 0: 10g ,1 : 1g
    rand uvm_reg_field port_typespeed_sel;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static phy_if_global_registers_reconfig_ctrl_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    phy_if_global_registers_reconfig_ctrl_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(phy_if_globals_reg_pkg::phy_if_global_registers_reconfig_ctrl_reg)

    // Constructor: new
    function new(string name = "phy_if_global_registers_reconfig_ctrl");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        port_reconfig = uvm_reg_field::type_id::create("port_reconfig", , get_full_name());
        port_typespeed_sel = uvm_reg_field::type_id::create("port_typespeed_sel", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        port_reconfig.configure(this, 12, 0, "rw", 0, 'h0, 1, 1, 0);
        port_typespeed_sel.configure(this, 12, 16, "rw", 0, 'h0, 1, 1, 0);
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
                cg = phy_if_global_registers_reconfig_ctrl_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = phy_if_global_registers_reconfig_ctrl_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, port_reconfig.get_name, port_reconfig.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port_typespeed_sel.get_name, port_typespeed_sel.value);
        return s;
    endfunction

endclass


// Class: phy_if_global_registers_reconfig_ctrl_reg_cover
// Register coverage object.
class phy_if_global_registers_reconfig_ctrl_reg_cover extends uvm_object;

    static local phy_if_global_registers_reconfig_ctrl_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    phy_if_global_registers_reconfig_ctrl_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        port_reconfig_wr: coverpoint r.port_reconfig.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        port_reconfig_rd: coverpoint r.port_reconfig.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        port_typespeed_sel_wr: coverpoint r.port_typespeed_sel.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        port_typespeed_sel_rd: coverpoint r.port_typespeed_sel.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(phy_if_globals_reg_pkg::phy_if_global_registers_reconfig_ctrl_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="phy_if_global_registers_reconfig_ctrl_reg_cover");
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
    static function phy_if_global_registers_reconfig_ctrl_reg_cover get();
        if (m_inst == null) begin
            m_inst = phy_if_global_registers_reconfig_ctrl_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(phy_if_global_registers_reconfig_ctrl_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class phy_if_global_registers_reconfig_status_reg_cover;

// Class: phy_if_global_registers_reconfig_status_reg
// Register phy_if_global_registers.reconfig_status: reconfiguration status of 1g/10g ports
class phy_if_global_registers_reconfig_status_reg extends uvm_reg;

    // Variable: reconfig_busy
    // 0: no reconfig in process ,1 : reconfig busy
    rand uvm_reg_field reconfig_busy;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static phy_if_global_registers_reconfig_status_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    phy_if_global_registers_reconfig_status_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(phy_if_globals_reg_pkg::phy_if_global_registers_reconfig_status_reg)

    // Constructor: new
    function new(string name = "phy_if_global_registers_reconfig_status");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        reconfig_busy = uvm_reg_field::type_id::create("reconfig_busy", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        reconfig_busy.configure(this, 1, 31, "ro", 0, 'h0, 1, 1, 0);
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
                cg = phy_if_global_registers_reconfig_status_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = phy_if_global_registers_reconfig_status_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, reconfig_busy.get_name, reconfig_busy.value);
        return s;
    endfunction

endclass


// Class: phy_if_global_registers_reconfig_status_reg_cover
// Register coverage object.
class phy_if_global_registers_reconfig_status_reg_cover extends uvm_object;

    static local phy_if_global_registers_reconfig_status_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    phy_if_global_registers_reconfig_status_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        reconfig_busy_wr: coverpoint r.reconfig_busy.value iff (!is_read);
        reconfig_busy_rd: coverpoint r.reconfig_busy.value iff  (is_read);
    endgroup

    `uvm_object_utils(phy_if_globals_reg_pkg::phy_if_global_registers_reconfig_status_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="phy_if_global_registers_reconfig_status_reg_cover");
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
    static function phy_if_global_registers_reconfig_status_reg_cover get();
        if (m_inst == null) begin
            m_inst = phy_if_global_registers_reconfig_status_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(phy_if_global_registers_reconfig_status_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class phy_if_global_registers_diag_1g_reg_cover;

// Class: phy_if_global_registers_diag_1g_reg
// Register phy_if_global_registers.diag_1g: Diagnostic status in 1G mode for ports 1 to 8
class phy_if_global_registers_diag_1g_reg extends uvm_reg;

    // Variable: rudi_c
    // The core is receiving /C/ ordered sets (Auto-Negotiation Configuration sequences) as defined in IEEE 802.3-2008 clause 36.2.4.10.
    rand uvm_reg_field rudi_c;
    // Variable: rudi_i
    // The core is receiving /I/ ordered sets (Idles) as defined in IEEE 802.3-2008 clause 36.2.4.12.
    rand uvm_reg_field rudi_i;
    // Variable: rudi_inv
    // The core has received invalid data while receiving/C/ or /I/ ordered set set as defined in IEEE 802.3-2008 clause 36.2.5.1.6. This can be caused, for example, by bit errors occurring in any clock cycle of the /C/ or /I/ ordered set.
    rand uvm_reg_field rudi_inv;
    // Variable: rxdisperr
    // The core has received a running disparity error during the 8B/10B decoding Function.
    rand uvm_reg_field rxdisperr;
    // Variable: rxnotintable
    // The core has received a code group which is not recognized from the 8B/10B coding tables.
    rand uvm_reg_field rxnotintable;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static phy_if_global_registers_diag_1g_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    phy_if_global_registers_diag_1g_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(phy_if_globals_reg_pkg::phy_if_global_registers_diag_1g_reg)

    // Constructor: new
    function new(string name = "phy_if_global_registers_diag_1g");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rudi_c = uvm_reg_field::type_id::create("rudi_c", , get_full_name());
        rudi_i = uvm_reg_field::type_id::create("rudi_i", , get_full_name());
        rudi_inv = uvm_reg_field::type_id::create("rudi_inv", , get_full_name());
        rxdisperr = uvm_reg_field::type_id::create("rxdisperr", , get_full_name());
        rxnotintable = uvm_reg_field::type_id::create("rxnotintable", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rudi_c.configure(this, 1, 0, "RO", 0, 'h0, 1, 1, 0);
        rudi_i.configure(this, 1, 1, "RO", 0, 'h0, 1, 1, 0);
        rudi_inv.configure(this, 1, 2, "RO", 0, 'h0, 1, 1, 0);
        rxdisperr.configure(this, 1, 3, "RO", 0, 'h0, 1, 1, 0);
        rxnotintable.configure(this, 1, 4, "RO", 0, 'h0, 1, 1, 0);
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
                cg = phy_if_global_registers_diag_1g_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = phy_if_global_registers_diag_1g_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rudi_c.get_name, rudi_c.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, rudi_i.get_name, rudi_i.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, rudi_inv.get_name, rudi_inv.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, rxdisperr.get_name, rxdisperr.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, rxnotintable.get_name, rxnotintable.value);
        return s;
    endfunction

endclass


// Class: phy_if_global_registers_diag_1g_reg_cover
// Register coverage object.
class phy_if_global_registers_diag_1g_reg_cover extends uvm_object;

    static local phy_if_global_registers_diag_1g_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    phy_if_global_registers_diag_1g_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rudi_c_wr: coverpoint r.rudi_c.value iff (!is_read);
        rudi_c_rd: coverpoint r.rudi_c.value iff  (is_read);
        rudi_i_wr: coverpoint r.rudi_i.value iff (!is_read);
        rudi_i_rd: coverpoint r.rudi_i.value iff  (is_read);
        rudi_inv_wr: coverpoint r.rudi_inv.value iff (!is_read);
        rudi_inv_rd: coverpoint r.rudi_inv.value iff  (is_read);
        rxdisperr_wr: coverpoint r.rxdisperr.value iff (!is_read);
        rxdisperr_rd: coverpoint r.rxdisperr.value iff  (is_read);
        rxnotintable_wr: coverpoint r.rxnotintable.value iff (!is_read);
        rxnotintable_rd: coverpoint r.rxnotintable.value iff  (is_read);
    endgroup

    `uvm_object_utils(phy_if_globals_reg_pkg::phy_if_global_registers_diag_1g_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="phy_if_global_registers_diag_1g_reg_cover");
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
    static function phy_if_global_registers_diag_1g_reg_cover get();
        if (m_inst == null) begin
            m_inst = phy_if_global_registers_diag_1g_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(phy_if_global_registers_diag_1g_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass





// Class: phy_if_globals_reg_block
// Register Block .phy_if_globals: 
class phy_if_globals_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand phy_if_global_registers_rgmii_reg rgmii;
    rand phy_if_global_registers_led_link_reg led_link;
    rand phy_if_global_registers_pll_10g_status_reg pll_10g_status;
    rand phy_if_global_registers_pll_1g_status_reg pll_1g_status;
    rand phy_if_global_registers_poll_status_inf1_reg poll_status_inf1;
    rand phy_if_global_registers_poll_status_inf2_reg poll_status_inf2;
    rand phy_if_global_registers_poll_status_inf3_reg poll_status_inf3;
    rand phy_if_global_registers_poll_ctrl_reg poll_ctrl;
    rand phy_if_global_registers_poll_status_reg poll_status;
    rand phy_if_global_registers_phy_reset_reg phy_reset;
    rand phy_if_global_registers_force_local_link_fault_reg force_local_link_fault;
    rand phy_if_global_registers_reconfig_ctrl_reg reconfig_ctrl;
    rand phy_if_global_registers_reconfig_status_reg reconfig_status;
    rand phy_if_global_registers_diag_1g_reg diag_1g[];

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(phy_if_globals_reg_pkg::phy_if_globals_reg_block)

    // Constructor: new
    function new(string name = "phy_if_globals_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        diag_1g = new[8];

        rgmii = phy_if_global_registers_rgmii_reg::type_id::create("rgmii", , get_full_name());
        led_link = phy_if_global_registers_led_link_reg::type_id::create("led_link", , get_full_name());
        pll_10g_status = phy_if_global_registers_pll_10g_status_reg::type_id::create("pll_10g_status", , get_full_name());
        pll_1g_status = phy_if_global_registers_pll_1g_status_reg::type_id::create("pll_1g_status", , get_full_name());
        poll_status_inf1 = phy_if_global_registers_poll_status_inf1_reg::type_id::create("poll_status_inf1", , get_full_name());
        poll_status_inf2 = phy_if_global_registers_poll_status_inf2_reg::type_id::create("poll_status_inf2", , get_full_name());
        poll_status_inf3 = phy_if_global_registers_poll_status_inf3_reg::type_id::create("poll_status_inf3", , get_full_name());
        poll_ctrl = phy_if_global_registers_poll_ctrl_reg::type_id::create("poll_ctrl", , get_full_name());
        poll_status = phy_if_global_registers_poll_status_reg::type_id::create("poll_status", , get_full_name());
        phy_reset = phy_if_global_registers_phy_reset_reg::type_id::create("phy_reset", , get_full_name());
        force_local_link_fault = phy_if_global_registers_force_local_link_fault_reg::type_id::create("force_local_link_fault", , get_full_name());
        reconfig_ctrl = phy_if_global_registers_reconfig_ctrl_reg::type_id::create("reconfig_ctrl", , get_full_name());
        reconfig_status = phy_if_global_registers_reconfig_status_reg::type_id::create("reconfig_status", , get_full_name());
        foreach(diag_1g[m]) begin
            diag_1g[m] = phy_if_global_registers_diag_1g_reg::type_id::create($sformatf("diag_1g[%0d]",m), , get_full_name());
        end

        rgmii.configure(this);
        led_link.configure(this);
        pll_10g_status.configure(this);
        pll_1g_status.configure(this);
        poll_status_inf1.configure(this);
        poll_status_inf2.configure(this);
        poll_status_inf3.configure(this);
        poll_ctrl.configure(this);
        poll_status.configure(this);
        phy_reset.configure(this);
        force_local_link_fault.configure(this);
        reconfig_ctrl.configure(this);
        reconfig_status.configure(this);
        foreach(diag_1g[m]) begin
            diag_1g[m].configure(this);
        end

        rgmii.build();
        led_link.build();
        pll_10g_status.build();
        pll_1g_status.build();
        poll_status_inf1.build();
        poll_status_inf2.build();
        poll_status_inf3.build();
        poll_ctrl.build();
        poll_status.build();
        phy_reset.build();
        force_local_link_fault.build();
        reconfig_ctrl.build();
        reconfig_status.build();
        foreach(diag_1g[m]) begin
            diag_1g[m].build();
        end

        // define default map
        default_map = create_map("phy_if_globals_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        this.default_map.add_reg(rgmii, 'h0, "RO");
        this.default_map.add_reg(led_link, 'h2, "RO");
        this.default_map.add_reg(pll_10g_status, 'h3, "RO");
        this.default_map.add_reg(pll_1g_status, 'h4, "RO");
        this.default_map.add_reg(poll_status_inf1, 'h5, "RO");
        this.default_map.add_reg(poll_status_inf2, 'h6, "RO");
        this.default_map.add_reg(poll_status_inf3, 'h7, "RO");
        this.default_map.add_reg(poll_ctrl, 'h9, "RW");
        this.default_map.add_reg(poll_status, 'hA, "RO");
        this.default_map.add_reg(phy_reset, 'hB, "RW");
        this.default_map.add_reg(force_local_link_fault, 'hC, "RW");
        this.default_map.add_reg(reconfig_ctrl, 'hD, "RW");
        this.default_map.add_reg(reconfig_status, 'hE, "RO");
        foreach(diag_1g[m]) begin
            this.default_map.add_reg(this.diag_1g[m], 'h10 + m, "RO");
        end

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
        rgmii.enable_coverage(is_on, this.cg_per_instance);
        led_link.enable_coverage(is_on, this.cg_per_instance);
        pll_10g_status.enable_coverage(is_on, this.cg_per_instance);
        pll_1g_status.enable_coverage(is_on, this.cg_per_instance);
        poll_status_inf1.enable_coverage(is_on, this.cg_per_instance);
        poll_status_inf2.enable_coverage(is_on, this.cg_per_instance);
        poll_status_inf3.enable_coverage(is_on, this.cg_per_instance);
        poll_ctrl.enable_coverage(is_on, this.cg_per_instance);
        poll_status.enable_coverage(is_on, this.cg_per_instance);
        phy_reset.enable_coverage(is_on, this.cg_per_instance);
        force_local_link_fault.enable_coverage(is_on, this.cg_per_instance);
        reconfig_ctrl.enable_coverage(is_on, this.cg_per_instance);
        reconfig_status.enable_coverage(is_on, this.cg_per_instance);
        foreach(diag_1g[m]) begin
            diag_1g[m].enable_coverage(is_on, this.cg_per_instance);
        end
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