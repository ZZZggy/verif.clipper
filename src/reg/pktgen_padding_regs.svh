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
// Register definitions for pktgen_padding register block.
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
// Group: pktgen_padding
//---------------------------------------------------------

package pktgen_padding_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;

typedef class padding_pad_info_1_reg_cover;

// Class: padding_pad_info_1_reg
// Register padding.pad_info_1: 
class padding_pad_info_1_reg extends uvm_reg;

    // Variable: padding
    //  8 bytes sequence value used if pad_info_2 = 0x2. Write 0x00000000 when pad_info_2 is set to 0x4 or 0x5 (incremental mode). Write 0xFFFFFFFF when pad_info_2 is set to 0x9        (pseudo random mode).   
    rand uvm_reg_field padding;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static padding_pad_info_1_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    padding_pad_info_1_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pktgen_padding_reg_pkg::padding_pad_info_1_reg)

    // Constructor: new
    function new(string name = "padding_pad_info_1");
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
                cg = padding_pad_info_1_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = padding_pad_info_1_reg_cover::get();
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


// Class: padding_pad_info_1_reg_cover
// Register coverage object.
class padding_pad_info_1_reg_cover extends uvm_object;

    static local padding_pad_info_1_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    padding_pad_info_1_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        padding_wr: coverpoint r.padding.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        padding_rd: coverpoint r.padding.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(pktgen_padding_reg_pkg::padding_pad_info_1_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="padding_pad_info_1_reg_cover");
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
    static function padding_pad_info_1_reg_cover get();
        if (m_inst == null) begin
            m_inst = padding_pad_info_1_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(padding_pad_info_1_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class padding_pad_info_2_reg_cover;

// Class: padding_pad_info_2_reg
// Register padding.pad_info_2: 
class padding_pad_info_2_reg extends uvm_reg;

    // Variable: mode
    //  x2 : 8 nibbles sequence as specified at register pad_info_1 x4 : Incremental bytes      (mettre 0x00000000 au registre pad_info_1) x5 : Incremental words      (mettre 0x00000000 au registre pad_info_1) x9 : 2^11 (CCITT/ITU O.153) (mettre 0x00000000 au registre pad_info_1) xA : 2^15 (CCITT/ITU O.153) (not supported anymore)
    rand uvm_reg_field mode;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static padding_pad_info_2_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    padding_pad_info_2_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pktgen_padding_reg_pkg::padding_pad_info_2_reg)

    // Constructor: new
    function new(string name = "padding_pad_info_2");
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
                cg = padding_pad_info_2_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = padding_pad_info_2_reg_cover::get();
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


// Class: padding_pad_info_2_reg_cover
// Register coverage object.
class padding_pad_info_2_reg_cover extends uvm_object;

    static local padding_pad_info_2_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    padding_pad_info_2_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        mode_wr: coverpoint r.mode.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        mode_rd: coverpoint r.mode.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(pktgen_padding_reg_pkg::padding_pad_info_2_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="padding_pad_info_2_reg_cover");
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
    static function padding_pad_info_2_reg_cover get();
        if (m_inst == null) begin
            m_inst = padding_pad_info_2_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(padding_pad_info_2_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class padding_gen_info_reg_cover;

// Class: padding_gen_info_reg
// Register padding.gen_info: 
class padding_gen_info_reg extends uvm_reg;

    // Variable: force_crc_error
    // Force CRC error.
    rand uvm_reg_field force_crc_error;
    // Variable: info_add_ena
    // Info add enable (to add timestamp, and all features, etc)
    rand uvm_reg_field info_add_ena;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static padding_gen_info_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    padding_gen_info_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pktgen_padding_reg_pkg::padding_gen_info_reg)

    // Constructor: new
    function new(string name = "padding_gen_info");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        force_crc_error = uvm_reg_field::type_id::create("force_crc_error", , get_full_name());
        info_add_ena = uvm_reg_field::type_id::create("info_add_ena", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        force_crc_error.configure(this, 1, 1, "RW", 0, 'h0, 1, 1, 0);
        info_add_ena.configure(this, 1, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = padding_gen_info_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = padding_gen_info_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, force_crc_error.get_name, force_crc_error.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, info_add_ena.get_name, info_add_ena.value);
        return s;
    endfunction

endclass


// Class: padding_gen_info_reg_cover
// Register coverage object.
class padding_gen_info_reg_cover extends uvm_object;

    static local padding_gen_info_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    padding_gen_info_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        force_crc_error_wr: coverpoint r.force_crc_error.value iff (!is_read);
        force_crc_error_rd: coverpoint r.force_crc_error.value iff  (is_read);
        info_add_ena_wr: coverpoint r.info_add_ena.value iff (!is_read);
        info_add_ena_rd: coverpoint r.info_add_ena.value iff  (is_read);
    endgroup

    `uvm_object_utils(pktgen_padding_reg_pkg::padding_gen_info_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="padding_gen_info_reg_cover");
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
    static function padding_gen_info_reg_cover get();
        if (m_inst == null) begin
            m_inst = padding_gen_info_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(padding_gen_info_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class padding_seq_nbr_reg_cover;

// Class: padding_seq_nbr_reg
// Register padding.seq_nbr: 
class padding_seq_nbr_reg extends uvm_reg;

    // Variable: seq_nbr
    // sequence number     writing to this register will arm first timestamp trigger (next packet timestamp will be kept in first timestamp register)
    rand uvm_reg_field seq_nbr;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static padding_seq_nbr_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    padding_seq_nbr_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pktgen_padding_reg_pkg::padding_seq_nbr_reg)

    // Constructor: new
    function new(string name = "padding_seq_nbr");
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
                cg = padding_seq_nbr_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = padding_seq_nbr_reg_cover::get();
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


// Class: padding_seq_nbr_reg_cover
// Register coverage object.
class padding_seq_nbr_reg_cover extends uvm_object;

    static local padding_seq_nbr_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    padding_seq_nbr_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        seq_nbr_wr: coverpoint r.seq_nbr.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        seq_nbr_rd: coverpoint r.seq_nbr.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(pktgen_padding_reg_pkg::padding_seq_nbr_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="padding_seq_nbr_reg_cover");
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
    static function padding_seq_nbr_reg_cover get();
        if (m_inst == null) begin
            m_inst = padding_seq_nbr_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(padding_seq_nbr_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class padding_first_timestamp_reg_cover;

// Class: padding_first_timestamp_reg
// Register padding.first_timestamp: 
class padding_first_timestamp_reg extends uvm_reg;

    // Variable: first_timestamp
    // First timestamp after writing seq_nbr will be kept in current register.
    rand uvm_reg_field first_timestamp;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static padding_first_timestamp_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    padding_first_timestamp_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pktgen_padding_reg_pkg::padding_first_timestamp_reg)

    // Constructor: new
    function new(string name = "padding_first_timestamp");
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
                cg = padding_first_timestamp_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = padding_first_timestamp_reg_cover::get();
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


// Class: padding_first_timestamp_reg_cover
// Register coverage object.
class padding_first_timestamp_reg_cover extends uvm_object;

    static local padding_first_timestamp_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    padding_first_timestamp_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        first_timestamp_wr: coverpoint r.first_timestamp.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        first_timestamp_rd: coverpoint r.first_timestamp.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(pktgen_padding_reg_pkg::padding_first_timestamp_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="padding_first_timestamp_reg_cover");
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
    static function padding_first_timestamp_reg_cover get();
        if (m_inst == null) begin
            m_inst = padding_first_timestamp_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(padding_first_timestamp_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class padding_last_timestamp_reg_cover;

// Class: padding_last_timestamp_reg
// Register padding.last_timestamp: 
class padding_last_timestamp_reg extends uvm_reg;

    // Variable: last_timestamp
    // Last timestamp is updated at every packet (except first after writing seq_nbr).
    rand uvm_reg_field last_timestamp;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static padding_last_timestamp_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    padding_last_timestamp_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pktgen_padding_reg_pkg::padding_last_timestamp_reg)

    // Constructor: new
    function new(string name = "padding_last_timestamp");
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
                cg = padding_last_timestamp_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = padding_last_timestamp_reg_cover::get();
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


// Class: padding_last_timestamp_reg_cover
// Register coverage object.
class padding_last_timestamp_reg_cover extends uvm_object;

    static local padding_last_timestamp_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    padding_last_timestamp_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        last_timestamp_wr: coverpoint r.last_timestamp.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        last_timestamp_rd: coverpoint r.last_timestamp.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(pktgen_padding_reg_pkg::padding_last_timestamp_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="padding_last_timestamp_reg_cover");
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
    static function padding_last_timestamp_reg_cover get();
        if (m_inst == null) begin
            m_inst = padding_last_timestamp_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(padding_last_timestamp_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class padding_flow_number_reg_cover;

// Class: padding_flow_number_reg
// Register padding.flow_number: 
class padding_flow_number_reg extends uvm_reg;

    // Variable: flow_number
    // Flow number (by default, programmable flow number will be 0 to 15 for flow 0 to flow 15 respectively.Be careful when overwriting flow number not to generate conflict between flows)
    rand uvm_reg_field flow_number;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static padding_flow_number_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    padding_flow_number_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pktgen_padding_reg_pkg::padding_flow_number_reg)

    // Constructor: new
    function new(string name = "padding_flow_number");
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
                cg = padding_flow_number_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = padding_flow_number_reg_cover::get();
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


// Class: padding_flow_number_reg_cover
// Register coverage object.
class padding_flow_number_reg_cover extends uvm_object;

    static local padding_flow_number_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    padding_flow_number_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        flow_number_wr: coverpoint r.flow_number.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        flow_number_rd: coverpoint r.flow_number.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(pktgen_padding_reg_pkg::padding_flow_number_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="padding_flow_number_reg_cover");
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
    static function padding_flow_number_reg_cover get();
        if (m_inst == null) begin
            m_inst = padding_flow_number_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(padding_flow_number_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class padding_timestamp_select_reg_cover;

// Class: padding_timestamp_select_reg
// Register padding.timestamp_select: 
class padding_timestamp_select_reg extends uvm_reg;

    // Variable: freerun
    //  logic 0 -&gt; regular timestamp  logic 1 -&gt; free run timestamp (not impacted by NTP server, must be used for two way delay tests
    rand uvm_reg_field freerun;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static padding_timestamp_select_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    padding_timestamp_select_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pktgen_padding_reg_pkg::padding_timestamp_select_reg)

    // Constructor: new
    function new(string name = "padding_timestamp_select");
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
                cg = padding_timestamp_select_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = padding_timestamp_select_reg_cover::get();
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


// Class: padding_timestamp_select_reg_cover
// Register coverage object.
class padding_timestamp_select_reg_cover extends uvm_object;

    static local padding_timestamp_select_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    padding_timestamp_select_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        freerun_wr: coverpoint r.freerun.value iff (!is_read);
        freerun_rd: coverpoint r.freerun.value iff  (is_read);
    endgroup

    `uvm_object_utils(pktgen_padding_reg_pkg::padding_timestamp_select_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="padding_timestamp_select_reg_cover");
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
    static function padding_timestamp_select_reg_cover get();
        if (m_inst == null) begin
            m_inst = padding_timestamp_select_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(padding_timestamp_select_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass





// Class: pktgen_padding_reg_block
// Register Block .pktgen_padding: 
class pktgen_padding_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand padding_pad_info_1_reg pad_info_1;
    rand padding_pad_info_2_reg pad_info_2;
    rand padding_gen_info_reg gen_info;
    rand padding_seq_nbr_reg seq_nbr;
    rand padding_first_timestamp_reg first_timestamp;
    rand padding_last_timestamp_reg last_timestamp;
    rand padding_flow_number_reg flow_number;
    rand padding_timestamp_select_reg timestamp_select;

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(pktgen_padding_reg_pkg::pktgen_padding_reg_block)

    // Constructor: new
    function new(string name = "pktgen_padding_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})


        pad_info_1 = padding_pad_info_1_reg::type_id::create("pad_info_1", , get_full_name());
        pad_info_2 = padding_pad_info_2_reg::type_id::create("pad_info_2", , get_full_name());
        gen_info = padding_gen_info_reg::type_id::create("gen_info", , get_full_name());
        seq_nbr = padding_seq_nbr_reg::type_id::create("seq_nbr", , get_full_name());
        first_timestamp = padding_first_timestamp_reg::type_id::create("first_timestamp", , get_full_name());
        last_timestamp = padding_last_timestamp_reg::type_id::create("last_timestamp", , get_full_name());
        flow_number = padding_flow_number_reg::type_id::create("flow_number", , get_full_name());
        timestamp_select = padding_timestamp_select_reg::type_id::create("timestamp_select", , get_full_name());

        pad_info_1.configure(this);
        pad_info_2.configure(this);
        gen_info.configure(this);
        seq_nbr.configure(this);
        first_timestamp.configure(this);
        last_timestamp.configure(this);
        flow_number.configure(this);
        timestamp_select.configure(this);

        pad_info_1.build();
        pad_info_2.build();
        gen_info.build();
        seq_nbr.build();
        first_timestamp.build();
        last_timestamp.build();
        flow_number.build();
        timestamp_select.build();

        // define default map
        default_map = create_map("pktgen_padding_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        this.default_map.add_reg(pad_info_1, 'h0, "RW");
        this.default_map.add_reg(pad_info_2, 'h1, "RW");
        this.default_map.add_reg(gen_info, 'h2, "RW");
        this.default_map.add_reg(seq_nbr, 'h3, "RW");
        this.default_map.add_reg(first_timestamp, 'h4, "RO");
        this.default_map.add_reg(last_timestamp, 'h5, "RO");
        this.default_map.add_reg(flow_number, 'h6, "RW");
        this.default_map.add_reg(timestamp_select, 'h7, "RW");

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