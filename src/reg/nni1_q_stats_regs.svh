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
// Register definitions for nni1_q_stats register block.
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
// Group: nni1_q_stats
//---------------------------------------------------------

package nni1_q_stats_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;

typedef class nni1_q_stats_fwd_no_dly_grn_reg_cover;

// Class: nni1_q_stats_fwd_no_dly_grn_reg
// Register nni1_q_stats.fwd_no_dly_grn: Statistics counters for green packets en-queued in an almost empty Q
class nni1_q_stats_fwd_no_dly_grn_reg extends uvm_reg;

    // Variable: packet_count
    // Packet counter
    rand uvm_reg_field packet_count;
    // Variable: byte_count
    // Byte counter
    rand uvm_reg_field byte_count;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static nni1_q_stats_fwd_no_dly_grn_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    nni1_q_stats_fwd_no_dly_grn_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(nni1_q_stats_reg_pkg::nni1_q_stats_fwd_no_dly_grn_reg)

    // Constructor: new
    function new(string name = "nni1_q_stats_fwd_no_dly_grn");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        packet_count = uvm_reg_field::type_id::create("packet_count", , get_full_name());
        byte_count = uvm_reg_field::type_id::create("byte_count", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        packet_count.configure(this, 29, 0, "RO", 0, 'h0, 1, 1, 0);
        byte_count.configure(this, 35, 29, "RO", 0, 'h0, 1, 1, 0);
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
                cg = nni1_q_stats_fwd_no_dly_grn_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = nni1_q_stats_fwd_no_dly_grn_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, packet_count.get_name, packet_count.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, byte_count.get_name, byte_count.value);
        return s;
    endfunction

endclass


// Class: nni1_q_stats_fwd_no_dly_grn_reg_cover
// Register coverage object.
class nni1_q_stats_fwd_no_dly_grn_reg_cover extends uvm_object;

    static local nni1_q_stats_fwd_no_dly_grn_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    nni1_q_stats_fwd_no_dly_grn_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        packet_count_wr: coverpoint r.packet_count.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        packet_count_rd: coverpoint r.packet_count.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        byte_count_wr: coverpoint r.byte_count.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        byte_count_rd: coverpoint r.byte_count.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(nni1_q_stats_reg_pkg::nni1_q_stats_fwd_no_dly_grn_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="nni1_q_stats_fwd_no_dly_grn_reg_cover");
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
    static function nni1_q_stats_fwd_no_dly_grn_reg_cover get();
        if (m_inst == null) begin
            m_inst = nni1_q_stats_fwd_no_dly_grn_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(nni1_q_stats_fwd_no_dly_grn_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class nni1_q_stats_fwd_no_dly_yel_reg_cover;

// Class: nni1_q_stats_fwd_no_dly_yel_reg
// Register nni1_q_stats.fwd_no_dly_yel: Statistics counters for yellow packets en-queued in an almost empty Q
class nni1_q_stats_fwd_no_dly_yel_reg extends uvm_reg;

    // Variable: packet_count
    // Packet counter
    rand uvm_reg_field packet_count;
    // Variable: byte_count
    // Byte counter
    rand uvm_reg_field byte_count;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static nni1_q_stats_fwd_no_dly_yel_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    nni1_q_stats_fwd_no_dly_yel_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(nni1_q_stats_reg_pkg::nni1_q_stats_fwd_no_dly_yel_reg)

    // Constructor: new
    function new(string name = "nni1_q_stats_fwd_no_dly_yel");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        packet_count = uvm_reg_field::type_id::create("packet_count", , get_full_name());
        byte_count = uvm_reg_field::type_id::create("byte_count", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        packet_count.configure(this, 29, 0, "RO", 0, 'h0, 1, 1, 0);
        byte_count.configure(this, 35, 29, "RO", 0, 'h0, 1, 1, 0);
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
                cg = nni1_q_stats_fwd_no_dly_yel_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = nni1_q_stats_fwd_no_dly_yel_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, packet_count.get_name, packet_count.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, byte_count.get_name, byte_count.value);
        return s;
    endfunction

endclass


// Class: nni1_q_stats_fwd_no_dly_yel_reg_cover
// Register coverage object.
class nni1_q_stats_fwd_no_dly_yel_reg_cover extends uvm_object;

    static local nni1_q_stats_fwd_no_dly_yel_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    nni1_q_stats_fwd_no_dly_yel_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        packet_count_wr: coverpoint r.packet_count.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        packet_count_rd: coverpoint r.packet_count.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        byte_count_wr: coverpoint r.byte_count.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        byte_count_rd: coverpoint r.byte_count.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(nni1_q_stats_reg_pkg::nni1_q_stats_fwd_no_dly_yel_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="nni1_q_stats_fwd_no_dly_yel_reg_cover");
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
    static function nni1_q_stats_fwd_no_dly_yel_reg_cover get();
        if (m_inst == null) begin
            m_inst = nni1_q_stats_fwd_no_dly_yel_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(nni1_q_stats_fwd_no_dly_yel_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class nni1_q_stats_fwd_dly_grn_reg_cover;

// Class: nni1_q_stats_fwd_dly_grn_reg
// Register nni1_q_stats.fwd_dly_grn: Statistics counters for green packets en-queued in a not almost empty Q
class nni1_q_stats_fwd_dly_grn_reg extends uvm_reg;

    // Variable: packet_count
    // Packet counter
    rand uvm_reg_field packet_count;
    // Variable: byte_count
    // Byte counter
    rand uvm_reg_field byte_count;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static nni1_q_stats_fwd_dly_grn_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    nni1_q_stats_fwd_dly_grn_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(nni1_q_stats_reg_pkg::nni1_q_stats_fwd_dly_grn_reg)

    // Constructor: new
    function new(string name = "nni1_q_stats_fwd_dly_grn");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        packet_count = uvm_reg_field::type_id::create("packet_count", , get_full_name());
        byte_count = uvm_reg_field::type_id::create("byte_count", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        packet_count.configure(this, 29, 0, "RO", 0, 'h0, 1, 1, 0);
        byte_count.configure(this, 35, 29, "RO", 0, 'h0, 1, 1, 0);
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
                cg = nni1_q_stats_fwd_dly_grn_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = nni1_q_stats_fwd_dly_grn_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, packet_count.get_name, packet_count.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, byte_count.get_name, byte_count.value);
        return s;
    endfunction

endclass


// Class: nni1_q_stats_fwd_dly_grn_reg_cover
// Register coverage object.
class nni1_q_stats_fwd_dly_grn_reg_cover extends uvm_object;

    static local nni1_q_stats_fwd_dly_grn_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    nni1_q_stats_fwd_dly_grn_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        packet_count_wr: coverpoint r.packet_count.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        packet_count_rd: coverpoint r.packet_count.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        byte_count_wr: coverpoint r.byte_count.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        byte_count_rd: coverpoint r.byte_count.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(nni1_q_stats_reg_pkg::nni1_q_stats_fwd_dly_grn_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="nni1_q_stats_fwd_dly_grn_reg_cover");
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
    static function nni1_q_stats_fwd_dly_grn_reg_cover get();
        if (m_inst == null) begin
            m_inst = nni1_q_stats_fwd_dly_grn_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(nni1_q_stats_fwd_dly_grn_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class nni1_q_stats_fwd_dly_yel_reg_cover;

// Class: nni1_q_stats_fwd_dly_yel_reg
// Register nni1_q_stats.fwd_dly_yel: Statistics counters for yellow packets en-queued in a not almost empty Q
class nni1_q_stats_fwd_dly_yel_reg extends uvm_reg;

    // Variable: packet_count
    // Packet counter
    rand uvm_reg_field packet_count;
    // Variable: byte_count
    // Byte counter
    rand uvm_reg_field byte_count;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static nni1_q_stats_fwd_dly_yel_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    nni1_q_stats_fwd_dly_yel_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(nni1_q_stats_reg_pkg::nni1_q_stats_fwd_dly_yel_reg)

    // Constructor: new
    function new(string name = "nni1_q_stats_fwd_dly_yel");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        packet_count = uvm_reg_field::type_id::create("packet_count", , get_full_name());
        byte_count = uvm_reg_field::type_id::create("byte_count", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        packet_count.configure(this, 29, 0, "RO", 0, 'h0, 1, 1, 0);
        byte_count.configure(this, 35, 29, "RO", 0, 'h0, 1, 1, 0);
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
                cg = nni1_q_stats_fwd_dly_yel_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = nni1_q_stats_fwd_dly_yel_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, packet_count.get_name, packet_count.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, byte_count.get_name, byte_count.value);
        return s;
    endfunction

endclass


// Class: nni1_q_stats_fwd_dly_yel_reg_cover
// Register coverage object.
class nni1_q_stats_fwd_dly_yel_reg_cover extends uvm_object;

    static local nni1_q_stats_fwd_dly_yel_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    nni1_q_stats_fwd_dly_yel_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        packet_count_wr: coverpoint r.packet_count.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        packet_count_rd: coverpoint r.packet_count.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        byte_count_wr: coverpoint r.byte_count.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        byte_count_rd: coverpoint r.byte_count.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(nni1_q_stats_reg_pkg::nni1_q_stats_fwd_dly_yel_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="nni1_q_stats_fwd_dly_yel_reg_cover");
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
    static function nni1_q_stats_fwd_dly_yel_reg_cover get();
        if (m_inst == null) begin
            m_inst = nni1_q_stats_fwd_dly_yel_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(nni1_q_stats_fwd_dly_yel_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class nni1_q_stats_discard_full_grn_reg_cover;

// Class: nni1_q_stats_discard_full_grn_reg
// Register nni1_q_stats.discard_full_grn: Statistics counters for green packets discarded because of Q being full
class nni1_q_stats_discard_full_grn_reg extends uvm_reg;

    // Variable: packet_count
    // Packet counter
    rand uvm_reg_field packet_count;
    // Variable: byte_count
    // Byte counter
    rand uvm_reg_field byte_count;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static nni1_q_stats_discard_full_grn_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    nni1_q_stats_discard_full_grn_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(nni1_q_stats_reg_pkg::nni1_q_stats_discard_full_grn_reg)

    // Constructor: new
    function new(string name = "nni1_q_stats_discard_full_grn");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        packet_count = uvm_reg_field::type_id::create("packet_count", , get_full_name());
        byte_count = uvm_reg_field::type_id::create("byte_count", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        packet_count.configure(this, 29, 0, "RO", 0, 'h0, 1, 1, 0);
        byte_count.configure(this, 35, 29, "RO", 0, 'h0, 1, 1, 0);
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
                cg = nni1_q_stats_discard_full_grn_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = nni1_q_stats_discard_full_grn_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, packet_count.get_name, packet_count.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, byte_count.get_name, byte_count.value);
        return s;
    endfunction

endclass


// Class: nni1_q_stats_discard_full_grn_reg_cover
// Register coverage object.
class nni1_q_stats_discard_full_grn_reg_cover extends uvm_object;

    static local nni1_q_stats_discard_full_grn_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    nni1_q_stats_discard_full_grn_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        packet_count_wr: coverpoint r.packet_count.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        packet_count_rd: coverpoint r.packet_count.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        byte_count_wr: coverpoint r.byte_count.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        byte_count_rd: coverpoint r.byte_count.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(nni1_q_stats_reg_pkg::nni1_q_stats_discard_full_grn_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="nni1_q_stats_discard_full_grn_reg_cover");
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
    static function nni1_q_stats_discard_full_grn_reg_cover get();
        if (m_inst == null) begin
            m_inst = nni1_q_stats_discard_full_grn_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(nni1_q_stats_discard_full_grn_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class nni1_q_stats_discard_full_yel_reg_cover;

// Class: nni1_q_stats_discard_full_yel_reg
// Register nni1_q_stats.discard_full_yel: Statistics counters for yellow packets discarded because of Q being full
class nni1_q_stats_discard_full_yel_reg extends uvm_reg;

    // Variable: packet_count
    // Packet counter
    rand uvm_reg_field packet_count;
    // Variable: byte_count
    // Byte counter
    rand uvm_reg_field byte_count;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static nni1_q_stats_discard_full_yel_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    nni1_q_stats_discard_full_yel_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(nni1_q_stats_reg_pkg::nni1_q_stats_discard_full_yel_reg)

    // Constructor: new
    function new(string name = "nni1_q_stats_discard_full_yel");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        packet_count = uvm_reg_field::type_id::create("packet_count", , get_full_name());
        byte_count = uvm_reg_field::type_id::create("byte_count", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        packet_count.configure(this, 29, 0, "RO", 0, 'h0, 1, 1, 0);
        byte_count.configure(this, 35, 29, "RO", 0, 'h0, 1, 1, 0);
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
                cg = nni1_q_stats_discard_full_yel_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = nni1_q_stats_discard_full_yel_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, packet_count.get_name, packet_count.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, byte_count.get_name, byte_count.value);
        return s;
    endfunction

endclass


// Class: nni1_q_stats_discard_full_yel_reg_cover
// Register coverage object.
class nni1_q_stats_discard_full_yel_reg_cover extends uvm_object;

    static local nni1_q_stats_discard_full_yel_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    nni1_q_stats_discard_full_yel_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        packet_count_wr: coverpoint r.packet_count.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        packet_count_rd: coverpoint r.packet_count.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        byte_count_wr: coverpoint r.byte_count.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        byte_count_rd: coverpoint r.byte_count.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(nni1_q_stats_reg_pkg::nni1_q_stats_discard_full_yel_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="nni1_q_stats_discard_full_yel_reg_cover");
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
    static function nni1_q_stats_discard_full_yel_reg_cover get();
        if (m_inst == null) begin
            m_inst = nni1_q_stats_discard_full_yel_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(nni1_q_stats_discard_full_yel_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class nni1_q_stats_discard_blue_grn_reg_cover;

// Class: nni1_q_stats_discard_blue_grn_reg
// Register nni1_q_stats.discard_blue_grn: Statistics counters for green packets early discarded by the BLUE algorithm
class nni1_q_stats_discard_blue_grn_reg extends uvm_reg;

    // Variable: packet_count
    // Packet counter
    rand uvm_reg_field packet_count;
    // Variable: byte_count
    // Byte counter
    rand uvm_reg_field byte_count;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static nni1_q_stats_discard_blue_grn_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    nni1_q_stats_discard_blue_grn_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(nni1_q_stats_reg_pkg::nni1_q_stats_discard_blue_grn_reg)

    // Constructor: new
    function new(string name = "nni1_q_stats_discard_blue_grn");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        packet_count = uvm_reg_field::type_id::create("packet_count", , get_full_name());
        byte_count = uvm_reg_field::type_id::create("byte_count", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        packet_count.configure(this, 29, 0, "RO", 0, 'h0, 1, 1, 0);
        byte_count.configure(this, 35, 29, "RO", 0, 'h0, 1, 1, 0);
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
                cg = nni1_q_stats_discard_blue_grn_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = nni1_q_stats_discard_blue_grn_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, packet_count.get_name, packet_count.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, byte_count.get_name, byte_count.value);
        return s;
    endfunction

endclass


// Class: nni1_q_stats_discard_blue_grn_reg_cover
// Register coverage object.
class nni1_q_stats_discard_blue_grn_reg_cover extends uvm_object;

    static local nni1_q_stats_discard_blue_grn_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    nni1_q_stats_discard_blue_grn_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        packet_count_wr: coverpoint r.packet_count.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        packet_count_rd: coverpoint r.packet_count.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        byte_count_wr: coverpoint r.byte_count.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        byte_count_rd: coverpoint r.byte_count.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(nni1_q_stats_reg_pkg::nni1_q_stats_discard_blue_grn_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="nni1_q_stats_discard_blue_grn_reg_cover");
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
    static function nni1_q_stats_discard_blue_grn_reg_cover get();
        if (m_inst == null) begin
            m_inst = nni1_q_stats_discard_blue_grn_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(nni1_q_stats_discard_blue_grn_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class nni1_q_stats_discard_blue_yel_reg_cover;

// Class: nni1_q_stats_discard_blue_yel_reg
// Register nni1_q_stats.discard_blue_yel: Statistics counters for yellow packets early discarded by the BLUE algorithm
class nni1_q_stats_discard_blue_yel_reg extends uvm_reg;

    // Variable: packet_count
    // Packet counter
    rand uvm_reg_field packet_count;
    // Variable: byte_count
    // Byte counter
    rand uvm_reg_field byte_count;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static nni1_q_stats_discard_blue_yel_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    nni1_q_stats_discard_blue_yel_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(nni1_q_stats_reg_pkg::nni1_q_stats_discard_blue_yel_reg)

    // Constructor: new
    function new(string name = "nni1_q_stats_discard_blue_yel");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        packet_count = uvm_reg_field::type_id::create("packet_count", , get_full_name());
        byte_count = uvm_reg_field::type_id::create("byte_count", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        packet_count.configure(this, 29, 0, "RO", 0, 'h0, 1, 1, 0);
        byte_count.configure(this, 35, 29, "RO", 0, 'h0, 1, 1, 0);
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
                cg = nni1_q_stats_discard_blue_yel_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = nni1_q_stats_discard_blue_yel_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, packet_count.get_name, packet_count.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, byte_count.get_name, byte_count.value);
        return s;
    endfunction

endclass


// Class: nni1_q_stats_discard_blue_yel_reg_cover
// Register coverage object.
class nni1_q_stats_discard_blue_yel_reg_cover extends uvm_object;

    static local nni1_q_stats_discard_blue_yel_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    nni1_q_stats_discard_blue_yel_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        packet_count_wr: coverpoint r.packet_count.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        packet_count_rd: coverpoint r.packet_count.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        byte_count_wr: coverpoint r.byte_count.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        byte_count_rd: coverpoint r.byte_count.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(nni1_q_stats_reg_pkg::nni1_q_stats_discard_blue_yel_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="nni1_q_stats_discard_blue_yel_reg_cover");
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
    static function nni1_q_stats_discard_blue_yel_reg_cover get();
        if (m_inst == null) begin
            m_inst = nni1_q_stats_discard_blue_yel_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(nni1_q_stats_discard_blue_yel_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class nni1_q_stats_discard_sys_grn_reg_cover;

// Class: nni1_q_stats_discard_sys_grn_reg
// Register nni1_q_stats.discard_sys_grn: Statistics counters for green packets early discarded by the TM. Should be always 0.
class nni1_q_stats_discard_sys_grn_reg extends uvm_reg;

    // Variable: packet_count
    // Packet counter
    rand uvm_reg_field packet_count;
    // Variable: byte_count
    // Byte counter
    rand uvm_reg_field byte_count;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static nni1_q_stats_discard_sys_grn_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    nni1_q_stats_discard_sys_grn_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(nni1_q_stats_reg_pkg::nni1_q_stats_discard_sys_grn_reg)

    // Constructor: new
    function new(string name = "nni1_q_stats_discard_sys_grn");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        packet_count = uvm_reg_field::type_id::create("packet_count", , get_full_name());
        byte_count = uvm_reg_field::type_id::create("byte_count", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        packet_count.configure(this, 29, 0, "RO", 0, 'h0, 1, 1, 0);
        byte_count.configure(this, 35, 29, "RO", 0, 'h0, 1, 1, 0);
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
                cg = nni1_q_stats_discard_sys_grn_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = nni1_q_stats_discard_sys_grn_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, packet_count.get_name, packet_count.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, byte_count.get_name, byte_count.value);
        return s;
    endfunction

endclass


// Class: nni1_q_stats_discard_sys_grn_reg_cover
// Register coverage object.
class nni1_q_stats_discard_sys_grn_reg_cover extends uvm_object;

    static local nni1_q_stats_discard_sys_grn_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    nni1_q_stats_discard_sys_grn_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        packet_count_wr: coverpoint r.packet_count.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        packet_count_rd: coverpoint r.packet_count.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        byte_count_wr: coverpoint r.byte_count.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        byte_count_rd: coverpoint r.byte_count.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(nni1_q_stats_reg_pkg::nni1_q_stats_discard_sys_grn_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="nni1_q_stats_discard_sys_grn_reg_cover");
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
    static function nni1_q_stats_discard_sys_grn_reg_cover get();
        if (m_inst == null) begin
            m_inst = nni1_q_stats_discard_sys_grn_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(nni1_q_stats_discard_sys_grn_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class nni1_q_stats_discard_sys_yel_reg_cover;

// Class: nni1_q_stats_discard_sys_yel_reg
// Register nni1_q_stats.discard_sys_yel: Statistics counters for yellow packets early discarded by the TM. Should be always 0.
class nni1_q_stats_discard_sys_yel_reg extends uvm_reg;

    // Variable: packet_count
    // Packet counter
    rand uvm_reg_field packet_count;
    // Variable: byte_count
    // Byte counter
    rand uvm_reg_field byte_count;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static nni1_q_stats_discard_sys_yel_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    nni1_q_stats_discard_sys_yel_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(nni1_q_stats_reg_pkg::nni1_q_stats_discard_sys_yel_reg)

    // Constructor: new
    function new(string name = "nni1_q_stats_discard_sys_yel");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        packet_count = uvm_reg_field::type_id::create("packet_count", , get_full_name());
        byte_count = uvm_reg_field::type_id::create("byte_count", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        packet_count.configure(this, 29, 0, "RO", 0, 'h0, 1, 1, 0);
        byte_count.configure(this, 35, 29, "RO", 0, 'h0, 1, 1, 0);
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
                cg = nni1_q_stats_discard_sys_yel_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = nni1_q_stats_discard_sys_yel_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, packet_count.get_name, packet_count.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, byte_count.get_name, byte_count.value);
        return s;
    endfunction

endclass


// Class: nni1_q_stats_discard_sys_yel_reg_cover
// Register coverage object.
class nni1_q_stats_discard_sys_yel_reg_cover extends uvm_object;

    static local nni1_q_stats_discard_sys_yel_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    nni1_q_stats_discard_sys_yel_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        packet_count_wr: coverpoint r.packet_count.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        packet_count_rd: coverpoint r.packet_count.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        byte_count_wr: coverpoint r.byte_count.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        byte_count_rd: coverpoint r.byte_count.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(nni1_q_stats_reg_pkg::nni1_q_stats_discard_sys_yel_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="nni1_q_stats_discard_sys_yel_reg_cover");
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
    static function nni1_q_stats_discard_sys_yel_reg_cover get();
        if (m_inst == null) begin
            m_inst = nni1_q_stats_discard_sys_yel_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(nni1_q_stats_discard_sys_yel_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class nni1_q_stats_cir_reg_cover;

// Class: nni1_q_stats_cir_reg
// Register nni1_q_stats.cir: Statistics counters for packets de-queued with CIR compliance
class nni1_q_stats_cir_reg extends uvm_reg;

    // Variable: packet_count
    // Packet counter
    rand uvm_reg_field packet_count;
    // Variable: byte_count
    // Byte counter
    rand uvm_reg_field byte_count;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static nni1_q_stats_cir_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    nni1_q_stats_cir_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(nni1_q_stats_reg_pkg::nni1_q_stats_cir_reg)

    // Constructor: new
    function new(string name = "nni1_q_stats_cir");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        packet_count = uvm_reg_field::type_id::create("packet_count", , get_full_name());
        byte_count = uvm_reg_field::type_id::create("byte_count", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        packet_count.configure(this, 29, 0, "RO", 0, 'h0, 1, 1, 0);
        byte_count.configure(this, 35, 29, "RO", 0, 'h0, 1, 1, 0);
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
                cg = nni1_q_stats_cir_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = nni1_q_stats_cir_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, packet_count.get_name, packet_count.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, byte_count.get_name, byte_count.value);
        return s;
    endfunction

endclass


// Class: nni1_q_stats_cir_reg_cover
// Register coverage object.
class nni1_q_stats_cir_reg_cover extends uvm_object;

    static local nni1_q_stats_cir_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    nni1_q_stats_cir_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        packet_count_wr: coverpoint r.packet_count.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        packet_count_rd: coverpoint r.packet_count.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        byte_count_wr: coverpoint r.byte_count.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        byte_count_rd: coverpoint r.byte_count.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(nni1_q_stats_reg_pkg::nni1_q_stats_cir_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="nni1_q_stats_cir_reg_cover");
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
    static function nni1_q_stats_cir_reg_cover get();
        if (m_inst == null) begin
            m_inst = nni1_q_stats_cir_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(nni1_q_stats_cir_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class nni1_q_stats_eir_reg_cover;

// Class: nni1_q_stats_eir_reg
// Register nni1_q_stats.eir: Statistics counters for packets de-queued with EIR compliance
class nni1_q_stats_eir_reg extends uvm_reg;

    // Variable: packet_count
    // Packet counter
    rand uvm_reg_field packet_count;
    // Variable: byte_count
    // Byte counter
    rand uvm_reg_field byte_count;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static nni1_q_stats_eir_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    nni1_q_stats_eir_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(nni1_q_stats_reg_pkg::nni1_q_stats_eir_reg)

    // Constructor: new
    function new(string name = "nni1_q_stats_eir");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        packet_count = uvm_reg_field::type_id::create("packet_count", , get_full_name());
        byte_count = uvm_reg_field::type_id::create("byte_count", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        packet_count.configure(this, 29, 0, "RO", 0, 'h0, 1, 1, 0);
        byte_count.configure(this, 35, 29, "RO", 0, 'h0, 1, 1, 0);
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
                cg = nni1_q_stats_eir_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = nni1_q_stats_eir_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, packet_count.get_name, packet_count.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, byte_count.get_name, byte_count.value);
        return s;
    endfunction

endclass


// Class: nni1_q_stats_eir_reg_cover
// Register coverage object.
class nni1_q_stats_eir_reg_cover extends uvm_object;

    static local nni1_q_stats_eir_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    nni1_q_stats_eir_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        packet_count_wr: coverpoint r.packet_count.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        packet_count_rd: coverpoint r.packet_count.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        byte_count_wr: coverpoint r.byte_count.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        byte_count_rd: coverpoint r.byte_count.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(nni1_q_stats_reg_pkg::nni1_q_stats_eir_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="nni1_q_stats_eir_reg_cover");
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
    static function nni1_q_stats_eir_reg_cover get();
        if (m_inst == null) begin
            m_inst = nni1_q_stats_eir_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(nni1_q_stats_eir_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class nni1_q_stats_discard_error_reg_cover;

// Class: nni1_q_stats_discard_error_reg
// Register nni1_q_stats.discard_error: Reserved
class nni1_q_stats_discard_error_reg extends uvm_reg;

    // Variable: packet_count
    // Packet counter
    rand uvm_reg_field packet_count;
    // Variable: byte_count
    // Byte counter
    rand uvm_reg_field byte_count;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static nni1_q_stats_discard_error_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    nni1_q_stats_discard_error_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(nni1_q_stats_reg_pkg::nni1_q_stats_discard_error_reg)

    // Constructor: new
    function new(string name = "nni1_q_stats_discard_error");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        packet_count = uvm_reg_field::type_id::create("packet_count", , get_full_name());
        byte_count = uvm_reg_field::type_id::create("byte_count", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        packet_count.configure(this, 29, 0, "RO", 0, 'h0, 1, 1, 0);
        byte_count.configure(this, 35, 29, "RO", 0, 'h0, 1, 1, 0);
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
                cg = nni1_q_stats_discard_error_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = nni1_q_stats_discard_error_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, packet_count.get_name, packet_count.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, byte_count.get_name, byte_count.value);
        return s;
    endfunction

endclass


// Class: nni1_q_stats_discard_error_reg_cover
// Register coverage object.
class nni1_q_stats_discard_error_reg_cover extends uvm_object;

    static local nni1_q_stats_discard_error_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    nni1_q_stats_discard_error_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        packet_count_wr: coverpoint r.packet_count.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        packet_count_rd: coverpoint r.packet_count.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        byte_count_wr: coverpoint r.byte_count.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        byte_count_rd: coverpoint r.byte_count.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(nni1_q_stats_reg_pkg::nni1_q_stats_discard_error_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="nni1_q_stats_discard_error_reg_cover");
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
    static function nni1_q_stats_discard_error_reg_cover get();
        if (m_inst == null) begin
            m_inst = nni1_q_stats_discard_error_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(nni1_q_stats_discard_error_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass





// Class: nni1_q_stats_reg_block
// Register Block .nni1_q_stats: 
class nni1_q_stats_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand nni1_q_stats_fwd_no_dly_grn_reg fwd_no_dly_grn[];
    rand nni1_q_stats_fwd_no_dly_yel_reg fwd_no_dly_yel[];
    rand nni1_q_stats_fwd_dly_grn_reg fwd_dly_grn[];
    rand nni1_q_stats_fwd_dly_yel_reg fwd_dly_yel[];
    rand nni1_q_stats_discard_full_grn_reg discard_full_grn[];
    rand nni1_q_stats_discard_full_yel_reg discard_full_yel[];
    rand nni1_q_stats_discard_blue_grn_reg discard_blue_grn[];
    rand nni1_q_stats_discard_blue_yel_reg discard_blue_yel[];
    rand nni1_q_stats_discard_sys_grn_reg discard_sys_grn[];
    rand nni1_q_stats_discard_sys_yel_reg discard_sys_yel[];
    rand nni1_q_stats_cir_reg cir[];
    rand nni1_q_stats_eir_reg eir[];
    rand nni1_q_stats_discard_error_reg discard_error[];

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(nni1_q_stats_reg_pkg::nni1_q_stats_reg_block)

    // Constructor: new
    function new(string name = "nni1_q_stats_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        fwd_no_dly_grn = new[32];
        fwd_no_dly_yel = new[32];
        fwd_dly_grn = new[32];
        fwd_dly_yel = new[32];
        discard_full_grn = new[32];
        discard_full_yel = new[32];
        discard_blue_grn = new[32];
        discard_blue_yel = new[32];
        discard_sys_grn = new[32];
        discard_sys_yel = new[32];
        cir = new[32];
        eir = new[32];
        discard_error = new[32];

        foreach(fwd_no_dly_grn[m]) begin
            fwd_no_dly_grn[m] = nni1_q_stats_fwd_no_dly_grn_reg::type_id::create($sformatf("fwd_no_dly_grn[%0d]",m), , get_full_name());
        end
        foreach(fwd_no_dly_yel[m]) begin
            fwd_no_dly_yel[m] = nni1_q_stats_fwd_no_dly_yel_reg::type_id::create($sformatf("fwd_no_dly_yel[%0d]",m), , get_full_name());
        end
        foreach(fwd_dly_grn[m]) begin
            fwd_dly_grn[m] = nni1_q_stats_fwd_dly_grn_reg::type_id::create($sformatf("fwd_dly_grn[%0d]",m), , get_full_name());
        end
        foreach(fwd_dly_yel[m]) begin
            fwd_dly_yel[m] = nni1_q_stats_fwd_dly_yel_reg::type_id::create($sformatf("fwd_dly_yel[%0d]",m), , get_full_name());
        end
        foreach(discard_full_grn[m]) begin
            discard_full_grn[m] = nni1_q_stats_discard_full_grn_reg::type_id::create($sformatf("discard_full_grn[%0d]",m), , get_full_name());
        end
        foreach(discard_full_yel[m]) begin
            discard_full_yel[m] = nni1_q_stats_discard_full_yel_reg::type_id::create($sformatf("discard_full_yel[%0d]",m), , get_full_name());
        end
        foreach(discard_blue_grn[m]) begin
            discard_blue_grn[m] = nni1_q_stats_discard_blue_grn_reg::type_id::create($sformatf("discard_blue_grn[%0d]",m), , get_full_name());
        end
        foreach(discard_blue_yel[m]) begin
            discard_blue_yel[m] = nni1_q_stats_discard_blue_yel_reg::type_id::create($sformatf("discard_blue_yel[%0d]",m), , get_full_name());
        end
        foreach(discard_sys_grn[m]) begin
            discard_sys_grn[m] = nni1_q_stats_discard_sys_grn_reg::type_id::create($sformatf("discard_sys_grn[%0d]",m), , get_full_name());
        end
        foreach(discard_sys_yel[m]) begin
            discard_sys_yel[m] = nni1_q_stats_discard_sys_yel_reg::type_id::create($sformatf("discard_sys_yel[%0d]",m), , get_full_name());
        end
        foreach(cir[m]) begin
            cir[m] = nni1_q_stats_cir_reg::type_id::create($sformatf("cir[%0d]",m), , get_full_name());
        end
        foreach(eir[m]) begin
            eir[m] = nni1_q_stats_eir_reg::type_id::create($sformatf("eir[%0d]",m), , get_full_name());
        end
        foreach(discard_error[m]) begin
            discard_error[m] = nni1_q_stats_discard_error_reg::type_id::create($sformatf("discard_error[%0d]",m), , get_full_name());
        end

        foreach(fwd_no_dly_grn[m]) begin
            fwd_no_dly_grn[m].configure(this);
        end
        foreach(fwd_no_dly_yel[m]) begin
            fwd_no_dly_yel[m].configure(this);
        end
        foreach(fwd_dly_grn[m]) begin
            fwd_dly_grn[m].configure(this);
        end
        foreach(fwd_dly_yel[m]) begin
            fwd_dly_yel[m].configure(this);
        end
        foreach(discard_full_grn[m]) begin
            discard_full_grn[m].configure(this);
        end
        foreach(discard_full_yel[m]) begin
            discard_full_yel[m].configure(this);
        end
        foreach(discard_blue_grn[m]) begin
            discard_blue_grn[m].configure(this);
        end
        foreach(discard_blue_yel[m]) begin
            discard_blue_yel[m].configure(this);
        end
        foreach(discard_sys_grn[m]) begin
            discard_sys_grn[m].configure(this);
        end
        foreach(discard_sys_yel[m]) begin
            discard_sys_yel[m].configure(this);
        end
        foreach(cir[m]) begin
            cir[m].configure(this);
        end
        foreach(eir[m]) begin
            eir[m].configure(this);
        end
        foreach(discard_error[m]) begin
            discard_error[m].configure(this);
        end

        foreach(fwd_no_dly_grn[m]) begin
            fwd_no_dly_grn[m].build();
        end
        foreach(fwd_no_dly_yel[m]) begin
            fwd_no_dly_yel[m].build();
        end
        foreach(fwd_dly_grn[m]) begin
            fwd_dly_grn[m].build();
        end
        foreach(fwd_dly_yel[m]) begin
            fwd_dly_yel[m].build();
        end
        foreach(discard_full_grn[m]) begin
            discard_full_grn[m].build();
        end
        foreach(discard_full_yel[m]) begin
            discard_full_yel[m].build();
        end
        foreach(discard_blue_grn[m]) begin
            discard_blue_grn[m].build();
        end
        foreach(discard_blue_yel[m]) begin
            discard_blue_yel[m].build();
        end
        foreach(discard_sys_grn[m]) begin
            discard_sys_grn[m].build();
        end
        foreach(discard_sys_yel[m]) begin
            discard_sys_yel[m].build();
        end
        foreach(cir[m]) begin
            cir[m].build();
        end
        foreach(eir[m]) begin
            eir[m].build();
        end
        foreach(discard_error[m]) begin
            discard_error[m].build();
        end

        // define default map
        default_map = create_map("nni1_q_stats_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        foreach(fwd_no_dly_grn[m]) begin
            this.default_map.add_reg(this.fwd_no_dly_grn[m], 'h0 + m, "RO");
        end
        foreach(fwd_no_dly_yel[m]) begin
            this.default_map.add_reg(this.fwd_no_dly_yel[m], 'h100 + m, "RO");
        end
        foreach(fwd_dly_grn[m]) begin
            this.default_map.add_reg(this.fwd_dly_grn[m], 'h200 + m, "RO");
        end
        foreach(fwd_dly_yel[m]) begin
            this.default_map.add_reg(this.fwd_dly_yel[m], 'h300 + m, "RO");
        end
        foreach(discard_full_grn[m]) begin
            this.default_map.add_reg(this.discard_full_grn[m], 'h400 + m, "RO");
        end
        foreach(discard_full_yel[m]) begin
            this.default_map.add_reg(this.discard_full_yel[m], 'h500 + m, "RO");
        end
        foreach(discard_blue_grn[m]) begin
            this.default_map.add_reg(this.discard_blue_grn[m], 'h600 + m, "RO");
        end
        foreach(discard_blue_yel[m]) begin
            this.default_map.add_reg(this.discard_blue_yel[m], 'h700 + m, "RO");
        end
        foreach(discard_sys_grn[m]) begin
            this.default_map.add_reg(this.discard_sys_grn[m], 'h800 + m, "RO");
        end
        foreach(discard_sys_yel[m]) begin
            this.default_map.add_reg(this.discard_sys_yel[m], 'h900 + m, "RO");
        end
        foreach(cir[m]) begin
            this.default_map.add_reg(this.cir[m], 'hA00 + m, "RO");
        end
        foreach(eir[m]) begin
            this.default_map.add_reg(this.eir[m], 'hB00 + m, "RO");
        end
        foreach(discard_error[m]) begin
            this.default_map.add_reg(this.discard_error[m], 'hC00 + m, "RO");
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
        foreach(fwd_no_dly_grn[m]) begin
            fwd_no_dly_grn[m].enable_coverage(is_on, this.cg_per_instance);
        end
        foreach(fwd_no_dly_yel[m]) begin
            fwd_no_dly_yel[m].enable_coverage(is_on, this.cg_per_instance);
        end
        foreach(fwd_dly_grn[m]) begin
            fwd_dly_grn[m].enable_coverage(is_on, this.cg_per_instance);
        end
        foreach(fwd_dly_yel[m]) begin
            fwd_dly_yel[m].enable_coverage(is_on, this.cg_per_instance);
        end
        foreach(discard_full_grn[m]) begin
            discard_full_grn[m].enable_coverage(is_on, this.cg_per_instance);
        end
        foreach(discard_full_yel[m]) begin
            discard_full_yel[m].enable_coverage(is_on, this.cg_per_instance);
        end
        foreach(discard_blue_grn[m]) begin
            discard_blue_grn[m].enable_coverage(is_on, this.cg_per_instance);
        end
        foreach(discard_blue_yel[m]) begin
            discard_blue_yel[m].enable_coverage(is_on, this.cg_per_instance);
        end
        foreach(discard_sys_grn[m]) begin
            discard_sys_grn[m].enable_coverage(is_on, this.cg_per_instance);
        end
        foreach(discard_sys_yel[m]) begin
            discard_sys_yel[m].enable_coverage(is_on, this.cg_per_instance);
        end
        foreach(cir[m]) begin
            cir[m].enable_coverage(is_on, this.cg_per_instance);
        end
        foreach(eir[m]) begin
            eir[m].enable_coverage(is_on, this.cg_per_instance);
        end
        foreach(discard_error[m]) begin
            discard_error[m].enable_coverage(is_on, this.cg_per_instance);
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