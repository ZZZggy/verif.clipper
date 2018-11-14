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
// Register definitions for xgmac_rx_stats register block.
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
// Group: xgmac_rx_stats
//---------------------------------------------------------

package xgmac_rx_stats_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;

typedef class xgmac_rx_stats_rx_short_bad_reg_cover;

// Class: xgmac_rx_stats_rx_short_bad_reg
// Register xgmac_rx_stats.rx_short_bad: RX_Short_Bad
class xgmac_rx_stats_rx_short_bad_reg extends uvm_reg;

    // Variable: rx_short_bad
    // RX Bad frames with Frame size &lt; 64 frames count
    rand uvm_reg_field rx_short_bad;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_short_bad_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_short_bad_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_short_bad_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_short_bad");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_short_bad = uvm_reg_field::type_id::create("rx_short_bad", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_short_bad.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_short_bad_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_short_bad_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_short_bad.get_name, rx_short_bad.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_short_bad_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_short_bad_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_short_bad_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_short_bad_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_short_bad_wr: coverpoint r.rx_short_bad.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_short_bad_rd: coverpoint r.rx_short_bad.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_short_bad_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_short_bad_reg_cover");
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
    static function xgmac_rx_stats_rx_short_bad_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_short_bad_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_short_bad_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_short_good_reg_cover;

// Class: xgmac_rx_stats_rx_short_good_reg
// Register xgmac_rx_stats.rx_short_good: RX_Short_Good
class xgmac_rx_stats_rx_short_good_reg extends uvm_reg;

    // Variable: rx_short_good
    // RX Good frames with Frame size &lt; 64 frames count
    rand uvm_reg_field rx_short_good;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_short_good_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_short_good_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_short_good_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_short_good");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_short_good = uvm_reg_field::type_id::create("rx_short_good", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_short_good.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_short_good_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_short_good_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_short_good.get_name, rx_short_good.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_short_good_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_short_good_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_short_good_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_short_good_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_short_good_wr: coverpoint r.rx_short_good.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_short_good_rd: coverpoint r.rx_short_good.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_short_good_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_short_good_reg_cover");
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
    static function xgmac_rx_stats_rx_short_good_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_short_good_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_short_good_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_frame_size_equal_64_reg_cover;

// Class: xgmac_rx_stats_rx_frame_size_equal_64_reg
// Register xgmac_rx_stats.rx_frame_size_equal_64: RX_Frame_size_equal_64
class xgmac_rx_stats_rx_frame_size_equal_64_reg extends uvm_reg;

    // Variable: rx_frame_size_equal_64
    // RX Frame size = 64 frames count
    rand uvm_reg_field rx_frame_size_equal_64;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_frame_size_equal_64_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_frame_size_equal_64_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_frame_size_equal_64_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_frame_size_equal_64");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_frame_size_equal_64 = uvm_reg_field::type_id::create("rx_frame_size_equal_64", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_frame_size_equal_64.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_frame_size_equal_64_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_frame_size_equal_64_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_frame_size_equal_64.get_name, rx_frame_size_equal_64.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_frame_size_equal_64_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_frame_size_equal_64_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_frame_size_equal_64_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_frame_size_equal_64_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_frame_size_equal_64_wr: coverpoint r.rx_frame_size_equal_64.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_frame_size_equal_64_rd: coverpoint r.rx_frame_size_equal_64.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_frame_size_equal_64_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_frame_size_equal_64_reg_cover");
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
    static function xgmac_rx_stats_rx_frame_size_equal_64_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_frame_size_equal_64_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_frame_size_equal_64_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_64_lt_frame_size_lt_128_reg_cover;

// Class: xgmac_rx_stats_rx_64_lt_frame_size_lt_128_reg
// Register xgmac_rx_stats.rx_64_lt_frame_size_lt_128: RX_64_lt_Frame_size_lt_128
class xgmac_rx_stats_rx_64_lt_frame_size_lt_128_reg extends uvm_reg;

    // Variable: rx_64_lt_frame_size_lt_128
    // RX 64 &lt; Frame size &lt; 128 frames count
    rand uvm_reg_field rx_64_lt_frame_size_lt_128;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_64_lt_frame_size_lt_128_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_64_lt_frame_size_lt_128_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_64_lt_frame_size_lt_128_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_64_lt_frame_size_lt_128");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_64_lt_frame_size_lt_128 = uvm_reg_field::type_id::create("rx_64_lt_frame_size_lt_128", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_64_lt_frame_size_lt_128.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_64_lt_frame_size_lt_128_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_64_lt_frame_size_lt_128_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_64_lt_frame_size_lt_128.get_name, rx_64_lt_frame_size_lt_128.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_64_lt_frame_size_lt_128_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_64_lt_frame_size_lt_128_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_64_lt_frame_size_lt_128_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_64_lt_frame_size_lt_128_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_64_lt_frame_size_lt_128_wr: coverpoint r.rx_64_lt_frame_size_lt_128.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_64_lt_frame_size_lt_128_rd: coverpoint r.rx_64_lt_frame_size_lt_128.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_64_lt_frame_size_lt_128_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_64_lt_frame_size_lt_128_reg_cover");
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
    static function xgmac_rx_stats_rx_64_lt_frame_size_lt_128_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_64_lt_frame_size_lt_128_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_64_lt_frame_size_lt_128_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_128_lte_frame_size_lt_256_reg_cover;

// Class: xgmac_rx_stats_rx_128_lte_frame_size_lt_256_reg
// Register xgmac_rx_stats.rx_128_lte_frame_size_lt_256: RX_128_lte_Frame_size_lt_256
class xgmac_rx_stats_rx_128_lte_frame_size_lt_256_reg extends uvm_reg;

    // Variable: rx_128_lte_frame_size_lt_256
    // RX 128 &lt;= Frame size &lt; 256 frames count
    rand uvm_reg_field rx_128_lte_frame_size_lt_256;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_128_lte_frame_size_lt_256_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_128_lte_frame_size_lt_256_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_128_lte_frame_size_lt_256_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_128_lte_frame_size_lt_256");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_128_lte_frame_size_lt_256 = uvm_reg_field::type_id::create("rx_128_lte_frame_size_lt_256", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_128_lte_frame_size_lt_256.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_128_lte_frame_size_lt_256_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_128_lte_frame_size_lt_256_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_128_lte_frame_size_lt_256.get_name, rx_128_lte_frame_size_lt_256.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_128_lte_frame_size_lt_256_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_128_lte_frame_size_lt_256_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_128_lte_frame_size_lt_256_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_128_lte_frame_size_lt_256_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_128_lte_frame_size_lt_256_wr: coverpoint r.rx_128_lte_frame_size_lt_256.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_128_lte_frame_size_lt_256_rd: coverpoint r.rx_128_lte_frame_size_lt_256.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_128_lte_frame_size_lt_256_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_128_lte_frame_size_lt_256_reg_cover");
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
    static function xgmac_rx_stats_rx_128_lte_frame_size_lt_256_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_128_lte_frame_size_lt_256_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_128_lte_frame_size_lt_256_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_256_lte_frame_size_lt_512_reg_cover;

// Class: xgmac_rx_stats_rx_256_lte_frame_size_lt_512_reg
// Register xgmac_rx_stats.rx_256_lte_frame_size_lt_512: RX_256_lte_Frame_size_lt_512
class xgmac_rx_stats_rx_256_lte_frame_size_lt_512_reg extends uvm_reg;

    // Variable: rx_256_lte_frame_size_lt_512
    // RX 256 &lt;= Frame size &lt; 512 frames count
    rand uvm_reg_field rx_256_lte_frame_size_lt_512;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_256_lte_frame_size_lt_512_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_256_lte_frame_size_lt_512_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_256_lte_frame_size_lt_512_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_256_lte_frame_size_lt_512");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_256_lte_frame_size_lt_512 = uvm_reg_field::type_id::create("rx_256_lte_frame_size_lt_512", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_256_lte_frame_size_lt_512.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_256_lte_frame_size_lt_512_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_256_lte_frame_size_lt_512_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_256_lte_frame_size_lt_512.get_name, rx_256_lte_frame_size_lt_512.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_256_lte_frame_size_lt_512_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_256_lte_frame_size_lt_512_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_256_lte_frame_size_lt_512_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_256_lte_frame_size_lt_512_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_256_lte_frame_size_lt_512_wr: coverpoint r.rx_256_lte_frame_size_lt_512.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_256_lte_frame_size_lt_512_rd: coverpoint r.rx_256_lte_frame_size_lt_512.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_256_lte_frame_size_lt_512_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_256_lte_frame_size_lt_512_reg_cover");
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
    static function xgmac_rx_stats_rx_256_lte_frame_size_lt_512_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_256_lte_frame_size_lt_512_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_256_lte_frame_size_lt_512_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_512_lte_frame_size_lt_1024_reg_cover;

// Class: xgmac_rx_stats_rx_512_lte_frame_size_lt_1024_reg
// Register xgmac_rx_stats.rx_512_lte_frame_size_lt_1024: RX_512_lte_Frame_size_lt_1024
class xgmac_rx_stats_rx_512_lte_frame_size_lt_1024_reg extends uvm_reg;

    // Variable: rx_512_lte_frame_size_lt_1024
    // RX 512 &lt;= Frame size &lt; 1024 frames count
    rand uvm_reg_field rx_512_lte_frame_size_lt_1024;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_512_lte_frame_size_lt_1024_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_512_lte_frame_size_lt_1024_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_512_lte_frame_size_lt_1024_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_512_lte_frame_size_lt_1024");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_512_lte_frame_size_lt_1024 = uvm_reg_field::type_id::create("rx_512_lte_frame_size_lt_1024", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_512_lte_frame_size_lt_1024.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_512_lte_frame_size_lt_1024_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_512_lte_frame_size_lt_1024_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_512_lte_frame_size_lt_1024.get_name, rx_512_lte_frame_size_lt_1024.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_512_lte_frame_size_lt_1024_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_512_lte_frame_size_lt_1024_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_512_lte_frame_size_lt_1024_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_512_lte_frame_size_lt_1024_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_512_lte_frame_size_lt_1024_wr: coverpoint r.rx_512_lte_frame_size_lt_1024.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_512_lte_frame_size_lt_1024_rd: coverpoint r.rx_512_lte_frame_size_lt_1024.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_512_lte_frame_size_lt_1024_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_512_lte_frame_size_lt_1024_reg_cover");
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
    static function xgmac_rx_stats_rx_512_lte_frame_size_lt_1024_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_512_lte_frame_size_lt_1024_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_512_lte_frame_size_lt_1024_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_1024_lte_frame_size_lt_1518_reg_cover;

// Class: xgmac_rx_stats_rx_1024_lte_frame_size_lt_1518_reg
// Register xgmac_rx_stats.rx_1024_lte_frame_size_lt_1518: RX_1024_lte_Frame_size_lt_1518
class xgmac_rx_stats_rx_1024_lte_frame_size_lt_1518_reg extends uvm_reg;

    // Variable: rx_1024_lte_frame_size_lt_1518
    // RX 1024 &lt;= Frame size &lt; 1518 frames count
    rand uvm_reg_field rx_1024_lte_frame_size_lt_1518;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_1024_lte_frame_size_lt_1518_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_1024_lte_frame_size_lt_1518_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_1024_lte_frame_size_lt_1518_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_1024_lte_frame_size_lt_1518");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_1024_lte_frame_size_lt_1518 = uvm_reg_field::type_id::create("rx_1024_lte_frame_size_lt_1518", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_1024_lte_frame_size_lt_1518.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_1024_lte_frame_size_lt_1518_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_1024_lte_frame_size_lt_1518_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_1024_lte_frame_size_lt_1518.get_name, rx_1024_lte_frame_size_lt_1518.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_1024_lte_frame_size_lt_1518_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_1024_lte_frame_size_lt_1518_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_1024_lte_frame_size_lt_1518_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_1024_lte_frame_size_lt_1518_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_1024_lte_frame_size_lt_1518_wr: coverpoint r.rx_1024_lte_frame_size_lt_1518.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_1024_lte_frame_size_lt_1518_rd: coverpoint r.rx_1024_lte_frame_size_lt_1518.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_1024_lte_frame_size_lt_1518_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_1024_lte_frame_size_lt_1518_reg_cover");
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
    static function xgmac_rx_stats_rx_1024_lte_frame_size_lt_1518_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_1024_lte_frame_size_lt_1518_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_1024_lte_frame_size_lt_1518_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_1518_lte_frame_size_lt_2048_reg_cover;

// Class: xgmac_rx_stats_rx_1518_lte_frame_size_lt_2048_reg
// Register xgmac_rx_stats.rx_1518_lte_frame_size_lt_2048: RX_1518_lte_Frame_size_lt_2048
class xgmac_rx_stats_rx_1518_lte_frame_size_lt_2048_reg extends uvm_reg;

    // Variable: rx_1518_lte_frame_size_lt_2048
    // RX 1518 &lt;= Frame size &lt; 2048 frames count
    rand uvm_reg_field rx_1518_lte_frame_size_lt_2048;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_1518_lte_frame_size_lt_2048_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_1518_lte_frame_size_lt_2048_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_1518_lte_frame_size_lt_2048_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_1518_lte_frame_size_lt_2048");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_1518_lte_frame_size_lt_2048 = uvm_reg_field::type_id::create("rx_1518_lte_frame_size_lt_2048", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_1518_lte_frame_size_lt_2048.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_1518_lte_frame_size_lt_2048_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_1518_lte_frame_size_lt_2048_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_1518_lte_frame_size_lt_2048.get_name, rx_1518_lte_frame_size_lt_2048.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_1518_lte_frame_size_lt_2048_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_1518_lte_frame_size_lt_2048_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_1518_lte_frame_size_lt_2048_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_1518_lte_frame_size_lt_2048_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_1518_lte_frame_size_lt_2048_wr: coverpoint r.rx_1518_lte_frame_size_lt_2048.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_1518_lte_frame_size_lt_2048_rd: coverpoint r.rx_1518_lte_frame_size_lt_2048.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_1518_lte_frame_size_lt_2048_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_1518_lte_frame_size_lt_2048_reg_cover");
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
    static function xgmac_rx_stats_rx_1518_lte_frame_size_lt_2048_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_1518_lte_frame_size_lt_2048_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_1518_lte_frame_size_lt_2048_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_2048_lte_frame_size_lt_4096_reg_cover;

// Class: xgmac_rx_stats_rx_2048_lte_frame_size_lt_4096_reg
// Register xgmac_rx_stats.rx_2048_lte_frame_size_lt_4096: RX_2048_lte_Frame_size_lt_4096
class xgmac_rx_stats_rx_2048_lte_frame_size_lt_4096_reg extends uvm_reg;

    // Variable: rx_2048_lte_frame_size_lt_4096
    // RX 2048 &lt;= Frame size &lt; 4096 frames count
    rand uvm_reg_field rx_2048_lte_frame_size_lt_4096;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_2048_lte_frame_size_lt_4096_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_2048_lte_frame_size_lt_4096_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_2048_lte_frame_size_lt_4096_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_2048_lte_frame_size_lt_4096");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_2048_lte_frame_size_lt_4096 = uvm_reg_field::type_id::create("rx_2048_lte_frame_size_lt_4096", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_2048_lte_frame_size_lt_4096.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_2048_lte_frame_size_lt_4096_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_2048_lte_frame_size_lt_4096_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_2048_lte_frame_size_lt_4096.get_name, rx_2048_lte_frame_size_lt_4096.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_2048_lte_frame_size_lt_4096_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_2048_lte_frame_size_lt_4096_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_2048_lte_frame_size_lt_4096_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_2048_lte_frame_size_lt_4096_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_2048_lte_frame_size_lt_4096_wr: coverpoint r.rx_2048_lte_frame_size_lt_4096.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_2048_lte_frame_size_lt_4096_rd: coverpoint r.rx_2048_lte_frame_size_lt_4096.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_2048_lte_frame_size_lt_4096_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_2048_lte_frame_size_lt_4096_reg_cover");
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
    static function xgmac_rx_stats_rx_2048_lte_frame_size_lt_4096_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_2048_lte_frame_size_lt_4096_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_2048_lte_frame_size_lt_4096_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_4096_lte_frame_size_lt_8192_reg_cover;

// Class: xgmac_rx_stats_rx_4096_lte_frame_size_lt_8192_reg
// Register xgmac_rx_stats.rx_4096_lte_frame_size_lt_8192: RX_4096_lte_Frame_size_lt_8192
class xgmac_rx_stats_rx_4096_lte_frame_size_lt_8192_reg extends uvm_reg;

    // Variable: rx_4096_lte_frame_size_lt_8192
    // RX 4096 &lt;= Frame size &lt; 8192 frames count
    rand uvm_reg_field rx_4096_lte_frame_size_lt_8192;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_4096_lte_frame_size_lt_8192_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_4096_lte_frame_size_lt_8192_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_4096_lte_frame_size_lt_8192_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_4096_lte_frame_size_lt_8192");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_4096_lte_frame_size_lt_8192 = uvm_reg_field::type_id::create("rx_4096_lte_frame_size_lt_8192", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_4096_lte_frame_size_lt_8192.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_4096_lte_frame_size_lt_8192_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_4096_lte_frame_size_lt_8192_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_4096_lte_frame_size_lt_8192.get_name, rx_4096_lte_frame_size_lt_8192.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_4096_lte_frame_size_lt_8192_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_4096_lte_frame_size_lt_8192_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_4096_lte_frame_size_lt_8192_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_4096_lte_frame_size_lt_8192_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_4096_lte_frame_size_lt_8192_wr: coverpoint r.rx_4096_lte_frame_size_lt_8192.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_4096_lte_frame_size_lt_8192_rd: coverpoint r.rx_4096_lte_frame_size_lt_8192.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_4096_lte_frame_size_lt_8192_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_4096_lte_frame_size_lt_8192_reg_cover");
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
    static function xgmac_rx_stats_rx_4096_lte_frame_size_lt_8192_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_4096_lte_frame_size_lt_8192_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_4096_lte_frame_size_lt_8192_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_8192_lte_frame_size_reg_cover;

// Class: xgmac_rx_stats_rx_8192_lte_frame_size_reg
// Register xgmac_rx_stats.rx_8192_lte_frame_size: RX_8192_lte_Frame_size
class xgmac_rx_stats_rx_8192_lte_frame_size_reg extends uvm_reg;

    // Variable: rx_8192_lte_frame_size
    // RX 8192 &lt;= Frame size frames count
    rand uvm_reg_field rx_8192_lte_frame_size;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_8192_lte_frame_size_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_8192_lte_frame_size_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_8192_lte_frame_size_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_8192_lte_frame_size");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_8192_lte_frame_size = uvm_reg_field::type_id::create("rx_8192_lte_frame_size", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_8192_lte_frame_size.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_8192_lte_frame_size_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_8192_lte_frame_size_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_8192_lte_frame_size.get_name, rx_8192_lte_frame_size.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_8192_lte_frame_size_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_8192_lte_frame_size_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_8192_lte_frame_size_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_8192_lte_frame_size_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_8192_lte_frame_size_wr: coverpoint r.rx_8192_lte_frame_size.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_8192_lte_frame_size_rd: coverpoint r.rx_8192_lte_frame_size.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_8192_lte_frame_size_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_8192_lte_frame_size_reg_cover");
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
    static function xgmac_rx_stats_rx_8192_lte_frame_size_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_8192_lte_frame_size_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_8192_lte_frame_size_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_unicast_accepted_reg_cover;

// Class: xgmac_rx_stats_rx_unicast_accepted_reg
// Register xgmac_rx_stats.rx_unicast_accepted: RX_Unicast_Accepted
class xgmac_rx_stats_rx_unicast_accepted_reg extends uvm_reg;

    // Variable: rx_unicast_accepted
    // RX Unicast accepted frames count
    rand uvm_reg_field rx_unicast_accepted;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_unicast_accepted_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_unicast_accepted_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_unicast_accepted_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_unicast_accepted");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_unicast_accepted = uvm_reg_field::type_id::create("rx_unicast_accepted", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_unicast_accepted.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_unicast_accepted_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_unicast_accepted_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_unicast_accepted.get_name, rx_unicast_accepted.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_unicast_accepted_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_unicast_accepted_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_unicast_accepted_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_unicast_accepted_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_unicast_accepted_wr: coverpoint r.rx_unicast_accepted.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_unicast_accepted_rd: coverpoint r.rx_unicast_accepted.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_unicast_accepted_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_unicast_accepted_reg_cover");
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
    static function xgmac_rx_stats_rx_unicast_accepted_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_unicast_accepted_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_unicast_accepted_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_multicast_accepted_reg_cover;

// Class: xgmac_rx_stats_rx_multicast_accepted_reg
// Register xgmac_rx_stats.rx_multicast_accepted: RX_Multicast_Accepted
class xgmac_rx_stats_rx_multicast_accepted_reg extends uvm_reg;

    // Variable: rx_multicast_accepted
    // RX Multicast accepted (excluding Pause) frames count
    rand uvm_reg_field rx_multicast_accepted;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_multicast_accepted_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_multicast_accepted_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_multicast_accepted_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_multicast_accepted");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_multicast_accepted = uvm_reg_field::type_id::create("rx_multicast_accepted", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_multicast_accepted.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_multicast_accepted_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_multicast_accepted_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_multicast_accepted.get_name, rx_multicast_accepted.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_multicast_accepted_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_multicast_accepted_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_multicast_accepted_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_multicast_accepted_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_multicast_accepted_wr: coverpoint r.rx_multicast_accepted.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_multicast_accepted_rd: coverpoint r.rx_multicast_accepted.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_multicast_accepted_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_multicast_accepted_reg_cover");
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
    static function xgmac_rx_stats_rx_multicast_accepted_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_multicast_accepted_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_multicast_accepted_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_broadcast_accepted_reg_cover;

// Class: xgmac_rx_stats_rx_broadcast_accepted_reg
// Register xgmac_rx_stats.rx_broadcast_accepted: RX_Broadcast_Accepted
class xgmac_rx_stats_rx_broadcast_accepted_reg extends uvm_reg;

    // Variable: rx_broadcast_accepted
    // RX Broadcast accepted frames count
    rand uvm_reg_field rx_broadcast_accepted;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_broadcast_accepted_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_broadcast_accepted_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_broadcast_accepted_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_broadcast_accepted");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_broadcast_accepted = uvm_reg_field::type_id::create("rx_broadcast_accepted", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_broadcast_accepted.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_broadcast_accepted_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_broadcast_accepted_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_broadcast_accepted.get_name, rx_broadcast_accepted.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_broadcast_accepted_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_broadcast_accepted_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_broadcast_accepted_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_broadcast_accepted_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_broadcast_accepted_wr: coverpoint r.rx_broadcast_accepted.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_broadcast_accepted_rd: coverpoint r.rx_broadcast_accepted.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_broadcast_accepted_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_broadcast_accepted_reg_cover");
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
    static function xgmac_rx_stats_rx_broadcast_accepted_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_broadcast_accepted_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_broadcast_accepted_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_unicast_filtered_reg_cover;

// Class: xgmac_rx_stats_rx_unicast_filtered_reg
// Register xgmac_rx_stats.rx_unicast_filtered: RX_Unicast_Filtered
class xgmac_rx_stats_rx_unicast_filtered_reg extends uvm_reg;

    // Variable: rx_unicast_filtered
    // RX Unicast filtered frames count
    rand uvm_reg_field rx_unicast_filtered;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_unicast_filtered_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_unicast_filtered_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_unicast_filtered_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_unicast_filtered");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_unicast_filtered = uvm_reg_field::type_id::create("rx_unicast_filtered", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_unicast_filtered.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_unicast_filtered_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_unicast_filtered_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_unicast_filtered.get_name, rx_unicast_filtered.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_unicast_filtered_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_unicast_filtered_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_unicast_filtered_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_unicast_filtered_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_unicast_filtered_wr: coverpoint r.rx_unicast_filtered.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_unicast_filtered_rd: coverpoint r.rx_unicast_filtered.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_unicast_filtered_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_unicast_filtered_reg_cover");
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
    static function xgmac_rx_stats_rx_unicast_filtered_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_unicast_filtered_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_unicast_filtered_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_multicast_filtered_reg_cover;

// Class: xgmac_rx_stats_rx_multicast_filtered_reg
// Register xgmac_rx_stats.rx_multicast_filtered: RX_Multicast_Filtered
class xgmac_rx_stats_rx_multicast_filtered_reg extends uvm_reg;

    // Variable: rx_multicast_filtered
    // RX Multicast filtered (excluding Pause) frames count
    rand uvm_reg_field rx_multicast_filtered;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_multicast_filtered_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_multicast_filtered_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_multicast_filtered_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_multicast_filtered");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_multicast_filtered = uvm_reg_field::type_id::create("rx_multicast_filtered", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_multicast_filtered.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_multicast_filtered_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_multicast_filtered_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_multicast_filtered.get_name, rx_multicast_filtered.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_multicast_filtered_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_multicast_filtered_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_multicast_filtered_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_multicast_filtered_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_multicast_filtered_wr: coverpoint r.rx_multicast_filtered.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_multicast_filtered_rd: coverpoint r.rx_multicast_filtered.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_multicast_filtered_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_multicast_filtered_reg_cover");
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
    static function xgmac_rx_stats_rx_multicast_filtered_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_multicast_filtered_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_multicast_filtered_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_broadcast_filtered_reg_cover;

// Class: xgmac_rx_stats_rx_broadcast_filtered_reg
// Register xgmac_rx_stats.rx_broadcast_filtered: RX_Broadcast_Filtered
class xgmac_rx_stats_rx_broadcast_filtered_reg extends uvm_reg;

    // Variable: rx_broadcast_filtered
    // RX Broadcast accepted frames count
    rand uvm_reg_field rx_broadcast_filtered;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_broadcast_filtered_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_broadcast_filtered_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_broadcast_filtered_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_broadcast_filtered");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_broadcast_filtered = uvm_reg_field::type_id::create("rx_broadcast_filtered", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_broadcast_filtered.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_broadcast_filtered_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_broadcast_filtered_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_broadcast_filtered.get_name, rx_broadcast_filtered.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_broadcast_filtered_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_broadcast_filtered_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_broadcast_filtered_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_broadcast_filtered_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_broadcast_filtered_wr: coverpoint r.rx_broadcast_filtered.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_broadcast_filtered_rd: coverpoint r.rx_broadcast_filtered.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_broadcast_filtered_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_broadcast_filtered_reg_cover");
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
    static function xgmac_rx_stats_rx_broadcast_filtered_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_broadcast_filtered_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_broadcast_filtered_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_pause_multicast_reg_cover;

// Class: xgmac_rx_stats_rx_pause_multicast_reg
// Register xgmac_rx_stats.rx_pause_multicast: RX_Pause_Multicast
class xgmac_rx_stats_rx_pause_multicast_reg extends uvm_reg;

    // Variable: rx_pause_multicast
    // RX Pause Multicast frames count
    rand uvm_reg_field rx_pause_multicast;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_pause_multicast_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_pause_multicast_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_pause_multicast_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_pause_multicast");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_pause_multicast = uvm_reg_field::type_id::create("rx_pause_multicast", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_pause_multicast.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_pause_multicast_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_pause_multicast_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_pause_multicast.get_name, rx_pause_multicast.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_pause_multicast_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_pause_multicast_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_pause_multicast_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_pause_multicast_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_pause_multicast_wr: coverpoint r.rx_pause_multicast.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_pause_multicast_rd: coverpoint r.rx_pause_multicast.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_pause_multicast_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_pause_multicast_reg_cover");
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
    static function xgmac_rx_stats_rx_pause_multicast_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_pause_multicast_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_pause_multicast_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_vlan_x8100_good_reg_cover;

// Class: xgmac_rx_stats_rx_vlan_x8100_good_reg
// Register xgmac_rx_stats.rx_vlan_x8100_good: RX_VLAN_x8100_Good
class xgmac_rx_stats_rx_vlan_x8100_good_reg extends uvm_reg;

    // Variable: rx_vlan_x8100_good
    // RX VLAN x8100 Good frames count
    rand uvm_reg_field rx_vlan_x8100_good;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_vlan_x8100_good_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_vlan_x8100_good_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_vlan_x8100_good_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_vlan_x8100_good");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_vlan_x8100_good = uvm_reg_field::type_id::create("rx_vlan_x8100_good", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_vlan_x8100_good.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_vlan_x8100_good_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_vlan_x8100_good_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_vlan_x8100_good.get_name, rx_vlan_x8100_good.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_vlan_x8100_good_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_vlan_x8100_good_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_vlan_x8100_good_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_vlan_x8100_good_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_vlan_x8100_good_wr: coverpoint r.rx_vlan_x8100_good.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_vlan_x8100_good_rd: coverpoint r.rx_vlan_x8100_good.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_vlan_x8100_good_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_vlan_x8100_good_reg_cover");
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
    static function xgmac_rx_stats_rx_vlan_x8100_good_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_vlan_x8100_good_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_vlan_x8100_good_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_vlan_second_vlan_ethertype_good_reg_cover;

// Class: xgmac_rx_stats_rx_vlan_second_vlan_ethertype_good_reg
// Register xgmac_rx_stats.rx_vlan_second_vlan_ethertype_good: RX_VLAN_Second_VLAN_Ethertype_Good
class xgmac_rx_stats_rx_vlan_second_vlan_ethertype_good_reg extends uvm_reg;

    // Variable: rx_vlan_second_vlan_ethertype_good
    // RX VLAN (Second VLAN Ethertype) Good frames count
    rand uvm_reg_field rx_vlan_second_vlan_ethertype_good;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_vlan_second_vlan_ethertype_good_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_vlan_second_vlan_ethertype_good_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_vlan_second_vlan_ethertype_good_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_vlan_second_vlan_ethertype_good");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_vlan_second_vlan_ethertype_good = uvm_reg_field::type_id::create("rx_vlan_second_vlan_ethertype_good", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_vlan_second_vlan_ethertype_good.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_vlan_second_vlan_ethertype_good_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_vlan_second_vlan_ethertype_good_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_vlan_second_vlan_ethertype_good.get_name, rx_vlan_second_vlan_ethertype_good.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_vlan_second_vlan_ethertype_good_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_vlan_second_vlan_ethertype_good_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_vlan_second_vlan_ethertype_good_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_vlan_second_vlan_ethertype_good_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_vlan_second_vlan_ethertype_good_wr: coverpoint r.rx_vlan_second_vlan_ethertype_good.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_vlan_second_vlan_ethertype_good_rd: coverpoint r.rx_vlan_second_vlan_ethertype_good.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_vlan_second_vlan_ethertype_good_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_vlan_second_vlan_ethertype_good_reg_cover");
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
    static function xgmac_rx_stats_rx_vlan_second_vlan_ethertype_good_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_vlan_second_vlan_ethertype_good_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_vlan_second_vlan_ethertype_good_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_stack_vlan_x8100_good_reg_cover;

// Class: xgmac_rx_stats_rx_stack_vlan_x8100_good_reg
// Register xgmac_rx_stats.rx_stack_vlan_x8100_good: RX_Stack_VLAN_x8100_Good
class xgmac_rx_stats_rx_stack_vlan_x8100_good_reg extends uvm_reg;

    // Variable: rx_stack_vlan_x8100_good
    // RX Stack VLAN x8100  Good frames count
    rand uvm_reg_field rx_stack_vlan_x8100_good;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_stack_vlan_x8100_good_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_stack_vlan_x8100_good_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_stack_vlan_x8100_good_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_stack_vlan_x8100_good");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_stack_vlan_x8100_good = uvm_reg_field::type_id::create("rx_stack_vlan_x8100_good", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_stack_vlan_x8100_good.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_stack_vlan_x8100_good_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_stack_vlan_x8100_good_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_stack_vlan_x8100_good.get_name, rx_stack_vlan_x8100_good.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_stack_vlan_x8100_good_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_stack_vlan_x8100_good_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_stack_vlan_x8100_good_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_stack_vlan_x8100_good_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_stack_vlan_x8100_good_wr: coverpoint r.rx_stack_vlan_x8100_good.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_stack_vlan_x8100_good_rd: coverpoint r.rx_stack_vlan_x8100_good.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_stack_vlan_x8100_good_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_stack_vlan_x8100_good_reg_cover");
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
    static function xgmac_rx_stats_rx_stack_vlan_x8100_good_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_stack_vlan_x8100_good_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_stack_vlan_x8100_good_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_stack_vlan_second_vlan_ethertype_good_reg_cover;

// Class: xgmac_rx_stats_rx_stack_vlan_second_vlan_ethertype_good_reg
// Register xgmac_rx_stats.rx_stack_vlan_second_vlan_ethertype_good: RX_Stack_VLAN_Second_VLAN_Ethertype_Good
class xgmac_rx_stats_rx_stack_vlan_second_vlan_ethertype_good_reg extends uvm_reg;

    // Variable: rx_stack_vlan_second_vlan_ethertype_good
    // RX Stack VLAN (Second VLAN Ethertype) Good frames count
    rand uvm_reg_field rx_stack_vlan_second_vlan_ethertype_good;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_stack_vlan_second_vlan_ethertype_good_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_stack_vlan_second_vlan_ethertype_good_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_stack_vlan_second_vlan_ethertype_good_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_stack_vlan_second_vlan_ethertype_good");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_stack_vlan_second_vlan_ethertype_good = uvm_reg_field::type_id::create("rx_stack_vlan_second_vlan_ethertype_good", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_stack_vlan_second_vlan_ethertype_good.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_stack_vlan_second_vlan_ethertype_good_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_stack_vlan_second_vlan_ethertype_good_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_stack_vlan_second_vlan_ethertype_good.get_name, rx_stack_vlan_second_vlan_ethertype_good.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_stack_vlan_second_vlan_ethertype_good_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_stack_vlan_second_vlan_ethertype_good_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_stack_vlan_second_vlan_ethertype_good_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_stack_vlan_second_vlan_ethertype_good_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_stack_vlan_second_vlan_ethertype_good_wr: coverpoint r.rx_stack_vlan_second_vlan_ethertype_good.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_stack_vlan_second_vlan_ethertype_good_rd: coverpoint r.rx_stack_vlan_second_vlan_ethertype_good.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_stack_vlan_second_vlan_ethertype_good_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_stack_vlan_second_vlan_ethertype_good_reg_cover");
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
    static function xgmac_rx_stats_rx_stack_vlan_second_vlan_ethertype_good_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_stack_vlan_second_vlan_ethertype_good_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_stack_vlan_second_vlan_ethertype_good_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_octets_good_reg_cover;

// Class: xgmac_rx_stats_rx_octets_good_reg
// Register xgmac_rx_stats.rx_octets_good: RX_Octets_Good
class xgmac_rx_stats_rx_octets_good_reg extends uvm_reg;

    // Variable: rx_octets_good
    // RX Good frames bytes count
    rand uvm_reg_field rx_octets_good;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_octets_good_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_octets_good_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_octets_good_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_octets_good");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_octets_good = uvm_reg_field::type_id::create("rx_octets_good", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_octets_good.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_octets_good_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_octets_good_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_octets_good.get_name, rx_octets_good.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_octets_good_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_octets_good_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_octets_good_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_octets_good_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_octets_good_wr: coverpoint r.rx_octets_good.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_octets_good_rd: coverpoint r.rx_octets_good.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_octets_good_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_octets_good_reg_cover");
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
    static function xgmac_rx_stats_rx_octets_good_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_octets_good_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_octets_good_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_octets_bad_reg_cover;

// Class: xgmac_rx_stats_rx_octets_bad_reg
// Register xgmac_rx_stats.rx_octets_bad: RX_Octets_Bad
class xgmac_rx_stats_rx_octets_bad_reg extends uvm_reg;

    // Variable: rx_octets_bad
    // RX Bad frames bytes count
    rand uvm_reg_field rx_octets_bad;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_octets_bad_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_octets_bad_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_octets_bad_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_octets_bad");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_octets_bad = uvm_reg_field::type_id::create("rx_octets_bad", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_octets_bad.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_octets_bad_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_octets_bad_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_octets_bad.get_name, rx_octets_bad.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_octets_bad_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_octets_bad_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_octets_bad_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_octets_bad_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_octets_bad_wr: coverpoint r.rx_octets_bad.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_octets_bad_rd: coverpoint r.rx_octets_bad.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_octets_bad_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_octets_bad_reg_cover");
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
    static function xgmac_rx_stats_rx_octets_bad_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_octets_bad_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_octets_bad_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_large_good_reg_cover;

// Class: xgmac_rx_stats_rx_large_good_reg
// Register xgmac_rx_stats.rx_large_good: RX_large_Good
class xgmac_rx_stats_rx_large_good_reg extends uvm_reg;

    // Variable: rx_large_good
    // RX large_Good frames count
    rand uvm_reg_field rx_large_good;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_large_good_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_large_good_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_large_good_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_large_good");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_large_good = uvm_reg_field::type_id::create("rx_large_good", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_large_good.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_large_good_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_large_good_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_large_good.get_name, rx_large_good.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_large_good_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_large_good_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_large_good_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_large_good_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_large_good_wr: coverpoint r.rx_large_good.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_large_good_rd: coverpoint r.rx_large_good.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_large_good_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_large_good_reg_cover");
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
    static function xgmac_rx_stats_rx_large_good_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_large_good_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_large_good_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_large_bad_reg_cover;

// Class: xgmac_rx_stats_rx_large_bad_reg
// Register xgmac_rx_stats.rx_large_bad: RX_large_Bad
class xgmac_rx_stats_rx_large_bad_reg extends uvm_reg;

    // Variable: rx_large_bad
    // RX large_Bad frames count
    rand uvm_reg_field rx_large_bad;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_large_bad_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_large_bad_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_large_bad_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_large_bad");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_large_bad = uvm_reg_field::type_id::create("rx_large_bad", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_large_bad.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_large_bad_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_large_bad_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_large_bad.get_name, rx_large_bad.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_large_bad_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_large_bad_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_large_bad_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_large_bad_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_large_bad_wr: coverpoint r.rx_large_bad.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_large_bad_rd: coverpoint r.rx_large_bad.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_large_bad_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_large_bad_reg_cover");
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
    static function xgmac_rx_stats_rx_large_bad_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_large_bad_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_large_bad_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_long_good_reg_cover;

// Class: xgmac_rx_stats_rx_long_good_reg
// Register xgmac_rx_stats.rx_long_good: RX_Long_Good
class xgmac_rx_stats_rx_long_good_reg extends uvm_reg;

    // Variable: rx_long_good
    // RX Good frames with MRU &lt; Frame size frames count
    rand uvm_reg_field rx_long_good;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_long_good_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_long_good_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_long_good_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_long_good");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_long_good = uvm_reg_field::type_id::create("rx_long_good", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_long_good.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_long_good_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_long_good_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_long_good.get_name, rx_long_good.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_long_good_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_long_good_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_long_good_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_long_good_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_long_good_wr: coverpoint r.rx_long_good.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_long_good_rd: coverpoint r.rx_long_good.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_long_good_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_long_good_reg_cover");
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
    static function xgmac_rx_stats_rx_long_good_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_long_good_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_long_good_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_long_bad_reg_cover;

// Class: xgmac_rx_stats_rx_long_bad_reg
// Register xgmac_rx_stats.rx_long_bad: RX_Long_Bad
class xgmac_rx_stats_rx_long_bad_reg extends uvm_reg;

    // Variable: rx_long_bad
    // RX Bad frames with MRU &lt; Frame size (Jabbers) frames count
    rand uvm_reg_field rx_long_bad;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_long_bad_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_long_bad_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_long_bad_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_long_bad");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_long_bad = uvm_reg_field::type_id::create("rx_long_bad", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_long_bad.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_long_bad_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_long_bad_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_long_bad.get_name, rx_long_bad.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_long_bad_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_long_bad_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_long_bad_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_long_bad_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_long_bad_wr: coverpoint r.rx_long_bad.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_long_bad_rd: coverpoint r.rx_long_bad.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_long_bad_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_long_bad_reg_cover");
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
    static function xgmac_rx_stats_rx_long_bad_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_long_bad_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_long_bad_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_mru_lt_length_802_3_field_reg_cover;

// Class: xgmac_rx_stats_rx_mru_lt_length_802_3_field_reg
// Register xgmac_rx_stats.rx_mru_lt_length_802_3_field: RX_MRU_lt_Length_802_3_field
class xgmac_rx_stats_rx_mru_lt_length_802_3_field_reg extends uvm_reg;

    // Variable: rx_mru_lt_length_802_3_field
    // RX 802_3 length field higher than MRU frames count
    rand uvm_reg_field rx_mru_lt_length_802_3_field;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_mru_lt_length_802_3_field_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_mru_lt_length_802_3_field_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_mru_lt_length_802_3_field_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_mru_lt_length_802_3_field");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_mru_lt_length_802_3_field = uvm_reg_field::type_id::create("rx_mru_lt_length_802_3_field", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_mru_lt_length_802_3_field.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_mru_lt_length_802_3_field_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_mru_lt_length_802_3_field_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_mru_lt_length_802_3_field.get_name, rx_mru_lt_length_802_3_field.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_mru_lt_length_802_3_field_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_mru_lt_length_802_3_field_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_mru_lt_length_802_3_field_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_mru_lt_length_802_3_field_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_mru_lt_length_802_3_field_wr: coverpoint r.rx_mru_lt_length_802_3_field.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_mru_lt_length_802_3_field_rd: coverpoint r.rx_mru_lt_length_802_3_field.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_mru_lt_length_802_3_field_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_mru_lt_length_802_3_field_reg_cover");
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
    static function xgmac_rx_stats_rx_mru_lt_length_802_3_field_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_mru_lt_length_802_3_field_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_mru_lt_length_802_3_field_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_frame_size_lt_length_802_3_field_reg_cover;

// Class: xgmac_rx_stats_rx_frame_size_lt_length_802_3_field_reg
// Register xgmac_rx_stats.rx_frame_size_lt_length_802_3_field: RX_Frame_size_lt_Length_802_3_field
class xgmac_rx_stats_rx_frame_size_lt_length_802_3_field_reg extends uvm_reg;

    // Variable: rx_frame_size_lt_length_802_3_field
    // RX 802_3 length field higher than frame size received frames count
    rand uvm_reg_field rx_frame_size_lt_length_802_3_field;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_frame_size_lt_length_802_3_field_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_frame_size_lt_length_802_3_field_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_frame_size_lt_length_802_3_field_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_frame_size_lt_length_802_3_field");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_frame_size_lt_length_802_3_field = uvm_reg_field::type_id::create("rx_frame_size_lt_length_802_3_field", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_frame_size_lt_length_802_3_field.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_frame_size_lt_length_802_3_field_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_frame_size_lt_length_802_3_field_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_frame_size_lt_length_802_3_field.get_name, rx_frame_size_lt_length_802_3_field.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_frame_size_lt_length_802_3_field_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_frame_size_lt_length_802_3_field_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_frame_size_lt_length_802_3_field_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_frame_size_lt_length_802_3_field_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_frame_size_lt_length_802_3_field_wr: coverpoint r.rx_frame_size_lt_length_802_3_field.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_frame_size_lt_length_802_3_field_rd: coverpoint r.rx_frame_size_lt_length_802_3_field.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_frame_size_lt_length_802_3_field_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_frame_size_lt_length_802_3_field_reg_cover");
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
    static function xgmac_rx_stats_rx_frame_size_lt_length_802_3_field_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_frame_size_lt_length_802_3_field_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_frame_size_lt_length_802_3_field_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_length_802_3_field_lt_frame_size_reg_cover;

// Class: xgmac_rx_stats_rx_length_802_3_field_lt_frame_size_reg
// Register xgmac_rx_stats.rx_length_802_3_field_lt_frame_size: RX_Length_802_3_field_lt_Frame_size
class xgmac_rx_stats_rx_length_802_3_field_lt_frame_size_reg extends uvm_reg;

    // Variable: rx_length_802_3_field_lt_frame_size
    // RX 802_3 length field lower than frame size received (excluding otherwise valid padded frames) frames count
    rand uvm_reg_field rx_length_802_3_field_lt_frame_size;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_length_802_3_field_lt_frame_size_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_length_802_3_field_lt_frame_size_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_length_802_3_field_lt_frame_size_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_length_802_3_field_lt_frame_size");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_length_802_3_field_lt_frame_size = uvm_reg_field::type_id::create("rx_length_802_3_field_lt_frame_size", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_length_802_3_field_lt_frame_size.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_length_802_3_field_lt_frame_size_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_length_802_3_field_lt_frame_size_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_length_802_3_field_lt_frame_size.get_name, rx_length_802_3_field_lt_frame_size.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_length_802_3_field_lt_frame_size_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_length_802_3_field_lt_frame_size_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_length_802_3_field_lt_frame_size_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_length_802_3_field_lt_frame_size_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_length_802_3_field_lt_frame_size_wr: coverpoint r.rx_length_802_3_field_lt_frame_size.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_length_802_3_field_lt_frame_size_rd: coverpoint r.rx_length_802_3_field_lt_frame_size.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_length_802_3_field_lt_frame_size_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_length_802_3_field_lt_frame_size_reg_cover");
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
    static function xgmac_rx_stats_rx_length_802_3_field_lt_frame_size_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_length_802_3_field_lt_frame_size_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_length_802_3_field_lt_frame_size_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_fifo_error_reg_cover;

// Class: xgmac_rx_stats_rx_fifo_error_reg
// Register xgmac_rx_stats.rx_fifo_error: RX_FIFO_Error
class xgmac_rx_stats_rx_fifo_error_reg extends uvm_reg;

    // Variable: rx_fifo_error
    // RX FIFO Error count
    rand uvm_reg_field rx_fifo_error;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_fifo_error_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_fifo_error_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_fifo_error_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_fifo_error");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_fifo_error = uvm_reg_field::type_id::create("rx_fifo_error", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_fifo_error.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_fifo_error_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_fifo_error_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_fifo_error.get_name, rx_fifo_error.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_fifo_error_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_fifo_error_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_fifo_error_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_fifo_error_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_fifo_error_wr: coverpoint r.rx_fifo_error.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_fifo_error_rd: coverpoint r.rx_fifo_error.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_fifo_error_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_fifo_error_reg_cover");
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
    static function xgmac_rx_stats_rx_fifo_error_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_fifo_error_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_fifo_error_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_fcs_inv_error_reg_cover;

// Class: xgmac_rx_stats_rx_fcs_inv_error_reg
// Register xgmac_rx_stats.rx_fcs_inv_error: RX_FCS_inv_error
class xgmac_rx_stats_rx_fcs_inv_error_reg extends uvm_reg;

    // Variable: rx_fcs_inv_error
    // RX FCS_inv error
    rand uvm_reg_field rx_fcs_inv_error;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_fcs_inv_error_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_fcs_inv_error_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_fcs_inv_error_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_fcs_inv_error");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_fcs_inv_error = uvm_reg_field::type_id::create("rx_fcs_inv_error", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_fcs_inv_error.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_fcs_inv_error_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_fcs_inv_error_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_fcs_inv_error.get_name, rx_fcs_inv_error.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_fcs_inv_error_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_fcs_inv_error_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_fcs_inv_error_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_fcs_inv_error_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_fcs_inv_error_wr: coverpoint r.rx_fcs_inv_error.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_fcs_inv_error_rd: coverpoint r.rx_fcs_inv_error.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_fcs_inv_error_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_fcs_inv_error_reg_cover");
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
    static function xgmac_rx_stats_rx_fcs_inv_error_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_fcs_inv_error_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_fcs_inv_error_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_fcs_error_reg_cover;

// Class: xgmac_rx_stats_rx_fcs_error_reg
// Register xgmac_rx_stats.rx_fcs_error: RX_FCS_error
class xgmac_rx_stats_rx_fcs_error_reg extends uvm_reg;

    // Variable: rx_fcs_error
    // RX FCS error
    rand uvm_reg_field rx_fcs_error;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_fcs_error_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_fcs_error_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_fcs_error_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_fcs_error");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_fcs_error = uvm_reg_field::type_id::create("rx_fcs_error", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_fcs_error.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_fcs_error_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_fcs_error_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_fcs_error.get_name, rx_fcs_error.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_fcs_error_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_fcs_error_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_fcs_error_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_fcs_error_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_fcs_error_wr: coverpoint r.rx_fcs_error.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_fcs_error_rd: coverpoint r.rx_fcs_error.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_fcs_error_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_fcs_error_reg_cover");
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
    static function xgmac_rx_stats_rx_fcs_error_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_fcs_error_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_fcs_error_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_ctrl_char_equal_xfe_error_reg_cover;

// Class: xgmac_rx_stats_rx_ctrl_char_equal_xfe_error_reg
// Register xgmac_rx_stats.rx_ctrl_char_equal_xfe_error: RX_Ctrl_Char_equal_xFE_error
class xgmac_rx_stats_rx_ctrl_char_equal_xfe_error_reg extends uvm_reg;

    // Variable: rx_ctrl_char_equal_xfe_error
    // RX Ctrl Char = xFE error
    rand uvm_reg_field rx_ctrl_char_equal_xfe_error;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_ctrl_char_equal_xfe_error_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_ctrl_char_equal_xfe_error_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_ctrl_char_equal_xfe_error_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_ctrl_char_equal_xfe_error");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_ctrl_char_equal_xfe_error = uvm_reg_field::type_id::create("rx_ctrl_char_equal_xfe_error", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_ctrl_char_equal_xfe_error.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_ctrl_char_equal_xfe_error_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_ctrl_char_equal_xfe_error_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_ctrl_char_equal_xfe_error.get_name, rx_ctrl_char_equal_xfe_error.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_ctrl_char_equal_xfe_error_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_ctrl_char_equal_xfe_error_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_ctrl_char_equal_xfe_error_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_ctrl_char_equal_xfe_error_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_ctrl_char_equal_xfe_error_wr: coverpoint r.rx_ctrl_char_equal_xfe_error.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_ctrl_char_equal_xfe_error_rd: coverpoint r.rx_ctrl_char_equal_xfe_error.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_ctrl_char_equal_xfe_error_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_ctrl_char_equal_xfe_error_reg_cover");
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
    static function xgmac_rx_stats_rx_ctrl_char_equal_xfe_error_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_ctrl_char_equal_xfe_error_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_ctrl_char_equal_xfe_error_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_unexpected_ctrl_char_reg_cover;

// Class: xgmac_rx_stats_rx_unexpected_ctrl_char_reg
// Register xgmac_rx_stats.rx_unexpected_ctrl_char: RX_Unexpected_Ctrl_Char
class xgmac_rx_stats_rx_unexpected_ctrl_char_reg extends uvm_reg;

    // Variable: rx_unexpected_ctrl_char
    // RX Unexpected Ctrl Char
    rand uvm_reg_field rx_unexpected_ctrl_char;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_unexpected_ctrl_char_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_unexpected_ctrl_char_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_unexpected_ctrl_char_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_unexpected_ctrl_char");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_unexpected_ctrl_char = uvm_reg_field::type_id::create("rx_unexpected_ctrl_char", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_unexpected_ctrl_char.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_unexpected_ctrl_char_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_unexpected_ctrl_char_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_unexpected_ctrl_char.get_name, rx_unexpected_ctrl_char.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_unexpected_ctrl_char_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_unexpected_ctrl_char_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_unexpected_ctrl_char_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_unexpected_ctrl_char_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_unexpected_ctrl_char_wr: coverpoint r.rx_unexpected_ctrl_char.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_unexpected_ctrl_char_rd: coverpoint r.rx_unexpected_ctrl_char.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_unexpected_ctrl_char_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_unexpected_ctrl_char_reg_cover");
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
    static function xgmac_rx_stats_rx_unexpected_ctrl_char_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_unexpected_ctrl_char_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_unexpected_ctrl_char_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_align_error_reg_cover;

// Class: xgmac_rx_stats_rx_align_error_reg
// Register xgmac_rx_stats.rx_align_error: RX_Align_Error
class xgmac_rx_stats_rx_align_error_reg extends uvm_reg;

    // Variable: rx_align_error
    // RX Alignment Error frames count
    rand uvm_reg_field rx_align_error;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_align_error_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_align_error_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_align_error_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_align_error");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_align_error = uvm_reg_field::type_id::create("rx_align_error", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_align_error.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_align_error_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_align_error_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_align_error.get_name, rx_align_error.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_align_error_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_align_error_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_align_error_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_align_error_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_align_error_wr: coverpoint r.rx_align_error.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_align_error_rd: coverpoint r.rx_align_error.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_align_error_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_align_error_reg_cover");
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
    static function xgmac_rx_stats_rx_align_error_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_align_error_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_align_error_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_unexpected_ctrl_char_error_reg_cover;

// Class: xgmac_rx_stats_rx_unexpected_ctrl_char_error_reg
// Register xgmac_rx_stats.rx_unexpected_ctrl_char_error: RX_Unexpected_Ctrl_Char_Error
class xgmac_rx_stats_rx_unexpected_ctrl_char_error_reg extends uvm_reg;

    // Variable: rx_unexpected_ctrl_char_error
    // RX Unexpected Ctrl Char Error
    rand uvm_reg_field rx_unexpected_ctrl_char_error;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_unexpected_ctrl_char_error_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_unexpected_ctrl_char_error_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_unexpected_ctrl_char_error_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_unexpected_ctrl_char_error");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_unexpected_ctrl_char_error = uvm_reg_field::type_id::create("rx_unexpected_ctrl_char_error", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_unexpected_ctrl_char_error.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_unexpected_ctrl_char_error_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_unexpected_ctrl_char_error_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_unexpected_ctrl_char_error.get_name, rx_unexpected_ctrl_char_error.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_unexpected_ctrl_char_error_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_unexpected_ctrl_char_error_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_unexpected_ctrl_char_error_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_unexpected_ctrl_char_error_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_unexpected_ctrl_char_error_wr: coverpoint r.rx_unexpected_ctrl_char_error.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_unexpected_ctrl_char_error_rd: coverpoint r.rx_unexpected_ctrl_char_error.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_unexpected_ctrl_char_error_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_unexpected_ctrl_char_error_reg_cover");
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
    static function xgmac_rx_stats_rx_unexpected_ctrl_char_error_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_unexpected_ctrl_char_error_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_unexpected_ctrl_char_error_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_link_fault_others_reg_cover;

// Class: xgmac_rx_stats_rx_link_fault_others_reg
// Register xgmac_rx_stats.rx_link_fault_others: RX_Link_Fault_others
class xgmac_rx_stats_rx_link_fault_others_reg extends uvm_reg;

    // Variable: rx_link_fault_others
    // RX Link Fault others count
    rand uvm_reg_field rx_link_fault_others;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_link_fault_others_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_link_fault_others_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_link_fault_others_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_link_fault_others");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_link_fault_others = uvm_reg_field::type_id::create("rx_link_fault_others", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_link_fault_others.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_link_fault_others_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_link_fault_others_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_link_fault_others.get_name, rx_link_fault_others.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_link_fault_others_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_link_fault_others_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_link_fault_others_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_link_fault_others_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_link_fault_others_wr: coverpoint r.rx_link_fault_others.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_link_fault_others_rd: coverpoint r.rx_link_fault_others.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_link_fault_others_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_link_fault_others_reg_cover");
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
    static function xgmac_rx_stats_rx_link_fault_others_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_link_fault_others_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_link_fault_others_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_remote_fault_reg_cover;

// Class: xgmac_rx_stats_rx_remote_fault_reg
// Register xgmac_rx_stats.rx_remote_fault: RX_Remote_Fault
class xgmac_rx_stats_rx_remote_fault_reg extends uvm_reg;

    // Variable: rx_remote_fault
    // Remote Fault count
    rand uvm_reg_field rx_remote_fault;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_remote_fault_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_remote_fault_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_remote_fault_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_remote_fault");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_remote_fault = uvm_reg_field::type_id::create("rx_remote_fault", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_remote_fault.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_remote_fault_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_remote_fault_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_remote_fault.get_name, rx_remote_fault.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_remote_fault_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_remote_fault_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_remote_fault_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_remote_fault_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_remote_fault_wr: coverpoint r.rx_remote_fault.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_remote_fault_rd: coverpoint r.rx_remote_fault.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_remote_fault_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_remote_fault_reg_cover");
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
    static function xgmac_rx_stats_rx_remote_fault_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_remote_fault_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_remote_fault_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_local_fault_reg_cover;

// Class: xgmac_rx_stats_rx_local_fault_reg
// Register xgmac_rx_stats.rx_local_fault: RX_Local_Fault
class xgmac_rx_stats_rx_local_fault_reg extends uvm_reg;

    // Variable: rx_local_fault
    // RX Local Fault count
    rand uvm_reg_field rx_local_fault;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_local_fault_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_local_fault_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_local_fault_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_local_fault");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_local_fault = uvm_reg_field::type_id::create("rx_local_fault", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_local_fault.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_local_fault_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_local_fault_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_local_fault.get_name, rx_local_fault.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_local_fault_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_local_fault_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_local_fault_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_local_fault_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_local_fault_wr: coverpoint r.rx_local_fault.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_local_fault_rd: coverpoint r.rx_local_fault.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_local_fault_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_local_fault_reg_cover");
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
    static function xgmac_rx_stats_rx_local_fault_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_local_fault_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_local_fault_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_rx_stats_rx_short_error_reg_cover;

// Class: xgmac_rx_stats_rx_short_error_reg
// Register xgmac_rx_stats.rx_short_error: RX_Short_Error
class xgmac_rx_stats_rx_short_error_reg extends uvm_reg;

    // Variable: rx_short_error
    // RX Short Error
    rand uvm_reg_field rx_short_error;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_rx_stats_rx_short_error_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_rx_stats_rx_short_error_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_short_error_reg)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_rx_short_error");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_short_error = uvm_reg_field::type_id::create("rx_short_error", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_short_error.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_rx_stats_rx_short_error_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_rx_stats_rx_short_error_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_short_error.get_name, rx_short_error.value);
        return s;
    endfunction

endclass


// Class: xgmac_rx_stats_rx_short_error_reg_cover
// Register coverage object.
class xgmac_rx_stats_rx_short_error_reg_cover extends uvm_object;

    static local xgmac_rx_stats_rx_short_error_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_rx_stats_rx_short_error_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_short_error_wr: coverpoint r.rx_short_error.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rx_short_error_rd: coverpoint r.rx_short_error.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_rx_short_error_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_rx_stats_rx_short_error_reg_cover");
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
    static function xgmac_rx_stats_rx_short_error_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_rx_stats_rx_short_error_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_rx_stats_rx_short_error_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass





// Class: xgmac_rx_stats_reg_block
// Register Block .xgmac_rx_stats: 
class xgmac_rx_stats_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand xgmac_rx_stats_rx_short_bad_reg rx_short_bad;
    rand xgmac_rx_stats_rx_short_good_reg rx_short_good;
    rand xgmac_rx_stats_rx_frame_size_equal_64_reg rx_frame_size_equal_64;
    rand xgmac_rx_stats_rx_64_lt_frame_size_lt_128_reg rx_64_lt_frame_size_lt_128;
    rand xgmac_rx_stats_rx_128_lte_frame_size_lt_256_reg rx_128_lte_frame_size_lt_256;
    rand xgmac_rx_stats_rx_256_lte_frame_size_lt_512_reg rx_256_lte_frame_size_lt_512;
    rand xgmac_rx_stats_rx_512_lte_frame_size_lt_1024_reg rx_512_lte_frame_size_lt_1024;
    rand xgmac_rx_stats_rx_1024_lte_frame_size_lt_1518_reg rx_1024_lte_frame_size_lt_1518;
    rand xgmac_rx_stats_rx_1518_lte_frame_size_lt_2048_reg rx_1518_lte_frame_size_lt_2048;
    rand xgmac_rx_stats_rx_2048_lte_frame_size_lt_4096_reg rx_2048_lte_frame_size_lt_4096;
    rand xgmac_rx_stats_rx_4096_lte_frame_size_lt_8192_reg rx_4096_lte_frame_size_lt_8192;
    rand xgmac_rx_stats_rx_8192_lte_frame_size_reg rx_8192_lte_frame_size;
    rand xgmac_rx_stats_rx_unicast_accepted_reg rx_unicast_accepted;
    rand xgmac_rx_stats_rx_multicast_accepted_reg rx_multicast_accepted;
    rand xgmac_rx_stats_rx_broadcast_accepted_reg rx_broadcast_accepted;
    rand xgmac_rx_stats_rx_unicast_filtered_reg rx_unicast_filtered;
    rand xgmac_rx_stats_rx_multicast_filtered_reg rx_multicast_filtered;
    rand xgmac_rx_stats_rx_broadcast_filtered_reg rx_broadcast_filtered;
    rand xgmac_rx_stats_rx_pause_multicast_reg rx_pause_multicast;
    rand xgmac_rx_stats_rx_vlan_x8100_good_reg rx_vlan_x8100_good;
    rand xgmac_rx_stats_rx_vlan_second_vlan_ethertype_good_reg rx_vlan_second_vlan_ethertype_good;
    rand xgmac_rx_stats_rx_stack_vlan_x8100_good_reg rx_stack_vlan_x8100_good;
    rand xgmac_rx_stats_rx_stack_vlan_second_vlan_ethertype_good_reg rx_stack_vlan_second_vlan_ethertype_good;
    rand xgmac_rx_stats_rx_octets_good_reg rx_octets_good;
    rand xgmac_rx_stats_rx_octets_bad_reg rx_octets_bad;
    rand xgmac_rx_stats_rx_large_good_reg rx_large_good;
    rand xgmac_rx_stats_rx_large_bad_reg rx_large_bad;
    rand xgmac_rx_stats_rx_long_good_reg rx_long_good;
    rand xgmac_rx_stats_rx_long_bad_reg rx_long_bad;
    rand xgmac_rx_stats_rx_mru_lt_length_802_3_field_reg rx_mru_lt_length_802_3_field;
    rand xgmac_rx_stats_rx_frame_size_lt_length_802_3_field_reg rx_frame_size_lt_length_802_3_field;
    rand xgmac_rx_stats_rx_length_802_3_field_lt_frame_size_reg rx_length_802_3_field_lt_frame_size;
    rand xgmac_rx_stats_rx_fifo_error_reg rx_fifo_error;
    rand xgmac_rx_stats_rx_fcs_inv_error_reg rx_fcs_inv_error;
    rand xgmac_rx_stats_rx_fcs_error_reg rx_fcs_error;
    rand xgmac_rx_stats_rx_ctrl_char_equal_xfe_error_reg rx_ctrl_char_equal_xfe_error;
    rand xgmac_rx_stats_rx_unexpected_ctrl_char_reg rx_unexpected_ctrl_char;
    rand xgmac_rx_stats_rx_align_error_reg rx_align_error;
    rand xgmac_rx_stats_rx_unexpected_ctrl_char_error_reg rx_unexpected_ctrl_char_error;
    rand xgmac_rx_stats_rx_link_fault_others_reg rx_link_fault_others;
    rand xgmac_rx_stats_rx_remote_fault_reg rx_remote_fault;
    rand xgmac_rx_stats_rx_local_fault_reg rx_local_fault;
    rand xgmac_rx_stats_rx_short_error_reg rx_short_error;

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(xgmac_rx_stats_reg_pkg::xgmac_rx_stats_reg_block)

    // Constructor: new
    function new(string name = "xgmac_rx_stats_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})


        rx_short_bad = xgmac_rx_stats_rx_short_bad_reg::type_id::create("rx_short_bad", , get_full_name());
        rx_short_good = xgmac_rx_stats_rx_short_good_reg::type_id::create("rx_short_good", , get_full_name());
        rx_frame_size_equal_64 = xgmac_rx_stats_rx_frame_size_equal_64_reg::type_id::create("rx_frame_size_equal_64", , get_full_name());
        rx_64_lt_frame_size_lt_128 = xgmac_rx_stats_rx_64_lt_frame_size_lt_128_reg::type_id::create("rx_64_lt_frame_size_lt_128", , get_full_name());
        rx_128_lte_frame_size_lt_256 = xgmac_rx_stats_rx_128_lte_frame_size_lt_256_reg::type_id::create("rx_128_lte_frame_size_lt_256", , get_full_name());
        rx_256_lte_frame_size_lt_512 = xgmac_rx_stats_rx_256_lte_frame_size_lt_512_reg::type_id::create("rx_256_lte_frame_size_lt_512", , get_full_name());
        rx_512_lte_frame_size_lt_1024 = xgmac_rx_stats_rx_512_lte_frame_size_lt_1024_reg::type_id::create("rx_512_lte_frame_size_lt_1024", , get_full_name());
        rx_1024_lte_frame_size_lt_1518 = xgmac_rx_stats_rx_1024_lte_frame_size_lt_1518_reg::type_id::create("rx_1024_lte_frame_size_lt_1518", , get_full_name());
        rx_1518_lte_frame_size_lt_2048 = xgmac_rx_stats_rx_1518_lte_frame_size_lt_2048_reg::type_id::create("rx_1518_lte_frame_size_lt_2048", , get_full_name());
        rx_2048_lte_frame_size_lt_4096 = xgmac_rx_stats_rx_2048_lte_frame_size_lt_4096_reg::type_id::create("rx_2048_lte_frame_size_lt_4096", , get_full_name());
        rx_4096_lte_frame_size_lt_8192 = xgmac_rx_stats_rx_4096_lte_frame_size_lt_8192_reg::type_id::create("rx_4096_lte_frame_size_lt_8192", , get_full_name());
        rx_8192_lte_frame_size = xgmac_rx_stats_rx_8192_lte_frame_size_reg::type_id::create("rx_8192_lte_frame_size", , get_full_name());
        rx_unicast_accepted = xgmac_rx_stats_rx_unicast_accepted_reg::type_id::create("rx_unicast_accepted", , get_full_name());
        rx_multicast_accepted = xgmac_rx_stats_rx_multicast_accepted_reg::type_id::create("rx_multicast_accepted", , get_full_name());
        rx_broadcast_accepted = xgmac_rx_stats_rx_broadcast_accepted_reg::type_id::create("rx_broadcast_accepted", , get_full_name());
        rx_unicast_filtered = xgmac_rx_stats_rx_unicast_filtered_reg::type_id::create("rx_unicast_filtered", , get_full_name());
        rx_multicast_filtered = xgmac_rx_stats_rx_multicast_filtered_reg::type_id::create("rx_multicast_filtered", , get_full_name());
        rx_broadcast_filtered = xgmac_rx_stats_rx_broadcast_filtered_reg::type_id::create("rx_broadcast_filtered", , get_full_name());
        rx_pause_multicast = xgmac_rx_stats_rx_pause_multicast_reg::type_id::create("rx_pause_multicast", , get_full_name());
        rx_vlan_x8100_good = xgmac_rx_stats_rx_vlan_x8100_good_reg::type_id::create("rx_vlan_x8100_good", , get_full_name());
        rx_vlan_second_vlan_ethertype_good = xgmac_rx_stats_rx_vlan_second_vlan_ethertype_good_reg::type_id::create("rx_vlan_second_vlan_ethertype_good", , get_full_name());
        rx_stack_vlan_x8100_good = xgmac_rx_stats_rx_stack_vlan_x8100_good_reg::type_id::create("rx_stack_vlan_x8100_good", , get_full_name());
        rx_stack_vlan_second_vlan_ethertype_good = xgmac_rx_stats_rx_stack_vlan_second_vlan_ethertype_good_reg::type_id::create("rx_stack_vlan_second_vlan_ethertype_good", , get_full_name());
        rx_octets_good = xgmac_rx_stats_rx_octets_good_reg::type_id::create("rx_octets_good", , get_full_name());
        rx_octets_bad = xgmac_rx_stats_rx_octets_bad_reg::type_id::create("rx_octets_bad", , get_full_name());
        rx_large_good = xgmac_rx_stats_rx_large_good_reg::type_id::create("rx_large_good", , get_full_name());
        rx_large_bad = xgmac_rx_stats_rx_large_bad_reg::type_id::create("rx_large_bad", , get_full_name());
        rx_long_good = xgmac_rx_stats_rx_long_good_reg::type_id::create("rx_long_good", , get_full_name());
        rx_long_bad = xgmac_rx_stats_rx_long_bad_reg::type_id::create("rx_long_bad", , get_full_name());
        rx_mru_lt_length_802_3_field = xgmac_rx_stats_rx_mru_lt_length_802_3_field_reg::type_id::create("rx_mru_lt_length_802_3_field", , get_full_name());
        rx_frame_size_lt_length_802_3_field = xgmac_rx_stats_rx_frame_size_lt_length_802_3_field_reg::type_id::create("rx_frame_size_lt_length_802_3_field", , get_full_name());
        rx_length_802_3_field_lt_frame_size = xgmac_rx_stats_rx_length_802_3_field_lt_frame_size_reg::type_id::create("rx_length_802_3_field_lt_frame_size", , get_full_name());
        rx_fifo_error = xgmac_rx_stats_rx_fifo_error_reg::type_id::create("rx_fifo_error", , get_full_name());
        rx_fcs_inv_error = xgmac_rx_stats_rx_fcs_inv_error_reg::type_id::create("rx_fcs_inv_error", , get_full_name());
        rx_fcs_error = xgmac_rx_stats_rx_fcs_error_reg::type_id::create("rx_fcs_error", , get_full_name());
        rx_ctrl_char_equal_xfe_error = xgmac_rx_stats_rx_ctrl_char_equal_xfe_error_reg::type_id::create("rx_ctrl_char_equal_xfe_error", , get_full_name());
        rx_unexpected_ctrl_char = xgmac_rx_stats_rx_unexpected_ctrl_char_reg::type_id::create("rx_unexpected_ctrl_char", , get_full_name());
        rx_align_error = xgmac_rx_stats_rx_align_error_reg::type_id::create("rx_align_error", , get_full_name());
        rx_unexpected_ctrl_char_error = xgmac_rx_stats_rx_unexpected_ctrl_char_error_reg::type_id::create("rx_unexpected_ctrl_char_error", , get_full_name());
        rx_link_fault_others = xgmac_rx_stats_rx_link_fault_others_reg::type_id::create("rx_link_fault_others", , get_full_name());
        rx_remote_fault = xgmac_rx_stats_rx_remote_fault_reg::type_id::create("rx_remote_fault", , get_full_name());
        rx_local_fault = xgmac_rx_stats_rx_local_fault_reg::type_id::create("rx_local_fault", , get_full_name());
        rx_short_error = xgmac_rx_stats_rx_short_error_reg::type_id::create("rx_short_error", , get_full_name());

        rx_short_bad.configure(this);
        rx_short_good.configure(this);
        rx_frame_size_equal_64.configure(this);
        rx_64_lt_frame_size_lt_128.configure(this);
        rx_128_lte_frame_size_lt_256.configure(this);
        rx_256_lte_frame_size_lt_512.configure(this);
        rx_512_lte_frame_size_lt_1024.configure(this);
        rx_1024_lte_frame_size_lt_1518.configure(this);
        rx_1518_lte_frame_size_lt_2048.configure(this);
        rx_2048_lte_frame_size_lt_4096.configure(this);
        rx_4096_lte_frame_size_lt_8192.configure(this);
        rx_8192_lte_frame_size.configure(this);
        rx_unicast_accepted.configure(this);
        rx_multicast_accepted.configure(this);
        rx_broadcast_accepted.configure(this);
        rx_unicast_filtered.configure(this);
        rx_multicast_filtered.configure(this);
        rx_broadcast_filtered.configure(this);
        rx_pause_multicast.configure(this);
        rx_vlan_x8100_good.configure(this);
        rx_vlan_second_vlan_ethertype_good.configure(this);
        rx_stack_vlan_x8100_good.configure(this);
        rx_stack_vlan_second_vlan_ethertype_good.configure(this);
        rx_octets_good.configure(this);
        rx_octets_bad.configure(this);
        rx_large_good.configure(this);
        rx_large_bad.configure(this);
        rx_long_good.configure(this);
        rx_long_bad.configure(this);
        rx_mru_lt_length_802_3_field.configure(this);
        rx_frame_size_lt_length_802_3_field.configure(this);
        rx_length_802_3_field_lt_frame_size.configure(this);
        rx_fifo_error.configure(this);
        rx_fcs_inv_error.configure(this);
        rx_fcs_error.configure(this);
        rx_ctrl_char_equal_xfe_error.configure(this);
        rx_unexpected_ctrl_char.configure(this);
        rx_align_error.configure(this);
        rx_unexpected_ctrl_char_error.configure(this);
        rx_link_fault_others.configure(this);
        rx_remote_fault.configure(this);
        rx_local_fault.configure(this);
        rx_short_error.configure(this);

        rx_short_bad.build();
        rx_short_good.build();
        rx_frame_size_equal_64.build();
        rx_64_lt_frame_size_lt_128.build();
        rx_128_lte_frame_size_lt_256.build();
        rx_256_lte_frame_size_lt_512.build();
        rx_512_lte_frame_size_lt_1024.build();
        rx_1024_lte_frame_size_lt_1518.build();
        rx_1518_lte_frame_size_lt_2048.build();
        rx_2048_lte_frame_size_lt_4096.build();
        rx_4096_lte_frame_size_lt_8192.build();
        rx_8192_lte_frame_size.build();
        rx_unicast_accepted.build();
        rx_multicast_accepted.build();
        rx_broadcast_accepted.build();
        rx_unicast_filtered.build();
        rx_multicast_filtered.build();
        rx_broadcast_filtered.build();
        rx_pause_multicast.build();
        rx_vlan_x8100_good.build();
        rx_vlan_second_vlan_ethertype_good.build();
        rx_stack_vlan_x8100_good.build();
        rx_stack_vlan_second_vlan_ethertype_good.build();
        rx_octets_good.build();
        rx_octets_bad.build();
        rx_large_good.build();
        rx_large_bad.build();
        rx_long_good.build();
        rx_long_bad.build();
        rx_mru_lt_length_802_3_field.build();
        rx_frame_size_lt_length_802_3_field.build();
        rx_length_802_3_field_lt_frame_size.build();
        rx_fifo_error.build();
        rx_fcs_inv_error.build();
        rx_fcs_error.build();
        rx_ctrl_char_equal_xfe_error.build();
        rx_unexpected_ctrl_char.build();
        rx_align_error.build();
        rx_unexpected_ctrl_char_error.build();
        rx_link_fault_others.build();
        rx_remote_fault.build();
        rx_local_fault.build();
        rx_short_error.build();

        // define default map
        default_map = create_map("xgmac_rx_stats_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        this.default_map.add_reg(rx_short_bad, 'h0, "RO");
        this.default_map.add_reg(rx_short_good, 'h2, "RO");
        this.default_map.add_reg(rx_frame_size_equal_64, 'h4, "RO");
        this.default_map.add_reg(rx_64_lt_frame_size_lt_128, 'h6, "RO");
        this.default_map.add_reg(rx_128_lte_frame_size_lt_256, 'h8, "RO");
        this.default_map.add_reg(rx_256_lte_frame_size_lt_512, 'hA, "RO");
        this.default_map.add_reg(rx_512_lte_frame_size_lt_1024, 'hC, "RO");
        this.default_map.add_reg(rx_1024_lte_frame_size_lt_1518, 'hE, "RO");
        this.default_map.add_reg(rx_1518_lte_frame_size_lt_2048, 'h10, "RO");
        this.default_map.add_reg(rx_2048_lte_frame_size_lt_4096, 'h12, "RO");
        this.default_map.add_reg(rx_4096_lte_frame_size_lt_8192, 'h14, "RO");
        this.default_map.add_reg(rx_8192_lte_frame_size, 'h16, "RO");
        this.default_map.add_reg(rx_unicast_accepted, 'h20, "RO");
        this.default_map.add_reg(rx_multicast_accepted, 'h22, "RO");
        this.default_map.add_reg(rx_broadcast_accepted, 'h24, "RO");
        this.default_map.add_reg(rx_unicast_filtered, 'h26, "RO");
        this.default_map.add_reg(rx_multicast_filtered, 'h28, "RO");
        this.default_map.add_reg(rx_broadcast_filtered, 'h2A, "RO");
        this.default_map.add_reg(rx_pause_multicast, 'h2C, "RO");
        this.default_map.add_reg(rx_vlan_x8100_good, 'h30, "RO");
        this.default_map.add_reg(rx_vlan_second_vlan_ethertype_good, 'h32, "RO");
        this.default_map.add_reg(rx_stack_vlan_x8100_good, 'h34, "RO");
        this.default_map.add_reg(rx_stack_vlan_second_vlan_ethertype_good, 'h36, "RO");
        this.default_map.add_reg(rx_octets_good, 'h38, "RO");
        this.default_map.add_reg(rx_octets_bad, 'h3A, "RO");
        this.default_map.add_reg(rx_large_good, 'h3C, "RO");
        this.default_map.add_reg(rx_large_bad, 'h3E, "RO");
        this.default_map.add_reg(rx_long_good, 'h40, "RO");
        this.default_map.add_reg(rx_long_bad, 'h42, "RO");
        this.default_map.add_reg(rx_mru_lt_length_802_3_field, 'h44, "RO");
        this.default_map.add_reg(rx_frame_size_lt_length_802_3_field, 'h46, "RO");
        this.default_map.add_reg(rx_length_802_3_field_lt_frame_size, 'h48, "RO");
        this.default_map.add_reg(rx_fifo_error, 'h50, "RO");
        this.default_map.add_reg(rx_fcs_inv_error, 'h58, "RO");
        this.default_map.add_reg(rx_fcs_error, 'h5A, "RO");
        this.default_map.add_reg(rx_ctrl_char_equal_xfe_error, 'h5C, "RO");
        this.default_map.add_reg(rx_unexpected_ctrl_char, 'h5E, "RO");
        this.default_map.add_reg(rx_align_error, 'h60, "RO");
        this.default_map.add_reg(rx_unexpected_ctrl_char_error, 'h62, "RO");
        this.default_map.add_reg(rx_link_fault_others, 'h64, "RO");
        this.default_map.add_reg(rx_remote_fault, 'h66, "RO");
        this.default_map.add_reg(rx_local_fault, 'h68, "RO");
        this.default_map.add_reg(rx_short_error, 'h6A, "RO");

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
        rx_short_bad.enable_coverage(is_on, this.cg_per_instance);
        rx_short_good.enable_coverage(is_on, this.cg_per_instance);
        rx_frame_size_equal_64.enable_coverage(is_on, this.cg_per_instance);
        rx_64_lt_frame_size_lt_128.enable_coverage(is_on, this.cg_per_instance);
        rx_128_lte_frame_size_lt_256.enable_coverage(is_on, this.cg_per_instance);
        rx_256_lte_frame_size_lt_512.enable_coverage(is_on, this.cg_per_instance);
        rx_512_lte_frame_size_lt_1024.enable_coverage(is_on, this.cg_per_instance);
        rx_1024_lte_frame_size_lt_1518.enable_coverage(is_on, this.cg_per_instance);
        rx_1518_lte_frame_size_lt_2048.enable_coverage(is_on, this.cg_per_instance);
        rx_2048_lte_frame_size_lt_4096.enable_coverage(is_on, this.cg_per_instance);
        rx_4096_lte_frame_size_lt_8192.enable_coverage(is_on, this.cg_per_instance);
        rx_8192_lte_frame_size.enable_coverage(is_on, this.cg_per_instance);
        rx_unicast_accepted.enable_coverage(is_on, this.cg_per_instance);
        rx_multicast_accepted.enable_coverage(is_on, this.cg_per_instance);
        rx_broadcast_accepted.enable_coverage(is_on, this.cg_per_instance);
        rx_unicast_filtered.enable_coverage(is_on, this.cg_per_instance);
        rx_multicast_filtered.enable_coverage(is_on, this.cg_per_instance);
        rx_broadcast_filtered.enable_coverage(is_on, this.cg_per_instance);
        rx_pause_multicast.enable_coverage(is_on, this.cg_per_instance);
        rx_vlan_x8100_good.enable_coverage(is_on, this.cg_per_instance);
        rx_vlan_second_vlan_ethertype_good.enable_coverage(is_on, this.cg_per_instance);
        rx_stack_vlan_x8100_good.enable_coverage(is_on, this.cg_per_instance);
        rx_stack_vlan_second_vlan_ethertype_good.enable_coverage(is_on, this.cg_per_instance);
        rx_octets_good.enable_coverage(is_on, this.cg_per_instance);
        rx_octets_bad.enable_coverage(is_on, this.cg_per_instance);
        rx_large_good.enable_coverage(is_on, this.cg_per_instance);
        rx_large_bad.enable_coverage(is_on, this.cg_per_instance);
        rx_long_good.enable_coverage(is_on, this.cg_per_instance);
        rx_long_bad.enable_coverage(is_on, this.cg_per_instance);
        rx_mru_lt_length_802_3_field.enable_coverage(is_on, this.cg_per_instance);
        rx_frame_size_lt_length_802_3_field.enable_coverage(is_on, this.cg_per_instance);
        rx_length_802_3_field_lt_frame_size.enable_coverage(is_on, this.cg_per_instance);
        rx_fifo_error.enable_coverage(is_on, this.cg_per_instance);
        rx_fcs_inv_error.enable_coverage(is_on, this.cg_per_instance);
        rx_fcs_error.enable_coverage(is_on, this.cg_per_instance);
        rx_ctrl_char_equal_xfe_error.enable_coverage(is_on, this.cg_per_instance);
        rx_unexpected_ctrl_char.enable_coverage(is_on, this.cg_per_instance);
        rx_align_error.enable_coverage(is_on, this.cg_per_instance);
        rx_unexpected_ctrl_char_error.enable_coverage(is_on, this.cg_per_instance);
        rx_link_fault_others.enable_coverage(is_on, this.cg_per_instance);
        rx_remote_fault.enable_coverage(is_on, this.cg_per_instance);
        rx_local_fault.enable_coverage(is_on, this.cg_per_instance);
        rx_short_error.enable_coverage(is_on, this.cg_per_instance);
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