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
// Register definitions for acd_seq_checker_reg register block.
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
// Group: acd_seq_checker_reg
//---------------------------------------------------------

package acd_seq_checker_reg_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;

typedef class acd_seq_checker_reg_input_error_reg_cover;

// Class: acd_seq_checker_reg_input_error_reg
// Register acd_seq_checker_reg.input_error: Sequence checker error at input of the input section
class acd_seq_checker_reg_input_error_reg extends uvm_reg;

    // Variable: port1
    // Error detected at Port  1
    rand uvm_reg_field port1;
    // Variable: port2
    // Error detected at Port  2
    rand uvm_reg_field port2;
    // Variable: port3
    // Error detected at Port  3
    rand uvm_reg_field port3;
    // Variable: port4
    // Error detected at Port  4
    rand uvm_reg_field port4;
    // Variable: port5
    // Error detected at Port  5
    rand uvm_reg_field port5;
    // Variable: port6
    // Error detected at Port  6
    rand uvm_reg_field port6;
    // Variable: port7
    // Error detected at Port  7
    rand uvm_reg_field port7;
    // Variable: port8
    // Error detected at Port  8
    rand uvm_reg_field port8;
    // Variable: port9
    // Error detected at Port  9
    rand uvm_reg_field port9;
    // Variable: port10
    // Error detected at Port 10
    rand uvm_reg_field port10;
    // Variable: port11
    // Error detected at Port 11
    rand uvm_reg_field port11;
    // Variable: port12
    // Error detected at Port 12
    rand uvm_reg_field port12;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static acd_seq_checker_reg_input_error_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    acd_seq_checker_reg_input_error_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(acd_seq_checker_reg_reg_pkg::acd_seq_checker_reg_input_error_reg)

    // Constructor: new
    function new(string name = "acd_seq_checker_reg_input_error");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        port1 = uvm_reg_field::type_id::create("port1", , get_full_name());
        port2 = uvm_reg_field::type_id::create("port2", , get_full_name());
        port3 = uvm_reg_field::type_id::create("port3", , get_full_name());
        port4 = uvm_reg_field::type_id::create("port4", , get_full_name());
        port5 = uvm_reg_field::type_id::create("port5", , get_full_name());
        port6 = uvm_reg_field::type_id::create("port6", , get_full_name());
        port7 = uvm_reg_field::type_id::create("port7", , get_full_name());
        port8 = uvm_reg_field::type_id::create("port8", , get_full_name());
        port9 = uvm_reg_field::type_id::create("port9", , get_full_name());
        port10 = uvm_reg_field::type_id::create("port10", , get_full_name());
        port11 = uvm_reg_field::type_id::create("port11", , get_full_name());
        port12 = uvm_reg_field::type_id::create("port12", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        port1.configure(this, 1, 0, "RO", 0, 'h0, 1, 1, 0);
        port2.configure(this, 1, 1, "RO", 0, 'h0, 1, 1, 0);
        port3.configure(this, 1, 2, "RO", 0, 'h0, 1, 1, 0);
        port4.configure(this, 1, 3, "RO", 0, 'h0, 1, 1, 0);
        port5.configure(this, 1, 4, "RO", 0, 'h0, 1, 1, 0);
        port6.configure(this, 1, 5, "RO", 0, 'h0, 1, 1, 0);
        port7.configure(this, 1, 6, "RO", 0, 'h0, 1, 1, 0);
        port8.configure(this, 1, 7, "RO", 0, 'h0, 1, 1, 0);
        port9.configure(this, 1, 8, "RO", 0, 'h0, 1, 1, 0);
        port10.configure(this, 1, 9, "RO", 0, 'h0, 1, 1, 0);
        port11.configure(this, 1, 10, "RO", 0, 'h0, 1, 1, 0);
        port12.configure(this, 1, 11, "RO", 0, 'h0, 1, 1, 0);
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
                cg = acd_seq_checker_reg_input_error_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = acd_seq_checker_reg_input_error_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, port1.get_name, port1.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port2.get_name, port2.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port3.get_name, port3.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port4.get_name, port4.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port5.get_name, port5.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port6.get_name, port6.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port7.get_name, port7.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port8.get_name, port8.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port9.get_name, port9.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port10.get_name, port10.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port11.get_name, port11.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port12.get_name, port12.value);
        return s;
    endfunction

endclass


// Class: acd_seq_checker_reg_input_error_reg_cover
// Register coverage object.
class acd_seq_checker_reg_input_error_reg_cover extends uvm_object;

    static local acd_seq_checker_reg_input_error_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    acd_seq_checker_reg_input_error_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        port1_wr: coverpoint r.port1.value iff (!is_read);
        port1_rd: coverpoint r.port1.value iff  (is_read);
        port2_wr: coverpoint r.port2.value iff (!is_read);
        port2_rd: coverpoint r.port2.value iff  (is_read);
        port3_wr: coverpoint r.port3.value iff (!is_read);
        port3_rd: coverpoint r.port3.value iff  (is_read);
        port4_wr: coverpoint r.port4.value iff (!is_read);
        port4_rd: coverpoint r.port4.value iff  (is_read);
        port5_wr: coverpoint r.port5.value iff (!is_read);
        port5_rd: coverpoint r.port5.value iff  (is_read);
        port6_wr: coverpoint r.port6.value iff (!is_read);
        port6_rd: coverpoint r.port6.value iff  (is_read);
        port7_wr: coverpoint r.port7.value iff (!is_read);
        port7_rd: coverpoint r.port7.value iff  (is_read);
        port8_wr: coverpoint r.port8.value iff (!is_read);
        port8_rd: coverpoint r.port8.value iff  (is_read);
        port9_wr: coverpoint r.port9.value iff (!is_read);
        port9_rd: coverpoint r.port9.value iff  (is_read);
        port10_wr: coverpoint r.port10.value iff (!is_read);
        port10_rd: coverpoint r.port10.value iff  (is_read);
        port11_wr: coverpoint r.port11.value iff (!is_read);
        port11_rd: coverpoint r.port11.value iff  (is_read);
        port12_wr: coverpoint r.port12.value iff (!is_read);
        port12_rd: coverpoint r.port12.value iff  (is_read);
    endgroup

    `uvm_object_utils(acd_seq_checker_reg_reg_pkg::acd_seq_checker_reg_input_error_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="acd_seq_checker_reg_input_error_reg_cover");
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
    static function acd_seq_checker_reg_input_error_reg_cover get();
        if (m_inst == null) begin
            m_inst = acd_seq_checker_reg_input_error_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(acd_seq_checker_reg_input_error_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class acd_seq_checker_reg_preact_error_reg_cover;

// Class: acd_seq_checker_reg_preact_error_reg
// Register acd_seq_checker_reg.preact_error: Sequence checker error at the pre action of input section
class acd_seq_checker_reg_preact_error_reg extends uvm_reg;

    // Variable: port1
    // Error detected at Port  1
    rand uvm_reg_field port1;
    // Variable: port2
    // Error detected at Port  2
    rand uvm_reg_field port2;
    // Variable: port3
    // Error detected at Port  3
    rand uvm_reg_field port3;
    // Variable: port4
    // Error detected at Port  4
    rand uvm_reg_field port4;
    // Variable: port5
    // Error detected at Port  5
    rand uvm_reg_field port5;
    // Variable: port6
    // Error detected at Port  6
    rand uvm_reg_field port6;
    // Variable: port7
    // Error detected at Port  7
    rand uvm_reg_field port7;
    // Variable: port8
    // Error detected at Port  8
    rand uvm_reg_field port8;
    // Variable: port9
    // Error detected at Port  9
    rand uvm_reg_field port9;
    // Variable: port10
    // Error detected at Port 10
    rand uvm_reg_field port10;
    // Variable: port11
    // Error detected at Port 11
    rand uvm_reg_field port11;
    // Variable: port12
    // Error detected at Port 12
    rand uvm_reg_field port12;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static acd_seq_checker_reg_preact_error_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    acd_seq_checker_reg_preact_error_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(acd_seq_checker_reg_reg_pkg::acd_seq_checker_reg_preact_error_reg)

    // Constructor: new
    function new(string name = "acd_seq_checker_reg_preact_error");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        port1 = uvm_reg_field::type_id::create("port1", , get_full_name());
        port2 = uvm_reg_field::type_id::create("port2", , get_full_name());
        port3 = uvm_reg_field::type_id::create("port3", , get_full_name());
        port4 = uvm_reg_field::type_id::create("port4", , get_full_name());
        port5 = uvm_reg_field::type_id::create("port5", , get_full_name());
        port6 = uvm_reg_field::type_id::create("port6", , get_full_name());
        port7 = uvm_reg_field::type_id::create("port7", , get_full_name());
        port8 = uvm_reg_field::type_id::create("port8", , get_full_name());
        port9 = uvm_reg_field::type_id::create("port9", , get_full_name());
        port10 = uvm_reg_field::type_id::create("port10", , get_full_name());
        port11 = uvm_reg_field::type_id::create("port11", , get_full_name());
        port12 = uvm_reg_field::type_id::create("port12", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        port1.configure(this, 1, 0, "RO", 0, 'h0, 1, 1, 0);
        port2.configure(this, 1, 1, "RO", 0, 'h0, 1, 1, 0);
        port3.configure(this, 1, 2, "RO", 0, 'h0, 1, 1, 0);
        port4.configure(this, 1, 3, "RO", 0, 'h0, 1, 1, 0);
        port5.configure(this, 1, 4, "RO", 0, 'h0, 1, 1, 0);
        port6.configure(this, 1, 5, "RO", 0, 'h0, 1, 1, 0);
        port7.configure(this, 1, 6, "RO", 0, 'h0, 1, 1, 0);
        port8.configure(this, 1, 7, "RO", 0, 'h0, 1, 1, 0);
        port9.configure(this, 1, 8, "RO", 0, 'h0, 1, 1, 0);
        port10.configure(this, 1, 9, "RO", 0, 'h0, 1, 1, 0);
        port11.configure(this, 1, 10, "RO", 0, 'h0, 1, 1, 0);
        port12.configure(this, 1, 11, "RO", 0, 'h0, 1, 1, 0);
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
                cg = acd_seq_checker_reg_preact_error_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = acd_seq_checker_reg_preact_error_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, port1.get_name, port1.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port2.get_name, port2.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port3.get_name, port3.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port4.get_name, port4.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port5.get_name, port5.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port6.get_name, port6.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port7.get_name, port7.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port8.get_name, port8.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port9.get_name, port9.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port10.get_name, port10.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port11.get_name, port11.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port12.get_name, port12.value);
        return s;
    endfunction

endclass


// Class: acd_seq_checker_reg_preact_error_reg_cover
// Register coverage object.
class acd_seq_checker_reg_preact_error_reg_cover extends uvm_object;

    static local acd_seq_checker_reg_preact_error_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    acd_seq_checker_reg_preact_error_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        port1_wr: coverpoint r.port1.value iff (!is_read);
        port1_rd: coverpoint r.port1.value iff  (is_read);
        port2_wr: coverpoint r.port2.value iff (!is_read);
        port2_rd: coverpoint r.port2.value iff  (is_read);
        port3_wr: coverpoint r.port3.value iff (!is_read);
        port3_rd: coverpoint r.port3.value iff  (is_read);
        port4_wr: coverpoint r.port4.value iff (!is_read);
        port4_rd: coverpoint r.port4.value iff  (is_read);
        port5_wr: coverpoint r.port5.value iff (!is_read);
        port5_rd: coverpoint r.port5.value iff  (is_read);
        port6_wr: coverpoint r.port6.value iff (!is_read);
        port6_rd: coverpoint r.port6.value iff  (is_read);
        port7_wr: coverpoint r.port7.value iff (!is_read);
        port7_rd: coverpoint r.port7.value iff  (is_read);
        port8_wr: coverpoint r.port8.value iff (!is_read);
        port8_rd: coverpoint r.port8.value iff  (is_read);
        port9_wr: coverpoint r.port9.value iff (!is_read);
        port9_rd: coverpoint r.port9.value iff  (is_read);
        port10_wr: coverpoint r.port10.value iff (!is_read);
        port10_rd: coverpoint r.port10.value iff  (is_read);
        port11_wr: coverpoint r.port11.value iff (!is_read);
        port11_rd: coverpoint r.port11.value iff  (is_read);
        port12_wr: coverpoint r.port12.value iff (!is_read);
        port12_rd: coverpoint r.port12.value iff  (is_read);
    endgroup

    `uvm_object_utils(acd_seq_checker_reg_reg_pkg::acd_seq_checker_reg_preact_error_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="acd_seq_checker_reg_preact_error_reg_cover");
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
    static function acd_seq_checker_reg_preact_error_reg_cover get();
        if (m_inst == null) begin
            m_inst = acd_seq_checker_reg_preact_error_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(acd_seq_checker_reg_preact_error_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class acd_seq_checker_reg_tm_error_reg_cover;

// Class: acd_seq_checker_reg_tm_error_reg
// Register acd_seq_checker_reg.tm_error: Sequence checker error at input of the TM
class acd_seq_checker_reg_tm_error_reg extends uvm_reg;

    // Variable: port1
    // Error detected at Port  1
    rand uvm_reg_field port1;
    // Variable: port2
    // Error detected at Port  2
    rand uvm_reg_field port2;
    // Variable: port3
    // Error detected at Port  3
    rand uvm_reg_field port3;
    // Variable: port4
    // Error detected at Port  4
    rand uvm_reg_field port4;
    // Variable: port5
    // Error detected at Port  5
    rand uvm_reg_field port5;
    // Variable: port6
    // Error detected at Port  6
    rand uvm_reg_field port6;
    // Variable: port7
    // Error detected at Port  7
    rand uvm_reg_field port7;
    // Variable: port8
    // Error detected at Port  8
    rand uvm_reg_field port8;
    // Variable: port9
    // Error detected at Port  9
    rand uvm_reg_field port9;
    // Variable: port10
    // Error detected at Port 10
    rand uvm_reg_field port10;
    // Variable: port11
    // Error detected at Port 11
    rand uvm_reg_field port11;
    // Variable: port12
    // Error detected at Port 12
    rand uvm_reg_field port12;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static acd_seq_checker_reg_tm_error_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    acd_seq_checker_reg_tm_error_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(acd_seq_checker_reg_reg_pkg::acd_seq_checker_reg_tm_error_reg)

    // Constructor: new
    function new(string name = "acd_seq_checker_reg_tm_error");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        port1 = uvm_reg_field::type_id::create("port1", , get_full_name());
        port2 = uvm_reg_field::type_id::create("port2", , get_full_name());
        port3 = uvm_reg_field::type_id::create("port3", , get_full_name());
        port4 = uvm_reg_field::type_id::create("port4", , get_full_name());
        port5 = uvm_reg_field::type_id::create("port5", , get_full_name());
        port6 = uvm_reg_field::type_id::create("port6", , get_full_name());
        port7 = uvm_reg_field::type_id::create("port7", , get_full_name());
        port8 = uvm_reg_field::type_id::create("port8", , get_full_name());
        port9 = uvm_reg_field::type_id::create("port9", , get_full_name());
        port10 = uvm_reg_field::type_id::create("port10", , get_full_name());
        port11 = uvm_reg_field::type_id::create("port11", , get_full_name());
        port12 = uvm_reg_field::type_id::create("port12", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        port1.configure(this, 1, 0, "RO", 0, 'h0, 1, 1, 0);
        port2.configure(this, 1, 1, "RO", 0, 'h0, 1, 1, 0);
        port3.configure(this, 1, 2, "RO", 0, 'h0, 1, 1, 0);
        port4.configure(this, 1, 3, "RO", 0, 'h0, 1, 1, 0);
        port5.configure(this, 1, 4, "RO", 0, 'h0, 1, 1, 0);
        port6.configure(this, 1, 5, "RO", 0, 'h0, 1, 1, 0);
        port7.configure(this, 1, 6, "RO", 0, 'h0, 1, 1, 0);
        port8.configure(this, 1, 7, "RO", 0, 'h0, 1, 1, 0);
        port9.configure(this, 1, 8, "RO", 0, 'h0, 1, 1, 0);
        port10.configure(this, 1, 9, "RO", 0, 'h0, 1, 1, 0);
        port11.configure(this, 1, 10, "RO", 0, 'h0, 1, 1, 0);
        port12.configure(this, 1, 11, "RO", 0, 'h0, 1, 1, 0);
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
                cg = acd_seq_checker_reg_tm_error_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = acd_seq_checker_reg_tm_error_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, port1.get_name, port1.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port2.get_name, port2.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port3.get_name, port3.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port4.get_name, port4.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port5.get_name, port5.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port6.get_name, port6.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port7.get_name, port7.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port8.get_name, port8.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port9.get_name, port9.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port10.get_name, port10.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port11.get_name, port11.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port12.get_name, port12.value);
        return s;
    endfunction

endclass


// Class: acd_seq_checker_reg_tm_error_reg_cover
// Register coverage object.
class acd_seq_checker_reg_tm_error_reg_cover extends uvm_object;

    static local acd_seq_checker_reg_tm_error_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    acd_seq_checker_reg_tm_error_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        port1_wr: coverpoint r.port1.value iff (!is_read);
        port1_rd: coverpoint r.port1.value iff  (is_read);
        port2_wr: coverpoint r.port2.value iff (!is_read);
        port2_rd: coverpoint r.port2.value iff  (is_read);
        port3_wr: coverpoint r.port3.value iff (!is_read);
        port3_rd: coverpoint r.port3.value iff  (is_read);
        port4_wr: coverpoint r.port4.value iff (!is_read);
        port4_rd: coverpoint r.port4.value iff  (is_read);
        port5_wr: coverpoint r.port5.value iff (!is_read);
        port5_rd: coverpoint r.port5.value iff  (is_read);
        port6_wr: coverpoint r.port6.value iff (!is_read);
        port6_rd: coverpoint r.port6.value iff  (is_read);
        port7_wr: coverpoint r.port7.value iff (!is_read);
        port7_rd: coverpoint r.port7.value iff  (is_read);
        port8_wr: coverpoint r.port8.value iff (!is_read);
        port8_rd: coverpoint r.port8.value iff  (is_read);
        port9_wr: coverpoint r.port9.value iff (!is_read);
        port9_rd: coverpoint r.port9.value iff  (is_read);
        port10_wr: coverpoint r.port10.value iff (!is_read);
        port10_rd: coverpoint r.port10.value iff  (is_read);
        port11_wr: coverpoint r.port11.value iff (!is_read);
        port11_rd: coverpoint r.port11.value iff  (is_read);
        port12_wr: coverpoint r.port12.value iff (!is_read);
        port12_rd: coverpoint r.port12.value iff  (is_read);
    endgroup

    `uvm_object_utils(acd_seq_checker_reg_reg_pkg::acd_seq_checker_reg_tm_error_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="acd_seq_checker_reg_tm_error_reg_cover");
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
    static function acd_seq_checker_reg_tm_error_reg_cover get();
        if (m_inst == null) begin
            m_inst = acd_seq_checker_reg_tm_error_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(acd_seq_checker_reg_tm_error_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class acd_seq_checker_reg_input_activity_reg_cover;

// Class: acd_seq_checker_reg_input_activity_reg
// Register acd_seq_checker_reg.input_activity: Sequence checker activity at input of the input section
class acd_seq_checker_reg_input_activity_reg extends uvm_reg;

    // Variable: port1
    // Activity detected at Port  1
    rand uvm_reg_field port1;
    // Variable: port2
    // Activity detected at Port  2
    rand uvm_reg_field port2;
    // Variable: port3
    // Activity detected at Port  3
    rand uvm_reg_field port3;
    // Variable: port4
    // Activity detected at Port  4
    rand uvm_reg_field port4;
    // Variable: port5
    // Activity detected at Port  5
    rand uvm_reg_field port5;
    // Variable: port6
    // Activity detected at Port  6
    rand uvm_reg_field port6;
    // Variable: port7
    // Activity detected at Port  7
    rand uvm_reg_field port7;
    // Variable: port8
    // Activity detected at Port  8
    rand uvm_reg_field port8;
    // Variable: port9
    // Activity detected at Port  9
    rand uvm_reg_field port9;
    // Variable: port10
    // Activity detected at Port 10
    rand uvm_reg_field port10;
    // Variable: port11
    // Activity detected at Port 11
    rand uvm_reg_field port11;
    // Variable: port12
    // Activity detected at Port 12
    rand uvm_reg_field port12;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static acd_seq_checker_reg_input_activity_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    acd_seq_checker_reg_input_activity_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(acd_seq_checker_reg_reg_pkg::acd_seq_checker_reg_input_activity_reg)

    // Constructor: new
    function new(string name = "acd_seq_checker_reg_input_activity");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        port1 = uvm_reg_field::type_id::create("port1", , get_full_name());
        port2 = uvm_reg_field::type_id::create("port2", , get_full_name());
        port3 = uvm_reg_field::type_id::create("port3", , get_full_name());
        port4 = uvm_reg_field::type_id::create("port4", , get_full_name());
        port5 = uvm_reg_field::type_id::create("port5", , get_full_name());
        port6 = uvm_reg_field::type_id::create("port6", , get_full_name());
        port7 = uvm_reg_field::type_id::create("port7", , get_full_name());
        port8 = uvm_reg_field::type_id::create("port8", , get_full_name());
        port9 = uvm_reg_field::type_id::create("port9", , get_full_name());
        port10 = uvm_reg_field::type_id::create("port10", , get_full_name());
        port11 = uvm_reg_field::type_id::create("port11", , get_full_name());
        port12 = uvm_reg_field::type_id::create("port12", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        port1.configure(this, 1, 0, "RO", 0, 'h0, 1, 1, 0);
        port2.configure(this, 1, 1, "RO", 0, 'h0, 1, 1, 0);
        port3.configure(this, 1, 2, "RO", 0, 'h0, 1, 1, 0);
        port4.configure(this, 1, 3, "RO", 0, 'h0, 1, 1, 0);
        port5.configure(this, 1, 4, "RO", 0, 'h0, 1, 1, 0);
        port6.configure(this, 1, 5, "RO", 0, 'h0, 1, 1, 0);
        port7.configure(this, 1, 6, "RO", 0, 'h0, 1, 1, 0);
        port8.configure(this, 1, 7, "RO", 0, 'h0, 1, 1, 0);
        port9.configure(this, 1, 8, "RO", 0, 'h0, 1, 1, 0);
        port10.configure(this, 1, 9, "RO", 0, 'h0, 1, 1, 0);
        port11.configure(this, 1, 10, "RO", 0, 'h0, 1, 1, 0);
        port12.configure(this, 1, 11, "RO", 0, 'h0, 1, 1, 0);
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
                cg = acd_seq_checker_reg_input_activity_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = acd_seq_checker_reg_input_activity_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, port1.get_name, port1.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port2.get_name, port2.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port3.get_name, port3.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port4.get_name, port4.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port5.get_name, port5.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port6.get_name, port6.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port7.get_name, port7.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port8.get_name, port8.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port9.get_name, port9.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port10.get_name, port10.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port11.get_name, port11.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port12.get_name, port12.value);
        return s;
    endfunction

endclass


// Class: acd_seq_checker_reg_input_activity_reg_cover
// Register coverage object.
class acd_seq_checker_reg_input_activity_reg_cover extends uvm_object;

    static local acd_seq_checker_reg_input_activity_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    acd_seq_checker_reg_input_activity_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        port1_wr: coverpoint r.port1.value iff (!is_read);
        port1_rd: coverpoint r.port1.value iff  (is_read);
        port2_wr: coverpoint r.port2.value iff (!is_read);
        port2_rd: coverpoint r.port2.value iff  (is_read);
        port3_wr: coverpoint r.port3.value iff (!is_read);
        port3_rd: coverpoint r.port3.value iff  (is_read);
        port4_wr: coverpoint r.port4.value iff (!is_read);
        port4_rd: coverpoint r.port4.value iff  (is_read);
        port5_wr: coverpoint r.port5.value iff (!is_read);
        port5_rd: coverpoint r.port5.value iff  (is_read);
        port6_wr: coverpoint r.port6.value iff (!is_read);
        port6_rd: coverpoint r.port6.value iff  (is_read);
        port7_wr: coverpoint r.port7.value iff (!is_read);
        port7_rd: coverpoint r.port7.value iff  (is_read);
        port8_wr: coverpoint r.port8.value iff (!is_read);
        port8_rd: coverpoint r.port8.value iff  (is_read);
        port9_wr: coverpoint r.port9.value iff (!is_read);
        port9_rd: coverpoint r.port9.value iff  (is_read);
        port10_wr: coverpoint r.port10.value iff (!is_read);
        port10_rd: coverpoint r.port10.value iff  (is_read);
        port11_wr: coverpoint r.port11.value iff (!is_read);
        port11_rd: coverpoint r.port11.value iff  (is_read);
        port12_wr: coverpoint r.port12.value iff (!is_read);
        port12_rd: coverpoint r.port12.value iff  (is_read);
    endgroup

    `uvm_object_utils(acd_seq_checker_reg_reg_pkg::acd_seq_checker_reg_input_activity_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="acd_seq_checker_reg_input_activity_reg_cover");
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
    static function acd_seq_checker_reg_input_activity_reg_cover get();
        if (m_inst == null) begin
            m_inst = acd_seq_checker_reg_input_activity_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(acd_seq_checker_reg_input_activity_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class acd_seq_checker_reg_preact_activity_reg_cover;

// Class: acd_seq_checker_reg_preact_activity_reg
// Register acd_seq_checker_reg.preact_activity: Sequence checker activity for pre action input section
class acd_seq_checker_reg_preact_activity_reg extends uvm_reg;

    // Variable: port1
    // Activity detected at Port  1
    rand uvm_reg_field port1;
    // Variable: port2
    // Activity detected at Port  2
    rand uvm_reg_field port2;
    // Variable: port3
    // Activity detected at Port  3
    rand uvm_reg_field port3;
    // Variable: port4
    // Activity detected at Port  4
    rand uvm_reg_field port4;
    // Variable: port5
    // Activity detected at Port  5
    rand uvm_reg_field port5;
    // Variable: port6
    // Activity detected at Port  6
    rand uvm_reg_field port6;
    // Variable: port7
    // Activity detected at Port  7
    rand uvm_reg_field port7;
    // Variable: port8
    // Activity detected at Port  8
    rand uvm_reg_field port8;
    // Variable: port9
    // Activity detected at Port  9
    rand uvm_reg_field port9;
    // Variable: port10
    // Activity detected at Port 10
    rand uvm_reg_field port10;
    // Variable: port11
    // Activity detected at Port 11
    rand uvm_reg_field port11;
    // Variable: port12
    // Activity detected at Port 12
    rand uvm_reg_field port12;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static acd_seq_checker_reg_preact_activity_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    acd_seq_checker_reg_preact_activity_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(acd_seq_checker_reg_reg_pkg::acd_seq_checker_reg_preact_activity_reg)

    // Constructor: new
    function new(string name = "acd_seq_checker_reg_preact_activity");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        port1 = uvm_reg_field::type_id::create("port1", , get_full_name());
        port2 = uvm_reg_field::type_id::create("port2", , get_full_name());
        port3 = uvm_reg_field::type_id::create("port3", , get_full_name());
        port4 = uvm_reg_field::type_id::create("port4", , get_full_name());
        port5 = uvm_reg_field::type_id::create("port5", , get_full_name());
        port6 = uvm_reg_field::type_id::create("port6", , get_full_name());
        port7 = uvm_reg_field::type_id::create("port7", , get_full_name());
        port8 = uvm_reg_field::type_id::create("port8", , get_full_name());
        port9 = uvm_reg_field::type_id::create("port9", , get_full_name());
        port10 = uvm_reg_field::type_id::create("port10", , get_full_name());
        port11 = uvm_reg_field::type_id::create("port11", , get_full_name());
        port12 = uvm_reg_field::type_id::create("port12", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        port1.configure(this, 1, 0, "RO", 0, 'h0, 1, 1, 0);
        port2.configure(this, 1, 1, "RO", 0, 'h0, 1, 1, 0);
        port3.configure(this, 1, 2, "RO", 0, 'h0, 1, 1, 0);
        port4.configure(this, 1, 3, "RO", 0, 'h0, 1, 1, 0);
        port5.configure(this, 1, 4, "RO", 0, 'h0, 1, 1, 0);
        port6.configure(this, 1, 5, "RO", 0, 'h0, 1, 1, 0);
        port7.configure(this, 1, 6, "RO", 0, 'h0, 1, 1, 0);
        port8.configure(this, 1, 7, "RO", 0, 'h0, 1, 1, 0);
        port9.configure(this, 1, 8, "RO", 0, 'h0, 1, 1, 0);
        port10.configure(this, 1, 9, "RO", 0, 'h0, 1, 1, 0);
        port11.configure(this, 1, 10, "RO", 0, 'h0, 1, 1, 0);
        port12.configure(this, 1, 11, "RO", 0, 'h0, 1, 1, 0);
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
                cg = acd_seq_checker_reg_preact_activity_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = acd_seq_checker_reg_preact_activity_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, port1.get_name, port1.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port2.get_name, port2.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port3.get_name, port3.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port4.get_name, port4.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port5.get_name, port5.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port6.get_name, port6.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port7.get_name, port7.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port8.get_name, port8.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port9.get_name, port9.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port10.get_name, port10.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port11.get_name, port11.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port12.get_name, port12.value);
        return s;
    endfunction

endclass


// Class: acd_seq_checker_reg_preact_activity_reg_cover
// Register coverage object.
class acd_seq_checker_reg_preact_activity_reg_cover extends uvm_object;

    static local acd_seq_checker_reg_preact_activity_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    acd_seq_checker_reg_preact_activity_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        port1_wr: coverpoint r.port1.value iff (!is_read);
        port1_rd: coverpoint r.port1.value iff  (is_read);
        port2_wr: coverpoint r.port2.value iff (!is_read);
        port2_rd: coverpoint r.port2.value iff  (is_read);
        port3_wr: coverpoint r.port3.value iff (!is_read);
        port3_rd: coverpoint r.port3.value iff  (is_read);
        port4_wr: coverpoint r.port4.value iff (!is_read);
        port4_rd: coverpoint r.port4.value iff  (is_read);
        port5_wr: coverpoint r.port5.value iff (!is_read);
        port5_rd: coverpoint r.port5.value iff  (is_read);
        port6_wr: coverpoint r.port6.value iff (!is_read);
        port6_rd: coverpoint r.port6.value iff  (is_read);
        port7_wr: coverpoint r.port7.value iff (!is_read);
        port7_rd: coverpoint r.port7.value iff  (is_read);
        port8_wr: coverpoint r.port8.value iff (!is_read);
        port8_rd: coverpoint r.port8.value iff  (is_read);
        port9_wr: coverpoint r.port9.value iff (!is_read);
        port9_rd: coverpoint r.port9.value iff  (is_read);
        port10_wr: coverpoint r.port10.value iff (!is_read);
        port10_rd: coverpoint r.port10.value iff  (is_read);
        port11_wr: coverpoint r.port11.value iff (!is_read);
        port11_rd: coverpoint r.port11.value iff  (is_read);
        port12_wr: coverpoint r.port12.value iff (!is_read);
        port12_rd: coverpoint r.port12.value iff  (is_read);
    endgroup

    `uvm_object_utils(acd_seq_checker_reg_reg_pkg::acd_seq_checker_reg_preact_activity_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="acd_seq_checker_reg_preact_activity_reg_cover");
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
    static function acd_seq_checker_reg_preact_activity_reg_cover get();
        if (m_inst == null) begin
            m_inst = acd_seq_checker_reg_preact_activity_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(acd_seq_checker_reg_preact_activity_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class acd_seq_checker_reg_tm_activity_reg_cover;

// Class: acd_seq_checker_reg_tm_activity_reg
// Register acd_seq_checker_reg.tm_activity: Sequence checker activity at input of the TM
class acd_seq_checker_reg_tm_activity_reg extends uvm_reg;

    // Variable: port1
    // Activity detected at Port  1
    rand uvm_reg_field port1;
    // Variable: port2
    // Activity detected at Port  2
    rand uvm_reg_field port2;
    // Variable: port3
    // Activity detected at Port  3
    rand uvm_reg_field port3;
    // Variable: port4
    // Activity detected at Port  4
    rand uvm_reg_field port4;
    // Variable: port5
    // Activity detected at Port  5
    rand uvm_reg_field port5;
    // Variable: port6
    // Activity detected at Port  6
    rand uvm_reg_field port6;
    // Variable: port7
    // Activity detected at Port  7
    rand uvm_reg_field port7;
    // Variable: port8
    // Activity detected at Port  8
    rand uvm_reg_field port8;
    // Variable: port9
    // Activity detected at Port  9
    rand uvm_reg_field port9;
    // Variable: port10
    // Activity detected at Port 10
    rand uvm_reg_field port10;
    // Variable: port11
    // Activity detected at Port 11
    rand uvm_reg_field port11;
    // Variable: port12
    // Activity detected at Port 12
    rand uvm_reg_field port12;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static acd_seq_checker_reg_tm_activity_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    acd_seq_checker_reg_tm_activity_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(acd_seq_checker_reg_reg_pkg::acd_seq_checker_reg_tm_activity_reg)

    // Constructor: new
    function new(string name = "acd_seq_checker_reg_tm_activity");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        port1 = uvm_reg_field::type_id::create("port1", , get_full_name());
        port2 = uvm_reg_field::type_id::create("port2", , get_full_name());
        port3 = uvm_reg_field::type_id::create("port3", , get_full_name());
        port4 = uvm_reg_field::type_id::create("port4", , get_full_name());
        port5 = uvm_reg_field::type_id::create("port5", , get_full_name());
        port6 = uvm_reg_field::type_id::create("port6", , get_full_name());
        port7 = uvm_reg_field::type_id::create("port7", , get_full_name());
        port8 = uvm_reg_field::type_id::create("port8", , get_full_name());
        port9 = uvm_reg_field::type_id::create("port9", , get_full_name());
        port10 = uvm_reg_field::type_id::create("port10", , get_full_name());
        port11 = uvm_reg_field::type_id::create("port11", , get_full_name());
        port12 = uvm_reg_field::type_id::create("port12", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        port1.configure(this, 1, 0, "RO", 0, 'h0, 1, 1, 0);
        port2.configure(this, 1, 1, "RO", 0, 'h0, 1, 1, 0);
        port3.configure(this, 1, 2, "RO", 0, 'h0, 1, 1, 0);
        port4.configure(this, 1, 3, "RO", 0, 'h0, 1, 1, 0);
        port5.configure(this, 1, 4, "RO", 0, 'h0, 1, 1, 0);
        port6.configure(this, 1, 5, "RO", 0, 'h0, 1, 1, 0);
        port7.configure(this, 1, 6, "RO", 0, 'h0, 1, 1, 0);
        port8.configure(this, 1, 7, "RO", 0, 'h0, 1, 1, 0);
        port9.configure(this, 1, 8, "RO", 0, 'h0, 1, 1, 0);
        port10.configure(this, 1, 9, "RO", 0, 'h0, 1, 1, 0);
        port11.configure(this, 1, 10, "RO", 0, 'h0, 1, 1, 0);
        port12.configure(this, 1, 11, "RO", 0, 'h0, 1, 1, 0);
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
                cg = acd_seq_checker_reg_tm_activity_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = acd_seq_checker_reg_tm_activity_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, port1.get_name, port1.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port2.get_name, port2.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port3.get_name, port3.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port4.get_name, port4.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port5.get_name, port5.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port6.get_name, port6.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port7.get_name, port7.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port8.get_name, port8.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port9.get_name, port9.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port10.get_name, port10.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port11.get_name, port11.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port12.get_name, port12.value);
        return s;
    endfunction

endclass


// Class: acd_seq_checker_reg_tm_activity_reg_cover
// Register coverage object.
class acd_seq_checker_reg_tm_activity_reg_cover extends uvm_object;

    static local acd_seq_checker_reg_tm_activity_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    acd_seq_checker_reg_tm_activity_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        port1_wr: coverpoint r.port1.value iff (!is_read);
        port1_rd: coverpoint r.port1.value iff  (is_read);
        port2_wr: coverpoint r.port2.value iff (!is_read);
        port2_rd: coverpoint r.port2.value iff  (is_read);
        port3_wr: coverpoint r.port3.value iff (!is_read);
        port3_rd: coverpoint r.port3.value iff  (is_read);
        port4_wr: coverpoint r.port4.value iff (!is_read);
        port4_rd: coverpoint r.port4.value iff  (is_read);
        port5_wr: coverpoint r.port5.value iff (!is_read);
        port5_rd: coverpoint r.port5.value iff  (is_read);
        port6_wr: coverpoint r.port6.value iff (!is_read);
        port6_rd: coverpoint r.port6.value iff  (is_read);
        port7_wr: coverpoint r.port7.value iff (!is_read);
        port7_rd: coverpoint r.port7.value iff  (is_read);
        port8_wr: coverpoint r.port8.value iff (!is_read);
        port8_rd: coverpoint r.port8.value iff  (is_read);
        port9_wr: coverpoint r.port9.value iff (!is_read);
        port9_rd: coverpoint r.port9.value iff  (is_read);
        port10_wr: coverpoint r.port10.value iff (!is_read);
        port10_rd: coverpoint r.port10.value iff  (is_read);
        port11_wr: coverpoint r.port11.value iff (!is_read);
        port11_rd: coverpoint r.port11.value iff  (is_read);
        port12_wr: coverpoint r.port12.value iff (!is_read);
        port12_rd: coverpoint r.port12.value iff  (is_read);
    endgroup

    `uvm_object_utils(acd_seq_checker_reg_reg_pkg::acd_seq_checker_reg_tm_activity_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="acd_seq_checker_reg_tm_activity_reg_cover");
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
    static function acd_seq_checker_reg_tm_activity_reg_cover get();
        if (m_inst == null) begin
            m_inst = acd_seq_checker_reg_tm_activity_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(acd_seq_checker_reg_tm_activity_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class acd_seq_checker_reg_input_error_code0_reg_cover;

// Class: acd_seq_checker_reg_input_error_code0_reg
// Register acd_seq_checker_reg.input_error_code0: Sequence checker error code at input of the input section
class acd_seq_checker_reg_input_error_code0_reg extends uvm_reg;

    // Variable: port1
    // Error code for Port 1
    rand uvm_reg_field port1;
    // Variable: port2
    // Error code for Port 2
    rand uvm_reg_field port2;
    // Variable: port3
    // Error code for Port 3
    rand uvm_reg_field port3;
    // Variable: port4
    // Error code for Port 4
    rand uvm_reg_field port4;
    // Variable: port5
    // Error code for Port 5
    rand uvm_reg_field port5;
    // Variable: port6
    // Error code for Port 6
    rand uvm_reg_field port6;
    // Variable: port7
    // Error code for Port 7
    rand uvm_reg_field port7;
    // Variable: port8
    // Error code for Port 8
    rand uvm_reg_field port8;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static acd_seq_checker_reg_input_error_code0_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    acd_seq_checker_reg_input_error_code0_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(acd_seq_checker_reg_reg_pkg::acd_seq_checker_reg_input_error_code0_reg)

    // Constructor: new
    function new(string name = "acd_seq_checker_reg_input_error_code0");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        port1 = uvm_reg_field::type_id::create("port1", , get_full_name());
        port2 = uvm_reg_field::type_id::create("port2", , get_full_name());
        port3 = uvm_reg_field::type_id::create("port3", , get_full_name());
        port4 = uvm_reg_field::type_id::create("port4", , get_full_name());
        port5 = uvm_reg_field::type_id::create("port5", , get_full_name());
        port6 = uvm_reg_field::type_id::create("port6", , get_full_name());
        port7 = uvm_reg_field::type_id::create("port7", , get_full_name());
        port8 = uvm_reg_field::type_id::create("port8", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        port1.configure(this, 8, 0, "RO", 0, 'h0, 1, 1, 0);
        port2.configure(this, 8, 8, "RO", 0, 'h0, 1, 1, 0);
        port3.configure(this, 8, 16, "RO", 0, 'h0, 1, 1, 0);
        port4.configure(this, 8, 24, "RO", 0, 'h0, 1, 1, 0);
        port5.configure(this, 8, 32, "RO", 0, 'h0, 1, 1, 0);
        port6.configure(this, 8, 40, "RO", 0, 'h0, 1, 1, 0);
        port7.configure(this, 8, 48, "RO", 0, 'h0, 1, 1, 0);
        port8.configure(this, 8, 56, "RO", 0, 'h0, 1, 1, 0);
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
                cg = acd_seq_checker_reg_input_error_code0_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = acd_seq_checker_reg_input_error_code0_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, port1.get_name, port1.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port2.get_name, port2.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port3.get_name, port3.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port4.get_name, port4.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port5.get_name, port5.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port6.get_name, port6.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port7.get_name, port7.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port8.get_name, port8.value);
        return s;
    endfunction

endclass


// Class: acd_seq_checker_reg_input_error_code0_reg_cover
// Register coverage object.
class acd_seq_checker_reg_input_error_code0_reg_cover extends uvm_object;

    static local acd_seq_checker_reg_input_error_code0_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    acd_seq_checker_reg_input_error_code0_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        port1_wr: coverpoint r.port1.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        port1_rd: coverpoint r.port1.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        port2_wr: coverpoint r.port2.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        port2_rd: coverpoint r.port2.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        port3_wr: coverpoint r.port3.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        port3_rd: coverpoint r.port3.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        port4_wr: coverpoint r.port4.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        port4_rd: coverpoint r.port4.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        port5_wr: coverpoint r.port5.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        port5_rd: coverpoint r.port5.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        port6_wr: coverpoint r.port6.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        port6_rd: coverpoint r.port6.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        port7_wr: coverpoint r.port7.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        port7_rd: coverpoint r.port7.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        port8_wr: coverpoint r.port8.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        port8_rd: coverpoint r.port8.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(acd_seq_checker_reg_reg_pkg::acd_seq_checker_reg_input_error_code0_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="acd_seq_checker_reg_input_error_code0_reg_cover");
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
    static function acd_seq_checker_reg_input_error_code0_reg_cover get();
        if (m_inst == null) begin
            m_inst = acd_seq_checker_reg_input_error_code0_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(acd_seq_checker_reg_input_error_code0_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class acd_seq_checker_reg_input_error_code1_reg_cover;

// Class: acd_seq_checker_reg_input_error_code1_reg
// Register acd_seq_checker_reg.input_error_code1: Sequence checker error code for input
class acd_seq_checker_reg_input_error_code1_reg extends uvm_reg;

    // Variable: port9
    // Error code for Port  9
    rand uvm_reg_field port9;
    // Variable: port10
    // Error code for Port 10
    rand uvm_reg_field port10;
    // Variable: port11
    // Error code for Port 11
    rand uvm_reg_field port11;
    // Variable: port12
    // Error code for Port 12
    rand uvm_reg_field port12;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static acd_seq_checker_reg_input_error_code1_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    acd_seq_checker_reg_input_error_code1_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(acd_seq_checker_reg_reg_pkg::acd_seq_checker_reg_input_error_code1_reg)

    // Constructor: new
    function new(string name = "acd_seq_checker_reg_input_error_code1");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        port9 = uvm_reg_field::type_id::create("port9", , get_full_name());
        port10 = uvm_reg_field::type_id::create("port10", , get_full_name());
        port11 = uvm_reg_field::type_id::create("port11", , get_full_name());
        port12 = uvm_reg_field::type_id::create("port12", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        port9.configure(this, 8, 0, "RO", 0, 'h0, 1, 1, 0);
        port10.configure(this, 8, 8, "RO", 0, 'h0, 1, 1, 0);
        port11.configure(this, 8, 16, "RO", 0, 'h0, 1, 1, 0);
        port12.configure(this, 8, 24, "RO", 0, 'h0, 1, 1, 0);
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
                cg = acd_seq_checker_reg_input_error_code1_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = acd_seq_checker_reg_input_error_code1_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, port9.get_name, port9.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port10.get_name, port10.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port11.get_name, port11.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port12.get_name, port12.value);
        return s;
    endfunction

endclass


// Class: acd_seq_checker_reg_input_error_code1_reg_cover
// Register coverage object.
class acd_seq_checker_reg_input_error_code1_reg_cover extends uvm_object;

    static local acd_seq_checker_reg_input_error_code1_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    acd_seq_checker_reg_input_error_code1_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        port9_wr: coverpoint r.port9.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        port9_rd: coverpoint r.port9.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        port10_wr: coverpoint r.port10.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        port10_rd: coverpoint r.port10.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        port11_wr: coverpoint r.port11.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        port11_rd: coverpoint r.port11.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        port12_wr: coverpoint r.port12.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        port12_rd: coverpoint r.port12.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(acd_seq_checker_reg_reg_pkg::acd_seq_checker_reg_input_error_code1_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="acd_seq_checker_reg_input_error_code1_reg_cover");
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
    static function acd_seq_checker_reg_input_error_code1_reg_cover get();
        if (m_inst == null) begin
            m_inst = acd_seq_checker_reg_input_error_code1_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(acd_seq_checker_reg_input_error_code1_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class acd_seq_checker_reg_preact_error_code0_reg_cover;

// Class: acd_seq_checker_reg_preact_error_code0_reg
// Register acd_seq_checker_reg.preact_error_code0: Sequence checker error code for preact
class acd_seq_checker_reg_preact_error_code0_reg extends uvm_reg;

    // Variable: port1
    // Error code for Port 1
    rand uvm_reg_field port1;
    // Variable: port2
    // Error code for Port 2
    rand uvm_reg_field port2;
    // Variable: port3
    // Error code for Port 3
    rand uvm_reg_field port3;
    // Variable: port4
    // Error code for Port 4
    rand uvm_reg_field port4;
    // Variable: port5
    // Error code for Port 5
    rand uvm_reg_field port5;
    // Variable: port6
    // Error code for Port 6
    rand uvm_reg_field port6;
    // Variable: port7
    // Error code for Port 7
    rand uvm_reg_field port7;
    // Variable: port8
    // Error code for Port 8
    rand uvm_reg_field port8;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static acd_seq_checker_reg_preact_error_code0_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    acd_seq_checker_reg_preact_error_code0_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(acd_seq_checker_reg_reg_pkg::acd_seq_checker_reg_preact_error_code0_reg)

    // Constructor: new
    function new(string name = "acd_seq_checker_reg_preact_error_code0");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        port1 = uvm_reg_field::type_id::create("port1", , get_full_name());
        port2 = uvm_reg_field::type_id::create("port2", , get_full_name());
        port3 = uvm_reg_field::type_id::create("port3", , get_full_name());
        port4 = uvm_reg_field::type_id::create("port4", , get_full_name());
        port5 = uvm_reg_field::type_id::create("port5", , get_full_name());
        port6 = uvm_reg_field::type_id::create("port6", , get_full_name());
        port7 = uvm_reg_field::type_id::create("port7", , get_full_name());
        port8 = uvm_reg_field::type_id::create("port8", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        port1.configure(this, 8, 0, "RO", 0, 'h0, 1, 1, 0);
        port2.configure(this, 8, 8, "RO", 0, 'h0, 1, 1, 0);
        port3.configure(this, 8, 16, "RO", 0, 'h0, 1, 1, 0);
        port4.configure(this, 8, 24, "RO", 0, 'h0, 1, 1, 0);
        port5.configure(this, 8, 32, "RO", 0, 'h0, 1, 1, 0);
        port6.configure(this, 8, 40, "RO", 0, 'h0, 1, 1, 0);
        port7.configure(this, 8, 48, "RO", 0, 'h0, 1, 1, 0);
        port8.configure(this, 8, 56, "RO", 0, 'h0, 1, 1, 0);
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
                cg = acd_seq_checker_reg_preact_error_code0_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = acd_seq_checker_reg_preact_error_code0_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, port1.get_name, port1.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port2.get_name, port2.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port3.get_name, port3.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port4.get_name, port4.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port5.get_name, port5.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port6.get_name, port6.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port7.get_name, port7.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port8.get_name, port8.value);
        return s;
    endfunction

endclass


// Class: acd_seq_checker_reg_preact_error_code0_reg_cover
// Register coverage object.
class acd_seq_checker_reg_preact_error_code0_reg_cover extends uvm_object;

    static local acd_seq_checker_reg_preact_error_code0_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    acd_seq_checker_reg_preact_error_code0_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        port1_wr: coverpoint r.port1.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        port1_rd: coverpoint r.port1.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        port2_wr: coverpoint r.port2.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        port2_rd: coverpoint r.port2.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        port3_wr: coverpoint r.port3.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        port3_rd: coverpoint r.port3.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        port4_wr: coverpoint r.port4.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        port4_rd: coverpoint r.port4.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        port5_wr: coverpoint r.port5.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        port5_rd: coverpoint r.port5.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        port6_wr: coverpoint r.port6.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        port6_rd: coverpoint r.port6.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        port7_wr: coverpoint r.port7.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        port7_rd: coverpoint r.port7.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        port8_wr: coverpoint r.port8.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        port8_rd: coverpoint r.port8.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(acd_seq_checker_reg_reg_pkg::acd_seq_checker_reg_preact_error_code0_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="acd_seq_checker_reg_preact_error_code0_reg_cover");
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
    static function acd_seq_checker_reg_preact_error_code0_reg_cover get();
        if (m_inst == null) begin
            m_inst = acd_seq_checker_reg_preact_error_code0_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(acd_seq_checker_reg_preact_error_code0_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class acd_seq_checker_reg_preact_error_code1_reg_cover;

// Class: acd_seq_checker_reg_preact_error_code1_reg
// Register acd_seq_checker_reg.preact_error_code1: Sequence checker error code for preact
class acd_seq_checker_reg_preact_error_code1_reg extends uvm_reg;

    // Variable: port9
    // Error code for Port 9
    rand uvm_reg_field port9;
    // Variable: port10
    // Error code for Port 10
    rand uvm_reg_field port10;
    // Variable: port11
    // Error code for Port 11
    rand uvm_reg_field port11;
    // Variable: port12
    // Error code for Port 12
    rand uvm_reg_field port12;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static acd_seq_checker_reg_preact_error_code1_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    acd_seq_checker_reg_preact_error_code1_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(acd_seq_checker_reg_reg_pkg::acd_seq_checker_reg_preact_error_code1_reg)

    // Constructor: new
    function new(string name = "acd_seq_checker_reg_preact_error_code1");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        port9 = uvm_reg_field::type_id::create("port9", , get_full_name());
        port10 = uvm_reg_field::type_id::create("port10", , get_full_name());
        port11 = uvm_reg_field::type_id::create("port11", , get_full_name());
        port12 = uvm_reg_field::type_id::create("port12", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        port9.configure(this, 8, 0, "RO", 0, 'h0, 1, 1, 0);
        port10.configure(this, 8, 8, "RO", 0, 'h0, 1, 1, 0);
        port11.configure(this, 8, 16, "RO", 0, 'h0, 1, 1, 0);
        port12.configure(this, 8, 24, "RO", 0, 'h0, 1, 1, 0);
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
                cg = acd_seq_checker_reg_preact_error_code1_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = acd_seq_checker_reg_preact_error_code1_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, port9.get_name, port9.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port10.get_name, port10.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port11.get_name, port11.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port12.get_name, port12.value);
        return s;
    endfunction

endclass


// Class: acd_seq_checker_reg_preact_error_code1_reg_cover
// Register coverage object.
class acd_seq_checker_reg_preact_error_code1_reg_cover extends uvm_object;

    static local acd_seq_checker_reg_preact_error_code1_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    acd_seq_checker_reg_preact_error_code1_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        port9_wr: coverpoint r.port9.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        port9_rd: coverpoint r.port9.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        port10_wr: coverpoint r.port10.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        port10_rd: coverpoint r.port10.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        port11_wr: coverpoint r.port11.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        port11_rd: coverpoint r.port11.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        port12_wr: coverpoint r.port12.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        port12_rd: coverpoint r.port12.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(acd_seq_checker_reg_reg_pkg::acd_seq_checker_reg_preact_error_code1_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="acd_seq_checker_reg_preact_error_code1_reg_cover");
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
    static function acd_seq_checker_reg_preact_error_code1_reg_cover get();
        if (m_inst == null) begin
            m_inst = acd_seq_checker_reg_preact_error_code1_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(acd_seq_checker_reg_preact_error_code1_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class acd_seq_checker_reg_tm_error_code0_reg_cover;

// Class: acd_seq_checker_reg_tm_error_code0_reg
// Register acd_seq_checker_reg.tm_error_code0: Sequence checker error code  at input of the TM
class acd_seq_checker_reg_tm_error_code0_reg extends uvm_reg;

    // Variable: port1
    // Error code for Port 1
    rand uvm_reg_field port1;
    // Variable: port2
    // Error code for Port 2
    rand uvm_reg_field port2;
    // Variable: port3
    // Error code for Port 3
    rand uvm_reg_field port3;
    // Variable: port4
    // Error code for Port 4
    rand uvm_reg_field port4;
    // Variable: port5
    // Error code for Port 5
    rand uvm_reg_field port5;
    // Variable: port6
    // Error code for Port 6
    rand uvm_reg_field port6;
    // Variable: port7
    // Error code for Port 7
    rand uvm_reg_field port7;
    // Variable: port8
    // Error code for Port 8
    rand uvm_reg_field port8;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static acd_seq_checker_reg_tm_error_code0_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    acd_seq_checker_reg_tm_error_code0_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(acd_seq_checker_reg_reg_pkg::acd_seq_checker_reg_tm_error_code0_reg)

    // Constructor: new
    function new(string name = "acd_seq_checker_reg_tm_error_code0");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        port1 = uvm_reg_field::type_id::create("port1", , get_full_name());
        port2 = uvm_reg_field::type_id::create("port2", , get_full_name());
        port3 = uvm_reg_field::type_id::create("port3", , get_full_name());
        port4 = uvm_reg_field::type_id::create("port4", , get_full_name());
        port5 = uvm_reg_field::type_id::create("port5", , get_full_name());
        port6 = uvm_reg_field::type_id::create("port6", , get_full_name());
        port7 = uvm_reg_field::type_id::create("port7", , get_full_name());
        port8 = uvm_reg_field::type_id::create("port8", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        port1.configure(this, 8, 0, "RO", 0, 'h0, 1, 1, 0);
        port2.configure(this, 8, 8, "RO", 0, 'h0, 1, 1, 0);
        port3.configure(this, 8, 16, "RO", 0, 'h0, 1, 1, 0);
        port4.configure(this, 8, 24, "RO", 0, 'h0, 1, 1, 0);
        port5.configure(this, 8, 32, "RO", 0, 'h0, 1, 1, 0);
        port6.configure(this, 8, 40, "RO", 0, 'h0, 1, 1, 0);
        port7.configure(this, 8, 48, "RO", 0, 'h0, 1, 1, 0);
        port8.configure(this, 8, 56, "RO", 0, 'h0, 1, 1, 0);
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
                cg = acd_seq_checker_reg_tm_error_code0_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = acd_seq_checker_reg_tm_error_code0_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, port1.get_name, port1.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port2.get_name, port2.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port3.get_name, port3.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port4.get_name, port4.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port5.get_name, port5.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port6.get_name, port6.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port7.get_name, port7.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port8.get_name, port8.value);
        return s;
    endfunction

endclass


// Class: acd_seq_checker_reg_tm_error_code0_reg_cover
// Register coverage object.
class acd_seq_checker_reg_tm_error_code0_reg_cover extends uvm_object;

    static local acd_seq_checker_reg_tm_error_code0_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    acd_seq_checker_reg_tm_error_code0_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        port1_wr: coverpoint r.port1.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        port1_rd: coverpoint r.port1.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        port2_wr: coverpoint r.port2.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        port2_rd: coverpoint r.port2.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        port3_wr: coverpoint r.port3.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        port3_rd: coverpoint r.port3.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        port4_wr: coverpoint r.port4.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        port4_rd: coverpoint r.port4.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        port5_wr: coverpoint r.port5.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        port5_rd: coverpoint r.port5.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        port6_wr: coverpoint r.port6.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        port6_rd: coverpoint r.port6.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        port7_wr: coverpoint r.port7.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        port7_rd: coverpoint r.port7.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        port8_wr: coverpoint r.port8.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        port8_rd: coverpoint r.port8.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(acd_seq_checker_reg_reg_pkg::acd_seq_checker_reg_tm_error_code0_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="acd_seq_checker_reg_tm_error_code0_reg_cover");
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
    static function acd_seq_checker_reg_tm_error_code0_reg_cover get();
        if (m_inst == null) begin
            m_inst = acd_seq_checker_reg_tm_error_code0_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(acd_seq_checker_reg_tm_error_code0_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class acd_seq_checker_reg_tm_error_code1_reg_cover;

// Class: acd_seq_checker_reg_tm_error_code1_reg
// Register acd_seq_checker_reg.tm_error_code1: Sequence checker error code  at input of the TM
class acd_seq_checker_reg_tm_error_code1_reg extends uvm_reg;

    // Variable: port9
    // Error code for Port 9
    rand uvm_reg_field port9;
    // Variable: port10
    // Error code for Port 10
    rand uvm_reg_field port10;
    // Variable: port11
    // Error code for Port 11
    rand uvm_reg_field port11;
    // Variable: port12
    // Error code for Port 12
    rand uvm_reg_field port12;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static acd_seq_checker_reg_tm_error_code1_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    acd_seq_checker_reg_tm_error_code1_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(acd_seq_checker_reg_reg_pkg::acd_seq_checker_reg_tm_error_code1_reg)

    // Constructor: new
    function new(string name = "acd_seq_checker_reg_tm_error_code1");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        port9 = uvm_reg_field::type_id::create("port9", , get_full_name());
        port10 = uvm_reg_field::type_id::create("port10", , get_full_name());
        port11 = uvm_reg_field::type_id::create("port11", , get_full_name());
        port12 = uvm_reg_field::type_id::create("port12", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        port9.configure(this, 8, 0, "RO", 0, 'h0, 1, 1, 0);
        port10.configure(this, 8, 8, "RO", 0, 'h0, 1, 1, 0);
        port11.configure(this, 8, 16, "RO", 0, 'h0, 1, 1, 0);
        port12.configure(this, 8, 24, "RO", 0, 'h0, 1, 1, 0);
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
                cg = acd_seq_checker_reg_tm_error_code1_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = acd_seq_checker_reg_tm_error_code1_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, port9.get_name, port9.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port10.get_name, port10.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port11.get_name, port11.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port12.get_name, port12.value);
        return s;
    endfunction

endclass


// Class: acd_seq_checker_reg_tm_error_code1_reg_cover
// Register coverage object.
class acd_seq_checker_reg_tm_error_code1_reg_cover extends uvm_object;

    static local acd_seq_checker_reg_tm_error_code1_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    acd_seq_checker_reg_tm_error_code1_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        port9_wr: coverpoint r.port9.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        port9_rd: coverpoint r.port9.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        port10_wr: coverpoint r.port10.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        port10_rd: coverpoint r.port10.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        port11_wr: coverpoint r.port11.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        port11_rd: coverpoint r.port11.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        port12_wr: coverpoint r.port12.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        port12_rd: coverpoint r.port12.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(acd_seq_checker_reg_reg_pkg::acd_seq_checker_reg_tm_error_code1_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="acd_seq_checker_reg_tm_error_code1_reg_cover");
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
    static function acd_seq_checker_reg_tm_error_code1_reg_cover get();
        if (m_inst == null) begin
            m_inst = acd_seq_checker_reg_tm_error_code1_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(acd_seq_checker_reg_tm_error_code1_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass





// Class: acd_seq_checker_reg_reg_block
// Register Block .acd_seq_checker_reg: 
class acd_seq_checker_reg_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand acd_seq_checker_reg_input_error_reg input_error;
    rand acd_seq_checker_reg_preact_error_reg preact_error;
    rand acd_seq_checker_reg_tm_error_reg tm_error;
    rand acd_seq_checker_reg_input_activity_reg input_activity;
    rand acd_seq_checker_reg_preact_activity_reg preact_activity;
    rand acd_seq_checker_reg_tm_activity_reg tm_activity;
    rand acd_seq_checker_reg_input_error_code0_reg input_error_code0;
    rand acd_seq_checker_reg_input_error_code1_reg input_error_code1;
    rand acd_seq_checker_reg_preact_error_code0_reg preact_error_code0;
    rand acd_seq_checker_reg_preact_error_code1_reg preact_error_code1;
    rand acd_seq_checker_reg_tm_error_code0_reg tm_error_code0;
    rand acd_seq_checker_reg_tm_error_code1_reg tm_error_code1;

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(acd_seq_checker_reg_reg_pkg::acd_seq_checker_reg_reg_block)

    // Constructor: new
    function new(string name = "acd_seq_checker_reg_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})


        input_error = acd_seq_checker_reg_input_error_reg::type_id::create("input_error", , get_full_name());
        preact_error = acd_seq_checker_reg_preact_error_reg::type_id::create("preact_error", , get_full_name());
        tm_error = acd_seq_checker_reg_tm_error_reg::type_id::create("tm_error", , get_full_name());
        input_activity = acd_seq_checker_reg_input_activity_reg::type_id::create("input_activity", , get_full_name());
        preact_activity = acd_seq_checker_reg_preact_activity_reg::type_id::create("preact_activity", , get_full_name());
        tm_activity = acd_seq_checker_reg_tm_activity_reg::type_id::create("tm_activity", , get_full_name());
        input_error_code0 = acd_seq_checker_reg_input_error_code0_reg::type_id::create("input_error_code0", , get_full_name());
        input_error_code1 = acd_seq_checker_reg_input_error_code1_reg::type_id::create("input_error_code1", , get_full_name());
        preact_error_code0 = acd_seq_checker_reg_preact_error_code0_reg::type_id::create("preact_error_code0", , get_full_name());
        preact_error_code1 = acd_seq_checker_reg_preact_error_code1_reg::type_id::create("preact_error_code1", , get_full_name());
        tm_error_code0 = acd_seq_checker_reg_tm_error_code0_reg::type_id::create("tm_error_code0", , get_full_name());
        tm_error_code1 = acd_seq_checker_reg_tm_error_code1_reg::type_id::create("tm_error_code1", , get_full_name());

        input_error.configure(this);
        preact_error.configure(this);
        tm_error.configure(this);
        input_activity.configure(this);
        preact_activity.configure(this);
        tm_activity.configure(this);
        input_error_code0.configure(this);
        input_error_code1.configure(this);
        preact_error_code0.configure(this);
        preact_error_code1.configure(this);
        tm_error_code0.configure(this);
        tm_error_code1.configure(this);

        input_error.build();
        preact_error.build();
        tm_error.build();
        input_activity.build();
        preact_activity.build();
        tm_activity.build();
        input_error_code0.build();
        input_error_code1.build();
        preact_error_code0.build();
        preact_error_code1.build();
        tm_error_code0.build();
        tm_error_code1.build();

        // define default map
        default_map = create_map("acd_seq_checker_reg_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        this.default_map.add_reg(input_error, 'h0, "RO");
        this.default_map.add_reg(preact_error, 'h1, "RO");
        this.default_map.add_reg(tm_error, 'h2, "RO");
        this.default_map.add_reg(input_activity, 'h10, "RO");
        this.default_map.add_reg(preact_activity, 'h11, "RO");
        this.default_map.add_reg(tm_activity, 'h12, "RO");
        this.default_map.add_reg(input_error_code0, 'h20, "RO");
        this.default_map.add_reg(input_error_code1, 'h21, "RO");
        this.default_map.add_reg(preact_error_code0, 'h22, "RO");
        this.default_map.add_reg(preact_error_code1, 'h23, "RO");
        this.default_map.add_reg(tm_error_code0, 'h24, "RO");
        this.default_map.add_reg(tm_error_code1, 'h25, "RO");

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
        input_error.enable_coverage(is_on, this.cg_per_instance);
        preact_error.enable_coverage(is_on, this.cg_per_instance);
        tm_error.enable_coverage(is_on, this.cg_per_instance);
        input_activity.enable_coverage(is_on, this.cg_per_instance);
        preact_activity.enable_coverage(is_on, this.cg_per_instance);
        tm_activity.enable_coverage(is_on, this.cg_per_instance);
        input_error_code0.enable_coverage(is_on, this.cg_per_instance);
        input_error_code1.enable_coverage(is_on, this.cg_per_instance);
        preact_error_code0.enable_coverage(is_on, this.cg_per_instance);
        preact_error_code1.enable_coverage(is_on, this.cg_per_instance);
        tm_error_code0.enable_coverage(is_on, this.cg_per_instance);
        tm_error_code1.enable_coverage(is_on, this.cg_per_instance);
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