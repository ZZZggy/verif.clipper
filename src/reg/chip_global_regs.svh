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
// Register definitions for chip_global register block.
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
// Group: chip_global
//---------------------------------------------------------

package chip_global_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;
    import port_input_cfg_reg_pkg::*;

typedef class globals_scratch_reg_cover;

// Class: globals_scratch_reg
// Register globals.scratch: Scratch pad register
class globals_scratch_reg extends uvm_reg;

    // Variable: scratch_val
    // 
    rand uvm_reg_field scratch_val;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_scratch_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_scratch_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_scratch_reg)

    // Constructor: new
    function new(string name = "globals_scratch");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        scratch_val = uvm_reg_field::type_id::create("scratch_val", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        scratch_val.configure(this, 32, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = globals_scratch_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_scratch_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, scratch_val.get_name, scratch_val.value);
        return s;
    endfunction

endclass


// Class: globals_scratch_reg_cover
// Register coverage object.
class globals_scratch_reg_cover extends uvm_object;

    static local globals_scratch_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_scratch_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        scratch_val_wr: coverpoint r.scratch_val.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        scratch_val_rd: coverpoint r.scratch_val.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_scratch_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_scratch_reg_cover");
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
    static function globals_scratch_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_scratch_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_scratch_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_mac_base_addr_reg_cover;

// Class: globals_mac_base_addr_reg
// Register globals.mac_base_addr: System MAC base address
class globals_mac_base_addr_reg extends uvm_reg;

    // Variable: nic
    // MAC base address NIC (23:0). MAC base address OUI (47:24) is hardcoded to Accedian OUI 0x0015AD.
    rand uvm_reg_field nic;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_mac_base_addr_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_mac_base_addr_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_mac_base_addr_reg)

    // Constructor: new
    function new(string name = "globals_mac_base_addr");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        nic = uvm_reg_field::type_id::create("nic", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        nic.configure(this, 24, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = globals_mac_base_addr_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_mac_base_addr_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, nic.get_name, nic.value);
        return s;
    endfunction

endclass


// Class: globals_mac_base_addr_reg_cover
// Register coverage object.
class globals_mac_base_addr_reg_cover extends uvm_object;

    static local globals_mac_base_addr_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_mac_base_addr_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        nic_wr: coverpoint r.nic.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        nic_rd: coverpoint r.nic.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_mac_base_addr_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_mac_base_addr_reg_cover");
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
    static function globals_mac_base_addr_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_mac_base_addr_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_mac_base_addr_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_cpu2if_port_shaper_debit_reg_cover;

// Class: globals_cpu2if_port_shaper_debit_reg
// Register globals.cpu2if_port_shaper_debit: CPU to interface port_shaper debit ctrl register
class globals_cpu2if_port_shaper_debit_reg extends uvm_reg;

    // Variable: cpu2if_port_shaper_debit_ena
    // CPU Packets debit port shaper per port.
    rand uvm_reg_field cpu2if_port_shaper_debit_ena;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_cpu2if_port_shaper_debit_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_cpu2if_port_shaper_debit_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_cpu2if_port_shaper_debit_reg)

    // Constructor: new
    function new(string name = "globals_cpu2if_port_shaper_debit");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        cpu2if_port_shaper_debit_ena = uvm_reg_field::type_id::create("cpu2if_port_shaper_debit_ena", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        cpu2if_port_shaper_debit_ena.configure(this, 12, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = globals_cpu2if_port_shaper_debit_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_cpu2if_port_shaper_debit_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, cpu2if_port_shaper_debit_ena.get_name, cpu2if_port_shaper_debit_ena.value);
        return s;
    endfunction

endclass


// Class: globals_cpu2if_port_shaper_debit_reg_cover
// Register coverage object.
class globals_cpu2if_port_shaper_debit_reg_cover extends uvm_object;

    static local globals_cpu2if_port_shaper_debit_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_cpu2if_port_shaper_debit_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        cpu2if_port_shaper_debit_ena_wr: coverpoint r.cpu2if_port_shaper_debit_ena.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        cpu2if_port_shaper_debit_ena_rd: coverpoint r.cpu2if_port_shaper_debit_ena.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_cpu2if_port_shaper_debit_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_cpu2if_port_shaper_debit_reg_cover");
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
    static function globals_cpu2if_port_shaper_debit_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_cpu2if_port_shaper_debit_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_cpu2if_port_shaper_debit_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_bw_attribs_reg_cover;

// Class: globals_bw_attribs_reg
// Register globals.bw_attribs: Bandwidth Control and Statistics Attributes
class globals_bw_attribs_reg extends uvm_reg;

    // Variable: phy_size_adjust_value
    // Physical layer size adjustment (bytes).
    rand uvm_reg_field phy_size_adjust_value;
    // Variable: phy_size_adjust_value_shaper
    // Shaper Physical layer (L1) size adjustment (bytes).       Defaults to L2 size: a 64B frame accounts for 64B.       For nominal 20B L1 overhead so that a 64B frame accounts for 84B, set to 0x14.
    rand uvm_reg_field phy_size_adjust_value_shaper;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_bw_attribs_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_bw_attribs_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_bw_attribs_reg)

    // Constructor: new
    function new(string name = "globals_bw_attribs");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        phy_size_adjust_value = uvm_reg_field::type_id::create("phy_size_adjust_value", , get_full_name());
        phy_size_adjust_value_shaper = uvm_reg_field::type_id::create("phy_size_adjust_value_shaper", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        phy_size_adjust_value.configure(this, 5, 0, "RW", 0, 'h0, 1, 1, 0);
        phy_size_adjust_value_shaper.configure(this, 5, 8, "RW", 0, 'h0, 1, 1, 0);
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
                cg = globals_bw_attribs_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_bw_attribs_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, phy_size_adjust_value.get_name, phy_size_adjust_value.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, phy_size_adjust_value_shaper.get_name, phy_size_adjust_value_shaper.value);
        return s;
    endfunction

endclass


// Class: globals_bw_attribs_reg_cover
// Register coverage object.
class globals_bw_attribs_reg_cover extends uvm_object;

    static local globals_bw_attribs_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_bw_attribs_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        phy_size_adjust_value_wr: coverpoint r.phy_size_adjust_value.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        phy_size_adjust_value_rd: coverpoint r.phy_size_adjust_value.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        phy_size_adjust_value_shaper_wr: coverpoint r.phy_size_adjust_value_shaper.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        phy_size_adjust_value_shaper_rd: coverpoint r.phy_size_adjust_value_shaper.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_bw_attribs_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_bw_attribs_reg_cover");
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
    static function globals_bw_attribs_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_bw_attribs_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_bw_attribs_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_link_status_mask_reg_cover;

// Class: globals_link_status_mask_reg
// Register globals.link_status_mask: Each bit position mask the link status notification for corresponding port
class globals_link_status_mask_reg extends uvm_reg;

    // Variable: port1_link_sta_mask
    // Port1 link status mask
    rand uvm_reg_field port1_link_sta_mask;
    // Variable: port2_link_sta_mask
    // Port2 link status mask
    rand uvm_reg_field port2_link_sta_mask;
    // Variable: port3_link_sta_mask
    // Port3 link status mask
    rand uvm_reg_field port3_link_sta_mask;
    // Variable: port4_link_sta_mask
    // Port4 link status mask
    rand uvm_reg_field port4_link_sta_mask;
    // Variable: port5_link_sta_mask
    // Port5 link status mask
    rand uvm_reg_field port5_link_sta_mask;
    // Variable: port6_link_sta_mask
    // Port6 link status mask
    rand uvm_reg_field port6_link_sta_mask;
    // Variable: port7_link_sta_mask
    // Port7 link status mask
    rand uvm_reg_field port7_link_sta_mask;
    // Variable: port8_link_sta_mask
    // Port8 link status mask
    rand uvm_reg_field port8_link_sta_mask;
    // Variable: port9_link_sta_mask
    // Port9 link status mask
    rand uvm_reg_field port9_link_sta_mask;
    // Variable: port10_link_sta_mask
    // Port10 link status mask
    rand uvm_reg_field port10_link_sta_mask;
    // Variable: port11_link_sta_mask
    // Port11 link status mask
    rand uvm_reg_field port11_link_sta_mask;
    // Variable: port12_link_sta_mask
    // Port12 link status mask
    rand uvm_reg_field port12_link_sta_mask;
    // Variable: port13_link_sta_mask
    // Port13 link status mask for management
    rand uvm_reg_field port13_link_sta_mask;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_link_status_mask_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_link_status_mask_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_link_status_mask_reg)

    // Constructor: new
    function new(string name = "globals_link_status_mask");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        port1_link_sta_mask = uvm_reg_field::type_id::create("port1_link_sta_mask", , get_full_name());
        port2_link_sta_mask = uvm_reg_field::type_id::create("port2_link_sta_mask", , get_full_name());
        port3_link_sta_mask = uvm_reg_field::type_id::create("port3_link_sta_mask", , get_full_name());
        port4_link_sta_mask = uvm_reg_field::type_id::create("port4_link_sta_mask", , get_full_name());
        port5_link_sta_mask = uvm_reg_field::type_id::create("port5_link_sta_mask", , get_full_name());
        port6_link_sta_mask = uvm_reg_field::type_id::create("port6_link_sta_mask", , get_full_name());
        port7_link_sta_mask = uvm_reg_field::type_id::create("port7_link_sta_mask", , get_full_name());
        port8_link_sta_mask = uvm_reg_field::type_id::create("port8_link_sta_mask", , get_full_name());
        port9_link_sta_mask = uvm_reg_field::type_id::create("port9_link_sta_mask", , get_full_name());
        port10_link_sta_mask = uvm_reg_field::type_id::create("port10_link_sta_mask", , get_full_name());
        port11_link_sta_mask = uvm_reg_field::type_id::create("port11_link_sta_mask", , get_full_name());
        port12_link_sta_mask = uvm_reg_field::type_id::create("port12_link_sta_mask", , get_full_name());
        port13_link_sta_mask = uvm_reg_field::type_id::create("port13_link_sta_mask", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        port1_link_sta_mask.configure(this, 1, 0, "RW", 0, 'h0, 1, 1, 0);
        port2_link_sta_mask.configure(this, 1, 1, "RW", 0, 'h0, 1, 1, 0);
        port3_link_sta_mask.configure(this, 1, 2, "RW", 0, 'h0, 1, 1, 0);
        port4_link_sta_mask.configure(this, 1, 3, "RW", 0, 'h0, 1, 1, 0);
        port5_link_sta_mask.configure(this, 1, 4, "RW", 0, 'h0, 1, 1, 0);
        port6_link_sta_mask.configure(this, 1, 5, "RW", 0, 'h0, 1, 1, 0);
        port7_link_sta_mask.configure(this, 1, 6, "RW", 0, 'h0, 1, 1, 0);
        port8_link_sta_mask.configure(this, 1, 7, "RW", 0, 'h0, 1, 1, 0);
        port9_link_sta_mask.configure(this, 1, 8, "RW", 0, 'h0, 1, 1, 0);
        port10_link_sta_mask.configure(this, 1, 9, "RW", 0, 'h0, 1, 1, 0);
        port11_link_sta_mask.configure(this, 1, 10, "RW", 0, 'h0, 1, 1, 0);
        port12_link_sta_mask.configure(this, 1, 11, "RW", 0, 'h0, 1, 1, 0);
        port13_link_sta_mask.configure(this, 1, 12, "RW", 0, 'h0, 1, 1, 0);
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
                cg = globals_link_status_mask_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_link_status_mask_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, port1_link_sta_mask.get_name, port1_link_sta_mask.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port2_link_sta_mask.get_name, port2_link_sta_mask.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port3_link_sta_mask.get_name, port3_link_sta_mask.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port4_link_sta_mask.get_name, port4_link_sta_mask.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port5_link_sta_mask.get_name, port5_link_sta_mask.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port6_link_sta_mask.get_name, port6_link_sta_mask.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port7_link_sta_mask.get_name, port7_link_sta_mask.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port8_link_sta_mask.get_name, port8_link_sta_mask.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port9_link_sta_mask.get_name, port9_link_sta_mask.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port10_link_sta_mask.get_name, port10_link_sta_mask.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port11_link_sta_mask.get_name, port11_link_sta_mask.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port12_link_sta_mask.get_name, port12_link_sta_mask.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port13_link_sta_mask.get_name, port13_link_sta_mask.value);
        return s;
    endfunction

endclass


// Class: globals_link_status_mask_reg_cover
// Register coverage object.
class globals_link_status_mask_reg_cover extends uvm_object;

    static local globals_link_status_mask_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_link_status_mask_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        port1_link_sta_mask_wr: coverpoint r.port1_link_sta_mask.value iff (!is_read);
        port1_link_sta_mask_rd: coverpoint r.port1_link_sta_mask.value iff  (is_read);
        port2_link_sta_mask_wr: coverpoint r.port2_link_sta_mask.value iff (!is_read);
        port2_link_sta_mask_rd: coverpoint r.port2_link_sta_mask.value iff  (is_read);
        port3_link_sta_mask_wr: coverpoint r.port3_link_sta_mask.value iff (!is_read);
        port3_link_sta_mask_rd: coverpoint r.port3_link_sta_mask.value iff  (is_read);
        port4_link_sta_mask_wr: coverpoint r.port4_link_sta_mask.value iff (!is_read);
        port4_link_sta_mask_rd: coverpoint r.port4_link_sta_mask.value iff  (is_read);
        port5_link_sta_mask_wr: coverpoint r.port5_link_sta_mask.value iff (!is_read);
        port5_link_sta_mask_rd: coverpoint r.port5_link_sta_mask.value iff  (is_read);
        port6_link_sta_mask_wr: coverpoint r.port6_link_sta_mask.value iff (!is_read);
        port6_link_sta_mask_rd: coverpoint r.port6_link_sta_mask.value iff  (is_read);
        port7_link_sta_mask_wr: coverpoint r.port7_link_sta_mask.value iff (!is_read);
        port7_link_sta_mask_rd: coverpoint r.port7_link_sta_mask.value iff  (is_read);
        port8_link_sta_mask_wr: coverpoint r.port8_link_sta_mask.value iff (!is_read);
        port8_link_sta_mask_rd: coverpoint r.port8_link_sta_mask.value iff  (is_read);
        port9_link_sta_mask_wr: coverpoint r.port9_link_sta_mask.value iff (!is_read);
        port9_link_sta_mask_rd: coverpoint r.port9_link_sta_mask.value iff  (is_read);
        port10_link_sta_mask_wr: coverpoint r.port10_link_sta_mask.value iff (!is_read);
        port10_link_sta_mask_rd: coverpoint r.port10_link_sta_mask.value iff  (is_read);
        port11_link_sta_mask_wr: coverpoint r.port11_link_sta_mask.value iff (!is_read);
        port11_link_sta_mask_rd: coverpoint r.port11_link_sta_mask.value iff  (is_read);
        port12_link_sta_mask_wr: coverpoint r.port12_link_sta_mask.value iff (!is_read);
        port12_link_sta_mask_rd: coverpoint r.port12_link_sta_mask.value iff  (is_read);
        port13_link_sta_mask_wr: coverpoint r.port13_link_sta_mask.value iff (!is_read);
        port13_link_sta_mask_rd: coverpoint r.port13_link_sta_mask.value iff  (is_read);
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_link_status_mask_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_link_status_mask_reg_cover");
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
    static function globals_link_status_mask_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_link_status_mask_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_link_status_mask_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_link_status_sw_reg_cover;

// Class: globals_link_status_sw_reg
// Register globals.link_status_sw: Indicates lasted known link status from software (0: down, 1: up)
class globals_link_status_sw_reg extends uvm_reg;

    // Variable: port1_link_sta_sw
    // Port1 link status as known by SW
    rand uvm_reg_field port1_link_sta_sw;
    // Variable: port2_link_sta_sw
    // Port2 link status as known by SW
    rand uvm_reg_field port2_link_sta_sw;
    // Variable: port3_link_sta_sw
    // Port3 link status as known by SW
    rand uvm_reg_field port3_link_sta_sw;
    // Variable: port4_link_sta_sw
    // Port4 link status as known by SW
    rand uvm_reg_field port4_link_sta_sw;
    // Variable: port5_link_sta_sw
    // Port5 link status as known by SW
    rand uvm_reg_field port5_link_sta_sw;
    // Variable: port6_link_sta_sw
    // Port6 link status sw
    rand uvm_reg_field port6_link_sta_sw;
    // Variable: port7_link_sta_sw
    // Port7 link status sw
    rand uvm_reg_field port7_link_sta_sw;
    // Variable: port8_link_sta_sw
    // Port8 link status sw
    rand uvm_reg_field port8_link_sta_sw;
    // Variable: port9_link_sta_sw
    // Port9 link status sw
    rand uvm_reg_field port9_link_sta_sw;
    // Variable: port10_link_sta_sw
    // Port10 link status sw
    rand uvm_reg_field port10_link_sta_sw;
    // Variable: port11_link_sta_sw
    // Port11 link status sw
    rand uvm_reg_field port11_link_sta_sw;
    // Variable: port12_link_sta_sw
    // Port12 link status sw
    rand uvm_reg_field port12_link_sta_sw;
    // Variable: port13_link_sta_sw
    // Port13 link status sw for management
    rand uvm_reg_field port13_link_sta_sw;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_link_status_sw_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_link_status_sw_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_link_status_sw_reg)

    // Constructor: new
    function new(string name = "globals_link_status_sw");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        port1_link_sta_sw = uvm_reg_field::type_id::create("port1_link_sta_sw", , get_full_name());
        port2_link_sta_sw = uvm_reg_field::type_id::create("port2_link_sta_sw", , get_full_name());
        port3_link_sta_sw = uvm_reg_field::type_id::create("port3_link_sta_sw", , get_full_name());
        port4_link_sta_sw = uvm_reg_field::type_id::create("port4_link_sta_sw", , get_full_name());
        port5_link_sta_sw = uvm_reg_field::type_id::create("port5_link_sta_sw", , get_full_name());
        port6_link_sta_sw = uvm_reg_field::type_id::create("port6_link_sta_sw", , get_full_name());
        port7_link_sta_sw = uvm_reg_field::type_id::create("port7_link_sta_sw", , get_full_name());
        port8_link_sta_sw = uvm_reg_field::type_id::create("port8_link_sta_sw", , get_full_name());
        port9_link_sta_sw = uvm_reg_field::type_id::create("port9_link_sta_sw", , get_full_name());
        port10_link_sta_sw = uvm_reg_field::type_id::create("port10_link_sta_sw", , get_full_name());
        port11_link_sta_sw = uvm_reg_field::type_id::create("port11_link_sta_sw", , get_full_name());
        port12_link_sta_sw = uvm_reg_field::type_id::create("port12_link_sta_sw", , get_full_name());
        port13_link_sta_sw = uvm_reg_field::type_id::create("port13_link_sta_sw", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        port1_link_sta_sw.configure(this, 1, 0, "RW", 0, 'h0, 1, 1, 0);
        port2_link_sta_sw.configure(this, 1, 1, "RW", 0, 'h0, 1, 1, 0);
        port3_link_sta_sw.configure(this, 1, 2, "RW", 0, 'h0, 1, 1, 0);
        port4_link_sta_sw.configure(this, 1, 3, "RW", 0, 'h0, 1, 1, 0);
        port5_link_sta_sw.configure(this, 1, 4, "RW", 0, 'h0, 1, 1, 0);
        port6_link_sta_sw.configure(this, 1, 5, "RW", 0, 'h0, 1, 1, 0);
        port7_link_sta_sw.configure(this, 1, 6, "RW", 0, 'h0, 1, 1, 0);
        port8_link_sta_sw.configure(this, 1, 7, "RW", 0, 'h0, 1, 1, 0);
        port9_link_sta_sw.configure(this, 1, 8, "RW", 0, 'h0, 1, 1, 0);
        port10_link_sta_sw.configure(this, 1, 9, "RW", 0, 'h0, 1, 1, 0);
        port11_link_sta_sw.configure(this, 1, 10, "RW", 0, 'h0, 1, 1, 0);
        port12_link_sta_sw.configure(this, 1, 11, "RW", 0, 'h0, 1, 1, 0);
        port13_link_sta_sw.configure(this, 1, 12, "RW", 0, 'h0, 1, 1, 0);
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
                cg = globals_link_status_sw_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_link_status_sw_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, port1_link_sta_sw.get_name, port1_link_sta_sw.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port2_link_sta_sw.get_name, port2_link_sta_sw.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port3_link_sta_sw.get_name, port3_link_sta_sw.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port4_link_sta_sw.get_name, port4_link_sta_sw.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port5_link_sta_sw.get_name, port5_link_sta_sw.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port6_link_sta_sw.get_name, port6_link_sta_sw.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port7_link_sta_sw.get_name, port7_link_sta_sw.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port8_link_sta_sw.get_name, port8_link_sta_sw.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port9_link_sta_sw.get_name, port9_link_sta_sw.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port10_link_sta_sw.get_name, port10_link_sta_sw.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port11_link_sta_sw.get_name, port11_link_sta_sw.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port12_link_sta_sw.get_name, port12_link_sta_sw.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port13_link_sta_sw.get_name, port13_link_sta_sw.value);
        return s;
    endfunction

endclass


// Class: globals_link_status_sw_reg_cover
// Register coverage object.
class globals_link_status_sw_reg_cover extends uvm_object;

    static local globals_link_status_sw_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_link_status_sw_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        port1_link_sta_sw_wr: coverpoint r.port1_link_sta_sw.value iff (!is_read);
        port1_link_sta_sw_rd: coverpoint r.port1_link_sta_sw.value iff  (is_read);
        port2_link_sta_sw_wr: coverpoint r.port2_link_sta_sw.value iff (!is_read);
        port2_link_sta_sw_rd: coverpoint r.port2_link_sta_sw.value iff  (is_read);
        port3_link_sta_sw_wr: coverpoint r.port3_link_sta_sw.value iff (!is_read);
        port3_link_sta_sw_rd: coverpoint r.port3_link_sta_sw.value iff  (is_read);
        port4_link_sta_sw_wr: coverpoint r.port4_link_sta_sw.value iff (!is_read);
        port4_link_sta_sw_rd: coverpoint r.port4_link_sta_sw.value iff  (is_read);
        port5_link_sta_sw_wr: coverpoint r.port5_link_sta_sw.value iff (!is_read);
        port5_link_sta_sw_rd: coverpoint r.port5_link_sta_sw.value iff  (is_read);
        port6_link_sta_sw_wr: coverpoint r.port6_link_sta_sw.value iff (!is_read);
        port6_link_sta_sw_rd: coverpoint r.port6_link_sta_sw.value iff  (is_read);
        port7_link_sta_sw_wr: coverpoint r.port7_link_sta_sw.value iff (!is_read);
        port7_link_sta_sw_rd: coverpoint r.port7_link_sta_sw.value iff  (is_read);
        port8_link_sta_sw_wr: coverpoint r.port8_link_sta_sw.value iff (!is_read);
        port8_link_sta_sw_rd: coverpoint r.port8_link_sta_sw.value iff  (is_read);
        port9_link_sta_sw_wr: coverpoint r.port9_link_sta_sw.value iff (!is_read);
        port9_link_sta_sw_rd: coverpoint r.port9_link_sta_sw.value iff  (is_read);
        port10_link_sta_sw_wr: coverpoint r.port10_link_sta_sw.value iff (!is_read);
        port10_link_sta_sw_rd: coverpoint r.port10_link_sta_sw.value iff  (is_read);
        port11_link_sta_sw_wr: coverpoint r.port11_link_sta_sw.value iff (!is_read);
        port11_link_sta_sw_rd: coverpoint r.port11_link_sta_sw.value iff  (is_read);
        port12_link_sta_sw_wr: coverpoint r.port12_link_sta_sw.value iff (!is_read);
        port12_link_sta_sw_rd: coverpoint r.port12_link_sta_sw.value iff  (is_read);
        port13_link_sta_sw_wr: coverpoint r.port13_link_sta_sw.value iff (!is_read);
        port13_link_sta_sw_rd: coverpoint r.port13_link_sta_sw.value iff  (is_read);
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_link_status_sw_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_link_status_sw_reg_cover");
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
    static function globals_link_status_sw_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_link_status_sw_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_link_status_sw_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_mon_cfg_reg_cover;

// Class: globals_mon_cfg_reg
// Register globals.mon_cfg: 
class globals_mon_cfg_reg extends uvm_reg;

    // Variable: mon1_port
    // NOT USED. Monitor-1 is connected on port-12 only
    rand uvm_reg_field mon1_port;
    // Variable: mon1_ena
    // 
    rand uvm_reg_field mon1_ena;
    // Variable: mon2_port
    // NOT USED. Monitor-2 is connected on port-8 only
    rand uvm_reg_field mon2_port;
    // Variable: mon2_ena
    // 
    rand uvm_reg_field mon2_ena;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_mon_cfg_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_mon_cfg_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_mon_cfg_reg)

    // Constructor: new
    function new(string name = "globals_mon_cfg");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        mon1_port = uvm_reg_field::type_id::create("mon1_port", , get_full_name());
        mon1_ena = uvm_reg_field::type_id::create("mon1_ena", , get_full_name());
        mon2_port = uvm_reg_field::type_id::create("mon2_port", , get_full_name());
        mon2_ena = uvm_reg_field::type_id::create("mon2_ena", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        mon1_port.configure(this, 4, 0, "RW", 0, 'hC, 1, 1, 0);
        mon1_ena.configure(this, 1, 4, "RW", 0, 'h0, 1, 1, 0);
        mon2_port.configure(this, 4, 8, "RW", 0, 'h8, 1, 1, 0);
        mon2_ena.configure(this, 1, 12, "RW", 0, 'h0, 1, 1, 0);
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
                cg = globals_mon_cfg_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_mon_cfg_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, mon1_port.get_name, mon1_port.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, mon1_ena.get_name, mon1_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, mon2_port.get_name, mon2_port.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, mon2_ena.get_name, mon2_ena.value);
        return s;
    endfunction

endclass


// Class: globals_mon_cfg_reg_cover
// Register coverage object.
class globals_mon_cfg_reg_cover extends uvm_object;

    static local globals_mon_cfg_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_mon_cfg_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        mon1_port_wr: coverpoint r.mon1_port.value iff (!is_read);
        mon1_port_rd: coverpoint r.mon1_port.value iff  (is_read);
        mon1_ena_wr: coverpoint r.mon1_ena.value iff (!is_read);
        mon1_ena_rd: coverpoint r.mon1_ena.value iff  (is_read);
        mon2_port_wr: coverpoint r.mon2_port.value iff (!is_read);
        mon2_port_rd: coverpoint r.mon2_port.value iff  (is_read);
        mon2_ena_wr: coverpoint r.mon2_ena.value iff (!is_read);
        mon2_ena_rd: coverpoint r.mon2_ena.value iff  (is_read);
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_mon_cfg_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_mon_cfg_reg_cover");
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
    static function globals_mon_cfg_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_mon_cfg_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_mon_cfg_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_tlcs_reg_cover;

// Class: globals_tlcs_reg
// Register globals.tlcs: Test of Locally Created Services
class globals_tlcs_reg extends uvm_reg;

    // Variable: port1_loopback_ena
    // port1 loopback enable
    rand uvm_reg_field port1_loopback_ena;
    // Variable: port2_loopback_ena
    // port2 loopback enable
    rand uvm_reg_field port2_loopback_ena;
    // Variable: port3_loopback_ena
    // port3 loopback enable
    rand uvm_reg_field port3_loopback_ena;
    // Variable: port4_loopback_ena
    // port4 loopback enable
    rand uvm_reg_field port4_loopback_ena;
    // Variable: port5_loopback_ena
    // port5 loopback enable
    rand uvm_reg_field port5_loopback_ena;
    // Variable: port6_loopback_ena
    // port6 loopback enable
    rand uvm_reg_field port6_loopback_ena;
    // Variable: port7_loopback_ena
    // port7 loopback enable
    rand uvm_reg_field port7_loopback_ena;
    // Variable: port8_loopback_ena
    // port8 loopback enable
    rand uvm_reg_field port8_loopback_ena;
    // Variable: port9_loopback_ena
    // port9 loopback enable
    rand uvm_reg_field port9_loopback_ena;
    // Variable: port10_loopback_ena
    // port10 loopback enable
    rand uvm_reg_field port10_loopback_ena;
    // Variable: port11_loopback_ena
    // port11 loopback enable
    rand uvm_reg_field port11_loopback_ena;
    // Variable: port12_loopback_ena
    // port12 loopback enable
    rand uvm_reg_field port12_loopback_ena;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_tlcs_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_tlcs_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_tlcs_reg)

    // Constructor: new
    function new(string name = "globals_tlcs");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        port1_loopback_ena = uvm_reg_field::type_id::create("port1_loopback_ena", , get_full_name());
        port2_loopback_ena = uvm_reg_field::type_id::create("port2_loopback_ena", , get_full_name());
        port3_loopback_ena = uvm_reg_field::type_id::create("port3_loopback_ena", , get_full_name());
        port4_loopback_ena = uvm_reg_field::type_id::create("port4_loopback_ena", , get_full_name());
        port5_loopback_ena = uvm_reg_field::type_id::create("port5_loopback_ena", , get_full_name());
        port6_loopback_ena = uvm_reg_field::type_id::create("port6_loopback_ena", , get_full_name());
        port7_loopback_ena = uvm_reg_field::type_id::create("port7_loopback_ena", , get_full_name());
        port8_loopback_ena = uvm_reg_field::type_id::create("port8_loopback_ena", , get_full_name());
        port9_loopback_ena = uvm_reg_field::type_id::create("port9_loopback_ena", , get_full_name());
        port10_loopback_ena = uvm_reg_field::type_id::create("port10_loopback_ena", , get_full_name());
        port11_loopback_ena = uvm_reg_field::type_id::create("port11_loopback_ena", , get_full_name());
        port12_loopback_ena = uvm_reg_field::type_id::create("port12_loopback_ena", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        port1_loopback_ena.configure(this, 1, 0, "RW", 0, 'h0, 1, 1, 0);
        port2_loopback_ena.configure(this, 1, 1, "RW", 0, 'h0, 1, 1, 0);
        port3_loopback_ena.configure(this, 1, 2, "RW", 0, 'h0, 1, 1, 0);
        port4_loopback_ena.configure(this, 1, 3, "RW", 0, 'h0, 1, 1, 0);
        port5_loopback_ena.configure(this, 1, 4, "RW", 0, 'h0, 1, 1, 0);
        port6_loopback_ena.configure(this, 1, 5, "RW", 0, 'h0, 1, 1, 0);
        port7_loopback_ena.configure(this, 1, 6, "RW", 0, 'h0, 1, 1, 0);
        port8_loopback_ena.configure(this, 1, 7, "RW", 0, 'h0, 1, 1, 0);
        port9_loopback_ena.configure(this, 1, 8, "RW", 0, 'h0, 1, 1, 0);
        port10_loopback_ena.configure(this, 1, 9, "RW", 0, 'h0, 1, 1, 0);
        port11_loopback_ena.configure(this, 1, 10, "RW", 0, 'h0, 1, 1, 0);
        port12_loopback_ena.configure(this, 1, 11, "RW", 0, 'h0, 1, 1, 0);
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
                cg = globals_tlcs_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_tlcs_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, port1_loopback_ena.get_name, port1_loopback_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port2_loopback_ena.get_name, port2_loopback_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port3_loopback_ena.get_name, port3_loopback_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port4_loopback_ena.get_name, port4_loopback_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port5_loopback_ena.get_name, port5_loopback_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port6_loopback_ena.get_name, port6_loopback_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port7_loopback_ena.get_name, port7_loopback_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port8_loopback_ena.get_name, port8_loopback_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port9_loopback_ena.get_name, port9_loopback_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port10_loopback_ena.get_name, port10_loopback_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port11_loopback_ena.get_name, port11_loopback_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port12_loopback_ena.get_name, port12_loopback_ena.value);
        return s;
    endfunction

endclass


// Class: globals_tlcs_reg_cover
// Register coverage object.
class globals_tlcs_reg_cover extends uvm_object;

    static local globals_tlcs_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_tlcs_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        port1_loopback_ena_wr: coverpoint r.port1_loopback_ena.value iff (!is_read);
        port1_loopback_ena_rd: coverpoint r.port1_loopback_ena.value iff  (is_read);
        port2_loopback_ena_wr: coverpoint r.port2_loopback_ena.value iff (!is_read);
        port2_loopback_ena_rd: coverpoint r.port2_loopback_ena.value iff  (is_read);
        port3_loopback_ena_wr: coverpoint r.port3_loopback_ena.value iff (!is_read);
        port3_loopback_ena_rd: coverpoint r.port3_loopback_ena.value iff  (is_read);
        port4_loopback_ena_wr: coverpoint r.port4_loopback_ena.value iff (!is_read);
        port4_loopback_ena_rd: coverpoint r.port4_loopback_ena.value iff  (is_read);
        port5_loopback_ena_wr: coverpoint r.port5_loopback_ena.value iff (!is_read);
        port5_loopback_ena_rd: coverpoint r.port5_loopback_ena.value iff  (is_read);
        port6_loopback_ena_wr: coverpoint r.port6_loopback_ena.value iff (!is_read);
        port6_loopback_ena_rd: coverpoint r.port6_loopback_ena.value iff  (is_read);
        port7_loopback_ena_wr: coverpoint r.port7_loopback_ena.value iff (!is_read);
        port7_loopback_ena_rd: coverpoint r.port7_loopback_ena.value iff  (is_read);
        port8_loopback_ena_wr: coverpoint r.port8_loopback_ena.value iff (!is_read);
        port8_loopback_ena_rd: coverpoint r.port8_loopback_ena.value iff  (is_read);
        port9_loopback_ena_wr: coverpoint r.port9_loopback_ena.value iff (!is_read);
        port9_loopback_ena_rd: coverpoint r.port9_loopback_ena.value iff  (is_read);
        port10_loopback_ena_wr: coverpoint r.port10_loopback_ena.value iff (!is_read);
        port10_loopback_ena_rd: coverpoint r.port10_loopback_ena.value iff  (is_read);
        port11_loopback_ena_wr: coverpoint r.port11_loopback_ena.value iff (!is_read);
        port11_loopback_ena_rd: coverpoint r.port11_loopback_ena.value iff  (is_read);
        port12_loopback_ena_wr: coverpoint r.port12_loopback_ena.value iff (!is_read);
        port12_loopback_ena_rd: coverpoint r.port12_loopback_ena.value iff  (is_read);
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_tlcs_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_tlcs_reg_cover");
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
    static function globals_tlcs_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_tlcs_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_tlcs_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_tbb_nni_level_reg_cover;

// Class: globals_tbb_nni_level_reg
// Register globals.tbb_nni_level: Set afull and watermark level for traffic buffer block NNI
class globals_tbb_nni_level_reg extends uvm_reg;

    // Variable: afull
    // afull level for each NNI for the TM queue
    rand uvm_reg_field afull;
    // Variable: store_and_forward
    // store_and_forward watermark level for each NNI for the TM queue
    rand uvm_reg_field store_and_forward;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_tbb_nni_level_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_tbb_nni_level_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_tbb_nni_level_reg)

    // Constructor: new
    function new(string name = "globals_tbb_nni_level");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        afull = uvm_reg_field::type_id::create("afull", , get_full_name());
        store_and_forward = uvm_reg_field::type_id::create("store_and_forward", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        afull.configure(this, 16, 0, "RW", 0, 'h600, 1, 1, 0);
        store_and_forward.configure(this, 16, 16, "RW", 0, 'h7FF, 1, 1, 0);
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
                cg = globals_tbb_nni_level_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_tbb_nni_level_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, afull.get_name, afull.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, store_and_forward.get_name, store_and_forward.value);
        return s;
    endfunction

endclass


// Class: globals_tbb_nni_level_reg_cover
// Register coverage object.
class globals_tbb_nni_level_reg_cover extends uvm_object;

    static local globals_tbb_nni_level_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_tbb_nni_level_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        afull_wr: coverpoint r.afull.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        afull_rd: coverpoint r.afull.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        store_and_forward_wr: coverpoint r.store_and_forward.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        store_and_forward_rd: coverpoint r.store_and_forward.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_tbb_nni_level_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_tbb_nni_level_reg_cover");
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
    static function globals_tbb_nni_level_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_tbb_nni_level_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_tbb_nni_level_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_tbb_uni_10g_level_reg_cover;

// Class: globals_tbb_uni_10g_level_reg
// Register globals.tbb_uni_10g_level: Set afull and watermark level for traffic buffer block UNI 10G
class globals_tbb_uni_10g_level_reg extends uvm_reg;

    // Variable: afull
    // afull level for each 10G UNI for the TM queue
    rand uvm_reg_field afull;
    // Variable: store_and_forward
    // store_and_forward watermark level for each 10G UNI for the TM queue
    rand uvm_reg_field store_and_forward;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_tbb_uni_10g_level_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_tbb_uni_10g_level_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_tbb_uni_10g_level_reg)

    // Constructor: new
    function new(string name = "globals_tbb_uni_10g_level");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        afull = uvm_reg_field::type_id::create("afull", , get_full_name());
        store_and_forward = uvm_reg_field::type_id::create("store_and_forward", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        afull.configure(this, 16, 0, "RW", 0, 'h600, 1, 1, 0);
        store_and_forward.configure(this, 16, 16, "RW", 0, 'h7FF, 1, 1, 0);
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
                cg = globals_tbb_uni_10g_level_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_tbb_uni_10g_level_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, afull.get_name, afull.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, store_and_forward.get_name, store_and_forward.value);
        return s;
    endfunction

endclass


// Class: globals_tbb_uni_10g_level_reg_cover
// Register coverage object.
class globals_tbb_uni_10g_level_reg_cover extends uvm_object;

    static local globals_tbb_uni_10g_level_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_tbb_uni_10g_level_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        afull_wr: coverpoint r.afull.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        afull_rd: coverpoint r.afull.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        store_and_forward_wr: coverpoint r.store_and_forward.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        store_and_forward_rd: coverpoint r.store_and_forward.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_tbb_uni_10g_level_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_tbb_uni_10g_level_reg_cover");
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
    static function globals_tbb_uni_10g_level_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_tbb_uni_10g_level_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_tbb_uni_10g_level_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_tbb_uni_1g_level_reg_cover;

// Class: globals_tbb_uni_1g_level_reg
// Register globals.tbb_uni_1g_level: Set afull and watermark level for traffic buffer block UNI 1G
class globals_tbb_uni_1g_level_reg extends uvm_reg;

    // Variable: afull
    // afull level for each 1G UNI for the TM queue
    rand uvm_reg_field afull;
    // Variable: store_and_forward
    // store_and_forward watermark level for each 1G UNI for the TM queue
    rand uvm_reg_field store_and_forward;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_tbb_uni_1g_level_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_tbb_uni_1g_level_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_tbb_uni_1g_level_reg)

    // Constructor: new
    function new(string name = "globals_tbb_uni_1g_level");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        afull = uvm_reg_field::type_id::create("afull", , get_full_name());
        store_and_forward = uvm_reg_field::type_id::create("store_and_forward", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        afull.configure(this, 16, 0, "RW", 0, 'h600, 1, 1, 0);
        store_and_forward.configure(this, 16, 16, "RW", 0, 'h7FF, 1, 1, 0);
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
                cg = globals_tbb_uni_1g_level_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_tbb_uni_1g_level_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, afull.get_name, afull.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, store_and_forward.get_name, store_and_forward.value);
        return s;
    endfunction

endclass


// Class: globals_tbb_uni_1g_level_reg_cover
// Register coverage object.
class globals_tbb_uni_1g_level_reg_cover extends uvm_object;

    static local globals_tbb_uni_1g_level_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_tbb_uni_1g_level_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        afull_wr: coverpoint r.afull.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        afull_rd: coverpoint r.afull.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        store_and_forward_wr: coverpoint r.store_and_forward.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        store_and_forward_rd: coverpoint r.store_and_forward.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_tbb_uni_1g_level_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_tbb_uni_1g_level_reg_cover");
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
    static function globals_tbb_uni_1g_level_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_tbb_uni_1g_level_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_tbb_uni_1g_level_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_hidden_rules_version_reg_cover;

// Class: globals_hidden_rules_version_reg
// Register globals.hidden_rules_version: Hidden rules version
class globals_hidden_rules_version_reg extends uvm_reg;

    // Variable: sub_minor
    // Decimal of sub-minor version
    rand uvm_reg_field sub_minor;
    // Variable: minor
    // Decimal of minor version
    rand uvm_reg_field minor;
    // Variable: major
    // Decimal of major version
    rand uvm_reg_field major;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_hidden_rules_version_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_hidden_rules_version_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_hidden_rules_version_reg)

    // Constructor: new
    function new(string name = "globals_hidden_rules_version");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        sub_minor = uvm_reg_field::type_id::create("sub_minor", , get_full_name());
        minor = uvm_reg_field::type_id::create("minor", , get_full_name());
        major = uvm_reg_field::type_id::create("major", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        sub_minor.configure(this, 4, 0, "RO", 0, 'h0, 1, 1, 0);
        minor.configure(this, 4, 4, "RO", 0, 'h5, 1, 1, 0);
        major.configure(this, 4, 8, "RO", 0, 'h2, 1, 1, 0);
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
                cg = globals_hidden_rules_version_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_hidden_rules_version_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, sub_minor.get_name, sub_minor.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, minor.get_name, minor.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, major.get_name, major.value);
        return s;
    endfunction

endclass


// Class: globals_hidden_rules_version_reg_cover
// Register coverage object.
class globals_hidden_rules_version_reg_cover extends uvm_object;

    static local globals_hidden_rules_version_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_hidden_rules_version_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        sub_minor_wr: coverpoint r.sub_minor.value iff (!is_read);
        sub_minor_rd: coverpoint r.sub_minor.value iff  (is_read);
        minor_wr: coverpoint r.minor.value iff (!is_read);
        minor_rd: coverpoint r.minor.value iff  (is_read);
        major_wr: coverpoint r.major.value iff (!is_read);
        major_rd: coverpoint r.major.value iff  (is_read);
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_hidden_rules_version_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_hidden_rules_version_reg_cover");
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
    static function globals_hidden_rules_version_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_hidden_rules_version_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_hidden_rules_version_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_class_scanmode_reg_cover;

// Class: globals_class_scanmode_reg
// Register globals.class_scanmode: 
class globals_class_scanmode_reg extends uvm_reg;

    // Variable: scan_1g
    // Classifier 5678 mode in 1g/10g scanning mode
    rand uvm_reg_field scan_1g;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_class_scanmode_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_class_scanmode_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_class_scanmode_reg)

    // Constructor: new
    function new(string name = "globals_class_scanmode");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        scan_1g = uvm_reg_field::type_id::create("scan_1g", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        scan_1g.configure(this, 4, 0, "RO", 0, 'hF, 1, 1, 0);
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
                cg = globals_class_scanmode_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_class_scanmode_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, scan_1g.get_name, scan_1g.value);
        return s;
    endfunction

endclass


// Class: globals_class_scanmode_reg_cover
// Register coverage object.
class globals_class_scanmode_reg_cover extends uvm_object;

    static local globals_class_scanmode_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_class_scanmode_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        scan_1g_wr: coverpoint r.scan_1g.value iff (!is_read);
        scan_1g_rd: coverpoint r.scan_1g.value iff  (is_read);
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_class_scanmode_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_class_scanmode_reg_cover");
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
    static function globals_class_scanmode_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_class_scanmode_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_class_scanmode_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_global_input_cfg_0_reg_cover;

// Class: globals_global_input_cfg_0_reg
// Register globals.global_input_cfg_0: Global Hidden CPU Rules &amp; other Classifier configuration register 0
class globals_global_input_cfg_0_reg extends uvm_reg;

    // Variable: user_vlan_ethertype
    // Extract &amp; Classifier (rules) &amp; PUSH
    rand uvm_reg_field user_vlan_ethertype;
    // Variable: s_vlan_t_vlan_ethertype_swap
    // Swaps the ethertype (TPID) normally associated to S-Tag (vlan_type 1) with the ethertype (TPID) normally associated to T-Tag (vlan_type 2).
    rand uvm_reg_field s_vlan_t_vlan_ethertype_swap;
    // Variable: system_acp_md_level
    // Used in ACP CPU Hidden Rule
    rand uvm_reg_field system_acp_md_level;
    // Variable: soam_lbm_rule_vlan_aware_ena
    // SOAM_LBM CPU Hidden Rule VLAN awareness enable
    rand uvm_reg_field soam_lbm_rule_vlan_aware_ena;
    // Variable: acd_lbm_rule_vlan_aware_ena
    // ACD_LBM CPU Hidden Rule VLAN awareness enable
    rand uvm_reg_field acd_lbm_rule_vlan_aware_ena;
    // Variable: acd_lbr_tst_leak_rule_vlan_aware_ena
    // ACD_LBR_TST_Leak CPU Hidden Rule vlan_aware enable
    rand uvm_reg_field acd_lbr_tst_leak_rule_vlan_aware_ena;
    // Variable: cfm_unicast_123_rule_vlan_aware_ena
    // CFM_Unicast CPU Hidden Rule sub-rules 1,2,3 vlan_aware enable
    rand uvm_reg_field cfm_unicast_123_rule_vlan_aware_ena;
    // Variable: cfm_unicast_rule_vlan_aware_ena
    // CFM_Unicast CPU Hidden Rule sub-rule 4 vlan_aware enable
    rand uvm_reg_field cfm_unicast_rule_vlan_aware_ena;
    // Variable: paa_discovery_rule_vlan_aware_ena
    // PAA_Discovery CPU Hidden Rule vlan_aware enable
    rand uvm_reg_field paa_discovery_rule_vlan_aware_ena;
    // Variable: paa_layer2_rule_vlan_aware_ena
    // PAA_Layer2 CPU Hidden Rule vlan_aware enable
    rand uvm_reg_field paa_layer2_rule_vlan_aware_ena;
    // Variable: twamp_reflector_rule_vlan_aware_ena
    // TWAMP_Reflector CPU Hidden Rule vlan_aware enable
    rand uvm_reg_field twamp_reflector_rule_vlan_aware_ena;
    // Variable: general_purpose_unicast_rule_vlan_aware_ena
    // General_Purpose_Unicast CPU Hidden Rule vlan_aware enable
    rand uvm_reg_field general_purpose_unicast_rule_vlan_aware_ena;
    // Variable: sw_up_soam_ena
    // CFM Hidden rules pattern matching check for isNpMacAddr enable
    rand uvm_reg_field sw_up_soam_ena;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_global_input_cfg_0_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_global_input_cfg_0_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_global_input_cfg_0_reg)

    // Constructor: new
    function new(string name = "globals_global_input_cfg_0");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        user_vlan_ethertype = uvm_reg_field::type_id::create("user_vlan_ethertype", , get_full_name());
        s_vlan_t_vlan_ethertype_swap = uvm_reg_field::type_id::create("s_vlan_t_vlan_ethertype_swap", , get_full_name());
        system_acp_md_level = uvm_reg_field::type_id::create("system_acp_md_level", , get_full_name());
        soam_lbm_rule_vlan_aware_ena = uvm_reg_field::type_id::create("soam_lbm_rule_vlan_aware_ena", , get_full_name());
        acd_lbm_rule_vlan_aware_ena = uvm_reg_field::type_id::create("acd_lbm_rule_vlan_aware_ena", , get_full_name());
        acd_lbr_tst_leak_rule_vlan_aware_ena = uvm_reg_field::type_id::create("acd_lbr_tst_leak_rule_vlan_aware_ena", , get_full_name());
        cfm_unicast_123_rule_vlan_aware_ena = uvm_reg_field::type_id::create("cfm_unicast_123_rule_vlan_aware_ena", , get_full_name());
        cfm_unicast_rule_vlan_aware_ena = uvm_reg_field::type_id::create("cfm_unicast_rule_vlan_aware_ena", , get_full_name());
        paa_discovery_rule_vlan_aware_ena = uvm_reg_field::type_id::create("paa_discovery_rule_vlan_aware_ena", , get_full_name());
        paa_layer2_rule_vlan_aware_ena = uvm_reg_field::type_id::create("paa_layer2_rule_vlan_aware_ena", , get_full_name());
        twamp_reflector_rule_vlan_aware_ena = uvm_reg_field::type_id::create("twamp_reflector_rule_vlan_aware_ena", , get_full_name());
        general_purpose_unicast_rule_vlan_aware_ena = uvm_reg_field::type_id::create("general_purpose_unicast_rule_vlan_aware_ena", , get_full_name());
        sw_up_soam_ena = uvm_reg_field::type_id::create("sw_up_soam_ena", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        user_vlan_ethertype.configure(this, 16, 0, "RW", 0, 'h8100, 1, 1, 0);
        s_vlan_t_vlan_ethertype_swap.configure(this, 1, 16, "RW", 0, 'h0, 1, 1, 0);
        system_acp_md_level.configure(this, 3, 17, "RW", 0, 'h7, 1, 1, 0);
        soam_lbm_rule_vlan_aware_ena.configure(this, 1, 20, "RW", 0, 'h1, 1, 1, 0);
        acd_lbm_rule_vlan_aware_ena.configure(this, 1, 21, "RW", 0, 'h1, 1, 1, 0);
        acd_lbr_tst_leak_rule_vlan_aware_ena.configure(this, 1, 22, "RW", 0, 'h1, 1, 1, 0);
        cfm_unicast_123_rule_vlan_aware_ena.configure(this, 1, 23, "RW", 0, 'h1, 1, 1, 0);
        cfm_unicast_rule_vlan_aware_ena.configure(this, 1, 24, "RW", 0, 'h1, 1, 1, 0);
        paa_discovery_rule_vlan_aware_ena.configure(this, 1, 25, "RW", 0, 'h1, 1, 1, 0);
        paa_layer2_rule_vlan_aware_ena.configure(this, 1, 26, "RW", 0, 'h1, 1, 1, 0);
        twamp_reflector_rule_vlan_aware_ena.configure(this, 1, 27, "RW", 0, 'h1, 1, 1, 0);
        general_purpose_unicast_rule_vlan_aware_ena.configure(this, 1, 28, "RW", 0, 'h1, 1, 1, 0);
        sw_up_soam_ena.configure(this, 1, 29, "RW", 0, 'h1, 1, 1, 0);
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
                cg = globals_global_input_cfg_0_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_global_input_cfg_0_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, user_vlan_ethertype.get_name, user_vlan_ethertype.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, s_vlan_t_vlan_ethertype_swap.get_name, s_vlan_t_vlan_ethertype_swap.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, system_acp_md_level.get_name, system_acp_md_level.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, soam_lbm_rule_vlan_aware_ena.get_name, soam_lbm_rule_vlan_aware_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, acd_lbm_rule_vlan_aware_ena.get_name, acd_lbm_rule_vlan_aware_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, acd_lbr_tst_leak_rule_vlan_aware_ena.get_name, acd_lbr_tst_leak_rule_vlan_aware_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, cfm_unicast_123_rule_vlan_aware_ena.get_name, cfm_unicast_123_rule_vlan_aware_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, cfm_unicast_rule_vlan_aware_ena.get_name, cfm_unicast_rule_vlan_aware_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, paa_discovery_rule_vlan_aware_ena.get_name, paa_discovery_rule_vlan_aware_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, paa_layer2_rule_vlan_aware_ena.get_name, paa_layer2_rule_vlan_aware_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, twamp_reflector_rule_vlan_aware_ena.get_name, twamp_reflector_rule_vlan_aware_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, general_purpose_unicast_rule_vlan_aware_ena.get_name, general_purpose_unicast_rule_vlan_aware_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sw_up_soam_ena.get_name, sw_up_soam_ena.value);
        return s;
    endfunction

endclass


// Class: globals_global_input_cfg_0_reg_cover
// Register coverage object.
class globals_global_input_cfg_0_reg_cover extends uvm_object;

    static local globals_global_input_cfg_0_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_global_input_cfg_0_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        user_vlan_ethertype_wr: coverpoint r.user_vlan_ethertype.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        user_vlan_ethertype_rd: coverpoint r.user_vlan_ethertype.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        s_vlan_t_vlan_ethertype_swap_wr: coverpoint r.s_vlan_t_vlan_ethertype_swap.value iff (!is_read);
        s_vlan_t_vlan_ethertype_swap_rd: coverpoint r.s_vlan_t_vlan_ethertype_swap.value iff  (is_read);
        system_acp_md_level_wr: coverpoint r.system_acp_md_level.value iff (!is_read);
        system_acp_md_level_rd: coverpoint r.system_acp_md_level.value iff  (is_read);
        soam_lbm_rule_vlan_aware_ena_wr: coverpoint r.soam_lbm_rule_vlan_aware_ena.value iff (!is_read);
        soam_lbm_rule_vlan_aware_ena_rd: coverpoint r.soam_lbm_rule_vlan_aware_ena.value iff  (is_read);
        acd_lbm_rule_vlan_aware_ena_wr: coverpoint r.acd_lbm_rule_vlan_aware_ena.value iff (!is_read);
        acd_lbm_rule_vlan_aware_ena_rd: coverpoint r.acd_lbm_rule_vlan_aware_ena.value iff  (is_read);
        acd_lbr_tst_leak_rule_vlan_aware_ena_wr: coverpoint r.acd_lbr_tst_leak_rule_vlan_aware_ena.value iff (!is_read);
        acd_lbr_tst_leak_rule_vlan_aware_ena_rd: coverpoint r.acd_lbr_tst_leak_rule_vlan_aware_ena.value iff  (is_read);
        cfm_unicast_123_rule_vlan_aware_ena_wr: coverpoint r.cfm_unicast_123_rule_vlan_aware_ena.value iff (!is_read);
        cfm_unicast_123_rule_vlan_aware_ena_rd: coverpoint r.cfm_unicast_123_rule_vlan_aware_ena.value iff  (is_read);
        cfm_unicast_rule_vlan_aware_ena_wr: coverpoint r.cfm_unicast_rule_vlan_aware_ena.value iff (!is_read);
        cfm_unicast_rule_vlan_aware_ena_rd: coverpoint r.cfm_unicast_rule_vlan_aware_ena.value iff  (is_read);
        paa_discovery_rule_vlan_aware_ena_wr: coverpoint r.paa_discovery_rule_vlan_aware_ena.value iff (!is_read);
        paa_discovery_rule_vlan_aware_ena_rd: coverpoint r.paa_discovery_rule_vlan_aware_ena.value iff  (is_read);
        paa_layer2_rule_vlan_aware_ena_wr: coverpoint r.paa_layer2_rule_vlan_aware_ena.value iff (!is_read);
        paa_layer2_rule_vlan_aware_ena_rd: coverpoint r.paa_layer2_rule_vlan_aware_ena.value iff  (is_read);
        twamp_reflector_rule_vlan_aware_ena_wr: coverpoint r.twamp_reflector_rule_vlan_aware_ena.value iff (!is_read);
        twamp_reflector_rule_vlan_aware_ena_rd: coverpoint r.twamp_reflector_rule_vlan_aware_ena.value iff  (is_read);
        general_purpose_unicast_rule_vlan_aware_ena_wr: coverpoint r.general_purpose_unicast_rule_vlan_aware_ena.value iff (!is_read);
        general_purpose_unicast_rule_vlan_aware_ena_rd: coverpoint r.general_purpose_unicast_rule_vlan_aware_ena.value iff  (is_read);
        sw_up_soam_ena_wr: coverpoint r.sw_up_soam_ena.value iff (!is_read);
        sw_up_soam_ena_rd: coverpoint r.sw_up_soam_ena.value iff  (is_read);
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_global_input_cfg_0_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_global_input_cfg_0_reg_cover");
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
    static function globals_global_input_cfg_0_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_global_input_cfg_0_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_global_input_cfg_0_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_global_input_cfg_1_reg_cover;

// Class: globals_global_input_cfg_1_reg
// Register globals.global_input_cfg_1: Global Hidden CPU Rules &amp; other Classifier configuration register 1
class globals_global_input_cfg_1_reg extends uvm_reg;

    // Variable: twamp_reflector_dport
    // UDP destination port used as a match criteria in the TWAMP_Reflector CPU Hidden Rule.
    rand uvm_reg_field twamp_reflector_dport;
    // Variable: system_ld_domain
    // System Loopback Detection (LD) domain.
    rand uvm_reg_field system_ld_domain;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_global_input_cfg_1_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_global_input_cfg_1_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_global_input_cfg_1_reg)

    // Constructor: new
    function new(string name = "globals_global_input_cfg_1");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        twamp_reflector_dport = uvm_reg_field::type_id::create("twamp_reflector_dport", , get_full_name());
        system_ld_domain = uvm_reg_field::type_id::create("system_ld_domain", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        twamp_reflector_dport.configure(this, 16, 0, "RW", 0, 'h1770, 1, 1, 0);
        system_ld_domain.configure(this, 16, 16, "RW", 0, 'h0, 1, 1, 0);
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
                cg = globals_global_input_cfg_1_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_global_input_cfg_1_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, twamp_reflector_dport.get_name, twamp_reflector_dport.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, system_ld_domain.get_name, system_ld_domain.value);
        return s;
    endfunction

endclass


// Class: globals_global_input_cfg_1_reg_cover
// Register coverage object.
class globals_global_input_cfg_1_reg_cover extends uvm_object;

    static local globals_global_input_cfg_1_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_global_input_cfg_1_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        twamp_reflector_dport_wr: coverpoint r.twamp_reflector_dport.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        twamp_reflector_dport_rd: coverpoint r.twamp_reflector_dport.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        system_ld_domain_wr: coverpoint r.system_ld_domain.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        system_ld_domain_rd: coverpoint r.system_ld_domain.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_global_input_cfg_1_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_global_input_cfg_1_reg_cover");
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
    static function globals_global_input_cfg_1_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_global_input_cfg_1_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_global_input_cfg_1_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_version_changeset_reg_cover;

// Class: globals_version_changeset_reg
// Register globals.version_changeset: 
class globals_version_changeset_reg extends uvm_reg;

    // Variable: changeset
    // 7 MSB GIT hash in hex.
    rand uvm_reg_field changeset;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_version_changeset_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_version_changeset_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_version_changeset_reg)

    // Constructor: new
    function new(string name = "globals_version_changeset");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        changeset = uvm_reg_field::type_id::create("changeset", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        changeset.configure(this, 28, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = globals_version_changeset_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_version_changeset_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, changeset.get_name, changeset.value);
        return s;
    endfunction

endclass


// Class: globals_version_changeset_reg_cover
// Register coverage object.
class globals_version_changeset_reg_cover extends uvm_object;

    static local globals_version_changeset_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_version_changeset_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        changeset_wr: coverpoint r.changeset.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        changeset_rd: coverpoint r.changeset.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_version_changeset_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_version_changeset_reg_cover");
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
    static function globals_version_changeset_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_version_changeset_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_version_changeset_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_version_build_reg_cover;

// Class: globals_version_build_reg
// Register globals.version_build: 
class globals_version_build_reg extends uvm_reg;

    // Variable: build_number
    // Incremental unique number assigned to a specific build.
    rand uvm_reg_field build_number;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_version_build_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_version_build_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_version_build_reg)

    // Constructor: new
    function new(string name = "globals_version_build");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        build_number = uvm_reg_field::type_id::create("build_number", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        build_number.configure(this, 16, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = globals_version_build_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_version_build_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, build_number.get_name, build_number.value);
        return s;
    endfunction

endclass


// Class: globals_version_build_reg_cover
// Register coverage object.
class globals_version_build_reg_cover extends uvm_object;

    static local globals_version_build_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_version_build_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        build_number_wr: coverpoint r.build_number.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        build_number_rd: coverpoint r.build_number.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_version_build_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_version_build_reg_cover");
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
    static function globals_version_build_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_version_build_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_version_build_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_version_release_reg_cover;

// Class: globals_version_release_reg
// Register globals.version_release: 
class globals_version_release_reg extends uvm_reg;

    // Variable: sub_minor
    // Decimal version of the sub-minor release
    rand uvm_reg_field sub_minor;
    // Variable: minor
    // Decimal version of the minor release
    rand uvm_reg_field minor;
    // Variable: major0
    // Decimal version of the major release
    rand uvm_reg_field major0;
    // Variable: major1
    // Decimal version of the major release
    rand uvm_reg_field major1;
    // Variable: product_id
    // 0xC0 prefix representing the Clipper product line
    rand uvm_reg_field product_id;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_version_release_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_version_release_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_version_release_reg)

    // Constructor: new
    function new(string name = "globals_version_release");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        sub_minor = uvm_reg_field::type_id::create("sub_minor", , get_full_name());
        minor = uvm_reg_field::type_id::create("minor", , get_full_name());
        major0 = uvm_reg_field::type_id::create("major0", , get_full_name());
        major1 = uvm_reg_field::type_id::create("major1", , get_full_name());
        product_id = uvm_reg_field::type_id::create("product_id", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        sub_minor.configure(this, 4, 0, "RO", 0, 'h0, 1, 1, 0);
        minor.configure(this, 4, 4, "RO", 0, 'h0, 1, 1, 0);
        major0.configure(this, 4, 8, "RO", 0, 'h0, 1, 1, 0);
        major1.configure(this, 4, 12, "RO", 0, 'h0, 1, 1, 0);
        product_id.configure(this, 16, 16, "RO", 0, 'h0, 1, 1, 0);
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
                cg = globals_version_release_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_version_release_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, sub_minor.get_name, sub_minor.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, minor.get_name, minor.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, major0.get_name, major0.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, major1.get_name, major1.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, product_id.get_name, product_id.value);
        return s;
    endfunction

endclass


// Class: globals_version_release_reg_cover
// Register coverage object.
class globals_version_release_reg_cover extends uvm_object;

    static local globals_version_release_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_version_release_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        sub_minor_wr: coverpoint r.sub_minor.value iff (!is_read);
        sub_minor_rd: coverpoint r.sub_minor.value iff  (is_read);
        minor_wr: coverpoint r.minor.value iff (!is_read);
        minor_rd: coverpoint r.minor.value iff  (is_read);
        major0_wr: coverpoint r.major0.value iff (!is_read);
        major0_rd: coverpoint r.major0.value iff  (is_read);
        major1_wr: coverpoint r.major1.value iff (!is_read);
        major1_rd: coverpoint r.major1.value iff  (is_read);
        product_id_wr: coverpoint r.product_id.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        product_id_rd: coverpoint r.product_id.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_version_release_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_version_release_reg_cover");
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
    static function globals_version_release_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_version_release_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_version_release_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_capabilities_0_reg_cover;

// Class: globals_capabilities_0_reg
// Register globals.capabilities_0: NOT USED. Specifies the device global capabilities
class globals_capabilities_0_reg extends uvm_reg;

    // Variable: pkt_gen
    // Packet Generator capabilities
    rand uvm_reg_field pkt_gen;
    // Variable: inspextractor
    // Inspextractor capabilities
    rand uvm_reg_field inspextractor;
    // Variable: classifier
    // Classifier capabilities
    rand uvm_reg_field classifier;
    // Variable: bwp
    // Bandwidth Policer capabilities
    rand uvm_reg_field bwp;
    // Variable: ddr
    // External DDR memory capabilities
    rand uvm_reg_field ddr;
    // Variable: fvt
    // Functional validation test specific capabilities
    rand uvm_reg_field fvt;
    // Variable: fwd_db
    // Forwarding Database capabilities
    rand uvm_reg_field fwd_db;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_capabilities_0_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_capabilities_0_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_capabilities_0_reg)

    // Constructor: new
    function new(string name = "globals_capabilities_0");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        pkt_gen = uvm_reg_field::type_id::create("pkt_gen", , get_full_name());
        inspextractor = uvm_reg_field::type_id::create("inspextractor", , get_full_name());
        classifier = uvm_reg_field::type_id::create("classifier", , get_full_name());
        bwp = uvm_reg_field::type_id::create("bwp", , get_full_name());
        ddr = uvm_reg_field::type_id::create("ddr", , get_full_name());
        fvt = uvm_reg_field::type_id::create("fvt", , get_full_name());
        fwd_db = uvm_reg_field::type_id::create("fwd_db", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        pkt_gen.configure(this, 4, 0, "RO", 0, 'h0, 1, 1, 0);
        inspextractor.configure(this, 4, 4, "RO", 0, 'h0, 1, 1, 0);
        classifier.configure(this, 4, 8, "RO", 0, 'h0, 1, 1, 0);
        bwp.configure(this, 4, 12, "RO", 0, 'h0, 1, 1, 0);
        ddr.configure(this, 4, 16, "RO", 0, 'h0, 1, 1, 0);
        fvt.configure(this, 4, 20, "RO", 0, 'h0, 1, 1, 0);
        fwd_db.configure(this, 4, 24, "RO", 0, 'h0, 1, 1, 0);
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
                cg = globals_capabilities_0_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_capabilities_0_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, pkt_gen.get_name, pkt_gen.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, inspextractor.get_name, inspextractor.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, classifier.get_name, classifier.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, bwp.get_name, bwp.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, ddr.get_name, ddr.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, fvt.get_name, fvt.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, fwd_db.get_name, fwd_db.value);
        return s;
    endfunction

endclass


// Class: globals_capabilities_0_reg_cover
// Register coverage object.
class globals_capabilities_0_reg_cover extends uvm_object;

    static local globals_capabilities_0_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_capabilities_0_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        pkt_gen_wr: coverpoint r.pkt_gen.value iff (!is_read);
        pkt_gen_rd: coverpoint r.pkt_gen.value iff  (is_read);
        inspextractor_wr: coverpoint r.inspextractor.value iff (!is_read);
        inspextractor_rd: coverpoint r.inspextractor.value iff  (is_read);
        classifier_wr: coverpoint r.classifier.value iff (!is_read);
        classifier_rd: coverpoint r.classifier.value iff  (is_read);
        bwp_wr: coverpoint r.bwp.value iff (!is_read);
        bwp_rd: coverpoint r.bwp.value iff  (is_read);
        ddr_wr: coverpoint r.ddr.value iff (!is_read);
        ddr_rd: coverpoint r.ddr.value iff  (is_read);
        fvt_wr: coverpoint r.fvt.value iff (!is_read);
        fvt_rd: coverpoint r.fvt.value iff  (is_read);
        fwd_db_wr: coverpoint r.fwd_db.value iff (!is_read);
        fwd_db_rd: coverpoint r.fwd_db.value iff  (is_read);
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_capabilities_0_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_capabilities_0_reg_cover");
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
    static function globals_capabilities_0_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_capabilities_0_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_capabilities_0_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_capabilities_1_reg_cover;

// Class: globals_capabilities_1_reg
// Register globals.capabilities_1: NOT USED. Specifies the device global capabilities
class globals_capabilities_1_reg extends uvm_reg;

    // Variable: feature_n
    // find me a purpose
    rand uvm_reg_field feature_n;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_capabilities_1_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_capabilities_1_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_capabilities_1_reg)

    // Constructor: new
    function new(string name = "globals_capabilities_1");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        feature_n = uvm_reg_field::type_id::create("feature_n", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        feature_n.configure(this, 16, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = globals_capabilities_1_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_capabilities_1_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, feature_n.get_name, feature_n.value);
        return s;
    endfunction

endclass


// Class: globals_capabilities_1_reg_cover
// Register coverage object.
class globals_capabilities_1_reg_cover extends uvm_object;

    static local globals_capabilities_1_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_capabilities_1_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        feature_n_wr: coverpoint r.feature_n.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        feature_n_rd: coverpoint r.feature_n.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_capabilities_1_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_capabilities_1_reg_cover");
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
    static function globals_capabilities_1_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_capabilities_1_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_capabilities_1_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_register_version_reg_cover;

// Class: globals_register_version_reg
// Register globals.register_version: 
class globals_register_version_reg extends uvm_reg;

    // Variable: regver
    // Decimal version of the registers
    rand uvm_reg_field regver;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_register_version_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_register_version_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_register_version_reg)

    // Constructor: new
    function new(string name = "globals_register_version");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        regver = uvm_reg_field::type_id::create("regver", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        regver.configure(this, 16, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = globals_register_version_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_register_version_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, regver.get_name, regver.value);
        return s;
    endfunction

endclass


// Class: globals_register_version_reg_cover
// Register coverage object.
class globals_register_version_reg_cover extends uvm_object;

    static local globals_register_version_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_register_version_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        regver_wr: coverpoint r.regver.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        regver_rd: coverpoint r.regver.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_register_version_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_register_version_reg_cover");
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
    static function globals_register_version_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_register_version_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_register_version_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_dbg_cfg_0_reg_cover;

// Class: globals_dbg_cfg_0_reg
// Register globals.dbg_cfg_0: Debug resources configuration and settings
class globals_dbg_cfg_0_reg extends uvm_reg;

    // Variable: debug_top_sel
    // 0: clear event detection registers _1 from 0x60 to 0x77 1: stop writing to the access logger. 3:2 not used.
    rand uvm_reg_field debug_top_sel;
    // Variable: debug_chiptop_sel
    // selection of lower level of debug
    rand uvm_reg_field debug_chiptop_sel;
    // Variable: seq_chckr_rst
    // 
    rand uvm_reg_field seq_chckr_rst;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_dbg_cfg_0_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_dbg_cfg_0_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_dbg_cfg_0_reg)

    // Constructor: new
    function new(string name = "globals_dbg_cfg_0");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        debug_top_sel = uvm_reg_field::type_id::create("debug_top_sel", , get_full_name());
        debug_chiptop_sel = uvm_reg_field::type_id::create("debug_chiptop_sel", , get_full_name());
        seq_chckr_rst = uvm_reg_field::type_id::create("seq_chckr_rst", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        debug_top_sel.configure(this, 4, 0, "RW", 0, 'h0, 1, 1, 0);
        debug_chiptop_sel.configure(this, 2, 4, "RW", 0, 'h0, 1, 1, 0);
        seq_chckr_rst.configure(this, 1, 6, "RW", 0, 'h0, 1, 1, 0);
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
                cg = globals_dbg_cfg_0_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_dbg_cfg_0_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, debug_top_sel.get_name, debug_top_sel.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, debug_chiptop_sel.get_name, debug_chiptop_sel.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, seq_chckr_rst.get_name, seq_chckr_rst.value);
        return s;
    endfunction

endclass


// Class: globals_dbg_cfg_0_reg_cover
// Register coverage object.
class globals_dbg_cfg_0_reg_cover extends uvm_object;

    static local globals_dbg_cfg_0_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_dbg_cfg_0_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        debug_top_sel_wr: coverpoint r.debug_top_sel.value iff (!is_read);
        debug_top_sel_rd: coverpoint r.debug_top_sel.value iff  (is_read);
        debug_chiptop_sel_wr: coverpoint r.debug_chiptop_sel.value iff (!is_read);
        debug_chiptop_sel_rd: coverpoint r.debug_chiptop_sel.value iff  (is_read);
        seq_chckr_rst_wr: coverpoint r.seq_chckr_rst.value iff (!is_read);
        seq_chckr_rst_rd: coverpoint r.seq_chckr_rst.value iff  (is_read);
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_dbg_cfg_0_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_dbg_cfg_0_reg_cover");
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
    static function globals_dbg_cfg_0_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_dbg_cfg_0_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_dbg_cfg_0_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_status1_reg_cover;

// Class: globals_status1_reg
// Register globals.status1: Current link status reported by FPGA
class globals_status1_reg extends uvm_reg;

    // Variable: p1_link_stat
    // Port1 link status
    rand uvm_reg_field p1_link_stat;
    // Variable: p1_speed
    // Port1 speed
    rand uvm_reg_field p1_speed;
    // Variable: p1_duplex
    // Port1 duplex. 1=Full duplex, 0=half duplex
    rand uvm_reg_field p1_duplex;
    // Variable: p2_link_stat
    // Port2 link status
    rand uvm_reg_field p2_link_stat;
    // Variable: p2_speed
    // Port2 speed
    rand uvm_reg_field p2_speed;
    // Variable: p2_duplex
    // Port2 duplex. 1=Full duplex, 0=half duplex
    rand uvm_reg_field p2_duplex;
    // Variable: p3_link_stat
    // Port3 link status
    rand uvm_reg_field p3_link_stat;
    // Variable: p3_speed
    // Port3 speed
    rand uvm_reg_field p3_speed;
    // Variable: p3_duplex
    // Port3 duplex. 1=Full duplex, 0=half duplex
    rand uvm_reg_field p3_duplex;
    // Variable: p4_link_stat
    // Port4 link status
    rand uvm_reg_field p4_link_stat;
    // Variable: p4_speed
    // Port4 speed
    rand uvm_reg_field p4_speed;
    // Variable: p4_duplex
    // Port4 duplex. 1=Full duplex, 0=half duplex
    rand uvm_reg_field p4_duplex;
    // Variable: p5_link_stat
    // Port5 link status
    rand uvm_reg_field p5_link_stat;
    // Variable: p5_speed
    // Port5 speed
    rand uvm_reg_field p5_speed;
    // Variable: p5_duplex
    // Port5 duplex. 1=Full duplex, 0=half duplex
    rand uvm_reg_field p5_duplex;
    // Variable: p6_link_stat
    // Port6 link status
    rand uvm_reg_field p6_link_stat;
    // Variable: p6_speed
    // Port6 speed
    rand uvm_reg_field p6_speed;
    // Variable: p6_duplex
    // Port6 duplex. 1=Full duplex, 0=half duplex
    rand uvm_reg_field p6_duplex;
    // Variable: p7_link_stat
    // Port7 link status
    rand uvm_reg_field p7_link_stat;
    // Variable: p7_speed
    // Port7 speed
    rand uvm_reg_field p7_speed;
    // Variable: p7_duplex
    // Port7 duplex. 1=Full duplex, 0=half duplex
    rand uvm_reg_field p7_duplex;
    // Variable: p8_link_stat
    // Port8 link status
    rand uvm_reg_field p8_link_stat;
    // Variable: p8_speed
    // Port8 speed
    rand uvm_reg_field p8_speed;
    // Variable: p8_duplex
    // Port8 duplex. 1=Full duplex, 0=half duplex
    rand uvm_reg_field p8_duplex;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_status1_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_status1_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_status1_reg)

    // Constructor: new
    function new(string name = "globals_status1");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        p1_link_stat = uvm_reg_field::type_id::create("p1_link_stat", , get_full_name());
        p1_speed = uvm_reg_field::type_id::create("p1_speed", , get_full_name());
        p1_duplex = uvm_reg_field::type_id::create("p1_duplex", , get_full_name());
        p2_link_stat = uvm_reg_field::type_id::create("p2_link_stat", , get_full_name());
        p2_speed = uvm_reg_field::type_id::create("p2_speed", , get_full_name());
        p2_duplex = uvm_reg_field::type_id::create("p2_duplex", , get_full_name());
        p3_link_stat = uvm_reg_field::type_id::create("p3_link_stat", , get_full_name());
        p3_speed = uvm_reg_field::type_id::create("p3_speed", , get_full_name());
        p3_duplex = uvm_reg_field::type_id::create("p3_duplex", , get_full_name());
        p4_link_stat = uvm_reg_field::type_id::create("p4_link_stat", , get_full_name());
        p4_speed = uvm_reg_field::type_id::create("p4_speed", , get_full_name());
        p4_duplex = uvm_reg_field::type_id::create("p4_duplex", , get_full_name());
        p5_link_stat = uvm_reg_field::type_id::create("p5_link_stat", , get_full_name());
        p5_speed = uvm_reg_field::type_id::create("p5_speed", , get_full_name());
        p5_duplex = uvm_reg_field::type_id::create("p5_duplex", , get_full_name());
        p6_link_stat = uvm_reg_field::type_id::create("p6_link_stat", , get_full_name());
        p6_speed = uvm_reg_field::type_id::create("p6_speed", , get_full_name());
        p6_duplex = uvm_reg_field::type_id::create("p6_duplex", , get_full_name());
        p7_link_stat = uvm_reg_field::type_id::create("p7_link_stat", , get_full_name());
        p7_speed = uvm_reg_field::type_id::create("p7_speed", , get_full_name());
        p7_duplex = uvm_reg_field::type_id::create("p7_duplex", , get_full_name());
        p8_link_stat = uvm_reg_field::type_id::create("p8_link_stat", , get_full_name());
        p8_speed = uvm_reg_field::type_id::create("p8_speed", , get_full_name());
        p8_duplex = uvm_reg_field::type_id::create("p8_duplex", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        p1_link_stat.configure(this, 1, 0, "RO", 0, 'h0, 1, 1, 0);
        p1_speed.configure(this, 2, 1, "RO", 0, 'h0, 1, 1, 0);
        p1_duplex.configure(this, 1, 3, "RO", 0, 'h0, 1, 1, 0);
        p2_link_stat.configure(this, 1, 4, "RO", 0, 'h0, 1, 1, 0);
        p2_speed.configure(this, 2, 5, "RO", 0, 'h0, 1, 1, 0);
        p2_duplex.configure(this, 1, 7, "RO", 0, 'h0, 1, 1, 0);
        p3_link_stat.configure(this, 1, 8, "RO", 0, 'h0, 1, 1, 0);
        p3_speed.configure(this, 2, 9, "RO", 0, 'h0, 1, 1, 0);
        p3_duplex.configure(this, 1, 11, "RO", 0, 'h0, 1, 1, 0);
        p4_link_stat.configure(this, 1, 12, "RO", 0, 'h0, 1, 1, 0);
        p4_speed.configure(this, 2, 13, "RO", 0, 'h0, 1, 1, 0);
        p4_duplex.configure(this, 1, 15, "RO", 0, 'h0, 1, 1, 0);
        p5_link_stat.configure(this, 1, 16, "RO", 0, 'h0, 1, 1, 0);
        p5_speed.configure(this, 2, 17, "RO", 0, 'h0, 1, 1, 0);
        p5_duplex.configure(this, 1, 19, "RO", 0, 'h0, 1, 1, 0);
        p6_link_stat.configure(this, 1, 20, "RO", 0, 'h0, 1, 1, 0);
        p6_speed.configure(this, 2, 21, "RO", 0, 'h0, 1, 1, 0);
        p6_duplex.configure(this, 1, 23, "RO", 0, 'h0, 1, 1, 0);
        p7_link_stat.configure(this, 1, 24, "RO", 0, 'h0, 1, 1, 0);
        p7_speed.configure(this, 2, 25, "RO", 0, 'h0, 1, 1, 0);
        p7_duplex.configure(this, 1, 27, "RO", 0, 'h0, 1, 1, 0);
        p8_link_stat.configure(this, 1, 28, "RO", 0, 'h0, 1, 1, 0);
        p8_speed.configure(this, 2, 29, "RO", 0, 'h0, 1, 1, 0);
        p8_duplex.configure(this, 1, 31, "RO", 0, 'h0, 1, 1, 0);
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
                cg = globals_status1_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_status1_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, p1_link_stat.get_name, p1_link_stat.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p1_speed.get_name, p1_speed.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p1_duplex.get_name, p1_duplex.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p2_link_stat.get_name, p2_link_stat.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p2_speed.get_name, p2_speed.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p2_duplex.get_name, p2_duplex.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p3_link_stat.get_name, p3_link_stat.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p3_speed.get_name, p3_speed.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p3_duplex.get_name, p3_duplex.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p4_link_stat.get_name, p4_link_stat.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p4_speed.get_name, p4_speed.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p4_duplex.get_name, p4_duplex.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p5_link_stat.get_name, p5_link_stat.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p5_speed.get_name, p5_speed.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p5_duplex.get_name, p5_duplex.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p6_link_stat.get_name, p6_link_stat.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p6_speed.get_name, p6_speed.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p6_duplex.get_name, p6_duplex.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p7_link_stat.get_name, p7_link_stat.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p7_speed.get_name, p7_speed.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p7_duplex.get_name, p7_duplex.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p8_link_stat.get_name, p8_link_stat.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p8_speed.get_name, p8_speed.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p8_duplex.get_name, p8_duplex.value);
        return s;
    endfunction

endclass


// Class: globals_status1_reg_cover
// Register coverage object.
class globals_status1_reg_cover extends uvm_object;

    static local globals_status1_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_status1_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        p1_link_stat_wr: coverpoint r.p1_link_stat.value iff (!is_read);
        p1_link_stat_rd: coverpoint r.p1_link_stat.value iff  (is_read);
        p1_speed_wr: coverpoint r.p1_speed.value iff (!is_read);
        p1_speed_rd: coverpoint r.p1_speed.value iff  (is_read);
        p1_duplex_wr: coverpoint r.p1_duplex.value iff (!is_read);
        p1_duplex_rd: coverpoint r.p1_duplex.value iff  (is_read);
        p2_link_stat_wr: coverpoint r.p2_link_stat.value iff (!is_read);
        p2_link_stat_rd: coverpoint r.p2_link_stat.value iff  (is_read);
        p2_speed_wr: coverpoint r.p2_speed.value iff (!is_read);
        p2_speed_rd: coverpoint r.p2_speed.value iff  (is_read);
        p2_duplex_wr: coverpoint r.p2_duplex.value iff (!is_read);
        p2_duplex_rd: coverpoint r.p2_duplex.value iff  (is_read);
        p3_link_stat_wr: coverpoint r.p3_link_stat.value iff (!is_read);
        p3_link_stat_rd: coverpoint r.p3_link_stat.value iff  (is_read);
        p3_speed_wr: coverpoint r.p3_speed.value iff (!is_read);
        p3_speed_rd: coverpoint r.p3_speed.value iff  (is_read);
        p3_duplex_wr: coverpoint r.p3_duplex.value iff (!is_read);
        p3_duplex_rd: coverpoint r.p3_duplex.value iff  (is_read);
        p4_link_stat_wr: coverpoint r.p4_link_stat.value iff (!is_read);
        p4_link_stat_rd: coverpoint r.p4_link_stat.value iff  (is_read);
        p4_speed_wr: coverpoint r.p4_speed.value iff (!is_read);
        p4_speed_rd: coverpoint r.p4_speed.value iff  (is_read);
        p4_duplex_wr: coverpoint r.p4_duplex.value iff (!is_read);
        p4_duplex_rd: coverpoint r.p4_duplex.value iff  (is_read);
        p5_link_stat_wr: coverpoint r.p5_link_stat.value iff (!is_read);
        p5_link_stat_rd: coverpoint r.p5_link_stat.value iff  (is_read);
        p5_speed_wr: coverpoint r.p5_speed.value iff (!is_read);
        p5_speed_rd: coverpoint r.p5_speed.value iff  (is_read);
        p5_duplex_wr: coverpoint r.p5_duplex.value iff (!is_read);
        p5_duplex_rd: coverpoint r.p5_duplex.value iff  (is_read);
        p6_link_stat_wr: coverpoint r.p6_link_stat.value iff (!is_read);
        p6_link_stat_rd: coverpoint r.p6_link_stat.value iff  (is_read);
        p6_speed_wr: coverpoint r.p6_speed.value iff (!is_read);
        p6_speed_rd: coverpoint r.p6_speed.value iff  (is_read);
        p6_duplex_wr: coverpoint r.p6_duplex.value iff (!is_read);
        p6_duplex_rd: coverpoint r.p6_duplex.value iff  (is_read);
        p7_link_stat_wr: coverpoint r.p7_link_stat.value iff (!is_read);
        p7_link_stat_rd: coverpoint r.p7_link_stat.value iff  (is_read);
        p7_speed_wr: coverpoint r.p7_speed.value iff (!is_read);
        p7_speed_rd: coverpoint r.p7_speed.value iff  (is_read);
        p7_duplex_wr: coverpoint r.p7_duplex.value iff (!is_read);
        p7_duplex_rd: coverpoint r.p7_duplex.value iff  (is_read);
        p8_link_stat_wr: coverpoint r.p8_link_stat.value iff (!is_read);
        p8_link_stat_rd: coverpoint r.p8_link_stat.value iff  (is_read);
        p8_speed_wr: coverpoint r.p8_speed.value iff (!is_read);
        p8_speed_rd: coverpoint r.p8_speed.value iff  (is_read);
        p8_duplex_wr: coverpoint r.p8_duplex.value iff (!is_read);
        p8_duplex_rd: coverpoint r.p8_duplex.value iff  (is_read);
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_status1_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_status1_reg_cover");
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
    static function globals_status1_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_status1_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_status1_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_status2_reg_cover;

// Class: globals_status2_reg
// Register globals.status2: Current link status reported by FPGA
class globals_status2_reg extends uvm_reg;

    // Variable: p9_link_stat
    // Port9 link status
    rand uvm_reg_field p9_link_stat;
    // Variable: p9_speed
    // Port9 speed
    rand uvm_reg_field p9_speed;
    // Variable: p9_duplex
    // Port9 duplex. 1=Full duplex, 0=half duplex
    rand uvm_reg_field p9_duplex;
    // Variable: p10_link_stat
    // Port10 link status
    rand uvm_reg_field p10_link_stat;
    // Variable: p10_speed
    // Port10 speed
    rand uvm_reg_field p10_speed;
    // Variable: p10_duplex
    // Port10 duplex. 1=Full duplex, 0=half duplex
    rand uvm_reg_field p10_duplex;
    // Variable: p11_link_stat
    // Port11 link status
    rand uvm_reg_field p11_link_stat;
    // Variable: p11_speed
    // Port11 speed
    rand uvm_reg_field p11_speed;
    // Variable: p11_duplex
    // Port11 duplex. 1=Full duplex, 0=half duplex
    rand uvm_reg_field p11_duplex;
    // Variable: p12_link_stat
    // Port12 link status
    rand uvm_reg_field p12_link_stat;
    // Variable: p12_speed
    // Port12 speed
    rand uvm_reg_field p12_speed;
    // Variable: p12_duplex
    // Port12 duplex. 1=Full duplex, 0=half duplex
    rand uvm_reg_field p12_duplex;
    // Variable: p13_link_stat
    // Port13 link status
    rand uvm_reg_field p13_link_stat;
    // Variable: p13_speed
    // Port13 speed
    rand uvm_reg_field p13_speed;
    // Variable: p13_duplex
    // Port13 duplex. 1=Full duplex, 0=half duplex
    rand uvm_reg_field p13_duplex;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_status2_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_status2_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_status2_reg)

    // Constructor: new
    function new(string name = "globals_status2");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        p9_link_stat = uvm_reg_field::type_id::create("p9_link_stat", , get_full_name());
        p9_speed = uvm_reg_field::type_id::create("p9_speed", , get_full_name());
        p9_duplex = uvm_reg_field::type_id::create("p9_duplex", , get_full_name());
        p10_link_stat = uvm_reg_field::type_id::create("p10_link_stat", , get_full_name());
        p10_speed = uvm_reg_field::type_id::create("p10_speed", , get_full_name());
        p10_duplex = uvm_reg_field::type_id::create("p10_duplex", , get_full_name());
        p11_link_stat = uvm_reg_field::type_id::create("p11_link_stat", , get_full_name());
        p11_speed = uvm_reg_field::type_id::create("p11_speed", , get_full_name());
        p11_duplex = uvm_reg_field::type_id::create("p11_duplex", , get_full_name());
        p12_link_stat = uvm_reg_field::type_id::create("p12_link_stat", , get_full_name());
        p12_speed = uvm_reg_field::type_id::create("p12_speed", , get_full_name());
        p12_duplex = uvm_reg_field::type_id::create("p12_duplex", , get_full_name());
        p13_link_stat = uvm_reg_field::type_id::create("p13_link_stat", , get_full_name());
        p13_speed = uvm_reg_field::type_id::create("p13_speed", , get_full_name());
        p13_duplex = uvm_reg_field::type_id::create("p13_duplex", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        p9_link_stat.configure(this, 1, 0, "RO", 0, 'h0, 1, 1, 0);
        p9_speed.configure(this, 2, 1, "RO", 0, 'h0, 1, 1, 0);
        p9_duplex.configure(this, 1, 3, "RO", 0, 'h0, 1, 1, 0);
        p10_link_stat.configure(this, 1, 4, "RO", 0, 'h0, 1, 1, 0);
        p10_speed.configure(this, 2, 5, "RO", 0, 'h0, 1, 1, 0);
        p10_duplex.configure(this, 1, 7, "RO", 0, 'h0, 1, 1, 0);
        p11_link_stat.configure(this, 1, 8, "RO", 0, 'h0, 1, 1, 0);
        p11_speed.configure(this, 2, 9, "RO", 0, 'h0, 1, 1, 0);
        p11_duplex.configure(this, 1, 11, "RO", 0, 'h0, 1, 1, 0);
        p12_link_stat.configure(this, 1, 12, "RO", 0, 'h0, 1, 1, 0);
        p12_speed.configure(this, 2, 13, "RO", 0, 'h0, 1, 1, 0);
        p12_duplex.configure(this, 1, 15, "RO", 0, 'h0, 1, 1, 0);
        p13_link_stat.configure(this, 1, 16, "RO", 0, 'h0, 1, 1, 0);
        p13_speed.configure(this, 2, 17, "RO", 0, 'h0, 1, 1, 0);
        p13_duplex.configure(this, 1, 19, "RO", 0, 'h0, 1, 1, 0);
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
                cg = globals_status2_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_status2_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, p9_link_stat.get_name, p9_link_stat.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p9_speed.get_name, p9_speed.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p9_duplex.get_name, p9_duplex.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p10_link_stat.get_name, p10_link_stat.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p10_speed.get_name, p10_speed.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p10_duplex.get_name, p10_duplex.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p11_link_stat.get_name, p11_link_stat.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p11_speed.get_name, p11_speed.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p11_duplex.get_name, p11_duplex.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p12_link_stat.get_name, p12_link_stat.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p12_speed.get_name, p12_speed.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p12_duplex.get_name, p12_duplex.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p13_link_stat.get_name, p13_link_stat.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p13_speed.get_name, p13_speed.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p13_duplex.get_name, p13_duplex.value);
        return s;
    endfunction

endclass


// Class: globals_status2_reg_cover
// Register coverage object.
class globals_status2_reg_cover extends uvm_object;

    static local globals_status2_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_status2_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        p9_link_stat_wr: coverpoint r.p9_link_stat.value iff (!is_read);
        p9_link_stat_rd: coverpoint r.p9_link_stat.value iff  (is_read);
        p9_speed_wr: coverpoint r.p9_speed.value iff (!is_read);
        p9_speed_rd: coverpoint r.p9_speed.value iff  (is_read);
        p9_duplex_wr: coverpoint r.p9_duplex.value iff (!is_read);
        p9_duplex_rd: coverpoint r.p9_duplex.value iff  (is_read);
        p10_link_stat_wr: coverpoint r.p10_link_stat.value iff (!is_read);
        p10_link_stat_rd: coverpoint r.p10_link_stat.value iff  (is_read);
        p10_speed_wr: coverpoint r.p10_speed.value iff (!is_read);
        p10_speed_rd: coverpoint r.p10_speed.value iff  (is_read);
        p10_duplex_wr: coverpoint r.p10_duplex.value iff (!is_read);
        p10_duplex_rd: coverpoint r.p10_duplex.value iff  (is_read);
        p11_link_stat_wr: coverpoint r.p11_link_stat.value iff (!is_read);
        p11_link_stat_rd: coverpoint r.p11_link_stat.value iff  (is_read);
        p11_speed_wr: coverpoint r.p11_speed.value iff (!is_read);
        p11_speed_rd: coverpoint r.p11_speed.value iff  (is_read);
        p11_duplex_wr: coverpoint r.p11_duplex.value iff (!is_read);
        p11_duplex_rd: coverpoint r.p11_duplex.value iff  (is_read);
        p12_link_stat_wr: coverpoint r.p12_link_stat.value iff (!is_read);
        p12_link_stat_rd: coverpoint r.p12_link_stat.value iff  (is_read);
        p12_speed_wr: coverpoint r.p12_speed.value iff (!is_read);
        p12_speed_rd: coverpoint r.p12_speed.value iff  (is_read);
        p12_duplex_wr: coverpoint r.p12_duplex.value iff (!is_read);
        p12_duplex_rd: coverpoint r.p12_duplex.value iff  (is_read);
        p13_link_stat_wr: coverpoint r.p13_link_stat.value iff (!is_read);
        p13_link_stat_rd: coverpoint r.p13_link_stat.value iff  (is_read);
        p13_speed_wr: coverpoint r.p13_speed.value iff (!is_read);
        p13_speed_rd: coverpoint r.p13_speed.value iff  (is_read);
        p13_duplex_wr: coverpoint r.p13_duplex.value iff (!is_read);
        p13_duplex_rd: coverpoint r.p13_duplex.value iff  (is_read);
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_status2_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_status2_reg_cover");
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
    static function globals_status2_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_status2_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_status2_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_clk_status_reg_cover;

// Class: globals_clk_status_reg
// Register globals.clk_status: NOT USED
class globals_clk_status_reg extends uvm_reg;

    // Variable: ready_status_per_mux_clk
    // which clock is ready
    rand uvm_reg_field ready_status_per_mux_clk;
    // Variable: current_clock_mux_sel
    // Selection of which input should be sent to synce clock
    rand uvm_reg_field current_clock_mux_sel;
    // Variable: current_clock_sel_fsm_state
    // 
    rand uvm_reg_field current_clock_sel_fsm_state;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_clk_status_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_clk_status_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_clk_status_reg)

    // Constructor: new
    function new(string name = "globals_clk_status");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        ready_status_per_mux_clk = uvm_reg_field::type_id::create("ready_status_per_mux_clk", , get_full_name());
        current_clock_mux_sel = uvm_reg_field::type_id::create("current_clock_mux_sel", , get_full_name());
        current_clock_sel_fsm_state = uvm_reg_field::type_id::create("current_clock_sel_fsm_state", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        ready_status_per_mux_clk.configure(this, 8, 0, "RO", 0, 'h0, 1, 1, 0);
        current_clock_mux_sel.configure(this, 4, 8, "RO", 0, 'h0, 1, 1, 0);
        current_clock_sel_fsm_state.configure(this, 2, 12, "RO", 0, 'h0, 1, 1, 0);
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
                cg = globals_clk_status_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_clk_status_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, ready_status_per_mux_clk.get_name, ready_status_per_mux_clk.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, current_clock_mux_sel.get_name, current_clock_mux_sel.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, current_clock_sel_fsm_state.get_name, current_clock_sel_fsm_state.value);
        return s;
    endfunction

endclass


// Class: globals_clk_status_reg_cover
// Register coverage object.
class globals_clk_status_reg_cover extends uvm_object;

    static local globals_clk_status_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_clk_status_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        ready_status_per_mux_clk_wr: coverpoint r.ready_status_per_mux_clk.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        ready_status_per_mux_clk_rd: coverpoint r.ready_status_per_mux_clk.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        current_clock_mux_sel_wr: coverpoint r.current_clock_mux_sel.value iff (!is_read);
        current_clock_mux_sel_rd: coverpoint r.current_clock_mux_sel.value iff  (is_read);
        current_clock_sel_fsm_state_wr: coverpoint r.current_clock_sel_fsm_state.value iff (!is_read);
        current_clock_sel_fsm_state_rd: coverpoint r.current_clock_sel_fsm_state.value iff  (is_read);
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_clk_status_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_clk_status_reg_cover");
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
    static function globals_clk_status_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_clk_status_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_clk_status_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_class_stats_cpu_cfg_reg_cover;

// Class: globals_class_stats_cpu_cfg_reg
// Register globals.class_stats_cpu_cfg: CPU class stats count mode config
class globals_class_stats_cpu_cfg_reg extends uvm_reg;

    // Variable: count_mode1
    // Port1 count mode
    rand uvm_reg_field count_mode1;
    // Variable: count_mode2
    // Port2 count mode: 0X (default): count_all; 10: count_forward; 11: count_discard 
    rand uvm_reg_field count_mode2;
    // Variable: count_mode3
    // Port3 count mode: 0X (default): count_all; 10: count_forward; 11: count_discard 
    rand uvm_reg_field count_mode3;
    // Variable: count_mode4
    // Port4 count mode: 
    rand uvm_reg_field count_mode4;
    // Variable: count_mode5
    // Port5 count mode: 
    rand uvm_reg_field count_mode5;
    // Variable: count_mode6
    // Port6 count mode: 
    rand uvm_reg_field count_mode6;
    // Variable: count_mode7
    // Port7 count mode: 
    rand uvm_reg_field count_mode7;
    // Variable: count_mode8
    // Port8 count mode: 
    rand uvm_reg_field count_mode8;
    // Variable: count_mode9
    // Port9 count mode: 
    rand uvm_reg_field count_mode9;
    // Variable: count_mode10
    // Port10 count mode: 
    rand uvm_reg_field count_mode10;
    // Variable: count_mode11
    // Port11 count mode: 
    rand uvm_reg_field count_mode11;
    // Variable: count_mode12
    // Port12 count mode: 
    rand uvm_reg_field count_mode12;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_class_stats_cpu_cfg_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_class_stats_cpu_cfg_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_class_stats_cpu_cfg_reg)

    // Constructor: new
    function new(string name = "globals_class_stats_cpu_cfg");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        count_mode1 = uvm_reg_field::type_id::create("count_mode1", , get_full_name());
        count_mode2 = uvm_reg_field::type_id::create("count_mode2", , get_full_name());
        count_mode3 = uvm_reg_field::type_id::create("count_mode3", , get_full_name());
        count_mode4 = uvm_reg_field::type_id::create("count_mode4", , get_full_name());
        count_mode5 = uvm_reg_field::type_id::create("count_mode5", , get_full_name());
        count_mode6 = uvm_reg_field::type_id::create("count_mode6", , get_full_name());
        count_mode7 = uvm_reg_field::type_id::create("count_mode7", , get_full_name());
        count_mode8 = uvm_reg_field::type_id::create("count_mode8", , get_full_name());
        count_mode9 = uvm_reg_field::type_id::create("count_mode9", , get_full_name());
        count_mode10 = uvm_reg_field::type_id::create("count_mode10", , get_full_name());
        count_mode11 = uvm_reg_field::type_id::create("count_mode11", , get_full_name());
        count_mode12 = uvm_reg_field::type_id::create("count_mode12", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        count_mode1.configure(this, 2, 0, "RW", 0, 'h0, 1, 1, 0);
        count_mode2.configure(this, 2, 2, "RW", 0, 'h0, 1, 1, 0);
        count_mode3.configure(this, 2, 4, "RW", 0, 'h0, 1, 1, 0);
        count_mode4.configure(this, 2, 6, "RW", 0, 'h0, 1, 1, 0);
        count_mode5.configure(this, 2, 8, "RW", 0, 'h0, 1, 1, 0);
        count_mode6.configure(this, 2, 10, "RW", 0, 'h0, 1, 1, 0);
        count_mode7.configure(this, 2, 12, "RW", 0, 'h0, 1, 1, 0);
        count_mode8.configure(this, 2, 14, "RW", 0, 'h0, 1, 1, 0);
        count_mode9.configure(this, 2, 16, "RW", 0, 'h0, 1, 1, 0);
        count_mode10.configure(this, 2, 18, "RW", 0, 'h0, 1, 1, 0);
        count_mode11.configure(this, 2, 20, "RW", 0, 'h0, 1, 1, 0);
        count_mode12.configure(this, 2, 22, "RW", 0, 'h0, 1, 1, 0);
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
                cg = globals_class_stats_cpu_cfg_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_class_stats_cpu_cfg_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, count_mode1.get_name, count_mode1.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, count_mode2.get_name, count_mode2.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, count_mode3.get_name, count_mode3.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, count_mode4.get_name, count_mode4.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, count_mode5.get_name, count_mode5.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, count_mode6.get_name, count_mode6.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, count_mode7.get_name, count_mode7.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, count_mode8.get_name, count_mode8.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, count_mode9.get_name, count_mode9.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, count_mode10.get_name, count_mode10.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, count_mode11.get_name, count_mode11.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, count_mode12.get_name, count_mode12.value);
        return s;
    endfunction

endclass


// Class: globals_class_stats_cpu_cfg_reg_cover
// Register coverage object.
class globals_class_stats_cpu_cfg_reg_cover extends uvm_object;

    static local globals_class_stats_cpu_cfg_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_class_stats_cpu_cfg_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        count_mode1_wr: coverpoint r.count_mode1.value iff (!is_read);
        count_mode1_rd: coverpoint r.count_mode1.value iff  (is_read);
        count_mode2_wr: coverpoint r.count_mode2.value iff (!is_read);
        count_mode2_rd: coverpoint r.count_mode2.value iff  (is_read);
        count_mode3_wr: coverpoint r.count_mode3.value iff (!is_read);
        count_mode3_rd: coverpoint r.count_mode3.value iff  (is_read);
        count_mode4_wr: coverpoint r.count_mode4.value iff (!is_read);
        count_mode4_rd: coverpoint r.count_mode4.value iff  (is_read);
        count_mode5_wr: coverpoint r.count_mode5.value iff (!is_read);
        count_mode5_rd: coverpoint r.count_mode5.value iff  (is_read);
        count_mode6_wr: coverpoint r.count_mode6.value iff (!is_read);
        count_mode6_rd: coverpoint r.count_mode6.value iff  (is_read);
        count_mode7_wr: coverpoint r.count_mode7.value iff (!is_read);
        count_mode7_rd: coverpoint r.count_mode7.value iff  (is_read);
        count_mode8_wr: coverpoint r.count_mode8.value iff (!is_read);
        count_mode8_rd: coverpoint r.count_mode8.value iff  (is_read);
        count_mode9_wr: coverpoint r.count_mode9.value iff (!is_read);
        count_mode9_rd: coverpoint r.count_mode9.value iff  (is_read);
        count_mode10_wr: coverpoint r.count_mode10.value iff (!is_read);
        count_mode10_rd: coverpoint r.count_mode10.value iff  (is_read);
        count_mode11_wr: coverpoint r.count_mode11.value iff (!is_read);
        count_mode11_rd: coverpoint r.count_mode11.value iff  (is_read);
        count_mode12_wr: coverpoint r.count_mode12.value iff (!is_read);
        count_mode12_rd: coverpoint r.count_mode12.value iff  (is_read);
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_class_stats_cpu_cfg_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_class_stats_cpu_cfg_reg_cover");
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
    static function globals_class_stats_cpu_cfg_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_class_stats_cpu_cfg_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_class_stats_cpu_cfg_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_cpu_mtu_size_reg_cover;

// Class: globals_cpu_mtu_size_reg
// Register globals.cpu_mtu_size: Maximum packet size in byte sent to cpu (if2cpu)
class globals_cpu_mtu_size_reg extends uvm_reg;

    // Variable: cpu_mtu_size
    // Pkt sent to cpu (if2cpu) greater than this value are discarded (never sent to CPU). The value must be a multiple of 2 (acd_st bus_width/8). The value is in byte. The value must be less or equal to the CPU_MRU - Tornado Header length (16 bytes) - FCS (4 bytes) The value must be less or equal to the TBB buffer size (2048) - SOP-HDR length (4 bytes) - security factor (8 bytes) to avoid buffer level reaching full The default value of 0x7E8=2024 come from 2048-16-4=2028 and must be a multiple of 8 for other platform (C1LT) with an acd_st bus width of 64
    rand uvm_reg_field cpu_mtu_size;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_cpu_mtu_size_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_cpu_mtu_size_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_cpu_mtu_size_reg)

    // Constructor: new
    function new(string name = "globals_cpu_mtu_size");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        cpu_mtu_size = uvm_reg_field::type_id::create("cpu_mtu_size", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        cpu_mtu_size.configure(this, 11, 0, "RW", 0, 'h7E8, 1, 1, 0);
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
                cg = globals_cpu_mtu_size_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_cpu_mtu_size_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, cpu_mtu_size.get_name, cpu_mtu_size.value);
        return s;
    endfunction

endclass


// Class: globals_cpu_mtu_size_reg_cover
// Register coverage object.
class globals_cpu_mtu_size_reg_cover extends uvm_object;

    static local globals_cpu_mtu_size_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_cpu_mtu_size_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        cpu_mtu_size_wr: coverpoint r.cpu_mtu_size.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        cpu_mtu_size_rd: coverpoint r.cpu_mtu_size.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_cpu_mtu_size_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_cpu_mtu_size_reg_cover");
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
    static function globals_cpu_mtu_size_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_cpu_mtu_size_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_cpu_mtu_size_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_debug_system_p0_0_reg_cover;

// Class: globals_debug_system_p0_0_reg
// Register globals.debug_system_p0_0: Misc debug register
class globals_debug_system_p0_0_reg extends uvm_reg;

    // Variable: debug
    // Input_section back-pressure
    rand uvm_reg_field debug;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_debug_system_p0_0_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_debug_system_p0_0_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p0_0_reg)

    // Constructor: new
    function new(string name = "globals_debug_system_p0_0");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        debug = uvm_reg_field::type_id::create("debug", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        debug.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = globals_debug_system_p0_0_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_debug_system_p0_0_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, debug.get_name, debug.value);
        return s;
    endfunction

endclass


// Class: globals_debug_system_p0_0_reg_cover
// Register coverage object.
class globals_debug_system_p0_0_reg_cover extends uvm_object;

    static local globals_debug_system_p0_0_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_debug_system_p0_0_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        debug_wr: coverpoint r.debug.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        debug_rd: coverpoint r.debug.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p0_0_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_debug_system_p0_0_reg_cover");
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
    static function globals_debug_system_p0_0_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_debug_system_p0_0_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_debug_system_p0_0_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_debug_system_p0_1_reg_cover;

// Class: globals_debug_system_p0_1_reg
// Register globals.debug_system_p0_1: Misc debug register
class globals_debug_system_p0_1_reg extends uvm_reg;

    // Variable: debug
    // Input_section back-pressure event
    rand uvm_reg_field debug;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_debug_system_p0_1_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_debug_system_p0_1_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p0_1_reg)

    // Constructor: new
    function new(string name = "globals_debug_system_p0_1");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        debug = uvm_reg_field::type_id::create("debug", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        debug.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = globals_debug_system_p0_1_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_debug_system_p0_1_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, debug.get_name, debug.value);
        return s;
    endfunction

endclass


// Class: globals_debug_system_p0_1_reg_cover
// Register coverage object.
class globals_debug_system_p0_1_reg_cover extends uvm_object;

    static local globals_debug_system_p0_1_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_debug_system_p0_1_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        debug_wr: coverpoint r.debug.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        debug_rd: coverpoint r.debug.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p0_1_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_debug_system_p0_1_reg_cover");
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
    static function globals_debug_system_p0_1_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_debug_system_p0_1_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_debug_system_p0_1_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_debug_system_p1_0_reg_cover;

// Class: globals_debug_system_p1_0_reg
// Register globals.debug_system_p1_0: Misc debug register
class globals_debug_system_p1_0_reg extends uvm_reg;

    // Variable: debug
    // Input_section back-pressure
    rand uvm_reg_field debug;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_debug_system_p1_0_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_debug_system_p1_0_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p1_0_reg)

    // Constructor: new
    function new(string name = "globals_debug_system_p1_0");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        debug = uvm_reg_field::type_id::create("debug", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        debug.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = globals_debug_system_p1_0_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_debug_system_p1_0_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, debug.get_name, debug.value);
        return s;
    endfunction

endclass


// Class: globals_debug_system_p1_0_reg_cover
// Register coverage object.
class globals_debug_system_p1_0_reg_cover extends uvm_object;

    static local globals_debug_system_p1_0_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_debug_system_p1_0_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        debug_wr: coverpoint r.debug.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        debug_rd: coverpoint r.debug.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p1_0_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_debug_system_p1_0_reg_cover");
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
    static function globals_debug_system_p1_0_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_debug_system_p1_0_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_debug_system_p1_0_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_debug_system_p1_1_reg_cover;

// Class: globals_debug_system_p1_1_reg
// Register globals.debug_system_p1_1: Misc debug register
class globals_debug_system_p1_1_reg extends uvm_reg;

    // Variable: debug
    // Input_section back-pressure event
    rand uvm_reg_field debug;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_debug_system_p1_1_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_debug_system_p1_1_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p1_1_reg)

    // Constructor: new
    function new(string name = "globals_debug_system_p1_1");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        debug = uvm_reg_field::type_id::create("debug", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        debug.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = globals_debug_system_p1_1_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_debug_system_p1_1_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, debug.get_name, debug.value);
        return s;
    endfunction

endclass


// Class: globals_debug_system_p1_1_reg_cover
// Register coverage object.
class globals_debug_system_p1_1_reg_cover extends uvm_object;

    static local globals_debug_system_p1_1_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_debug_system_p1_1_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        debug_wr: coverpoint r.debug.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        debug_rd: coverpoint r.debug.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p1_1_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_debug_system_p1_1_reg_cover");
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
    static function globals_debug_system_p1_1_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_debug_system_p1_1_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_debug_system_p1_1_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_debug_system_p2_0_reg_cover;

// Class: globals_debug_system_p2_0_reg
// Register globals.debug_system_p2_0: Misc debug register
class globals_debug_system_p2_0_reg extends uvm_reg;

    // Variable: debug
    // Input_section back-pressure
    rand uvm_reg_field debug;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_debug_system_p2_0_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_debug_system_p2_0_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p2_0_reg)

    // Constructor: new
    function new(string name = "globals_debug_system_p2_0");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        debug = uvm_reg_field::type_id::create("debug", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        debug.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = globals_debug_system_p2_0_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_debug_system_p2_0_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, debug.get_name, debug.value);
        return s;
    endfunction

endclass


// Class: globals_debug_system_p2_0_reg_cover
// Register coverage object.
class globals_debug_system_p2_0_reg_cover extends uvm_object;

    static local globals_debug_system_p2_0_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_debug_system_p2_0_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        debug_wr: coverpoint r.debug.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        debug_rd: coverpoint r.debug.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p2_0_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_debug_system_p2_0_reg_cover");
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
    static function globals_debug_system_p2_0_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_debug_system_p2_0_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_debug_system_p2_0_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_debug_system_p2_1_reg_cover;

// Class: globals_debug_system_p2_1_reg
// Register globals.debug_system_p2_1: Misc debug register
class globals_debug_system_p2_1_reg extends uvm_reg;

    // Variable: debug
    // Input_section back-pressure event
    rand uvm_reg_field debug;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_debug_system_p2_1_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_debug_system_p2_1_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p2_1_reg)

    // Constructor: new
    function new(string name = "globals_debug_system_p2_1");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        debug = uvm_reg_field::type_id::create("debug", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        debug.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = globals_debug_system_p2_1_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_debug_system_p2_1_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, debug.get_name, debug.value);
        return s;
    endfunction

endclass


// Class: globals_debug_system_p2_1_reg_cover
// Register coverage object.
class globals_debug_system_p2_1_reg_cover extends uvm_object;

    static local globals_debug_system_p2_1_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_debug_system_p2_1_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        debug_wr: coverpoint r.debug.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        debug_rd: coverpoint r.debug.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p2_1_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_debug_system_p2_1_reg_cover");
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
    static function globals_debug_system_p2_1_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_debug_system_p2_1_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_debug_system_p2_1_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_debug_system_p3_0_reg_cover;

// Class: globals_debug_system_p3_0_reg
// Register globals.debug_system_p3_0: Misc debug register
class globals_debug_system_p3_0_reg extends uvm_reg;

    // Variable: debug
    // Input_section back-pressure
    rand uvm_reg_field debug;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_debug_system_p3_0_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_debug_system_p3_0_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p3_0_reg)

    // Constructor: new
    function new(string name = "globals_debug_system_p3_0");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        debug = uvm_reg_field::type_id::create("debug", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        debug.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = globals_debug_system_p3_0_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_debug_system_p3_0_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, debug.get_name, debug.value);
        return s;
    endfunction

endclass


// Class: globals_debug_system_p3_0_reg_cover
// Register coverage object.
class globals_debug_system_p3_0_reg_cover extends uvm_object;

    static local globals_debug_system_p3_0_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_debug_system_p3_0_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        debug_wr: coverpoint r.debug.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        debug_rd: coverpoint r.debug.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p3_0_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_debug_system_p3_0_reg_cover");
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
    static function globals_debug_system_p3_0_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_debug_system_p3_0_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_debug_system_p3_0_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_debug_system_p3_1_reg_cover;

// Class: globals_debug_system_p3_1_reg
// Register globals.debug_system_p3_1: Misc debug register
class globals_debug_system_p3_1_reg extends uvm_reg;

    // Variable: debug
    // Input_section back-pressure event
    rand uvm_reg_field debug;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_debug_system_p3_1_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_debug_system_p3_1_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p3_1_reg)

    // Constructor: new
    function new(string name = "globals_debug_system_p3_1");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        debug = uvm_reg_field::type_id::create("debug", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        debug.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = globals_debug_system_p3_1_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_debug_system_p3_1_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, debug.get_name, debug.value);
        return s;
    endfunction

endclass


// Class: globals_debug_system_p3_1_reg_cover
// Register coverage object.
class globals_debug_system_p3_1_reg_cover extends uvm_object;

    static local globals_debug_system_p3_1_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_debug_system_p3_1_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        debug_wr: coverpoint r.debug.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        debug_rd: coverpoint r.debug.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p3_1_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_debug_system_p3_1_reg_cover");
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
    static function globals_debug_system_p3_1_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_debug_system_p3_1_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_debug_system_p3_1_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_debug_system_p4_0_reg_cover;

// Class: globals_debug_system_p4_0_reg
// Register globals.debug_system_p4_0: Misc debug register
class globals_debug_system_p4_0_reg extends uvm_reg;

    // Variable: debug
    // Input_section back-pressure
    rand uvm_reg_field debug;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_debug_system_p4_0_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_debug_system_p4_0_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p4_0_reg)

    // Constructor: new
    function new(string name = "globals_debug_system_p4_0");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        debug = uvm_reg_field::type_id::create("debug", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        debug.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = globals_debug_system_p4_0_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_debug_system_p4_0_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, debug.get_name, debug.value);
        return s;
    endfunction

endclass


// Class: globals_debug_system_p4_0_reg_cover
// Register coverage object.
class globals_debug_system_p4_0_reg_cover extends uvm_object;

    static local globals_debug_system_p4_0_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_debug_system_p4_0_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        debug_wr: coverpoint r.debug.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        debug_rd: coverpoint r.debug.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p4_0_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_debug_system_p4_0_reg_cover");
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
    static function globals_debug_system_p4_0_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_debug_system_p4_0_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_debug_system_p4_0_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_debug_system_p4_1_reg_cover;

// Class: globals_debug_system_p4_1_reg
// Register globals.debug_system_p4_1: Misc debug register
class globals_debug_system_p4_1_reg extends uvm_reg;

    // Variable: debug
    // Input_section back-pressure event
    rand uvm_reg_field debug;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_debug_system_p4_1_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_debug_system_p4_1_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p4_1_reg)

    // Constructor: new
    function new(string name = "globals_debug_system_p4_1");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        debug = uvm_reg_field::type_id::create("debug", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        debug.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = globals_debug_system_p4_1_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_debug_system_p4_1_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, debug.get_name, debug.value);
        return s;
    endfunction

endclass


// Class: globals_debug_system_p4_1_reg_cover
// Register coverage object.
class globals_debug_system_p4_1_reg_cover extends uvm_object;

    static local globals_debug_system_p4_1_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_debug_system_p4_1_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        debug_wr: coverpoint r.debug.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        debug_rd: coverpoint r.debug.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p4_1_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_debug_system_p4_1_reg_cover");
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
    static function globals_debug_system_p4_1_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_debug_system_p4_1_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_debug_system_p4_1_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_debug_system_p5_0_reg_cover;

// Class: globals_debug_system_p5_0_reg
// Register globals.debug_system_p5_0: Misc debug register
class globals_debug_system_p5_0_reg extends uvm_reg;

    // Variable: debug
    // Input_section back-pressure
    rand uvm_reg_field debug;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_debug_system_p5_0_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_debug_system_p5_0_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p5_0_reg)

    // Constructor: new
    function new(string name = "globals_debug_system_p5_0");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        debug = uvm_reg_field::type_id::create("debug", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        debug.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = globals_debug_system_p5_0_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_debug_system_p5_0_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, debug.get_name, debug.value);
        return s;
    endfunction

endclass


// Class: globals_debug_system_p5_0_reg_cover
// Register coverage object.
class globals_debug_system_p5_0_reg_cover extends uvm_object;

    static local globals_debug_system_p5_0_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_debug_system_p5_0_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        debug_wr: coverpoint r.debug.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        debug_rd: coverpoint r.debug.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p5_0_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_debug_system_p5_0_reg_cover");
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
    static function globals_debug_system_p5_0_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_debug_system_p5_0_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_debug_system_p5_0_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_debug_system_p5_1_reg_cover;

// Class: globals_debug_system_p5_1_reg
// Register globals.debug_system_p5_1: Misc debug register
class globals_debug_system_p5_1_reg extends uvm_reg;

    // Variable: debug
    // Input_section back-pressure event
    rand uvm_reg_field debug;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_debug_system_p5_1_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_debug_system_p5_1_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p5_1_reg)

    // Constructor: new
    function new(string name = "globals_debug_system_p5_1");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        debug = uvm_reg_field::type_id::create("debug", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        debug.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = globals_debug_system_p5_1_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_debug_system_p5_1_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, debug.get_name, debug.value);
        return s;
    endfunction

endclass


// Class: globals_debug_system_p5_1_reg_cover
// Register coverage object.
class globals_debug_system_p5_1_reg_cover extends uvm_object;

    static local globals_debug_system_p5_1_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_debug_system_p5_1_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        debug_wr: coverpoint r.debug.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        debug_rd: coverpoint r.debug.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p5_1_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_debug_system_p5_1_reg_cover");
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
    static function globals_debug_system_p5_1_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_debug_system_p5_1_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_debug_system_p5_1_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_debug_system_p6_0_reg_cover;

// Class: globals_debug_system_p6_0_reg
// Register globals.debug_system_p6_0: Misc debug register
class globals_debug_system_p6_0_reg extends uvm_reg;

    // Variable: debug
    // Input_section back-pressure
    rand uvm_reg_field debug;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_debug_system_p6_0_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_debug_system_p6_0_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p6_0_reg)

    // Constructor: new
    function new(string name = "globals_debug_system_p6_0");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        debug = uvm_reg_field::type_id::create("debug", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        debug.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = globals_debug_system_p6_0_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_debug_system_p6_0_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, debug.get_name, debug.value);
        return s;
    endfunction

endclass


// Class: globals_debug_system_p6_0_reg_cover
// Register coverage object.
class globals_debug_system_p6_0_reg_cover extends uvm_object;

    static local globals_debug_system_p6_0_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_debug_system_p6_0_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        debug_wr: coverpoint r.debug.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        debug_rd: coverpoint r.debug.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p6_0_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_debug_system_p6_0_reg_cover");
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
    static function globals_debug_system_p6_0_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_debug_system_p6_0_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_debug_system_p6_0_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_debug_system_p6_1_reg_cover;

// Class: globals_debug_system_p6_1_reg
// Register globals.debug_system_p6_1: Misc debug register
class globals_debug_system_p6_1_reg extends uvm_reg;

    // Variable: debug
    // Input_section back-pressure event
    rand uvm_reg_field debug;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_debug_system_p6_1_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_debug_system_p6_1_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p6_1_reg)

    // Constructor: new
    function new(string name = "globals_debug_system_p6_1");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        debug = uvm_reg_field::type_id::create("debug", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        debug.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = globals_debug_system_p6_1_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_debug_system_p6_1_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, debug.get_name, debug.value);
        return s;
    endfunction

endclass


// Class: globals_debug_system_p6_1_reg_cover
// Register coverage object.
class globals_debug_system_p6_1_reg_cover extends uvm_object;

    static local globals_debug_system_p6_1_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_debug_system_p6_1_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        debug_wr: coverpoint r.debug.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        debug_rd: coverpoint r.debug.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p6_1_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_debug_system_p6_1_reg_cover");
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
    static function globals_debug_system_p6_1_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_debug_system_p6_1_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_debug_system_p6_1_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_debug_system_p7_0_reg_cover;

// Class: globals_debug_system_p7_0_reg
// Register globals.debug_system_p7_0: Misc debug register
class globals_debug_system_p7_0_reg extends uvm_reg;

    // Variable: debug
    // Input_section back-pressure
    rand uvm_reg_field debug;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_debug_system_p7_0_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_debug_system_p7_0_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p7_0_reg)

    // Constructor: new
    function new(string name = "globals_debug_system_p7_0");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        debug = uvm_reg_field::type_id::create("debug", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        debug.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = globals_debug_system_p7_0_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_debug_system_p7_0_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, debug.get_name, debug.value);
        return s;
    endfunction

endclass


// Class: globals_debug_system_p7_0_reg_cover
// Register coverage object.
class globals_debug_system_p7_0_reg_cover extends uvm_object;

    static local globals_debug_system_p7_0_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_debug_system_p7_0_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        debug_wr: coverpoint r.debug.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        debug_rd: coverpoint r.debug.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p7_0_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_debug_system_p7_0_reg_cover");
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
    static function globals_debug_system_p7_0_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_debug_system_p7_0_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_debug_system_p7_0_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_debug_system_p7_1_reg_cover;

// Class: globals_debug_system_p7_1_reg
// Register globals.debug_system_p7_1: Misc debug register
class globals_debug_system_p7_1_reg extends uvm_reg;

    // Variable: debug
    // Input_section back-pressure event
    rand uvm_reg_field debug;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_debug_system_p7_1_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_debug_system_p7_1_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p7_1_reg)

    // Constructor: new
    function new(string name = "globals_debug_system_p7_1");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        debug = uvm_reg_field::type_id::create("debug", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        debug.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = globals_debug_system_p7_1_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_debug_system_p7_1_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, debug.get_name, debug.value);
        return s;
    endfunction

endclass


// Class: globals_debug_system_p7_1_reg_cover
// Register coverage object.
class globals_debug_system_p7_1_reg_cover extends uvm_object;

    static local globals_debug_system_p7_1_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_debug_system_p7_1_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        debug_wr: coverpoint r.debug.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        debug_rd: coverpoint r.debug.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p7_1_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_debug_system_p7_1_reg_cover");
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
    static function globals_debug_system_p7_1_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_debug_system_p7_1_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_debug_system_p7_1_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_debug_system_p8_0_reg_cover;

// Class: globals_debug_system_p8_0_reg
// Register globals.debug_system_p8_0: Misc debug register
class globals_debug_system_p8_0_reg extends uvm_reg;

    // Variable: debug
    // Input_section back-pressure
    rand uvm_reg_field debug;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_debug_system_p8_0_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_debug_system_p8_0_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p8_0_reg)

    // Constructor: new
    function new(string name = "globals_debug_system_p8_0");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        debug = uvm_reg_field::type_id::create("debug", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        debug.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = globals_debug_system_p8_0_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_debug_system_p8_0_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, debug.get_name, debug.value);
        return s;
    endfunction

endclass


// Class: globals_debug_system_p8_0_reg_cover
// Register coverage object.
class globals_debug_system_p8_0_reg_cover extends uvm_object;

    static local globals_debug_system_p8_0_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_debug_system_p8_0_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        debug_wr: coverpoint r.debug.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        debug_rd: coverpoint r.debug.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p8_0_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_debug_system_p8_0_reg_cover");
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
    static function globals_debug_system_p8_0_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_debug_system_p8_0_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_debug_system_p8_0_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_debug_system_p8_1_reg_cover;

// Class: globals_debug_system_p8_1_reg
// Register globals.debug_system_p8_1: Misc debug register
class globals_debug_system_p8_1_reg extends uvm_reg;

    // Variable: debug
    // Input_section back-pressure event
    rand uvm_reg_field debug;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_debug_system_p8_1_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_debug_system_p8_1_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p8_1_reg)

    // Constructor: new
    function new(string name = "globals_debug_system_p8_1");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        debug = uvm_reg_field::type_id::create("debug", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        debug.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = globals_debug_system_p8_1_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_debug_system_p8_1_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, debug.get_name, debug.value);
        return s;
    endfunction

endclass


// Class: globals_debug_system_p8_1_reg_cover
// Register coverage object.
class globals_debug_system_p8_1_reg_cover extends uvm_object;

    static local globals_debug_system_p8_1_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_debug_system_p8_1_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        debug_wr: coverpoint r.debug.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        debug_rd: coverpoint r.debug.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p8_1_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_debug_system_p8_1_reg_cover");
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
    static function globals_debug_system_p8_1_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_debug_system_p8_1_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_debug_system_p8_1_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_debug_system_p9_0_reg_cover;

// Class: globals_debug_system_p9_0_reg
// Register globals.debug_system_p9_0: Misc debug register
class globals_debug_system_p9_0_reg extends uvm_reg;

    // Variable: debug
    // Input_section back-pressure
    rand uvm_reg_field debug;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_debug_system_p9_0_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_debug_system_p9_0_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p9_0_reg)

    // Constructor: new
    function new(string name = "globals_debug_system_p9_0");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        debug = uvm_reg_field::type_id::create("debug", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        debug.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = globals_debug_system_p9_0_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_debug_system_p9_0_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, debug.get_name, debug.value);
        return s;
    endfunction

endclass


// Class: globals_debug_system_p9_0_reg_cover
// Register coverage object.
class globals_debug_system_p9_0_reg_cover extends uvm_object;

    static local globals_debug_system_p9_0_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_debug_system_p9_0_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        debug_wr: coverpoint r.debug.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        debug_rd: coverpoint r.debug.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p9_0_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_debug_system_p9_0_reg_cover");
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
    static function globals_debug_system_p9_0_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_debug_system_p9_0_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_debug_system_p9_0_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_debug_system_p9_1_reg_cover;

// Class: globals_debug_system_p9_1_reg
// Register globals.debug_system_p9_1: Misc debug register
class globals_debug_system_p9_1_reg extends uvm_reg;

    // Variable: debug
    // Input_section back-pressure event
    rand uvm_reg_field debug;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_debug_system_p9_1_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_debug_system_p9_1_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p9_1_reg)

    // Constructor: new
    function new(string name = "globals_debug_system_p9_1");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        debug = uvm_reg_field::type_id::create("debug", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        debug.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = globals_debug_system_p9_1_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_debug_system_p9_1_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, debug.get_name, debug.value);
        return s;
    endfunction

endclass


// Class: globals_debug_system_p9_1_reg_cover
// Register coverage object.
class globals_debug_system_p9_1_reg_cover extends uvm_object;

    static local globals_debug_system_p9_1_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_debug_system_p9_1_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        debug_wr: coverpoint r.debug.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        debug_rd: coverpoint r.debug.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p9_1_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_debug_system_p9_1_reg_cover");
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
    static function globals_debug_system_p9_1_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_debug_system_p9_1_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_debug_system_p9_1_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_debug_system_p10_0_reg_cover;

// Class: globals_debug_system_p10_0_reg
// Register globals.debug_system_p10_0: Misc debug register
class globals_debug_system_p10_0_reg extends uvm_reg;

    // Variable: debug
    // Input_section back-pressure
    rand uvm_reg_field debug;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_debug_system_p10_0_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_debug_system_p10_0_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p10_0_reg)

    // Constructor: new
    function new(string name = "globals_debug_system_p10_0");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        debug = uvm_reg_field::type_id::create("debug", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        debug.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = globals_debug_system_p10_0_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_debug_system_p10_0_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, debug.get_name, debug.value);
        return s;
    endfunction

endclass


// Class: globals_debug_system_p10_0_reg_cover
// Register coverage object.
class globals_debug_system_p10_0_reg_cover extends uvm_object;

    static local globals_debug_system_p10_0_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_debug_system_p10_0_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        debug_wr: coverpoint r.debug.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        debug_rd: coverpoint r.debug.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p10_0_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_debug_system_p10_0_reg_cover");
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
    static function globals_debug_system_p10_0_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_debug_system_p10_0_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_debug_system_p10_0_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_debug_system_p10_1_reg_cover;

// Class: globals_debug_system_p10_1_reg
// Register globals.debug_system_p10_1: Misc debug register
class globals_debug_system_p10_1_reg extends uvm_reg;

    // Variable: debug
    // Input_section back-pressure event
    rand uvm_reg_field debug;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_debug_system_p10_1_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_debug_system_p10_1_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p10_1_reg)

    // Constructor: new
    function new(string name = "globals_debug_system_p10_1");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        debug = uvm_reg_field::type_id::create("debug", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        debug.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = globals_debug_system_p10_1_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_debug_system_p10_1_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, debug.get_name, debug.value);
        return s;
    endfunction

endclass


// Class: globals_debug_system_p10_1_reg_cover
// Register coverage object.
class globals_debug_system_p10_1_reg_cover extends uvm_object;

    static local globals_debug_system_p10_1_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_debug_system_p10_1_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        debug_wr: coverpoint r.debug.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        debug_rd: coverpoint r.debug.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p10_1_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_debug_system_p10_1_reg_cover");
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
    static function globals_debug_system_p10_1_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_debug_system_p10_1_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_debug_system_p10_1_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_debug_system_p11_0_reg_cover;

// Class: globals_debug_system_p11_0_reg
// Register globals.debug_system_p11_0: Misc debug register
class globals_debug_system_p11_0_reg extends uvm_reg;

    // Variable: debug
    // Input_section back-pressure
    rand uvm_reg_field debug;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_debug_system_p11_0_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_debug_system_p11_0_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p11_0_reg)

    // Constructor: new
    function new(string name = "globals_debug_system_p11_0");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        debug = uvm_reg_field::type_id::create("debug", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        debug.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = globals_debug_system_p11_0_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_debug_system_p11_0_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, debug.get_name, debug.value);
        return s;
    endfunction

endclass


// Class: globals_debug_system_p11_0_reg_cover
// Register coverage object.
class globals_debug_system_p11_0_reg_cover extends uvm_object;

    static local globals_debug_system_p11_0_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_debug_system_p11_0_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        debug_wr: coverpoint r.debug.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        debug_rd: coverpoint r.debug.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p11_0_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_debug_system_p11_0_reg_cover");
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
    static function globals_debug_system_p11_0_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_debug_system_p11_0_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_debug_system_p11_0_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_debug_system_p11_1_reg_cover;

// Class: globals_debug_system_p11_1_reg
// Register globals.debug_system_p11_1: Misc debug register
class globals_debug_system_p11_1_reg extends uvm_reg;

    // Variable: debug
    // Input_section back-pressure event
    rand uvm_reg_field debug;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_debug_system_p11_1_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_debug_system_p11_1_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p11_1_reg)

    // Constructor: new
    function new(string name = "globals_debug_system_p11_1");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        debug = uvm_reg_field::type_id::create("debug", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        debug.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = globals_debug_system_p11_1_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_debug_system_p11_1_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, debug.get_name, debug.value);
        return s;
    endfunction

endclass


// Class: globals_debug_system_p11_1_reg_cover
// Register coverage object.
class globals_debug_system_p11_1_reg_cover extends uvm_object;

    static local globals_debug_system_p11_1_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_debug_system_p11_1_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        debug_wr: coverpoint r.debug.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        debug_rd: coverpoint r.debug.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_p11_1_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_debug_system_p11_1_reg_cover");
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
    static function globals_debug_system_p11_1_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_debug_system_p11_1_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_debug_system_p11_1_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_capture_address_reg_cover;

// Class: globals_capture_address_reg
// Register globals.capture_address: Misc debug register
class globals_capture_address_reg extends uvm_reg;

    // Variable: debug
    // Logger debug
    rand uvm_reg_field debug;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_capture_address_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_capture_address_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_capture_address_reg)

    // Constructor: new
    function new(string name = "globals_capture_address");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        debug = uvm_reg_field::type_id::create("debug", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        debug.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = globals_capture_address_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_capture_address_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, debug.get_name, debug.value);
        return s;
    endfunction

endclass


// Class: globals_capture_address_reg_cover
// Register coverage object.
class globals_capture_address_reg_cover extends uvm_object;

    static local globals_capture_address_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_capture_address_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        debug_wr: coverpoint r.debug.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        debug_rd: coverpoint r.debug.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_capture_address_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_capture_address_reg_cover");
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
    static function globals_capture_address_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_capture_address_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_capture_address_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_debug_system_reg_cover;

// Class: globals_debug_system_reg
// Register globals.debug_system: Misc debug register
class globals_debug_system_reg extends uvm_reg;

    // Variable: inp1_busy
    // Latch for Port-1 Input_section back-pressure
    rand uvm_reg_field inp1_busy;
    // Variable: inp2_busy
    // Latch for Port-2 Input_section back-pressure
    rand uvm_reg_field inp2_busy;
    // Variable: inp3_busy
    // Latch for Port-3 Input_section back-pressure
    rand uvm_reg_field inp3_busy;
    // Variable: inp4_busy
    // Latch for Port-4 Input_section back-pressure
    rand uvm_reg_field inp4_busy;
    // Variable: inp5_busy
    // Latch for Port-5 Input_section back-pressure
    rand uvm_reg_field inp5_busy;
    // Variable: inp6_busy
    // Latch for Port-6 Input_section back-pressure
    rand uvm_reg_field inp6_busy;
    // Variable: inp7_busy
    // Latch for Port-7 Input_section back-pressure
    rand uvm_reg_field inp7_busy;
    // Variable: inp8_busy
    // Latch for Port-8 Input_section back-pressure
    rand uvm_reg_field inp8_busy;
    // Variable: inp9_busy
    // Latch for Port-9 Input_section back-pressure
    rand uvm_reg_field inp9_busy;
    // Variable: inp10_busy
    // Latch for Port-10 Input_section back-pressure
    rand uvm_reg_field inp10_busy;
    // Variable: inp11_busy
    // Latch for Port-11 Input_section back-pressure
    rand uvm_reg_field inp11_busy;
    // Variable: inp12_busy
    // Latch for Port-12 Input_section back-pressure
    rand uvm_reg_field inp12_busy;
    // Variable: packetgen_not_ready
    // Latch for Packegen RFC2544 input not ready
    rand uvm_reg_field packetgen_not_ready;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_debug_system_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_debug_system_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_reg)

    // Constructor: new
    function new(string name = "globals_debug_system");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        inp1_busy = uvm_reg_field::type_id::create("inp1_busy", , get_full_name());
        inp2_busy = uvm_reg_field::type_id::create("inp2_busy", , get_full_name());
        inp3_busy = uvm_reg_field::type_id::create("inp3_busy", , get_full_name());
        inp4_busy = uvm_reg_field::type_id::create("inp4_busy", , get_full_name());
        inp5_busy = uvm_reg_field::type_id::create("inp5_busy", , get_full_name());
        inp6_busy = uvm_reg_field::type_id::create("inp6_busy", , get_full_name());
        inp7_busy = uvm_reg_field::type_id::create("inp7_busy", , get_full_name());
        inp8_busy = uvm_reg_field::type_id::create("inp8_busy", , get_full_name());
        inp9_busy = uvm_reg_field::type_id::create("inp9_busy", , get_full_name());
        inp10_busy = uvm_reg_field::type_id::create("inp10_busy", , get_full_name());
        inp11_busy = uvm_reg_field::type_id::create("inp11_busy", , get_full_name());
        inp12_busy = uvm_reg_field::type_id::create("inp12_busy", , get_full_name());
        packetgen_not_ready = uvm_reg_field::type_id::create("packetgen_not_ready", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        inp1_busy.configure(this, 1, 0, "RO", 0, 'h0, 1, 1, 0);
        inp2_busy.configure(this, 1, 1, "RO", 0, 'h0, 1, 1, 0);
        inp3_busy.configure(this, 1, 2, "RO", 0, 'h0, 1, 1, 0);
        inp4_busy.configure(this, 1, 3, "RO", 0, 'h0, 1, 1, 0);
        inp5_busy.configure(this, 1, 4, "RO", 0, 'h0, 1, 1, 0);
        inp6_busy.configure(this, 1, 5, "RO", 0, 'h0, 1, 1, 0);
        inp7_busy.configure(this, 1, 6, "RO", 0, 'h0, 1, 1, 0);
        inp8_busy.configure(this, 1, 7, "RO", 0, 'h0, 1, 1, 0);
        inp9_busy.configure(this, 1, 8, "RO", 0, 'h0, 1, 1, 0);
        inp10_busy.configure(this, 1, 9, "RO", 0, 'h0, 1, 1, 0);
        inp11_busy.configure(this, 1, 10, "RO", 0, 'h0, 1, 1, 0);
        inp12_busy.configure(this, 1, 11, "RO", 0, 'h0, 1, 1, 0);
        packetgen_not_ready.configure(this, 1, 12, "RO", 0, 'h0, 1, 1, 0);
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
                cg = globals_debug_system_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_debug_system_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, inp1_busy.get_name, inp1_busy.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, inp2_busy.get_name, inp2_busy.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, inp3_busy.get_name, inp3_busy.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, inp4_busy.get_name, inp4_busy.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, inp5_busy.get_name, inp5_busy.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, inp6_busy.get_name, inp6_busy.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, inp7_busy.get_name, inp7_busy.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, inp8_busy.get_name, inp8_busy.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, inp9_busy.get_name, inp9_busy.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, inp10_busy.get_name, inp10_busy.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, inp11_busy.get_name, inp11_busy.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, inp12_busy.get_name, inp12_busy.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, packetgen_not_ready.get_name, packetgen_not_ready.value);
        return s;
    endfunction

endclass


// Class: globals_debug_system_reg_cover
// Register coverage object.
class globals_debug_system_reg_cover extends uvm_object;

    static local globals_debug_system_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_debug_system_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        inp1_busy_wr: coverpoint r.inp1_busy.value iff (!is_read);
        inp1_busy_rd: coverpoint r.inp1_busy.value iff  (is_read);
        inp2_busy_wr: coverpoint r.inp2_busy.value iff (!is_read);
        inp2_busy_rd: coverpoint r.inp2_busy.value iff  (is_read);
        inp3_busy_wr: coverpoint r.inp3_busy.value iff (!is_read);
        inp3_busy_rd: coverpoint r.inp3_busy.value iff  (is_read);
        inp4_busy_wr: coverpoint r.inp4_busy.value iff (!is_read);
        inp4_busy_rd: coverpoint r.inp4_busy.value iff  (is_read);
        inp5_busy_wr: coverpoint r.inp5_busy.value iff (!is_read);
        inp5_busy_rd: coverpoint r.inp5_busy.value iff  (is_read);
        inp6_busy_wr: coverpoint r.inp6_busy.value iff (!is_read);
        inp6_busy_rd: coverpoint r.inp6_busy.value iff  (is_read);
        inp7_busy_wr: coverpoint r.inp7_busy.value iff (!is_read);
        inp7_busy_rd: coverpoint r.inp7_busy.value iff  (is_read);
        inp8_busy_wr: coverpoint r.inp8_busy.value iff (!is_read);
        inp8_busy_rd: coverpoint r.inp8_busy.value iff  (is_read);
        inp9_busy_wr: coverpoint r.inp9_busy.value iff (!is_read);
        inp9_busy_rd: coverpoint r.inp9_busy.value iff  (is_read);
        inp10_busy_wr: coverpoint r.inp10_busy.value iff (!is_read);
        inp10_busy_rd: coverpoint r.inp10_busy.value iff  (is_read);
        inp11_busy_wr: coverpoint r.inp11_busy.value iff (!is_read);
        inp11_busy_rd: coverpoint r.inp11_busy.value iff  (is_read);
        inp12_busy_wr: coverpoint r.inp12_busy.value iff (!is_read);
        inp12_busy_rd: coverpoint r.inp12_busy.value iff  (is_read);
        packetgen_not_ready_wr: coverpoint r.packetgen_not_ready.value iff (!is_read);
        packetgen_not_ready_rd: coverpoint r.packetgen_not_ready.value iff  (is_read);
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_debug_system_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_debug_system_reg_cover");
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
    static function globals_debug_system_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_debug_system_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_debug_system_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_dbg_tm_reg_cover;

// Class: globals_dbg_tm_reg
// Register globals.dbg_tm: Debug TM
class globals_dbg_tm_reg extends uvm_reg;

    // Variable: tm_sw_rst
    // Reset traffic manager
    rand uvm_reg_field tm_sw_rst;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_dbg_tm_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_dbg_tm_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_dbg_tm_reg)

    // Constructor: new
    function new(string name = "globals_dbg_tm");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        tm_sw_rst = uvm_reg_field::type_id::create("tm_sw_rst", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        tm_sw_rst.configure(this, 1, 3, "RW", 0, 'h0, 1, 1, 0);
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
                cg = globals_dbg_tm_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_dbg_tm_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, tm_sw_rst.get_name, tm_sw_rst.value);
        return s;
    endfunction

endclass


// Class: globals_dbg_tm_reg_cover
// Register coverage object.
class globals_dbg_tm_reg_cover extends uvm_object;

    static local globals_dbg_tm_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_dbg_tm_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        tm_sw_rst_wr: coverpoint r.tm_sw_rst.value iff (!is_read);
        tm_sw_rst_rd: coverpoint r.tm_sw_rst.value iff  (is_read);
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_dbg_tm_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_dbg_tm_reg_cover");
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
    static function globals_dbg_tm_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_dbg_tm_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_dbg_tm_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_dbg_cs_select_reg_cover;

// Class: globals_dbg_cs_select_reg
// Register globals.dbg_cs_select: Chipscope mux selector
class globals_dbg_cs_select_reg extends uvm_reg;

    // Variable: mux
    // Data selection
    rand uvm_reg_field mux;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_dbg_cs_select_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_dbg_cs_select_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_dbg_cs_select_reg)

    // Constructor: new
    function new(string name = "globals_dbg_cs_select");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        mux = uvm_reg_field::type_id::create("mux", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        mux.configure(this, 4, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = globals_dbg_cs_select_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_dbg_cs_select_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, mux.get_name, mux.value);
        return s;
    endfunction

endclass


// Class: globals_dbg_cs_select_reg_cover
// Register coverage object.
class globals_dbg_cs_select_reg_cover extends uvm_object;

    static local globals_dbg_cs_select_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_dbg_cs_select_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        mux_wr: coverpoint r.mux.value iff (!is_read);
        mux_rd: coverpoint r.mux.value iff  (is_read);
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_dbg_cs_select_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_dbg_cs_select_reg_cover");
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
    static function globals_dbg_cs_select_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_dbg_cs_select_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_dbg_cs_select_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_dbg_cs1_reg_cover;

// Class: globals_dbg_cs1_reg
// Register globals.dbg_cs1: Chipscope data
class globals_dbg_cs1_reg extends uvm_reg;

    // Variable: data
    // Data selection
    rand uvm_reg_field data;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_dbg_cs1_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_dbg_cs1_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_dbg_cs1_reg)

    // Constructor: new
    function new(string name = "globals_dbg_cs1");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        data = uvm_reg_field::type_id::create("data", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        data.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = globals_dbg_cs1_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_dbg_cs1_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, data.get_name, data.value);
        return s;
    endfunction

endclass


// Class: globals_dbg_cs1_reg_cover
// Register coverage object.
class globals_dbg_cs1_reg_cover extends uvm_object;

    static local globals_dbg_cs1_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_dbg_cs1_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        data_wr: coverpoint r.data.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        data_rd: coverpoint r.data.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_dbg_cs1_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_dbg_cs1_reg_cover");
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
    static function globals_dbg_cs1_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_dbg_cs1_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_dbg_cs1_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_dbg_cs2_reg_cover;

// Class: globals_dbg_cs2_reg
// Register globals.dbg_cs2: Chipscope data
class globals_dbg_cs2_reg extends uvm_reg;

    // Variable: data
    // Data selection
    rand uvm_reg_field data;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_dbg_cs2_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_dbg_cs2_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(chip_global_reg_pkg::globals_dbg_cs2_reg)

    // Constructor: new
    function new(string name = "globals_dbg_cs2");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        data = uvm_reg_field::type_id::create("data", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        data.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = globals_dbg_cs2_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_dbg_cs2_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, data.get_name, data.value);
        return s;
    endfunction

endclass


// Class: globals_dbg_cs2_reg_cover
// Register coverage object.
class globals_dbg_cs2_reg_cover extends uvm_object;

    static local globals_dbg_cs2_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_dbg_cs2_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        data_wr: coverpoint r.data.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        data_rd: coverpoint r.data.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(chip_global_reg_pkg::globals_dbg_cs2_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_dbg_cs2_reg_cover");
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
    static function globals_dbg_cs2_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_dbg_cs2_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_dbg_cs2_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass





// Class: chip_global_reg_block
// Register Block .chip_global: 
class chip_global_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand globals_scratch_reg scratch;
    rand globals_mac_base_addr_reg mac_base_addr;
    rand globals_cpu2if_port_shaper_debit_reg cpu2if_port_shaper_debit;
    rand globals_bw_attribs_reg bw_attribs;
    rand globals_link_status_mask_reg link_status_mask;
    rand globals_link_status_sw_reg link_status_sw;
    rand globals_mon_cfg_reg mon_cfg;
    rand globals_tlcs_reg tlcs;
    rand globals_tbb_nni_level_reg tbb_nni_level;
    rand globals_tbb_uni_10g_level_reg tbb_uni_10g_level;
    rand globals_tbb_uni_1g_level_reg tbb_uni_1g_level;
    rand globals_hidden_rules_version_reg hidden_rules_version;
    rand globals_class_scanmode_reg class_scanmode;
    rand globals_global_input_cfg_0_reg global_input_cfg_0;
    rand globals_global_input_cfg_1_reg global_input_cfg_1;
    rand globals_version_changeset_reg version_changeset;
    rand globals_version_build_reg version_build;
    rand globals_version_release_reg version_release;
    rand globals_capabilities_0_reg capabilities_0;
    rand globals_capabilities_1_reg capabilities_1;
    rand globals_register_version_reg register_version;
    rand globals_dbg_cfg_0_reg dbg_cfg_0;
    rand globals_status1_reg status1;
    rand globals_status2_reg status2;
    rand globals_clk_status_reg clk_status;
    rand globals_class_stats_cpu_cfg_reg class_stats_cpu_cfg;
    rand globals_cpu_mtu_size_reg cpu_mtu_size;
    rand globals_debug_system_p0_0_reg debug_system_p0_0;
    rand globals_debug_system_p0_1_reg debug_system_p0_1;
    rand globals_debug_system_p1_0_reg debug_system_p1_0;
    rand globals_debug_system_p1_1_reg debug_system_p1_1;
    rand globals_debug_system_p2_0_reg debug_system_p2_0;
    rand globals_debug_system_p2_1_reg debug_system_p2_1;
    rand globals_debug_system_p3_0_reg debug_system_p3_0;
    rand globals_debug_system_p3_1_reg debug_system_p3_1;
    rand globals_debug_system_p4_0_reg debug_system_p4_0;
    rand globals_debug_system_p4_1_reg debug_system_p4_1;
    rand globals_debug_system_p5_0_reg debug_system_p5_0;
    rand globals_debug_system_p5_1_reg debug_system_p5_1;
    rand globals_debug_system_p6_0_reg debug_system_p6_0;
    rand globals_debug_system_p6_1_reg debug_system_p6_1;
    rand globals_debug_system_p7_0_reg debug_system_p7_0;
    rand globals_debug_system_p7_1_reg debug_system_p7_1;
    rand globals_debug_system_p8_0_reg debug_system_p8_0;
    rand globals_debug_system_p8_1_reg debug_system_p8_1;
    rand globals_debug_system_p9_0_reg debug_system_p9_0;
    rand globals_debug_system_p9_1_reg debug_system_p9_1;
    rand globals_debug_system_p10_0_reg debug_system_p10_0;
    rand globals_debug_system_p10_1_reg debug_system_p10_1;
    rand globals_debug_system_p11_0_reg debug_system_p11_0;
    rand globals_debug_system_p11_1_reg debug_system_p11_1;
    rand globals_capture_address_reg capture_address;
    rand globals_debug_system_reg debug_system;
    rand globals_dbg_tm_reg dbg_tm;
    rand globals_dbg_cs_select_reg dbg_cs_select;
    rand globals_dbg_cs1_reg dbg_cs1;
    rand globals_dbg_cs2_reg dbg_cs2;
    rand port_input_cfg_reg_block port_input_cfg[];

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(chip_global_reg_pkg::chip_global_reg_block)

    // Constructor: new
    function new(string name = "chip_global_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        port_input_cfg = new[12];

        scratch = globals_scratch_reg::type_id::create("scratch", , get_full_name());
        mac_base_addr = globals_mac_base_addr_reg::type_id::create("mac_base_addr", , get_full_name());
        cpu2if_port_shaper_debit = globals_cpu2if_port_shaper_debit_reg::type_id::create("cpu2if_port_shaper_debit", , get_full_name());
        bw_attribs = globals_bw_attribs_reg::type_id::create("bw_attribs", , get_full_name());
        link_status_mask = globals_link_status_mask_reg::type_id::create("link_status_mask", , get_full_name());
        link_status_sw = globals_link_status_sw_reg::type_id::create("link_status_sw", , get_full_name());
        mon_cfg = globals_mon_cfg_reg::type_id::create("mon_cfg", , get_full_name());
        tlcs = globals_tlcs_reg::type_id::create("tlcs", , get_full_name());
        tbb_nni_level = globals_tbb_nni_level_reg::type_id::create("tbb_nni_level", , get_full_name());
        tbb_uni_10g_level = globals_tbb_uni_10g_level_reg::type_id::create("tbb_uni_10g_level", , get_full_name());
        tbb_uni_1g_level = globals_tbb_uni_1g_level_reg::type_id::create("tbb_uni_1g_level", , get_full_name());
        hidden_rules_version = globals_hidden_rules_version_reg::type_id::create("hidden_rules_version", , get_full_name());
        class_scanmode = globals_class_scanmode_reg::type_id::create("class_scanmode", , get_full_name());
        global_input_cfg_0 = globals_global_input_cfg_0_reg::type_id::create("global_input_cfg_0", , get_full_name());
        global_input_cfg_1 = globals_global_input_cfg_1_reg::type_id::create("global_input_cfg_1", , get_full_name());
        version_changeset = globals_version_changeset_reg::type_id::create("version_changeset", , get_full_name());
        version_build = globals_version_build_reg::type_id::create("version_build", , get_full_name());
        version_release = globals_version_release_reg::type_id::create("version_release", , get_full_name());
        capabilities_0 = globals_capabilities_0_reg::type_id::create("capabilities_0", , get_full_name());
        capabilities_1 = globals_capabilities_1_reg::type_id::create("capabilities_1", , get_full_name());
        register_version = globals_register_version_reg::type_id::create("register_version", , get_full_name());
        dbg_cfg_0 = globals_dbg_cfg_0_reg::type_id::create("dbg_cfg_0", , get_full_name());
        status1 = globals_status1_reg::type_id::create("status1", , get_full_name());
        status2 = globals_status2_reg::type_id::create("status2", , get_full_name());
        clk_status = globals_clk_status_reg::type_id::create("clk_status", , get_full_name());
        class_stats_cpu_cfg = globals_class_stats_cpu_cfg_reg::type_id::create("class_stats_cpu_cfg", , get_full_name());
        cpu_mtu_size = globals_cpu_mtu_size_reg::type_id::create("cpu_mtu_size", , get_full_name());
        debug_system_p0_0 = globals_debug_system_p0_0_reg::type_id::create("debug_system_p0_0", , get_full_name());
        debug_system_p0_1 = globals_debug_system_p0_1_reg::type_id::create("debug_system_p0_1", , get_full_name());
        debug_system_p1_0 = globals_debug_system_p1_0_reg::type_id::create("debug_system_p1_0", , get_full_name());
        debug_system_p1_1 = globals_debug_system_p1_1_reg::type_id::create("debug_system_p1_1", , get_full_name());
        debug_system_p2_0 = globals_debug_system_p2_0_reg::type_id::create("debug_system_p2_0", , get_full_name());
        debug_system_p2_1 = globals_debug_system_p2_1_reg::type_id::create("debug_system_p2_1", , get_full_name());
        debug_system_p3_0 = globals_debug_system_p3_0_reg::type_id::create("debug_system_p3_0", , get_full_name());
        debug_system_p3_1 = globals_debug_system_p3_1_reg::type_id::create("debug_system_p3_1", , get_full_name());
        debug_system_p4_0 = globals_debug_system_p4_0_reg::type_id::create("debug_system_p4_0", , get_full_name());
        debug_system_p4_1 = globals_debug_system_p4_1_reg::type_id::create("debug_system_p4_1", , get_full_name());
        debug_system_p5_0 = globals_debug_system_p5_0_reg::type_id::create("debug_system_p5_0", , get_full_name());
        debug_system_p5_1 = globals_debug_system_p5_1_reg::type_id::create("debug_system_p5_1", , get_full_name());
        debug_system_p6_0 = globals_debug_system_p6_0_reg::type_id::create("debug_system_p6_0", , get_full_name());
        debug_system_p6_1 = globals_debug_system_p6_1_reg::type_id::create("debug_system_p6_1", , get_full_name());
        debug_system_p7_0 = globals_debug_system_p7_0_reg::type_id::create("debug_system_p7_0", , get_full_name());
        debug_system_p7_1 = globals_debug_system_p7_1_reg::type_id::create("debug_system_p7_1", , get_full_name());
        debug_system_p8_0 = globals_debug_system_p8_0_reg::type_id::create("debug_system_p8_0", , get_full_name());
        debug_system_p8_1 = globals_debug_system_p8_1_reg::type_id::create("debug_system_p8_1", , get_full_name());
        debug_system_p9_0 = globals_debug_system_p9_0_reg::type_id::create("debug_system_p9_0", , get_full_name());
        debug_system_p9_1 = globals_debug_system_p9_1_reg::type_id::create("debug_system_p9_1", , get_full_name());
        debug_system_p10_0 = globals_debug_system_p10_0_reg::type_id::create("debug_system_p10_0", , get_full_name());
        debug_system_p10_1 = globals_debug_system_p10_1_reg::type_id::create("debug_system_p10_1", , get_full_name());
        debug_system_p11_0 = globals_debug_system_p11_0_reg::type_id::create("debug_system_p11_0", , get_full_name());
        debug_system_p11_1 = globals_debug_system_p11_1_reg::type_id::create("debug_system_p11_1", , get_full_name());
        capture_address = globals_capture_address_reg::type_id::create("capture_address", , get_full_name());
        debug_system = globals_debug_system_reg::type_id::create("debug_system", , get_full_name());
        dbg_tm = globals_dbg_tm_reg::type_id::create("dbg_tm", , get_full_name());
        dbg_cs_select = globals_dbg_cs_select_reg::type_id::create("dbg_cs_select", , get_full_name());
        dbg_cs1 = globals_dbg_cs1_reg::type_id::create("dbg_cs1", , get_full_name());
        dbg_cs2 = globals_dbg_cs2_reg::type_id::create("dbg_cs2", , get_full_name());
        foreach(port_input_cfg[m]) begin
            port_input_cfg[m] = port_input_cfg_reg_block::type_id::create($sformatf("port_input_cfg[%0d]",m), , get_full_name());
        end

        scratch.configure(this);
        mac_base_addr.configure(this);
        cpu2if_port_shaper_debit.configure(this);
        bw_attribs.configure(this);
        link_status_mask.configure(this);
        link_status_sw.configure(this);
        mon_cfg.configure(this);
        tlcs.configure(this);
        tbb_nni_level.configure(this);
        tbb_uni_10g_level.configure(this);
        tbb_uni_1g_level.configure(this);
        hidden_rules_version.configure(this);
        class_scanmode.configure(this);
        global_input_cfg_0.configure(this);
        global_input_cfg_1.configure(this);
        version_changeset.configure(this);
        version_build.configure(this);
        version_release.configure(this);
        capabilities_0.configure(this);
        capabilities_1.configure(this);
        register_version.configure(this);
        dbg_cfg_0.configure(this);
        status1.configure(this);
        status2.configure(this);
        clk_status.configure(this);
        class_stats_cpu_cfg.configure(this);
        cpu_mtu_size.configure(this);
        debug_system_p0_0.configure(this);
        debug_system_p0_1.configure(this);
        debug_system_p1_0.configure(this);
        debug_system_p1_1.configure(this);
        debug_system_p2_0.configure(this);
        debug_system_p2_1.configure(this);
        debug_system_p3_0.configure(this);
        debug_system_p3_1.configure(this);
        debug_system_p4_0.configure(this);
        debug_system_p4_1.configure(this);
        debug_system_p5_0.configure(this);
        debug_system_p5_1.configure(this);
        debug_system_p6_0.configure(this);
        debug_system_p6_1.configure(this);
        debug_system_p7_0.configure(this);
        debug_system_p7_1.configure(this);
        debug_system_p8_0.configure(this);
        debug_system_p8_1.configure(this);
        debug_system_p9_0.configure(this);
        debug_system_p9_1.configure(this);
        debug_system_p10_0.configure(this);
        debug_system_p10_1.configure(this);
        debug_system_p11_0.configure(this);
        debug_system_p11_1.configure(this);
        capture_address.configure(this);
        debug_system.configure(this);
        dbg_tm.configure(this);
        dbg_cs_select.configure(this);
        dbg_cs1.configure(this);
        dbg_cs2.configure(this);
        foreach(port_input_cfg[m]) begin
            port_input_cfg[m].configure(this);
        end

        scratch.build();
        mac_base_addr.build();
        cpu2if_port_shaper_debit.build();
        bw_attribs.build();
        link_status_mask.build();
        link_status_sw.build();
        mon_cfg.build();
        tlcs.build();
        tbb_nni_level.build();
        tbb_uni_10g_level.build();
        tbb_uni_1g_level.build();
        hidden_rules_version.build();
        class_scanmode.build();
        global_input_cfg_0.build();
        global_input_cfg_1.build();
        version_changeset.build();
        version_build.build();
        version_release.build();
        capabilities_0.build();
        capabilities_1.build();
        register_version.build();
        dbg_cfg_0.build();
        status1.build();
        status2.build();
        clk_status.build();
        class_stats_cpu_cfg.build();
        cpu_mtu_size.build();
        debug_system_p0_0.build();
        debug_system_p0_1.build();
        debug_system_p1_0.build();
        debug_system_p1_1.build();
        debug_system_p2_0.build();
        debug_system_p2_1.build();
        debug_system_p3_0.build();
        debug_system_p3_1.build();
        debug_system_p4_0.build();
        debug_system_p4_1.build();
        debug_system_p5_0.build();
        debug_system_p5_1.build();
        debug_system_p6_0.build();
        debug_system_p6_1.build();
        debug_system_p7_0.build();
        debug_system_p7_1.build();
        debug_system_p8_0.build();
        debug_system_p8_1.build();
        debug_system_p9_0.build();
        debug_system_p9_1.build();
        debug_system_p10_0.build();
        debug_system_p10_1.build();
        debug_system_p11_0.build();
        debug_system_p11_1.build();
        capture_address.build();
        debug_system.build();
        dbg_tm.build();
        dbg_cs_select.build();
        dbg_cs1.build();
        dbg_cs2.build();
        foreach(port_input_cfg[m]) begin
            port_input_cfg[m].build();
        end

        // define default map
        default_map = create_map("chip_global_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        this.default_map.add_reg(scratch, 'h0, "RW");
        this.default_map.add_reg(mac_base_addr, 'h1, "RW");
        this.default_map.add_reg(cpu2if_port_shaper_debit, 'h2, "RW");
        this.default_map.add_reg(bw_attribs, 'h3, "RW");
        this.default_map.add_reg(link_status_mask, 'h4, "RW");
        this.default_map.add_reg(link_status_sw, 'h5, "RW");
        this.default_map.add_reg(mon_cfg, 'h7, "RW");
        this.default_map.add_reg(tlcs, 'h8, "RW");
        this.default_map.add_reg(tbb_nni_level, 'h9, "RW");
        this.default_map.add_reg(tbb_uni_10g_level, 'hA, "RW");
        this.default_map.add_reg(tbb_uni_1g_level, 'hB, "RW");
        this.default_map.add_reg(hidden_rules_version, 'hC, "RO");
        this.default_map.add_reg(class_scanmode, 'hD, "RO");
        this.default_map.add_reg(global_input_cfg_0, 'hE, "RW");
        this.default_map.add_reg(global_input_cfg_1, 'hF, "RW");
        this.default_map.add_reg(version_changeset, 'h40, "RO");
        this.default_map.add_reg(version_build, 'h41, "RO");
        this.default_map.add_reg(version_release, 'h42, "RO");
        this.default_map.add_reg(capabilities_0, 'h43, "RO");
        this.default_map.add_reg(capabilities_1, 'h44, "RO");
        this.default_map.add_reg(register_version, 'h45, "RO");
        this.default_map.add_reg(dbg_cfg_0, 'h46, "RW");
        this.default_map.add_reg(status1, 'h49, "RO");
        this.default_map.add_reg(status2, 'h4A, "RO");
        this.default_map.add_reg(clk_status, 'h4B, "RO");
        this.default_map.add_reg(class_stats_cpu_cfg, 'h54, "RW");
        this.default_map.add_reg(cpu_mtu_size, 'h55, "RW");
        this.default_map.add_reg(debug_system_p0_0, 'h60, "RO");
        this.default_map.add_reg(debug_system_p0_1, 'h61, "RO");
        this.default_map.add_reg(debug_system_p1_0, 'h62, "RO");
        this.default_map.add_reg(debug_system_p1_1, 'h63, "RO");
        this.default_map.add_reg(debug_system_p2_0, 'h64, "RO");
        this.default_map.add_reg(debug_system_p2_1, 'h65, "RO");
        this.default_map.add_reg(debug_system_p3_0, 'h66, "RO");
        this.default_map.add_reg(debug_system_p3_1, 'h67, "RO");
        this.default_map.add_reg(debug_system_p4_0, 'h68, "RO");
        this.default_map.add_reg(debug_system_p4_1, 'h69, "RO");
        this.default_map.add_reg(debug_system_p5_0, 'h6A, "RO");
        this.default_map.add_reg(debug_system_p5_1, 'h6B, "RO");
        this.default_map.add_reg(debug_system_p6_0, 'h6C, "RO");
        this.default_map.add_reg(debug_system_p6_1, 'h6D, "RO");
        this.default_map.add_reg(debug_system_p7_0, 'h6E, "RO");
        this.default_map.add_reg(debug_system_p7_1, 'h6F, "RO");
        this.default_map.add_reg(debug_system_p8_0, 'h70, "RO");
        this.default_map.add_reg(debug_system_p8_1, 'h71, "RO");
        this.default_map.add_reg(debug_system_p9_0, 'h72, "RO");
        this.default_map.add_reg(debug_system_p9_1, 'h73, "RO");
        this.default_map.add_reg(debug_system_p10_0, 'h74, "RO");
        this.default_map.add_reg(debug_system_p10_1, 'h75, "RO");
        this.default_map.add_reg(debug_system_p11_0, 'h76, "RO");
        this.default_map.add_reg(debug_system_p11_1, 'h77, "RO");
        this.default_map.add_reg(capture_address, 'h78, "RO");
        this.default_map.add_reg(debug_system, 'h7B, "RO");
        this.default_map.add_reg(dbg_tm, 'h7C, "RW");
        this.default_map.add_reg(dbg_cs_select, 'h7D, "RW");
        this.default_map.add_reg(dbg_cs1, 'h7E, "RO");
        this.default_map.add_reg(dbg_cs2, 'h7F, "RO");
        foreach(port_input_cfg[m]) begin
            this.default_map.add_submap(this.port_input_cfg[m].default_map, 'h10 + m*('h4));
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
            foreach(port_input_cfg[m]) begin
                port_input_cfg[m].set_per_instance_coverage(per_inst, hier);
            end
        end
     endfunction


    // Function: set_coverage
    // Override base function to create covergroups for all registers in this block.
    //
    // In order to enable hierarchical creation, use UVM_CVR_ALL.
    virtual function uvm_reg_cvr_t set_coverage(uvm_reg_cvr_t is_on);
        //void'(uvm_config_db#(bit)::get(null, get_full_name(), "cg_per_instance", cg_per_instance));
        set_coverage = super.set_coverage(is_on);
        scratch.enable_coverage(is_on, this.cg_per_instance);
        mac_base_addr.enable_coverage(is_on, this.cg_per_instance);
        cpu2if_port_shaper_debit.enable_coverage(is_on, this.cg_per_instance);
        bw_attribs.enable_coverage(is_on, this.cg_per_instance);
        link_status_mask.enable_coverage(is_on, this.cg_per_instance);
        link_status_sw.enable_coverage(is_on, this.cg_per_instance);
        mon_cfg.enable_coverage(is_on, this.cg_per_instance);
        tlcs.enable_coverage(is_on, this.cg_per_instance);
        tbb_nni_level.enable_coverage(is_on, this.cg_per_instance);
        tbb_uni_10g_level.enable_coverage(is_on, this.cg_per_instance);
        tbb_uni_1g_level.enable_coverage(is_on, this.cg_per_instance);
        hidden_rules_version.enable_coverage(is_on, this.cg_per_instance);
        class_scanmode.enable_coverage(is_on, this.cg_per_instance);
        global_input_cfg_0.enable_coverage(is_on, this.cg_per_instance);
        global_input_cfg_1.enable_coverage(is_on, this.cg_per_instance);
        version_changeset.enable_coverage(is_on, this.cg_per_instance);
        version_build.enable_coverage(is_on, this.cg_per_instance);
        version_release.enable_coverage(is_on, this.cg_per_instance);
        capabilities_0.enable_coverage(is_on, this.cg_per_instance);
        capabilities_1.enable_coverage(is_on, this.cg_per_instance);
        register_version.enable_coverage(is_on, this.cg_per_instance);
        dbg_cfg_0.enable_coverage(is_on, this.cg_per_instance);
        status1.enable_coverage(is_on, this.cg_per_instance);
        status2.enable_coverage(is_on, this.cg_per_instance);
        clk_status.enable_coverage(is_on, this.cg_per_instance);
        class_stats_cpu_cfg.enable_coverage(is_on, this.cg_per_instance);
        cpu_mtu_size.enable_coverage(is_on, this.cg_per_instance);
        debug_system_p0_0.enable_coverage(is_on, this.cg_per_instance);
        debug_system_p0_1.enable_coverage(is_on, this.cg_per_instance);
        debug_system_p1_0.enable_coverage(is_on, this.cg_per_instance);
        debug_system_p1_1.enable_coverage(is_on, this.cg_per_instance);
        debug_system_p2_0.enable_coverage(is_on, this.cg_per_instance);
        debug_system_p2_1.enable_coverage(is_on, this.cg_per_instance);
        debug_system_p3_0.enable_coverage(is_on, this.cg_per_instance);
        debug_system_p3_1.enable_coverage(is_on, this.cg_per_instance);
        debug_system_p4_0.enable_coverage(is_on, this.cg_per_instance);
        debug_system_p4_1.enable_coverage(is_on, this.cg_per_instance);
        debug_system_p5_0.enable_coverage(is_on, this.cg_per_instance);
        debug_system_p5_1.enable_coverage(is_on, this.cg_per_instance);
        debug_system_p6_0.enable_coverage(is_on, this.cg_per_instance);
        debug_system_p6_1.enable_coverage(is_on, this.cg_per_instance);
        debug_system_p7_0.enable_coverage(is_on, this.cg_per_instance);
        debug_system_p7_1.enable_coverage(is_on, this.cg_per_instance);
        debug_system_p8_0.enable_coverage(is_on, this.cg_per_instance);
        debug_system_p8_1.enable_coverage(is_on, this.cg_per_instance);
        debug_system_p9_0.enable_coverage(is_on, this.cg_per_instance);
        debug_system_p9_1.enable_coverage(is_on, this.cg_per_instance);
        debug_system_p10_0.enable_coverage(is_on, this.cg_per_instance);
        debug_system_p10_1.enable_coverage(is_on, this.cg_per_instance);
        debug_system_p11_0.enable_coverage(is_on, this.cg_per_instance);
        debug_system_p11_1.enable_coverage(is_on, this.cg_per_instance);
        capture_address.enable_coverage(is_on, this.cg_per_instance);
        debug_system.enable_coverage(is_on, this.cg_per_instance);
        dbg_tm.enable_coverage(is_on, this.cg_per_instance);
        dbg_cs_select.enable_coverage(is_on, this.cg_per_instance);
        dbg_cs1.enable_coverage(is_on, this.cg_per_instance);
        dbg_cs2.enable_coverage(is_on, this.cg_per_instance);
        // Use UVM_CVR_ALL for hierarchical enabling.
        if(is_on == UVM_CVR_ALL) begin
            foreach(port_input_cfg[m]) begin
                //void'(uvm_config_db#(bit)::set(null, port_input_cfg[m].get_full_name(), "cg_per_instance", cg_per_instance));
                void'(port_input_cfg[m].set_coverage(is_on));
            end
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