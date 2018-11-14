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
// Register definitions for padding_flow register block.
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
// Group: padding_flow
//---------------------------------------------------------

package padding_flow_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;

typedef class padding_flow_pad_info_1_reg_cover;

// Class: padding_flow_pad_info_1_reg
// Register padding_flow.pad_info_1: 
class padding_flow_pad_info_1_reg extends uvm_reg;

    // Variable: padding
    // 
    rand uvm_reg_field padding;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static padding_flow_pad_info_1_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    padding_flow_pad_info_1_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(padding_flow_reg_pkg::padding_flow_pad_info_1_reg)

    // Constructor: new
    function new(string name = "padding_flow_pad_info_1");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        padding = uvm_reg_field::type_id::create("padding", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        padding.configure(this, 32, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = padding_flow_pad_info_1_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = padding_flow_pad_info_1_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, padding.get_name, padding.value);
        return s;
    endfunction

endclass


// Class: padding_flow_pad_info_1_reg_cover
// Register coverage object.
class padding_flow_pad_info_1_reg_cover extends uvm_object;

    static local padding_flow_pad_info_1_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    padding_flow_pad_info_1_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        padding_wr: coverpoint r.padding.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        padding_rd: coverpoint r.padding.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(padding_flow_reg_pkg::padding_flow_pad_info_1_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="padding_flow_pad_info_1_reg_cover");
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
    static function padding_flow_pad_info_1_reg_cover get();
        if (m_inst == null) begin
            m_inst = padding_flow_pad_info_1_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(padding_flow_pad_info_1_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class padding_flow_pad_info_2_reg_cover;

// Class: padding_flow_pad_info_2_reg
// Register padding_flow.pad_info_2: 
class padding_flow_pad_info_2_reg extends uvm_reg;

    // Variable: mode
    // 
    rand uvm_reg_field mode;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static padding_flow_pad_info_2_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    padding_flow_pad_info_2_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(padding_flow_reg_pkg::padding_flow_pad_info_2_reg)

    // Constructor: new
    function new(string name = "padding_flow_pad_info_2");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        mode = uvm_reg_field::type_id::create("mode", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        mode.configure(this, 6, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = padding_flow_pad_info_2_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = padding_flow_pad_info_2_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, mode.get_name, mode.value);
        return s;
    endfunction

endclass


// Class: padding_flow_pad_info_2_reg_cover
// Register coverage object.
class padding_flow_pad_info_2_reg_cover extends uvm_object;

    static local padding_flow_pad_info_2_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    padding_flow_pad_info_2_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        mode_wr: coverpoint r.mode.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        mode_rd: coverpoint r.mode.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(padding_flow_reg_pkg::padding_flow_pad_info_2_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="padding_flow_pad_info_2_reg_cover");
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
    static function padding_flow_pad_info_2_reg_cover get();
        if (m_inst == null) begin
            m_inst = padding_flow_pad_info_2_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(padding_flow_pad_info_2_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class padding_flow_gen_info_reg_cover;

// Class: padding_flow_gen_info_reg
// Register padding_flow.gen_info: 
class padding_flow_gen_info_reg extends uvm_reg;

    // Variable: y1731_info_add_ena
    // Info add enable (to add timestamp, seq_number and flow_id)
    rand uvm_reg_field y1731_info_add_ena;
    // Variable: force_crc_error
    // Force CRC error.
    rand uvm_reg_field force_crc_error;
    // Variable: flow_hdr_only
    // It is used to generate special frame formats. Forces the PktGen to only generate the data from the flow_header section.
    rand uvm_reg_field flow_hdr_only;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static padding_flow_gen_info_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    padding_flow_gen_info_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(padding_flow_reg_pkg::padding_flow_gen_info_reg)

    // Constructor: new
    function new(string name = "padding_flow_gen_info");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        y1731_info_add_ena = uvm_reg_field::type_id::create("y1731_info_add_ena", , get_full_name());
        force_crc_error = uvm_reg_field::type_id::create("force_crc_error", , get_full_name());
        flow_hdr_only = uvm_reg_field::type_id::create("flow_hdr_only", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        y1731_info_add_ena.configure(this, 1, 0, "RW", 0, 'h0, 1, 1, 0);
        force_crc_error.configure(this, 1, 1, "RW", 0, 'h0, 1, 1, 0);
        flow_hdr_only.configure(this, 1, 2, "RW", 0, 'h0, 1, 1, 0);
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
                cg = padding_flow_gen_info_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = padding_flow_gen_info_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, y1731_info_add_ena.get_name, y1731_info_add_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, force_crc_error.get_name, force_crc_error.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, flow_hdr_only.get_name, flow_hdr_only.value);
        return s;
    endfunction

endclass


// Class: padding_flow_gen_info_reg_cover
// Register coverage object.
class padding_flow_gen_info_reg_cover extends uvm_object;

    static local padding_flow_gen_info_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    padding_flow_gen_info_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        y1731_info_add_ena_wr: coverpoint r.y1731_info_add_ena.value iff (!is_read);
        y1731_info_add_ena_rd: coverpoint r.y1731_info_add_ena.value iff  (is_read);
        force_crc_error_wr: coverpoint r.force_crc_error.value iff (!is_read);
        force_crc_error_rd: coverpoint r.force_crc_error.value iff  (is_read);
        flow_hdr_only_wr: coverpoint r.flow_hdr_only.value iff (!is_read);
        flow_hdr_only_rd: coverpoint r.flow_hdr_only.value iff  (is_read);
    endgroup

    `uvm_object_utils(padding_flow_reg_pkg::padding_flow_gen_info_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="padding_flow_gen_info_reg_cover");
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
    static function padding_flow_gen_info_reg_cover get();
        if (m_inst == null) begin
            m_inst = padding_flow_gen_info_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(padding_flow_gen_info_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class padding_flow_seq_nbr_reg_cover;

// Class: padding_flow_seq_nbr_reg
// Register padding_flow.seq_nbr: 
class padding_flow_seq_nbr_reg extends uvm_reg;

    // Variable: seq_nbr
    // sequence number writing to this register will arm first timestamp trigger (next packet timestamp will be kept in first timestamp register)
    rand uvm_reg_field seq_nbr;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static padding_flow_seq_nbr_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    padding_flow_seq_nbr_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(padding_flow_reg_pkg::padding_flow_seq_nbr_reg)

    // Constructor: new
    function new(string name = "padding_flow_seq_nbr");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        seq_nbr = uvm_reg_field::type_id::create("seq_nbr", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        seq_nbr.configure(this, 24, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = padding_flow_seq_nbr_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = padding_flow_seq_nbr_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, seq_nbr.get_name, seq_nbr.value);
        return s;
    endfunction

endclass


// Class: padding_flow_seq_nbr_reg_cover
// Register coverage object.
class padding_flow_seq_nbr_reg_cover extends uvm_object;

    static local padding_flow_seq_nbr_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    padding_flow_seq_nbr_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        seq_nbr_wr: coverpoint r.seq_nbr.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        seq_nbr_rd: coverpoint r.seq_nbr.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(padding_flow_reg_pkg::padding_flow_seq_nbr_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="padding_flow_seq_nbr_reg_cover");
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
    static function padding_flow_seq_nbr_reg_cover get();
        if (m_inst == null) begin
            m_inst = padding_flow_seq_nbr_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(padding_flow_seq_nbr_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class padding_flow_first_timestamp_reg_cover;

// Class: padding_flow_first_timestamp_reg
// Register padding_flow.first_timestamp: 
class padding_flow_first_timestamp_reg extends uvm_reg;

    // Variable: first_timestamp
    // First timestamp after writing seq_nbr will be kept in current register.
    rand uvm_reg_field first_timestamp;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static padding_flow_first_timestamp_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    padding_flow_first_timestamp_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(padding_flow_reg_pkg::padding_flow_first_timestamp_reg)

    // Constructor: new
    function new(string name = "padding_flow_first_timestamp");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        first_timestamp = uvm_reg_field::type_id::create("first_timestamp", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        first_timestamp.configure(this, 40, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = padding_flow_first_timestamp_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = padding_flow_first_timestamp_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, first_timestamp.get_name, first_timestamp.value);
        return s;
    endfunction

endclass


// Class: padding_flow_first_timestamp_reg_cover
// Register coverage object.
class padding_flow_first_timestamp_reg_cover extends uvm_object;

    static local padding_flow_first_timestamp_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    padding_flow_first_timestamp_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        first_timestamp_wr: coverpoint r.first_timestamp.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        first_timestamp_rd: coverpoint r.first_timestamp.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(padding_flow_reg_pkg::padding_flow_first_timestamp_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="padding_flow_first_timestamp_reg_cover");
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
    static function padding_flow_first_timestamp_reg_cover get();
        if (m_inst == null) begin
            m_inst = padding_flow_first_timestamp_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(padding_flow_first_timestamp_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class padding_flow_last_timestamp_reg_cover;

// Class: padding_flow_last_timestamp_reg
// Register padding_flow.last_timestamp: 
class padding_flow_last_timestamp_reg extends uvm_reg;

    // Variable: last_timestamp
    // Last timestamp is updated at every packet (except first after writing seq_nbr).
    rand uvm_reg_field last_timestamp;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static padding_flow_last_timestamp_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    padding_flow_last_timestamp_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(padding_flow_reg_pkg::padding_flow_last_timestamp_reg)

    // Constructor: new
    function new(string name = "padding_flow_last_timestamp");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        last_timestamp = uvm_reg_field::type_id::create("last_timestamp", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        last_timestamp.configure(this, 40, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = padding_flow_last_timestamp_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = padding_flow_last_timestamp_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, last_timestamp.get_name, last_timestamp.value);
        return s;
    endfunction

endclass


// Class: padding_flow_last_timestamp_reg_cover
// Register coverage object.
class padding_flow_last_timestamp_reg_cover extends uvm_object;

    static local padding_flow_last_timestamp_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    padding_flow_last_timestamp_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        last_timestamp_wr: coverpoint r.last_timestamp.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        last_timestamp_rd: coverpoint r.last_timestamp.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(padding_flow_reg_pkg::padding_flow_last_timestamp_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="padding_flow_last_timestamp_reg_cover");
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
    static function padding_flow_last_timestamp_reg_cover get();
        if (m_inst == null) begin
            m_inst = padding_flow_last_timestamp_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(padding_flow_last_timestamp_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class padding_flow_flow_number_reg_cover;

// Class: padding_flow_flow_number_reg
// Register padding_flow.flow_number: 
class padding_flow_flow_number_reg extends uvm_reg;

    // Variable: flow_number
    // Flow number (by default, programmable flow number will be 0 to 15 for flow 0 to flow 15 respectively.Be careful when overwriting flow number not to generate conflict between flows)
    rand uvm_reg_field flow_number;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static padding_flow_flow_number_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    padding_flow_flow_number_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(padding_flow_reg_pkg::padding_flow_flow_number_reg)

    // Constructor: new
    function new(string name = "padding_flow_flow_number");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        flow_number = uvm_reg_field::type_id::create("flow_number", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        flow_number.configure(this, 8, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = padding_flow_flow_number_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = padding_flow_flow_number_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, flow_number.get_name, flow_number.value);
        return s;
    endfunction

endclass


// Class: padding_flow_flow_number_reg_cover
// Register coverage object.
class padding_flow_flow_number_reg_cover extends uvm_object;

    static local padding_flow_flow_number_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    padding_flow_flow_number_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        flow_number_wr: coverpoint r.flow_number.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        flow_number_rd: coverpoint r.flow_number.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(padding_flow_reg_pkg::padding_flow_flow_number_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="padding_flow_flow_number_reg_cover");
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
    static function padding_flow_flow_number_reg_cover get();
        if (m_inst == null) begin
            m_inst = padding_flow_flow_number_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(padding_flow_flow_number_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class padding_flow_timestamp_select_reg_cover;

// Class: padding_flow_timestamp_select_reg
// Register padding_flow.timestamp_select: 
class padding_flow_timestamp_select_reg extends uvm_reg;

    // Variable: freerun
    // 
    rand uvm_reg_field freerun;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static padding_flow_timestamp_select_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    padding_flow_timestamp_select_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(padding_flow_reg_pkg::padding_flow_timestamp_select_reg)

    // Constructor: new
    function new(string name = "padding_flow_timestamp_select");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        freerun = uvm_reg_field::type_id::create("freerun", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        freerun.configure(this, 1, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = padding_flow_timestamp_select_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = padding_flow_timestamp_select_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, freerun.get_name, freerun.value);
        return s;
    endfunction

endclass


// Class: padding_flow_timestamp_select_reg_cover
// Register coverage object.
class padding_flow_timestamp_select_reg_cover extends uvm_object;

    static local padding_flow_timestamp_select_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    padding_flow_timestamp_select_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        freerun_wr: coverpoint r.freerun.value iff (!is_read);
        freerun_rd: coverpoint r.freerun.value iff  (is_read);
    endgroup

    `uvm_object_utils(padding_flow_reg_pkg::padding_flow_timestamp_select_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="padding_flow_timestamp_select_reg_cover");
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
    static function padding_flow_timestamp_select_reg_cover get();
        if (m_inst == null) begin
            m_inst = padding_flow_timestamp_select_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(padding_flow_timestamp_select_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class padding_flow_frame_info_reg_cover;

// Class: padding_flow_frame_info_reg
// Register padding_flow.frame_info: Unless specified otherwise, the fields in this register are FOR 10Gbps module only and have no effect for 1Gbps
class padding_flow_frame_info_reg extends uvm_reg;

    // Variable: mpls_vlan_stack_size
    // Total number of VLAN tags and MPLS labels
    rand uvm_reg_field mpls_vlan_stack_size;
    // Variable: protocol
    // THIS FIELD IS USED BY 10G AND 1G DESIGNS
    rand uvm_reg_field protocol;
    // Variable: ip_options_extensions_stack_size
    // THIS FIELD IS USED BY 10G AND 1G DESIGNS. Number of 32-bit words used as layer 3 ipv4 options in the packet OR number of 64-bit words used as layer 3 ipv6 extension headers in the packet:
    rand uvm_reg_field ip_options_extensions_stack_size;
    // Variable: extra_offset_stack_size
    // Number of extra 16-bits words added to flow header after a flag=2 and up to the flag=3.
    rand uvm_reg_field extra_offset_stack_size;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static padding_flow_frame_info_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    padding_flow_frame_info_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(padding_flow_reg_pkg::padding_flow_frame_info_reg)

    // Constructor: new
    function new(string name = "padding_flow_frame_info");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        mpls_vlan_stack_size = uvm_reg_field::type_id::create("mpls_vlan_stack_size", , get_full_name());
        protocol = uvm_reg_field::type_id::create("protocol", , get_full_name());
        ip_options_extensions_stack_size = uvm_reg_field::type_id::create("ip_options_extensions_stack_size", , get_full_name());
        extra_offset_stack_size = uvm_reg_field::type_id::create("extra_offset_stack_size", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        mpls_vlan_stack_size.configure(this, 4, 0, "RW", 0, 'h0, 1, 1, 0);
        protocol.configure(this, 2, 8, "RW", 0, 'h0, 1, 1, 0);
        ip_options_extensions_stack_size.configure(this, 5, 16, "RW", 0, 'h0, 1, 1, 0);
        extra_offset_stack_size.configure(this, 7, 24, "RW", 0, 'h0, 1, 1, 0);
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
                cg = padding_flow_frame_info_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = padding_flow_frame_info_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, mpls_vlan_stack_size.get_name, mpls_vlan_stack_size.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, protocol.get_name, protocol.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, ip_options_extensions_stack_size.get_name, ip_options_extensions_stack_size.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, extra_offset_stack_size.get_name, extra_offset_stack_size.value);
        return s;
    endfunction

endclass


// Class: padding_flow_frame_info_reg_cover
// Register coverage object.
class padding_flow_frame_info_reg_cover extends uvm_object;

    static local padding_flow_frame_info_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    padding_flow_frame_info_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        mpls_vlan_stack_size_wr: coverpoint r.mpls_vlan_stack_size.value iff (!is_read);
        mpls_vlan_stack_size_rd: coverpoint r.mpls_vlan_stack_size.value iff  (is_read);
        protocol_wr: coverpoint r.protocol.value iff (!is_read);
        protocol_rd: coverpoint r.protocol.value iff  (is_read);
        ip_options_extensions_stack_size_wr: coverpoint r.ip_options_extensions_stack_size.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        ip_options_extensions_stack_size_rd: coverpoint r.ip_options_extensions_stack_size.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        extra_offset_stack_size_wr: coverpoint r.extra_offset_stack_size.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        extra_offset_stack_size_rd: coverpoint r.extra_offset_stack_size.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(padding_flow_reg_pkg::padding_flow_frame_info_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="padding_flow_frame_info_reg_cover");
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
    static function padding_flow_frame_info_reg_cover get();
        if (m_inst == null) begin
            m_inst = padding_flow_frame_info_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(padding_flow_frame_info_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class padding_flow_checksum_reg_cover;

// Class: padding_flow_checksum_reg
// Register padding_flow.checksum: FOR 10Gbps module only and has no effect for 1Gbps
class padding_flow_checksum_reg extends uvm_reg;

    // Variable: partial_ipv4_chcksm
    // partial IPv4 checksum with overflow already managed, but NOT TRANSFORMED TO COMPLEMENT ONE NOTATION, FPGA will add IP_Total_length to value, transform to complement-1 notation and insert into packet (overflow impossible on FPGA s side because added value is 14 bits)
    rand uvm_reg_field partial_ipv4_chcksm;
    // Variable: partial_l4_chcksm
    // partial layer4 checksum (i.e. UDP) with overflow already managed, but NOT TRANSFORMED TO COMPLEMENT ONE NOTATION
    rand uvm_reg_field partial_l4_chcksm;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static padding_flow_checksum_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    padding_flow_checksum_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(padding_flow_reg_pkg::padding_flow_checksum_reg)

    // Constructor: new
    function new(string name = "padding_flow_checksum");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        partial_ipv4_chcksm = uvm_reg_field::type_id::create("partial_ipv4_chcksm", , get_full_name());
        partial_l4_chcksm = uvm_reg_field::type_id::create("partial_l4_chcksm", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        partial_ipv4_chcksm.configure(this, 16, 0, "RW", 0, 'h0, 1, 1, 0);
        partial_l4_chcksm.configure(this, 16, 16, "RW", 0, 'h0, 1, 1, 0);
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
                cg = padding_flow_checksum_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = padding_flow_checksum_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, partial_ipv4_chcksm.get_name, partial_ipv4_chcksm.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, partial_l4_chcksm.get_name, partial_l4_chcksm.value);
        return s;
    endfunction

endclass


// Class: padding_flow_checksum_reg_cover
// Register coverage object.
class padding_flow_checksum_reg_cover extends uvm_object;

    static local padding_flow_checksum_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    padding_flow_checksum_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        partial_ipv4_chcksm_wr: coverpoint r.partial_ipv4_chcksm.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        partial_ipv4_chcksm_rd: coverpoint r.partial_ipv4_chcksm.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        partial_l4_chcksm_wr: coverpoint r.partial_l4_chcksm.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        partial_l4_chcksm_rd: coverpoint r.partial_l4_chcksm.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(padding_flow_reg_pkg::padding_flow_checksum_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="padding_flow_checksum_reg_cover");
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
    static function padding_flow_checksum_reg_cover get();
        if (m_inst == null) begin
            m_inst = padding_flow_checksum_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(padding_flow_checksum_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class padding_flow_modif_header_reg_cover;

// Class: padding_flow_modif_header_reg
// Register padding_flow.modif_header: FOR ACD-TestSet only (replaces the vid_range)
class padding_flow_modif_header_reg extends uvm_reg;

    // Variable: min
    // MUST be programmed with the value of the word programmed at modif_header_offset of flow header for the IP or UDP Checksum to be evaluated properly. 
    rand uvm_reg_field min;
    // Variable: incr
    // Bit field increment value left shifted to the first bit position of the targeted bit field in the word
    rand uvm_reg_field incr;
    // Variable: mod_div_adj
    // Modulo divisor adjusted. Precalculated from: modif_header_max - modif_header_min +2^field_offset - modif_header_inc
    rand uvm_reg_field mod_div_adj;
    // Variable: offset
    // Flow header word offset (0-127). Only one field per flow can be modified at a time.
    rand uvm_reg_field offset;
    // Variable: ena
    // Enables flow header on-the-fly field modification of a contiguous bit field up to the full word
    rand uvm_reg_field ena;
    // Variable: udp_chksm_mod_ena
    // Enables the logic that updates the UDP Checksum based on the new value of the field. MUST only be set to one when one of the following IPv4 or IPv6 fields are part of the flow header word that will be modified by this modif_header register: IPv4 or IPv6 source or destination address, UDP source or destination port
    rand uvm_reg_field udp_chksm_mod_ena;
    // Variable: ipv4_chksm_mod_ena
    // Enables the logic that updates the IPv4 Checksum based on the new value of the field. MUST only be set to one when one of the following IPv4 fields are part of the flow header word that will be modified by this modif_header register: IPv4 Version/IHL, IPv4 TOS, IPv4 ID, IPv4 Flags/Fragments, IPv4 TTL, IPv4 Protocol, IPv4 source or destination address
    rand uvm_reg_field ipv4_chksm_mod_ena;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static padding_flow_modif_header_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    padding_flow_modif_header_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(padding_flow_reg_pkg::padding_flow_modif_header_reg)

    // Constructor: new
    function new(string name = "padding_flow_modif_header");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        min = uvm_reg_field::type_id::create("min", , get_full_name());
        incr = uvm_reg_field::type_id::create("incr", , get_full_name());
        mod_div_adj = uvm_reg_field::type_id::create("mod_div_adj", , get_full_name());
        offset = uvm_reg_field::type_id::create("offset", , get_full_name());
        ena = uvm_reg_field::type_id::create("ena", , get_full_name());
        udp_chksm_mod_ena = uvm_reg_field::type_id::create("udp_chksm_mod_ena", , get_full_name());
        ipv4_chksm_mod_ena = uvm_reg_field::type_id::create("ipv4_chksm_mod_ena", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        min.configure(this, 16, 0, "RW", 0, 'h0, 1, 1, 0);
        incr.configure(this, 16, 16, "RW", 0, 'h0, 1, 1, 0);
        mod_div_adj.configure(this, 16, 32, "RW", 0, 'h0, 1, 1, 0);
        offset.configure(this, 7, 48, "RW", 0, 'h0, 1, 1, 0);
        ena.configure(this, 1, 56, "RW", 0, 'h0, 1, 1, 0);
        udp_chksm_mod_ena.configure(this, 1, 57, "RW", 0, 'h0, 1, 1, 0);
        ipv4_chksm_mod_ena.configure(this, 1, 58, "RW", 0, 'h0, 1, 1, 0);
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
                cg = padding_flow_modif_header_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = padding_flow_modif_header_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, min.get_name, min.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, incr.get_name, incr.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, mod_div_adj.get_name, mod_div_adj.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, offset.get_name, offset.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, ena.get_name, ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, udp_chksm_mod_ena.get_name, udp_chksm_mod_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, ipv4_chksm_mod_ena.get_name, ipv4_chksm_mod_ena.value);
        return s;
    endfunction

endclass


// Class: padding_flow_modif_header_reg_cover
// Register coverage object.
class padding_flow_modif_header_reg_cover extends uvm_object;

    static local padding_flow_modif_header_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    padding_flow_modif_header_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        min_wr: coverpoint r.min.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        min_rd: coverpoint r.min.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        incr_wr: coverpoint r.incr.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        incr_rd: coverpoint r.incr.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        mod_div_adj_wr: coverpoint r.mod_div_adj.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        mod_div_adj_rd: coverpoint r.mod_div_adj.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        offset_wr: coverpoint r.offset.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        offset_rd: coverpoint r.offset.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        ena_wr: coverpoint r.ena.value iff (!is_read);
        ena_rd: coverpoint r.ena.value iff  (is_read);
        udp_chksm_mod_ena_wr: coverpoint r.udp_chksm_mod_ena.value iff (!is_read);
        udp_chksm_mod_ena_rd: coverpoint r.udp_chksm_mod_ena.value iff  (is_read);
        ipv4_chksm_mod_ena_wr: coverpoint r.ipv4_chksm_mod_ena.value iff (!is_read);
        ipv4_chksm_mod_ena_rd: coverpoint r.ipv4_chksm_mod_ena.value iff  (is_read);
    endgroup

    `uvm_object_utils(padding_flow_reg_pkg::padding_flow_modif_header_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="padding_flow_modif_header_reg_cover");
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
    static function padding_flow_modif_header_reg_cover get();
        if (m_inst == null) begin
            m_inst = padding_flow_modif_header_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(padding_flow_modif_header_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass





// Class: padding_flow_reg_block
// Register Block .padding_flow: 
class padding_flow_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand padding_flow_pad_info_1_reg pad_info_1;
    rand padding_flow_pad_info_2_reg pad_info_2;
    rand padding_flow_gen_info_reg gen_info;
    rand padding_flow_seq_nbr_reg seq_nbr;
    rand padding_flow_first_timestamp_reg first_timestamp;
    rand padding_flow_last_timestamp_reg last_timestamp;
    rand padding_flow_flow_number_reg flow_number;
    rand padding_flow_timestamp_select_reg timestamp_select;
    rand padding_flow_frame_info_reg frame_info;
    rand padding_flow_checksum_reg checksum;
    rand padding_flow_modif_header_reg modif_header;

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(padding_flow_reg_pkg::padding_flow_reg_block)

    // Constructor: new
    function new(string name = "padding_flow_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})


        pad_info_1 = padding_flow_pad_info_1_reg::type_id::create("pad_info_1", , get_full_name());
        pad_info_2 = padding_flow_pad_info_2_reg::type_id::create("pad_info_2", , get_full_name());
        gen_info = padding_flow_gen_info_reg::type_id::create("gen_info", , get_full_name());
        seq_nbr = padding_flow_seq_nbr_reg::type_id::create("seq_nbr", , get_full_name());
        first_timestamp = padding_flow_first_timestamp_reg::type_id::create("first_timestamp", , get_full_name());
        last_timestamp = padding_flow_last_timestamp_reg::type_id::create("last_timestamp", , get_full_name());
        flow_number = padding_flow_flow_number_reg::type_id::create("flow_number", , get_full_name());
        timestamp_select = padding_flow_timestamp_select_reg::type_id::create("timestamp_select", , get_full_name());
        frame_info = padding_flow_frame_info_reg::type_id::create("frame_info", , get_full_name());
        checksum = padding_flow_checksum_reg::type_id::create("checksum", , get_full_name());
        modif_header = padding_flow_modif_header_reg::type_id::create("modif_header", , get_full_name());

        pad_info_1.configure(this);
        pad_info_2.configure(this);
        gen_info.configure(this);
        seq_nbr.configure(this);
        first_timestamp.configure(this);
        last_timestamp.configure(this);
        flow_number.configure(this);
        timestamp_select.configure(this);
        frame_info.configure(this);
        checksum.configure(this);
        modif_header.configure(this);

        pad_info_1.build();
        pad_info_2.build();
        gen_info.build();
        seq_nbr.build();
        first_timestamp.build();
        last_timestamp.build();
        flow_number.build();
        timestamp_select.build();
        frame_info.build();
        checksum.build();
        modif_header.build();

        // define default map
        default_map = create_map("padding_flow_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        this.default_map.add_reg(pad_info_1, 'h0, "RW");
        this.default_map.add_reg(pad_info_2, 'h1, "RW");
        this.default_map.add_reg(gen_info, 'h2, "RW");
        this.default_map.add_reg(seq_nbr, 'h3, "RW");
        this.default_map.add_reg(first_timestamp, 'h4, "RO");
        this.default_map.add_reg(last_timestamp, 'h5, "RO");
        this.default_map.add_reg(flow_number, 'h6, "RW");
        this.default_map.add_reg(timestamp_select, 'h7, "RW");
        this.default_map.add_reg(frame_info, 'h8, "RW");
        this.default_map.add_reg(checksum, 'h9, "RW");
        this.default_map.add_reg(modif_header, 'hA, "RW");

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
        pad_info_1.enable_coverage(is_on, this.cg_per_instance);
        pad_info_2.enable_coverage(is_on, this.cg_per_instance);
        gen_info.enable_coverage(is_on, this.cg_per_instance);
        seq_nbr.enable_coverage(is_on, this.cg_per_instance);
        first_timestamp.enable_coverage(is_on, this.cg_per_instance);
        last_timestamp.enable_coverage(is_on, this.cg_per_instance);
        flow_number.enable_coverage(is_on, this.cg_per_instance);
        timestamp_select.enable_coverage(is_on, this.cg_per_instance);
        frame_info.enable_coverage(is_on, this.cg_per_instance);
        checksum.enable_coverage(is_on, this.cg_per_instance);
        modif_header.enable_coverage(is_on, this.cg_per_instance);
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