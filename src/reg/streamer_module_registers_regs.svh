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
// Register definitions for streamer_module_registers register block.
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
// Group: streamer_module_registers
//---------------------------------------------------------

package streamer_module_registers_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;

typedef class streamer_module_registers_logical_channel_number_reg_cover;

// Class: streamer_module_registers_logical_channel_number_reg
// Register streamer_module_registers.logical_channel_number: 
class streamer_module_registers_logical_channel_number_reg extends uvm_reg;

    // Variable: logical_channel_number
    // The logical channel number. Must be specified when performing dynamic updates. The Transceiver Reconfiguration Controller maps the logical address to the physical address.
    rand uvm_reg_field logical_channel_number;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static streamer_module_registers_logical_channel_number_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    streamer_module_registers_logical_channel_number_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(streamer_module_registers_reg_pkg::streamer_module_registers_logical_channel_number_reg)

    // Constructor: new
    function new(string name = "streamer_module_registers_logical_channel_number");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        logical_channel_number = uvm_reg_field::type_id::create("logical_channel_number", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        logical_channel_number.configure(this, 10, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = streamer_module_registers_logical_channel_number_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = streamer_module_registers_logical_channel_number_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, logical_channel_number.get_name, logical_channel_number.value);
        return s;
    endfunction

endclass


// Class: streamer_module_registers_logical_channel_number_reg_cover
// Register coverage object.
class streamer_module_registers_logical_channel_number_reg_cover extends uvm_object;

    static local streamer_module_registers_logical_channel_number_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    streamer_module_registers_logical_channel_number_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        logical_channel_number_wr: coverpoint r.logical_channel_number.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        logical_channel_number_rd: coverpoint r.logical_channel_number.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(streamer_module_registers_reg_pkg::streamer_module_registers_logical_channel_number_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="streamer_module_registers_logical_channel_number_reg_cover");
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
    static function streamer_module_registers_logical_channel_number_reg_cover get();
        if (m_inst == null) begin
            m_inst = streamer_module_registers_logical_channel_number_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(streamer_module_registers_logical_channel_number_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class streamer_module_registers_control_and_status_reg_cover;

// Class: streamer_module_registers_control_and_status_reg
// Register streamer_module_registers.control_and_status: 
class streamer_module_registers_control_and_status_reg extends uvm_reg;

    // Variable: error
    // When asserted, indicates an error. This bit is asserted if any of the following conditions occur: • The channel address is invalid. • The PHY address is invalid. • The PMA offset is invalid.
    rand uvm_reg_field error;
    // Variable: busy
    // When asserted, indicates that a reconfiguration operation is in progress.
    rand uvm_reg_field busy;
    // Variable: mode
    // Writing a 1 to this bit triggers a read operation.
    rand uvm_reg_field mode;
    // Variable: rd
    // Writing a 1 to this bit triggers a read operation.
    rand uvm_reg_field rd;
    // Variable: wr
    // Writing a 1 to this bit triggers a write operation.
    rand uvm_reg_field wr;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static streamer_module_registers_control_and_status_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    streamer_module_registers_control_and_status_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(streamer_module_registers_reg_pkg::streamer_module_registers_control_and_status_reg)

    // Constructor: new
    function new(string name = "streamer_module_registers_control_and_status");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        error = uvm_reg_field::type_id::create("error", , get_full_name());
        busy = uvm_reg_field::type_id::create("busy", , get_full_name());
        mode = uvm_reg_field::type_id::create("mode", , get_full_name());
        rd = uvm_reg_field::type_id::create("rd", , get_full_name());
        wr = uvm_reg_field::type_id::create("wr", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        error.configure(this, 1, 9, "ro", 0, 'h0, 1, 1, 0);
        busy.configure(this, 1, 8, "ro", 0, 'h0, 1, 1, 0);
        mode.configure(this, 2, 2, "rw", 0, 'h0, 1, 1, 0);
        rd.configure(this, 1, 1, "rw", 0, 'h0, 1, 1, 0);
        wr.configure(this, 1, 0, "rw", 0, 'h0, 1, 1, 0);
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
                cg = streamer_module_registers_control_and_status_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = streamer_module_registers_control_and_status_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, error.get_name, error.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, busy.get_name, busy.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, mode.get_name, mode.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, rd.get_name, rd.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, wr.get_name, wr.value);
        return s;
    endfunction

endclass


// Class: streamer_module_registers_control_and_status_reg_cover
// Register coverage object.
class streamer_module_registers_control_and_status_reg_cover extends uvm_object;

    static local streamer_module_registers_control_and_status_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    streamer_module_registers_control_and_status_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        error_wr: coverpoint r.error.value iff (!is_read);
        error_rd: coverpoint r.error.value iff  (is_read);
        busy_wr: coverpoint r.busy.value iff (!is_read);
        busy_rd: coverpoint r.busy.value iff  (is_read);
        mode_wr: coverpoint r.mode.value iff (!is_read);
        mode_rd: coverpoint r.mode.value iff  (is_read);
        rd_wr: coverpoint r.rd.value iff (!is_read);
        rd_rd: coverpoint r.rd.value iff  (is_read);
        wr_wr: coverpoint r.wr.value iff (!is_read);
        wr_rd: coverpoint r.wr.value iff  (is_read);
    endgroup

    `uvm_object_utils(streamer_module_registers_reg_pkg::streamer_module_registers_control_and_status_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="streamer_module_registers_control_and_status_reg_cover");
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
    static function streamer_module_registers_control_and_status_reg_cover get();
        if (m_inst == null) begin
            m_inst = streamer_module_registers_control_and_status_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(streamer_module_registers_control_and_status_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class streamer_module_registers_streamer_offset_reg_cover;

// Class: streamer_module_registers_streamer_offset_reg
// Register streamer_module_registers.streamer_offset: 
class streamer_module_registers_streamer_offset_reg extends uvm_reg;

    // Variable: streamer_offset
    // When the MIF Mode = 2’b00, the offset register specifies a an internal MIF Streamer register. This register cannot be set to a value greater than 0x2 when control and status register is set to MIF mode. You must ensure that appropriate values are set for this register, when you switch between MIF mode and Direct Write mode. Refer to Table 16-25 for definitions of these registers. WhenMIF Mode = 2’b01, offset register specifies register in the transceiver.
    rand uvm_reg_field streamer_offset;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static streamer_module_registers_streamer_offset_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    streamer_module_registers_streamer_offset_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(streamer_module_registers_reg_pkg::streamer_module_registers_streamer_offset_reg)

    // Constructor: new
    function new(string name = "streamer_module_registers_streamer_offset");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        streamer_offset = uvm_reg_field::type_id::create("streamer_offset", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        streamer_offset.configure(this, 16, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = streamer_module_registers_streamer_offset_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = streamer_module_registers_streamer_offset_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, streamer_offset.get_name, streamer_offset.value);
        return s;
    endfunction

endclass


// Class: streamer_module_registers_streamer_offset_reg_cover
// Register coverage object.
class streamer_module_registers_streamer_offset_reg_cover extends uvm_object;

    static local streamer_module_registers_streamer_offset_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    streamer_module_registers_streamer_offset_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        streamer_offset_wr: coverpoint r.streamer_offset.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        streamer_offset_rd: coverpoint r.streamer_offset.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(streamer_module_registers_reg_pkg::streamer_module_registers_streamer_offset_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="streamer_module_registers_streamer_offset_reg_cover");
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
    static function streamer_module_registers_streamer_offset_reg_cover get();
        if (m_inst == null) begin
            m_inst = streamer_module_registers_streamer_offset_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(streamer_module_registers_streamer_offset_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class streamer_module_registers_data_reg_cover;

// Class: streamer_module_registers_data_reg
// Register streamer_module_registers.data: 
class streamer_module_registers_data_reg extends uvm_reg;

    // Variable: data
    // When the MIF Mode = 2’b00, the data register stores read or write data for indirect access to the location specified in the offset register. hen MIF Mode = 2’b01, data holds an update for transceiver to be dynamically reconfigured.
    rand uvm_reg_field data;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static streamer_module_registers_data_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    streamer_module_registers_data_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(streamer_module_registers_reg_pkg::streamer_module_registers_data_reg)

    // Constructor: new
    function new(string name = "streamer_module_registers_data");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        data = uvm_reg_field::type_id::create("data", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        data.configure(this, 32, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = streamer_module_registers_data_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = streamer_module_registers_data_reg_cover::get();
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


// Class: streamer_module_registers_data_reg_cover
// Register coverage object.
class streamer_module_registers_data_reg_cover extends uvm_object;

    static local streamer_module_registers_data_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    streamer_module_registers_data_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        data_wr: coverpoint r.data.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        data_rd: coverpoint r.data.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(streamer_module_registers_reg_pkg::streamer_module_registers_data_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="streamer_module_registers_data_reg_cover");
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
    static function streamer_module_registers_data_reg_cover get();
        if (m_inst == null) begin
            m_inst = streamer_module_registers_data_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(streamer_module_registers_data_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass





// Class: streamer_module_registers_reg_block
// Register Block .streamer_module_registers: 
class streamer_module_registers_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand streamer_module_registers_logical_channel_number_reg logical_channel_number;
    rand streamer_module_registers_control_and_status_reg control_and_status;
    rand streamer_module_registers_streamer_offset_reg streamer_offset;
    rand streamer_module_registers_data_reg data;

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(streamer_module_registers_reg_pkg::streamer_module_registers_reg_block)

    // Constructor: new
    function new(string name = "streamer_module_registers_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})


        logical_channel_number = streamer_module_registers_logical_channel_number_reg::type_id::create("logical_channel_number", , get_full_name());
        control_and_status = streamer_module_registers_control_and_status_reg::type_id::create("control_and_status", , get_full_name());
        streamer_offset = streamer_module_registers_streamer_offset_reg::type_id::create("streamer_offset", , get_full_name());
        data = streamer_module_registers_data_reg::type_id::create("data", , get_full_name());

        logical_channel_number.configure(this);
        control_and_status.configure(this);
        streamer_offset.configure(this);
        data.configure(this);

        logical_channel_number.build();
        control_and_status.build();
        streamer_offset.build();
        data.build();

        // define default map
        default_map = create_map("streamer_module_registers_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        this.default_map.add_reg(logical_channel_number, 'h38, "RW");
        this.default_map.add_reg(control_and_status, 'h3A, "RW");
        this.default_map.add_reg(streamer_offset, 'h3B, "RW");
        this.default_map.add_reg(data, 'h3C, "RW");

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
        logical_channel_number.enable_coverage(is_on, this.cg_per_instance);
        control_and_status.enable_coverage(is_on, this.cg_per_instance);
        streamer_offset.enable_coverage(is_on, this.cg_per_instance);
        data.enable_coverage(is_on, this.cg_per_instance);
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