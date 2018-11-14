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
// Register definitions for i2c register block.
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
// Group: i2c
//---------------------------------------------------------

package i2c_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;

typedef class i2c_select_reg_cover;

// Class: i2c_select_reg
// Register i2c.select: Controls various IO and muxes in the FPGA top
class i2c_select_reg extends uvm_reg;

    // Variable: sel
    // Controls whether the I2C line driver goes to SFP1 (0), SFP2 (1), ..., SFP8 (7)
    rand uvm_reg_field sel;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static i2c_select_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    i2c_select_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(i2c_reg_pkg::i2c_select_reg)

    // Constructor: new
    function new(string name = "i2c_select");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        sel = uvm_reg_field::type_id::create("sel", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        sel.configure(this, 3, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = i2c_select_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = i2c_select_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, sel.get_name, sel.value);
        return s;
    endfunction

endclass


// Class: i2c_select_reg_cover
// Register coverage object.
class i2c_select_reg_cover extends uvm_object;

    static local i2c_select_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    i2c_select_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        sel_wr: coverpoint r.sel.value iff (!is_read);
        sel_rd: coverpoint r.sel.value iff  (is_read);
    endgroup

    `uvm_object_utils(i2c_reg_pkg::i2c_select_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="i2c_select_reg_cover");
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
    static function i2c_select_reg_cover get();
        if (m_inst == null) begin
            m_inst = i2c_select_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(i2c_select_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class i2c_control_reg_cover;

// Class: i2c_control_reg
// Register i2c.control: Indexed addresses for I2C input access of the SFPs
class i2c_control_reg extends uvm_reg;

    // Variable: length
    // Nbr of bytes = length + 1 :  0=1, 1=2, 2=3, ... In write, the maximum is 3 (4 bytes = 32 bits) due to wdata is a 32 bits only
    rand uvm_reg_field length;
    // Variable: command
    // Rd = 1, Wr = 0
    rand uvm_reg_field command;
    // Variable: start
    // Send a start bit at the begining. The device ID will be sent when start is high
    rand uvm_reg_field start;
    // Variable: stop
    // Send a stop bit at the end
    rand uvm_reg_field stop;
    // Variable: address
    // device address 
    rand uvm_reg_field address;
    // Variable: wdata
    // Write data. wdata is in big endian. if wdata = 0x11223344 then “0x11” is written in the i2c device first independantly of length
    rand uvm_reg_field wdata;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static i2c_control_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    i2c_control_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(i2c_reg_pkg::i2c_control_reg)

    // Constructor: new
    function new(string name = "i2c_control");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        length = uvm_reg_field::type_id::create("length", , get_full_name());
        command = uvm_reg_field::type_id::create("command", , get_full_name());
        start = uvm_reg_field::type_id::create("start", , get_full_name());
        stop = uvm_reg_field::type_id::create("stop", , get_full_name());
        address = uvm_reg_field::type_id::create("address", , get_full_name());
        wdata = uvm_reg_field::type_id::create("wdata", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        length.configure(this, 7, 48, "RW", 0, 'h0, 1, 1, 0);
        command.configure(this, 1, 43, "RW", 0, 'h0, 1, 1, 0);
        start.configure(this, 1, 42, "RW", 0, 'h0, 1, 1, 0);
        stop.configure(this, 1, 41, "RW", 0, 'h0, 1, 1, 0);
        address.configure(this, 7, 32, "RW", 0, 'h0, 1, 1, 0);
        wdata.configure(this, 32, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = i2c_control_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = i2c_control_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, length.get_name, length.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, command.get_name, command.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, start.get_name, start.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, stop.get_name, stop.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, address.get_name, address.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, wdata.get_name, wdata.value);
        return s;
    endfunction

endclass


// Class: i2c_control_reg_cover
// Register coverage object.
class i2c_control_reg_cover extends uvm_object;

    static local i2c_control_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    i2c_control_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        length_wr: coverpoint r.length.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        length_rd: coverpoint r.length.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        command_wr: coverpoint r.command.value iff (!is_read);
        command_rd: coverpoint r.command.value iff  (is_read);
        start_wr: coverpoint r.start.value iff (!is_read);
        start_rd: coverpoint r.start.value iff  (is_read);
        stop_wr: coverpoint r.stop.value iff (!is_read);
        stop_rd: coverpoint r.stop.value iff  (is_read);
        address_wr: coverpoint r.address.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        address_rd: coverpoint r.address.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        wdata_wr: coverpoint r.wdata.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        wdata_rd: coverpoint r.wdata.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(i2c_reg_pkg::i2c_control_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="i2c_control_reg_cover");
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
    static function i2c_control_reg_cover get();
        if (m_inst == null) begin
            m_inst = i2c_control_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(i2c_control_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class i2c_status_reg_cover;

// Class: i2c_status_reg
// Register i2c.status: I2C controller status
class i2c_status_reg extends uvm_reg;

    // Variable: bytes_left
    // Number of pending bytes to read/write from/to the I2C slave device
    rand uvm_reg_field bytes_left;
    // Variable: pending_cmd
    // Pending command in control register. Control register should not be written when pending_cmd is high. Otherwise, the pending command will be lost.
    rand uvm_reg_field pending_cmd;
    // Variable: status
    // 00: no error,  01: i2c_module_busy,  1X: error
    rand uvm_reg_field status;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static i2c_status_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    i2c_status_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(i2c_reg_pkg::i2c_status_reg)

    // Constructor: new
    function new(string name = "i2c_status");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        bytes_left = uvm_reg_field::type_id::create("bytes_left", , get_full_name());
        pending_cmd = uvm_reg_field::type_id::create("pending_cmd", , get_full_name());
        status = uvm_reg_field::type_id::create("status", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        bytes_left.configure(this, 7, 8, "RO", 0, 'h0, 1, 1, 0);
        pending_cmd.configure(this, 1, 4, "RO", 0, 'h0, 1, 1, 0);
        status.configure(this, 2, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = i2c_status_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = i2c_status_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, bytes_left.get_name, bytes_left.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, pending_cmd.get_name, pending_cmd.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, status.get_name, status.value);
        return s;
    endfunction

endclass


// Class: i2c_status_reg_cover
// Register coverage object.
class i2c_status_reg_cover extends uvm_object;

    static local i2c_status_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    i2c_status_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        bytes_left_wr: coverpoint r.bytes_left.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        bytes_left_rd: coverpoint r.bytes_left.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        pending_cmd_wr: coverpoint r.pending_cmd.value iff (!is_read);
        pending_cmd_rd: coverpoint r.pending_cmd.value iff  (is_read);
        status_wr: coverpoint r.status.value iff (!is_read);
        status_rd: coverpoint r.status.value iff  (is_read);
    endgroup

    `uvm_object_utils(i2c_reg_pkg::i2c_status_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="i2c_status_reg_cover");
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
    static function i2c_status_reg_cover get();
        if (m_inst == null) begin
            m_inst = i2c_status_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(i2c_status_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class i2c_rdata_reg_cover;

// Class: i2c_rdata_reg
// Register i2c.rdata: Read data from I2C output access of the SFPs
class i2c_rdata_reg extends uvm_reg;

    // Variable: rdata
    // Read data
    rand uvm_reg_field rdata;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static i2c_rdata_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    i2c_rdata_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(i2c_reg_pkg::i2c_rdata_reg)

    // Constructor: new
    function new(string name = "i2c_rdata");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rdata = uvm_reg_field::type_id::create("rdata", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rdata.configure(this, 64, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = i2c_rdata_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = i2c_rdata_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rdata.get_name, rdata.value);
        return s;
    endfunction

endclass


// Class: i2c_rdata_reg_cover
// Register coverage object.
class i2c_rdata_reg_cover extends uvm_object;

    static local i2c_rdata_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    i2c_rdata_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rdata_wr: coverpoint r.rdata.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rdata_rd: coverpoint r.rdata.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(i2c_reg_pkg::i2c_rdata_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="i2c_rdata_reg_cover");
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
    static function i2c_rdata_reg_cover get();
        if (m_inst == null) begin
            m_inst = i2c_rdata_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(i2c_rdata_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass





// Class: i2c_reg_block
// Register Block .i2c: 
class i2c_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand i2c_select_reg select;
    rand i2c_control_reg control;
    rand i2c_status_reg status;
    rand i2c_rdata_reg rdata[];

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(i2c_reg_pkg::i2c_reg_block)

    // Constructor: new
    function new(string name = "i2c_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rdata = new[16];

        select = i2c_select_reg::type_id::create("select", , get_full_name());
        control = i2c_control_reg::type_id::create("control", , get_full_name());
        status = i2c_status_reg::type_id::create("status", , get_full_name());
        foreach(rdata[m]) begin
            rdata[m] = i2c_rdata_reg::type_id::create($sformatf("rdata[%0d]",m), , get_full_name());
        end

        select.configure(this);
        control.configure(this);
        status.configure(this);
        foreach(rdata[m]) begin
            rdata[m].configure(this);
        end

        select.build();
        control.build();
        status.build();
        foreach(rdata[m]) begin
            rdata[m].build();
        end

        // define default map
        default_map = create_map("i2c_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        this.default_map.add_reg(select, 'h0, "RW");
        this.default_map.add_reg(control, 'h1, "RW");
        this.default_map.add_reg(status, 'h2, "RO");
        foreach(rdata[m]) begin
            this.default_map.add_reg(this.rdata[m], 'h10 + m, "RO");
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
        select.enable_coverage(is_on, this.cg_per_instance);
        control.enable_coverage(is_on, this.cg_per_instance);
        status.enable_coverage(is_on, this.cg_per_instance);
        foreach(rdata[m]) begin
            rdata[m].enable_coverage(is_on, this.cg_per_instance);
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