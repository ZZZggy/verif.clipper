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
// Register definitions for xgmac_tx_stats register block.
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
// Group: xgmac_tx_stats
//---------------------------------------------------------

package xgmac_tx_stats_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;

typedef class xgmac_tx_stats_tx_short_bad_reg_cover;

// Class: xgmac_tx_stats_tx_short_bad_reg
// Register xgmac_tx_stats.tx_short_bad: TX_Short_Bad
class xgmac_tx_stats_tx_short_bad_reg extends uvm_reg;

    // Variable: tx_short_bad
    // TX Bad frames with Frame size &lt; 64 frames count [31:0]
    rand uvm_reg_field tx_short_bad;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_tx_stats_tx_short_bad_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_tx_stats_tx_short_bad_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_short_bad_reg)

    // Constructor: new
    function new(string name = "xgmac_tx_stats_tx_short_bad");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        tx_short_bad = uvm_reg_field::type_id::create("tx_short_bad", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        tx_short_bad.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_tx_stats_tx_short_bad_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_tx_stats_tx_short_bad_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_short_bad.get_name, tx_short_bad.value);
        return s;
    endfunction

endclass


// Class: xgmac_tx_stats_tx_short_bad_reg_cover
// Register coverage object.
class xgmac_tx_stats_tx_short_bad_reg_cover extends uvm_object;

    static local xgmac_tx_stats_tx_short_bad_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_tx_stats_tx_short_bad_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        tx_short_bad_wr: coverpoint r.tx_short_bad.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        tx_short_bad_rd: coverpoint r.tx_short_bad.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_short_bad_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_tx_stats_tx_short_bad_reg_cover");
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
    static function xgmac_tx_stats_tx_short_bad_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_tx_stats_tx_short_bad_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_tx_stats_tx_short_bad_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_tx_stats_tx_short_good_reg_cover;

// Class: xgmac_tx_stats_tx_short_good_reg
// Register xgmac_tx_stats.tx_short_good: TX_Short_Good
class xgmac_tx_stats_tx_short_good_reg extends uvm_reg;

    // Variable: tx_short_good
    // TX Good frames with Frame size &lt; 64 frames count [31:0]
    rand uvm_reg_field tx_short_good;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_tx_stats_tx_short_good_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_tx_stats_tx_short_good_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_short_good_reg)

    // Constructor: new
    function new(string name = "xgmac_tx_stats_tx_short_good");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        tx_short_good = uvm_reg_field::type_id::create("tx_short_good", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        tx_short_good.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_tx_stats_tx_short_good_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_tx_stats_tx_short_good_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_short_good.get_name, tx_short_good.value);
        return s;
    endfunction

endclass


// Class: xgmac_tx_stats_tx_short_good_reg_cover
// Register coverage object.
class xgmac_tx_stats_tx_short_good_reg_cover extends uvm_object;

    static local xgmac_tx_stats_tx_short_good_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_tx_stats_tx_short_good_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        tx_short_good_wr: coverpoint r.tx_short_good.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        tx_short_good_rd: coverpoint r.tx_short_good.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_short_good_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_tx_stats_tx_short_good_reg_cover");
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
    static function xgmac_tx_stats_tx_short_good_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_tx_stats_tx_short_good_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_tx_stats_tx_short_good_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_tx_stats_tx_frame_size_equal_64_bytes_reg_cover;

// Class: xgmac_tx_stats_tx_frame_size_equal_64_bytes_reg
// Register xgmac_tx_stats.tx_frame_size_equal_64_bytes: TX_Frame_size_equal_64_bytes
class xgmac_tx_stats_tx_frame_size_equal_64_bytes_reg extends uvm_reg;

    // Variable: tx_frame_size_equal_64_bytes
    // TX Frame size = 64 frames count [31:0]
    rand uvm_reg_field tx_frame_size_equal_64_bytes;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_tx_stats_tx_frame_size_equal_64_bytes_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_tx_stats_tx_frame_size_equal_64_bytes_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_frame_size_equal_64_bytes_reg)

    // Constructor: new
    function new(string name = "xgmac_tx_stats_tx_frame_size_equal_64_bytes");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        tx_frame_size_equal_64_bytes = uvm_reg_field::type_id::create("tx_frame_size_equal_64_bytes", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        tx_frame_size_equal_64_bytes.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_tx_stats_tx_frame_size_equal_64_bytes_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_tx_stats_tx_frame_size_equal_64_bytes_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_frame_size_equal_64_bytes.get_name, tx_frame_size_equal_64_bytes.value);
        return s;
    endfunction

endclass


// Class: xgmac_tx_stats_tx_frame_size_equal_64_bytes_reg_cover
// Register coverage object.
class xgmac_tx_stats_tx_frame_size_equal_64_bytes_reg_cover extends uvm_object;

    static local xgmac_tx_stats_tx_frame_size_equal_64_bytes_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_tx_stats_tx_frame_size_equal_64_bytes_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        tx_frame_size_equal_64_bytes_wr: coverpoint r.tx_frame_size_equal_64_bytes.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        tx_frame_size_equal_64_bytes_rd: coverpoint r.tx_frame_size_equal_64_bytes.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_frame_size_equal_64_bytes_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_tx_stats_tx_frame_size_equal_64_bytes_reg_cover");
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
    static function xgmac_tx_stats_tx_frame_size_equal_64_bytes_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_tx_stats_tx_frame_size_equal_64_bytes_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_tx_stats_tx_frame_size_equal_64_bytes_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_tx_stats_tx_64_lt_frame_size_lt_128_reg_cover;

// Class: xgmac_tx_stats_tx_64_lt_frame_size_lt_128_reg
// Register xgmac_tx_stats.tx_64_lt_frame_size_lt_128: TX_64_lt_Frame_size_lt_128
class xgmac_tx_stats_tx_64_lt_frame_size_lt_128_reg extends uvm_reg;

    // Variable: tx_64_lt_frame_size_lt_128
    // TX 64 &lt; Frame size &lt; 128 frames count [31:0]
    rand uvm_reg_field tx_64_lt_frame_size_lt_128;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_tx_stats_tx_64_lt_frame_size_lt_128_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_tx_stats_tx_64_lt_frame_size_lt_128_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_64_lt_frame_size_lt_128_reg)

    // Constructor: new
    function new(string name = "xgmac_tx_stats_tx_64_lt_frame_size_lt_128");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        tx_64_lt_frame_size_lt_128 = uvm_reg_field::type_id::create("tx_64_lt_frame_size_lt_128", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        tx_64_lt_frame_size_lt_128.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_tx_stats_tx_64_lt_frame_size_lt_128_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_tx_stats_tx_64_lt_frame_size_lt_128_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_64_lt_frame_size_lt_128.get_name, tx_64_lt_frame_size_lt_128.value);
        return s;
    endfunction

endclass


// Class: xgmac_tx_stats_tx_64_lt_frame_size_lt_128_reg_cover
// Register coverage object.
class xgmac_tx_stats_tx_64_lt_frame_size_lt_128_reg_cover extends uvm_object;

    static local xgmac_tx_stats_tx_64_lt_frame_size_lt_128_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_tx_stats_tx_64_lt_frame_size_lt_128_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        tx_64_lt_frame_size_lt_128_wr: coverpoint r.tx_64_lt_frame_size_lt_128.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        tx_64_lt_frame_size_lt_128_rd: coverpoint r.tx_64_lt_frame_size_lt_128.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_64_lt_frame_size_lt_128_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_tx_stats_tx_64_lt_frame_size_lt_128_reg_cover");
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
    static function xgmac_tx_stats_tx_64_lt_frame_size_lt_128_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_tx_stats_tx_64_lt_frame_size_lt_128_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_tx_stats_tx_64_lt_frame_size_lt_128_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_tx_stats_tx_128_lte_frame_size_lt_256_reg_cover;

// Class: xgmac_tx_stats_tx_128_lte_frame_size_lt_256_reg
// Register xgmac_tx_stats.tx_128_lte_frame_size_lt_256: TX_128_lte_Frame_size_lt_256
class xgmac_tx_stats_tx_128_lte_frame_size_lt_256_reg extends uvm_reg;

    // Variable: tx_128_lte_frame_size_lt_256
    // TX 128 &lt;= Frame size &lt; 256 frames count [31:0]
    rand uvm_reg_field tx_128_lte_frame_size_lt_256;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_tx_stats_tx_128_lte_frame_size_lt_256_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_tx_stats_tx_128_lte_frame_size_lt_256_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_128_lte_frame_size_lt_256_reg)

    // Constructor: new
    function new(string name = "xgmac_tx_stats_tx_128_lte_frame_size_lt_256");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        tx_128_lte_frame_size_lt_256 = uvm_reg_field::type_id::create("tx_128_lte_frame_size_lt_256", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        tx_128_lte_frame_size_lt_256.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_tx_stats_tx_128_lte_frame_size_lt_256_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_tx_stats_tx_128_lte_frame_size_lt_256_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_128_lte_frame_size_lt_256.get_name, tx_128_lte_frame_size_lt_256.value);
        return s;
    endfunction

endclass


// Class: xgmac_tx_stats_tx_128_lte_frame_size_lt_256_reg_cover
// Register coverage object.
class xgmac_tx_stats_tx_128_lte_frame_size_lt_256_reg_cover extends uvm_object;

    static local xgmac_tx_stats_tx_128_lte_frame_size_lt_256_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_tx_stats_tx_128_lte_frame_size_lt_256_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        tx_128_lte_frame_size_lt_256_wr: coverpoint r.tx_128_lte_frame_size_lt_256.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        tx_128_lte_frame_size_lt_256_rd: coverpoint r.tx_128_lte_frame_size_lt_256.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_128_lte_frame_size_lt_256_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_tx_stats_tx_128_lte_frame_size_lt_256_reg_cover");
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
    static function xgmac_tx_stats_tx_128_lte_frame_size_lt_256_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_tx_stats_tx_128_lte_frame_size_lt_256_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_tx_stats_tx_128_lte_frame_size_lt_256_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_tx_stats_tx_256_lte_frame_size_lt_512_reg_cover;

// Class: xgmac_tx_stats_tx_256_lte_frame_size_lt_512_reg
// Register xgmac_tx_stats.tx_256_lte_frame_size_lt_512: TX_256_lte_Frame_size_lt_512
class xgmac_tx_stats_tx_256_lte_frame_size_lt_512_reg extends uvm_reg;

    // Variable: tx_256_lte_frame_size_lt_512
    // TX 256 &lt;= Frame size &lt; 512 frames count [31:0]
    rand uvm_reg_field tx_256_lte_frame_size_lt_512;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_tx_stats_tx_256_lte_frame_size_lt_512_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_tx_stats_tx_256_lte_frame_size_lt_512_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_256_lte_frame_size_lt_512_reg)

    // Constructor: new
    function new(string name = "xgmac_tx_stats_tx_256_lte_frame_size_lt_512");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        tx_256_lte_frame_size_lt_512 = uvm_reg_field::type_id::create("tx_256_lte_frame_size_lt_512", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        tx_256_lte_frame_size_lt_512.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_tx_stats_tx_256_lte_frame_size_lt_512_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_tx_stats_tx_256_lte_frame_size_lt_512_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_256_lte_frame_size_lt_512.get_name, tx_256_lte_frame_size_lt_512.value);
        return s;
    endfunction

endclass


// Class: xgmac_tx_stats_tx_256_lte_frame_size_lt_512_reg_cover
// Register coverage object.
class xgmac_tx_stats_tx_256_lte_frame_size_lt_512_reg_cover extends uvm_object;

    static local xgmac_tx_stats_tx_256_lte_frame_size_lt_512_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_tx_stats_tx_256_lte_frame_size_lt_512_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        tx_256_lte_frame_size_lt_512_wr: coverpoint r.tx_256_lte_frame_size_lt_512.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        tx_256_lte_frame_size_lt_512_rd: coverpoint r.tx_256_lte_frame_size_lt_512.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_256_lte_frame_size_lt_512_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_tx_stats_tx_256_lte_frame_size_lt_512_reg_cover");
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
    static function xgmac_tx_stats_tx_256_lte_frame_size_lt_512_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_tx_stats_tx_256_lte_frame_size_lt_512_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_tx_stats_tx_256_lte_frame_size_lt_512_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_tx_stats_tx_512_lte_frame_size_lt_1024_reg_cover;

// Class: xgmac_tx_stats_tx_512_lte_frame_size_lt_1024_reg
// Register xgmac_tx_stats.tx_512_lte_frame_size_lt_1024: TX_512_lte_Frame_size_lt_1024
class xgmac_tx_stats_tx_512_lte_frame_size_lt_1024_reg extends uvm_reg;

    // Variable: tx_512_lte_frame_size_lt_1024
    // TX 512 &lt;= Frame size &lt; 1024 frames count [31:0]
    rand uvm_reg_field tx_512_lte_frame_size_lt_1024;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_tx_stats_tx_512_lte_frame_size_lt_1024_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_tx_stats_tx_512_lte_frame_size_lt_1024_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_512_lte_frame_size_lt_1024_reg)

    // Constructor: new
    function new(string name = "xgmac_tx_stats_tx_512_lte_frame_size_lt_1024");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        tx_512_lte_frame_size_lt_1024 = uvm_reg_field::type_id::create("tx_512_lte_frame_size_lt_1024", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        tx_512_lte_frame_size_lt_1024.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_tx_stats_tx_512_lte_frame_size_lt_1024_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_tx_stats_tx_512_lte_frame_size_lt_1024_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_512_lte_frame_size_lt_1024.get_name, tx_512_lte_frame_size_lt_1024.value);
        return s;
    endfunction

endclass


// Class: xgmac_tx_stats_tx_512_lte_frame_size_lt_1024_reg_cover
// Register coverage object.
class xgmac_tx_stats_tx_512_lte_frame_size_lt_1024_reg_cover extends uvm_object;

    static local xgmac_tx_stats_tx_512_lte_frame_size_lt_1024_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_tx_stats_tx_512_lte_frame_size_lt_1024_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        tx_512_lte_frame_size_lt_1024_wr: coverpoint r.tx_512_lte_frame_size_lt_1024.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        tx_512_lte_frame_size_lt_1024_rd: coverpoint r.tx_512_lte_frame_size_lt_1024.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_512_lte_frame_size_lt_1024_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_tx_stats_tx_512_lte_frame_size_lt_1024_reg_cover");
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
    static function xgmac_tx_stats_tx_512_lte_frame_size_lt_1024_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_tx_stats_tx_512_lte_frame_size_lt_1024_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_tx_stats_tx_512_lte_frame_size_lt_1024_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_tx_stats_tx_1024_lte_frame_size_lt_1518_reg_cover;

// Class: xgmac_tx_stats_tx_1024_lte_frame_size_lt_1518_reg
// Register xgmac_tx_stats.tx_1024_lte_frame_size_lt_1518: TX_1024_lte_Frame_size_lt_1518
class xgmac_tx_stats_tx_1024_lte_frame_size_lt_1518_reg extends uvm_reg;

    // Variable: tx_1024_lte_frame_size_lt_1518
    // TX 1024 &lt;= Frame size &lt; 1518 frames count [31:0]
    rand uvm_reg_field tx_1024_lte_frame_size_lt_1518;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_tx_stats_tx_1024_lte_frame_size_lt_1518_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_tx_stats_tx_1024_lte_frame_size_lt_1518_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_1024_lte_frame_size_lt_1518_reg)

    // Constructor: new
    function new(string name = "xgmac_tx_stats_tx_1024_lte_frame_size_lt_1518");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        tx_1024_lte_frame_size_lt_1518 = uvm_reg_field::type_id::create("tx_1024_lte_frame_size_lt_1518", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        tx_1024_lte_frame_size_lt_1518.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_tx_stats_tx_1024_lte_frame_size_lt_1518_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_tx_stats_tx_1024_lte_frame_size_lt_1518_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_1024_lte_frame_size_lt_1518.get_name, tx_1024_lte_frame_size_lt_1518.value);
        return s;
    endfunction

endclass


// Class: xgmac_tx_stats_tx_1024_lte_frame_size_lt_1518_reg_cover
// Register coverage object.
class xgmac_tx_stats_tx_1024_lte_frame_size_lt_1518_reg_cover extends uvm_object;

    static local xgmac_tx_stats_tx_1024_lte_frame_size_lt_1518_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_tx_stats_tx_1024_lte_frame_size_lt_1518_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        tx_1024_lte_frame_size_lt_1518_wr: coverpoint r.tx_1024_lte_frame_size_lt_1518.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        tx_1024_lte_frame_size_lt_1518_rd: coverpoint r.tx_1024_lte_frame_size_lt_1518.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_1024_lte_frame_size_lt_1518_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_tx_stats_tx_1024_lte_frame_size_lt_1518_reg_cover");
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
    static function xgmac_tx_stats_tx_1024_lte_frame_size_lt_1518_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_tx_stats_tx_1024_lte_frame_size_lt_1518_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_tx_stats_tx_1024_lte_frame_size_lt_1518_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_tx_stats_tx_1518_lte_frame_size_lt_2048_reg_cover;

// Class: xgmac_tx_stats_tx_1518_lte_frame_size_lt_2048_reg
// Register xgmac_tx_stats.tx_1518_lte_frame_size_lt_2048: TX_1518_lte_Frame_size_lt_2048
class xgmac_tx_stats_tx_1518_lte_frame_size_lt_2048_reg extends uvm_reg;

    // Variable: tx_1518_lte_frame_size_lt_2048
    // TX 1518 &lt;= Frame size &lt; 2048 frames count [31:0]
    rand uvm_reg_field tx_1518_lte_frame_size_lt_2048;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_tx_stats_tx_1518_lte_frame_size_lt_2048_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_tx_stats_tx_1518_lte_frame_size_lt_2048_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_1518_lte_frame_size_lt_2048_reg)

    // Constructor: new
    function new(string name = "xgmac_tx_stats_tx_1518_lte_frame_size_lt_2048");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        tx_1518_lte_frame_size_lt_2048 = uvm_reg_field::type_id::create("tx_1518_lte_frame_size_lt_2048", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        tx_1518_lte_frame_size_lt_2048.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_tx_stats_tx_1518_lte_frame_size_lt_2048_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_tx_stats_tx_1518_lte_frame_size_lt_2048_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_1518_lte_frame_size_lt_2048.get_name, tx_1518_lte_frame_size_lt_2048.value);
        return s;
    endfunction

endclass


// Class: xgmac_tx_stats_tx_1518_lte_frame_size_lt_2048_reg_cover
// Register coverage object.
class xgmac_tx_stats_tx_1518_lte_frame_size_lt_2048_reg_cover extends uvm_object;

    static local xgmac_tx_stats_tx_1518_lte_frame_size_lt_2048_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_tx_stats_tx_1518_lte_frame_size_lt_2048_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        tx_1518_lte_frame_size_lt_2048_wr: coverpoint r.tx_1518_lte_frame_size_lt_2048.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        tx_1518_lte_frame_size_lt_2048_rd: coverpoint r.tx_1518_lte_frame_size_lt_2048.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_1518_lte_frame_size_lt_2048_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_tx_stats_tx_1518_lte_frame_size_lt_2048_reg_cover");
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
    static function xgmac_tx_stats_tx_1518_lte_frame_size_lt_2048_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_tx_stats_tx_1518_lte_frame_size_lt_2048_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_tx_stats_tx_1518_lte_frame_size_lt_2048_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_tx_stats_tx_2048_lte_frame_size_lt_4096_reg_cover;

// Class: xgmac_tx_stats_tx_2048_lte_frame_size_lt_4096_reg
// Register xgmac_tx_stats.tx_2048_lte_frame_size_lt_4096: TX_2048_lte_Frame_size_lt_4096
class xgmac_tx_stats_tx_2048_lte_frame_size_lt_4096_reg extends uvm_reg;

    // Variable: tx_2048_lte_frame_size_lt_4096
    // TX 2048 &lt;= Frame size &lt; 4096 frames count [31:0]
    rand uvm_reg_field tx_2048_lte_frame_size_lt_4096;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_tx_stats_tx_2048_lte_frame_size_lt_4096_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_tx_stats_tx_2048_lte_frame_size_lt_4096_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_2048_lte_frame_size_lt_4096_reg)

    // Constructor: new
    function new(string name = "xgmac_tx_stats_tx_2048_lte_frame_size_lt_4096");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        tx_2048_lte_frame_size_lt_4096 = uvm_reg_field::type_id::create("tx_2048_lte_frame_size_lt_4096", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        tx_2048_lte_frame_size_lt_4096.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_tx_stats_tx_2048_lte_frame_size_lt_4096_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_tx_stats_tx_2048_lte_frame_size_lt_4096_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_2048_lte_frame_size_lt_4096.get_name, tx_2048_lte_frame_size_lt_4096.value);
        return s;
    endfunction

endclass


// Class: xgmac_tx_stats_tx_2048_lte_frame_size_lt_4096_reg_cover
// Register coverage object.
class xgmac_tx_stats_tx_2048_lte_frame_size_lt_4096_reg_cover extends uvm_object;

    static local xgmac_tx_stats_tx_2048_lte_frame_size_lt_4096_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_tx_stats_tx_2048_lte_frame_size_lt_4096_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        tx_2048_lte_frame_size_lt_4096_wr: coverpoint r.tx_2048_lte_frame_size_lt_4096.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        tx_2048_lte_frame_size_lt_4096_rd: coverpoint r.tx_2048_lte_frame_size_lt_4096.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_2048_lte_frame_size_lt_4096_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_tx_stats_tx_2048_lte_frame_size_lt_4096_reg_cover");
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
    static function xgmac_tx_stats_tx_2048_lte_frame_size_lt_4096_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_tx_stats_tx_2048_lte_frame_size_lt_4096_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_tx_stats_tx_2048_lte_frame_size_lt_4096_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_tx_stats_tx_4096_lte_frame_size_lt_8192_reg_cover;

// Class: xgmac_tx_stats_tx_4096_lte_frame_size_lt_8192_reg
// Register xgmac_tx_stats.tx_4096_lte_frame_size_lt_8192: TX_4096_lte_Frame_size_lt_8192
class xgmac_tx_stats_tx_4096_lte_frame_size_lt_8192_reg extends uvm_reg;

    // Variable: tx_4096_lte_frame_size_lt_8192
    // TX 4096 &lt;= Frame size &lt; 8192 frames count [31:0]
    rand uvm_reg_field tx_4096_lte_frame_size_lt_8192;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_tx_stats_tx_4096_lte_frame_size_lt_8192_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_tx_stats_tx_4096_lte_frame_size_lt_8192_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_4096_lte_frame_size_lt_8192_reg)

    // Constructor: new
    function new(string name = "xgmac_tx_stats_tx_4096_lte_frame_size_lt_8192");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        tx_4096_lte_frame_size_lt_8192 = uvm_reg_field::type_id::create("tx_4096_lte_frame_size_lt_8192", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        tx_4096_lte_frame_size_lt_8192.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_tx_stats_tx_4096_lte_frame_size_lt_8192_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_tx_stats_tx_4096_lte_frame_size_lt_8192_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_4096_lte_frame_size_lt_8192.get_name, tx_4096_lte_frame_size_lt_8192.value);
        return s;
    endfunction

endclass


// Class: xgmac_tx_stats_tx_4096_lte_frame_size_lt_8192_reg_cover
// Register coverage object.
class xgmac_tx_stats_tx_4096_lte_frame_size_lt_8192_reg_cover extends uvm_object;

    static local xgmac_tx_stats_tx_4096_lte_frame_size_lt_8192_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_tx_stats_tx_4096_lte_frame_size_lt_8192_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        tx_4096_lte_frame_size_lt_8192_wr: coverpoint r.tx_4096_lte_frame_size_lt_8192.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        tx_4096_lte_frame_size_lt_8192_rd: coverpoint r.tx_4096_lte_frame_size_lt_8192.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_4096_lte_frame_size_lt_8192_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_tx_stats_tx_4096_lte_frame_size_lt_8192_reg_cover");
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
    static function xgmac_tx_stats_tx_4096_lte_frame_size_lt_8192_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_tx_stats_tx_4096_lte_frame_size_lt_8192_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_tx_stats_tx_4096_lte_frame_size_lt_8192_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_tx_stats_tx_8192_lte_frame_size_reg_cover;

// Class: xgmac_tx_stats_tx_8192_lte_frame_size_reg
// Register xgmac_tx_stats.tx_8192_lte_frame_size: TX_8192_lte_Frame_size
class xgmac_tx_stats_tx_8192_lte_frame_size_reg extends uvm_reg;

    // Variable: tx_8192_lte_frame_size
    // TX 8192 &lt;= Frame size frames count [31:0]
    rand uvm_reg_field tx_8192_lte_frame_size;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_tx_stats_tx_8192_lte_frame_size_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_tx_stats_tx_8192_lte_frame_size_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_8192_lte_frame_size_reg)

    // Constructor: new
    function new(string name = "xgmac_tx_stats_tx_8192_lte_frame_size");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        tx_8192_lte_frame_size = uvm_reg_field::type_id::create("tx_8192_lte_frame_size", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        tx_8192_lte_frame_size.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_tx_stats_tx_8192_lte_frame_size_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_tx_stats_tx_8192_lte_frame_size_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_8192_lte_frame_size.get_name, tx_8192_lte_frame_size.value);
        return s;
    endfunction

endclass


// Class: xgmac_tx_stats_tx_8192_lte_frame_size_reg_cover
// Register coverage object.
class xgmac_tx_stats_tx_8192_lte_frame_size_reg_cover extends uvm_object;

    static local xgmac_tx_stats_tx_8192_lte_frame_size_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_tx_stats_tx_8192_lte_frame_size_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        tx_8192_lte_frame_size_wr: coverpoint r.tx_8192_lte_frame_size.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        tx_8192_lte_frame_size_rd: coverpoint r.tx_8192_lte_frame_size.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_8192_lte_frame_size_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_tx_stats_tx_8192_lte_frame_size_reg_cover");
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
    static function xgmac_tx_stats_tx_8192_lte_frame_size_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_tx_stats_tx_8192_lte_frame_size_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_tx_stats_tx_8192_lte_frame_size_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_tx_stats_reserved0_reg_cover;

// Class: xgmac_tx_stats_reserved0_reg
// Register xgmac_tx_stats.reserved0: Reserved
class xgmac_tx_stats_reserved0_reg extends uvm_reg;

    // Variable: unused
    // Unused
    rand uvm_reg_field unused;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_tx_stats_reserved0_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_tx_stats_reserved0_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_reserved0_reg)

    // Constructor: new
    function new(string name = "xgmac_tx_stats_reserved0");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        unused = uvm_reg_field::type_id::create("unused", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        unused.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_tx_stats_reserved0_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_tx_stats_reserved0_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, unused.get_name, unused.value);
        return s;
    endfunction

endclass


// Class: xgmac_tx_stats_reserved0_reg_cover
// Register coverage object.
class xgmac_tx_stats_reserved0_reg_cover extends uvm_object;

    static local xgmac_tx_stats_reserved0_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_tx_stats_reserved0_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        unused_wr: coverpoint r.unused.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        unused_rd: coverpoint r.unused.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_reserved0_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_tx_stats_reserved0_reg_cover");
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
    static function xgmac_tx_stats_reserved0_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_tx_stats_reserved0_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_tx_stats_reserved0_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_tx_stats_tx_unicast_reg_cover;

// Class: xgmac_tx_stats_tx_unicast_reg
// Register xgmac_tx_stats.tx_unicast: TX_Unicast
class xgmac_tx_stats_tx_unicast_reg extends uvm_reg;

    // Variable: tx_unicast
    // TX Unicast frames count [31:0]
    rand uvm_reg_field tx_unicast;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_tx_stats_tx_unicast_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_tx_stats_tx_unicast_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_unicast_reg)

    // Constructor: new
    function new(string name = "xgmac_tx_stats_tx_unicast");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        tx_unicast = uvm_reg_field::type_id::create("tx_unicast", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        tx_unicast.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_tx_stats_tx_unicast_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_tx_stats_tx_unicast_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_unicast.get_name, tx_unicast.value);
        return s;
    endfunction

endclass


// Class: xgmac_tx_stats_tx_unicast_reg_cover
// Register coverage object.
class xgmac_tx_stats_tx_unicast_reg_cover extends uvm_object;

    static local xgmac_tx_stats_tx_unicast_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_tx_stats_tx_unicast_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        tx_unicast_wr: coverpoint r.tx_unicast.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        tx_unicast_rd: coverpoint r.tx_unicast.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_unicast_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_tx_stats_tx_unicast_reg_cover");
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
    static function xgmac_tx_stats_tx_unicast_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_tx_stats_tx_unicast_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_tx_stats_tx_unicast_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_tx_stats_tx_multicast_reg_cover;

// Class: xgmac_tx_stats_tx_multicast_reg
// Register xgmac_tx_stats.tx_multicast: TX_Multicast
class xgmac_tx_stats_tx_multicast_reg extends uvm_reg;

    // Variable: tx_multicast
    // TX Multicast (excluding Pause) frames count  [31:0]
    rand uvm_reg_field tx_multicast;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_tx_stats_tx_multicast_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_tx_stats_tx_multicast_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_multicast_reg)

    // Constructor: new
    function new(string name = "xgmac_tx_stats_tx_multicast");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        tx_multicast = uvm_reg_field::type_id::create("tx_multicast", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        tx_multicast.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_tx_stats_tx_multicast_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_tx_stats_tx_multicast_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_multicast.get_name, tx_multicast.value);
        return s;
    endfunction

endclass


// Class: xgmac_tx_stats_tx_multicast_reg_cover
// Register coverage object.
class xgmac_tx_stats_tx_multicast_reg_cover extends uvm_object;

    static local xgmac_tx_stats_tx_multicast_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_tx_stats_tx_multicast_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        tx_multicast_wr: coverpoint r.tx_multicast.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        tx_multicast_rd: coverpoint r.tx_multicast.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_multicast_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_tx_stats_tx_multicast_reg_cover");
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
    static function xgmac_tx_stats_tx_multicast_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_tx_stats_tx_multicast_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_tx_stats_tx_multicast_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_tx_stats_tx_broadcast_reg_cover;

// Class: xgmac_tx_stats_tx_broadcast_reg
// Register xgmac_tx_stats.tx_broadcast: TX_Broadcast
class xgmac_tx_stats_tx_broadcast_reg extends uvm_reg;

    // Variable: tx_broadcast
    // TX Broadcast frames count [31:0]
    rand uvm_reg_field tx_broadcast;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_tx_stats_tx_broadcast_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_tx_stats_tx_broadcast_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_broadcast_reg)

    // Constructor: new
    function new(string name = "xgmac_tx_stats_tx_broadcast");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        tx_broadcast = uvm_reg_field::type_id::create("tx_broadcast", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        tx_broadcast.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_tx_stats_tx_broadcast_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_tx_stats_tx_broadcast_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_broadcast.get_name, tx_broadcast.value);
        return s;
    endfunction

endclass


// Class: xgmac_tx_stats_tx_broadcast_reg_cover
// Register coverage object.
class xgmac_tx_stats_tx_broadcast_reg_cover extends uvm_object;

    static local xgmac_tx_stats_tx_broadcast_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_tx_stats_tx_broadcast_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        tx_broadcast_wr: coverpoint r.tx_broadcast.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        tx_broadcast_rd: coverpoint r.tx_broadcast.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_broadcast_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_tx_stats_tx_broadcast_reg_cover");
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
    static function xgmac_tx_stats_tx_broadcast_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_tx_stats_tx_broadcast_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_tx_stats_tx_broadcast_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_tx_stats_reserved1_reg_cover;

// Class: xgmac_tx_stats_reserved1_reg
// Register xgmac_tx_stats.reserved1: Reserved
class xgmac_tx_stats_reserved1_reg extends uvm_reg;

    // Variable: unused
    // Unused
    rand uvm_reg_field unused;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_tx_stats_reserved1_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_tx_stats_reserved1_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_reserved1_reg)

    // Constructor: new
    function new(string name = "xgmac_tx_stats_reserved1");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        unused = uvm_reg_field::type_id::create("unused", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        unused.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_tx_stats_reserved1_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_tx_stats_reserved1_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, unused.get_name, unused.value);
        return s;
    endfunction

endclass


// Class: xgmac_tx_stats_reserved1_reg_cover
// Register coverage object.
class xgmac_tx_stats_reserved1_reg_cover extends uvm_object;

    static local xgmac_tx_stats_reserved1_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_tx_stats_reserved1_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        unused_wr: coverpoint r.unused.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        unused_rd: coverpoint r.unused.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_reserved1_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_tx_stats_reserved1_reg_cover");
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
    static function xgmac_tx_stats_reserved1_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_tx_stats_reserved1_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_tx_stats_reserved1_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_tx_stats_tx_pause_multicast_reg_cover;

// Class: xgmac_tx_stats_tx_pause_multicast_reg
// Register xgmac_tx_stats.tx_pause_multicast: TX_Pause_Multicast
class xgmac_tx_stats_tx_pause_multicast_reg extends uvm_reg;

    // Variable: tx_pause_multicast
    // TX Pause Multicast frames count [31:0]
    rand uvm_reg_field tx_pause_multicast;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_tx_stats_tx_pause_multicast_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_tx_stats_tx_pause_multicast_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_pause_multicast_reg)

    // Constructor: new
    function new(string name = "xgmac_tx_stats_tx_pause_multicast");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        tx_pause_multicast = uvm_reg_field::type_id::create("tx_pause_multicast", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        tx_pause_multicast.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_tx_stats_tx_pause_multicast_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_tx_stats_tx_pause_multicast_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_pause_multicast.get_name, tx_pause_multicast.value);
        return s;
    endfunction

endclass


// Class: xgmac_tx_stats_tx_pause_multicast_reg_cover
// Register coverage object.
class xgmac_tx_stats_tx_pause_multicast_reg_cover extends uvm_object;

    static local xgmac_tx_stats_tx_pause_multicast_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_tx_stats_tx_pause_multicast_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        tx_pause_multicast_wr: coverpoint r.tx_pause_multicast.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        tx_pause_multicast_rd: coverpoint r.tx_pause_multicast.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_pause_multicast_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_tx_stats_tx_pause_multicast_reg_cover");
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
    static function xgmac_tx_stats_tx_pause_multicast_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_tx_stats_tx_pause_multicast_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_tx_stats_tx_pause_multicast_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_tx_stats_reserved2_reg_cover;

// Class: xgmac_tx_stats_reserved2_reg
// Register xgmac_tx_stats.reserved2: Reserved
class xgmac_tx_stats_reserved2_reg extends uvm_reg;

    // Variable: unused
    // Unused
    rand uvm_reg_field unused;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_tx_stats_reserved2_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_tx_stats_reserved2_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_reserved2_reg)

    // Constructor: new
    function new(string name = "xgmac_tx_stats_reserved2");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        unused = uvm_reg_field::type_id::create("unused", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        unused.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_tx_stats_reserved2_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_tx_stats_reserved2_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, unused.get_name, unused.value);
        return s;
    endfunction

endclass


// Class: xgmac_tx_stats_reserved2_reg_cover
// Register coverage object.
class xgmac_tx_stats_reserved2_reg_cover extends uvm_object;

    static local xgmac_tx_stats_reserved2_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_tx_stats_reserved2_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        unused_wr: coverpoint r.unused.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        unused_rd: coverpoint r.unused.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_reserved2_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_tx_stats_reserved2_reg_cover");
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
    static function xgmac_tx_stats_reserved2_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_tx_stats_reserved2_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_tx_stats_reserved2_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_tx_stats_tx_vlan_x8100_good_reg_cover;

// Class: xgmac_tx_stats_tx_vlan_x8100_good_reg
// Register xgmac_tx_stats.tx_vlan_x8100_good: TX_VLAN_x8100_Good
class xgmac_tx_stats_tx_vlan_x8100_good_reg extends uvm_reg;

    // Variable: tx_vlan_x8100_good
    // TX VLAN x8100 Good frames count [31:0]
    rand uvm_reg_field tx_vlan_x8100_good;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_tx_stats_tx_vlan_x8100_good_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_tx_stats_tx_vlan_x8100_good_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_vlan_x8100_good_reg)

    // Constructor: new
    function new(string name = "xgmac_tx_stats_tx_vlan_x8100_good");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        tx_vlan_x8100_good = uvm_reg_field::type_id::create("tx_vlan_x8100_good", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        tx_vlan_x8100_good.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_tx_stats_tx_vlan_x8100_good_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_tx_stats_tx_vlan_x8100_good_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_vlan_x8100_good.get_name, tx_vlan_x8100_good.value);
        return s;
    endfunction

endclass


// Class: xgmac_tx_stats_tx_vlan_x8100_good_reg_cover
// Register coverage object.
class xgmac_tx_stats_tx_vlan_x8100_good_reg_cover extends uvm_object;

    static local xgmac_tx_stats_tx_vlan_x8100_good_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_tx_stats_tx_vlan_x8100_good_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        tx_vlan_x8100_good_wr: coverpoint r.tx_vlan_x8100_good.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        tx_vlan_x8100_good_rd: coverpoint r.tx_vlan_x8100_good.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_vlan_x8100_good_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_tx_stats_tx_vlan_x8100_good_reg_cover");
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
    static function xgmac_tx_stats_tx_vlan_x8100_good_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_tx_stats_tx_vlan_x8100_good_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_tx_stats_tx_vlan_x8100_good_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_tx_stats_tx_vlan_second_vlan_ethertype_good_reg_cover;

// Class: xgmac_tx_stats_tx_vlan_second_vlan_ethertype_good_reg
// Register xgmac_tx_stats.tx_vlan_second_vlan_ethertype_good: TX_VLAN_Second_VLAN_Ethertype_Good
class xgmac_tx_stats_tx_vlan_second_vlan_ethertype_good_reg extends uvm_reg;

    // Variable: tx_vlan_second_vlan_ethertype_good
    // TX VLAN (Second VLAN Ethertype) Good frames count [31:0]
    rand uvm_reg_field tx_vlan_second_vlan_ethertype_good;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_tx_stats_tx_vlan_second_vlan_ethertype_good_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_tx_stats_tx_vlan_second_vlan_ethertype_good_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_vlan_second_vlan_ethertype_good_reg)

    // Constructor: new
    function new(string name = "xgmac_tx_stats_tx_vlan_second_vlan_ethertype_good");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        tx_vlan_second_vlan_ethertype_good = uvm_reg_field::type_id::create("tx_vlan_second_vlan_ethertype_good", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        tx_vlan_second_vlan_ethertype_good.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_tx_stats_tx_vlan_second_vlan_ethertype_good_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_tx_stats_tx_vlan_second_vlan_ethertype_good_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_vlan_second_vlan_ethertype_good.get_name, tx_vlan_second_vlan_ethertype_good.value);
        return s;
    endfunction

endclass


// Class: xgmac_tx_stats_tx_vlan_second_vlan_ethertype_good_reg_cover
// Register coverage object.
class xgmac_tx_stats_tx_vlan_second_vlan_ethertype_good_reg_cover extends uvm_object;

    static local xgmac_tx_stats_tx_vlan_second_vlan_ethertype_good_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_tx_stats_tx_vlan_second_vlan_ethertype_good_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        tx_vlan_second_vlan_ethertype_good_wr: coverpoint r.tx_vlan_second_vlan_ethertype_good.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        tx_vlan_second_vlan_ethertype_good_rd: coverpoint r.tx_vlan_second_vlan_ethertype_good.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_vlan_second_vlan_ethertype_good_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_tx_stats_tx_vlan_second_vlan_ethertype_good_reg_cover");
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
    static function xgmac_tx_stats_tx_vlan_second_vlan_ethertype_good_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_tx_stats_tx_vlan_second_vlan_ethertype_good_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_tx_stats_tx_vlan_second_vlan_ethertype_good_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_tx_stats_tx_stack_vlan_x8100_good_reg_cover;

// Class: xgmac_tx_stats_tx_stack_vlan_x8100_good_reg
// Register xgmac_tx_stats.tx_stack_vlan_x8100_good: TX_Stack_VLAN_x8100_Good
class xgmac_tx_stats_tx_stack_vlan_x8100_good_reg extends uvm_reg;

    // Variable: tx_stack_vlan_x8100_good
    // TX Stack VLAN x8100  Good frames count [31:0]
    rand uvm_reg_field tx_stack_vlan_x8100_good;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_tx_stats_tx_stack_vlan_x8100_good_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_tx_stats_tx_stack_vlan_x8100_good_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_stack_vlan_x8100_good_reg)

    // Constructor: new
    function new(string name = "xgmac_tx_stats_tx_stack_vlan_x8100_good");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        tx_stack_vlan_x8100_good = uvm_reg_field::type_id::create("tx_stack_vlan_x8100_good", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        tx_stack_vlan_x8100_good.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_tx_stats_tx_stack_vlan_x8100_good_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_tx_stats_tx_stack_vlan_x8100_good_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_stack_vlan_x8100_good.get_name, tx_stack_vlan_x8100_good.value);
        return s;
    endfunction

endclass


// Class: xgmac_tx_stats_tx_stack_vlan_x8100_good_reg_cover
// Register coverage object.
class xgmac_tx_stats_tx_stack_vlan_x8100_good_reg_cover extends uvm_object;

    static local xgmac_tx_stats_tx_stack_vlan_x8100_good_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_tx_stats_tx_stack_vlan_x8100_good_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        tx_stack_vlan_x8100_good_wr: coverpoint r.tx_stack_vlan_x8100_good.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        tx_stack_vlan_x8100_good_rd: coverpoint r.tx_stack_vlan_x8100_good.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_stack_vlan_x8100_good_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_tx_stats_tx_stack_vlan_x8100_good_reg_cover");
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
    static function xgmac_tx_stats_tx_stack_vlan_x8100_good_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_tx_stats_tx_stack_vlan_x8100_good_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_tx_stats_tx_stack_vlan_x8100_good_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_tx_stats_tx_stack_vlan_second_vlan_ethertype_good_reg_cover;

// Class: xgmac_tx_stats_tx_stack_vlan_second_vlan_ethertype_good_reg
// Register xgmac_tx_stats.tx_stack_vlan_second_vlan_ethertype_good: TX_Stack_VLAN_Second_VLAN_Ethertype_Good
class xgmac_tx_stats_tx_stack_vlan_second_vlan_ethertype_good_reg extends uvm_reg;

    // Variable: tx_stack_vlan_second_vlan_ethertype_good
    // TX Stack VLAN (Second VLAN Ethertype) Good frames count [31:0]
    rand uvm_reg_field tx_stack_vlan_second_vlan_ethertype_good;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_tx_stats_tx_stack_vlan_second_vlan_ethertype_good_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_tx_stats_tx_stack_vlan_second_vlan_ethertype_good_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_stack_vlan_second_vlan_ethertype_good_reg)

    // Constructor: new
    function new(string name = "xgmac_tx_stats_tx_stack_vlan_second_vlan_ethertype_good");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        tx_stack_vlan_second_vlan_ethertype_good = uvm_reg_field::type_id::create("tx_stack_vlan_second_vlan_ethertype_good", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        tx_stack_vlan_second_vlan_ethertype_good.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_tx_stats_tx_stack_vlan_second_vlan_ethertype_good_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_tx_stats_tx_stack_vlan_second_vlan_ethertype_good_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_stack_vlan_second_vlan_ethertype_good.get_name, tx_stack_vlan_second_vlan_ethertype_good.value);
        return s;
    endfunction

endclass


// Class: xgmac_tx_stats_tx_stack_vlan_second_vlan_ethertype_good_reg_cover
// Register coverage object.
class xgmac_tx_stats_tx_stack_vlan_second_vlan_ethertype_good_reg_cover extends uvm_object;

    static local xgmac_tx_stats_tx_stack_vlan_second_vlan_ethertype_good_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_tx_stats_tx_stack_vlan_second_vlan_ethertype_good_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        tx_stack_vlan_second_vlan_ethertype_good_wr: coverpoint r.tx_stack_vlan_second_vlan_ethertype_good.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        tx_stack_vlan_second_vlan_ethertype_good_rd: coverpoint r.tx_stack_vlan_second_vlan_ethertype_good.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_stack_vlan_second_vlan_ethertype_good_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_tx_stats_tx_stack_vlan_second_vlan_ethertype_good_reg_cover");
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
    static function xgmac_tx_stats_tx_stack_vlan_second_vlan_ethertype_good_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_tx_stats_tx_stack_vlan_second_vlan_ethertype_good_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_tx_stats_tx_stack_vlan_second_vlan_ethertype_good_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_tx_stats_tx_octets_good_reg_cover;

// Class: xgmac_tx_stats_tx_octets_good_reg
// Register xgmac_tx_stats.tx_octets_good: TX_Octets_Good
class xgmac_tx_stats_tx_octets_good_reg extends uvm_reg;

    // Variable: tx_octets_good
    // TX Good frames bytes count [31:0]
    rand uvm_reg_field tx_octets_good;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_tx_stats_tx_octets_good_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_tx_stats_tx_octets_good_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_octets_good_reg)

    // Constructor: new
    function new(string name = "xgmac_tx_stats_tx_octets_good");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        tx_octets_good = uvm_reg_field::type_id::create("tx_octets_good", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        tx_octets_good.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_tx_stats_tx_octets_good_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_tx_stats_tx_octets_good_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_octets_good.get_name, tx_octets_good.value);
        return s;
    endfunction

endclass


// Class: xgmac_tx_stats_tx_octets_good_reg_cover
// Register coverage object.
class xgmac_tx_stats_tx_octets_good_reg_cover extends uvm_object;

    static local xgmac_tx_stats_tx_octets_good_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_tx_stats_tx_octets_good_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        tx_octets_good_wr: coverpoint r.tx_octets_good.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        tx_octets_good_rd: coverpoint r.tx_octets_good.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_octets_good_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_tx_stats_tx_octets_good_reg_cover");
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
    static function xgmac_tx_stats_tx_octets_good_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_tx_stats_tx_octets_good_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_tx_stats_tx_octets_good_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_tx_stats_tx_octets_bad_reg_cover;

// Class: xgmac_tx_stats_tx_octets_bad_reg
// Register xgmac_tx_stats.tx_octets_bad: TX_Octets_Bad
class xgmac_tx_stats_tx_octets_bad_reg extends uvm_reg;

    // Variable: tx_octets_bad
    // TX Bad frames bytes count [31:0]
    rand uvm_reg_field tx_octets_bad;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_tx_stats_tx_octets_bad_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_tx_stats_tx_octets_bad_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_octets_bad_reg)

    // Constructor: new
    function new(string name = "xgmac_tx_stats_tx_octets_bad");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        tx_octets_bad = uvm_reg_field::type_id::create("tx_octets_bad", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        tx_octets_bad.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_tx_stats_tx_octets_bad_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_tx_stats_tx_octets_bad_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_octets_bad.get_name, tx_octets_bad.value);
        return s;
    endfunction

endclass


// Class: xgmac_tx_stats_tx_octets_bad_reg_cover
// Register coverage object.
class xgmac_tx_stats_tx_octets_bad_reg_cover extends uvm_object;

    static local xgmac_tx_stats_tx_octets_bad_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_tx_stats_tx_octets_bad_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        tx_octets_bad_wr: coverpoint r.tx_octets_bad.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        tx_octets_bad_rd: coverpoint r.tx_octets_bad.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_octets_bad_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_tx_stats_tx_octets_bad_reg_cover");
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
    static function xgmac_tx_stats_tx_octets_bad_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_tx_stats_tx_octets_bad_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_tx_stats_tx_octets_bad_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_tx_stats_tx_large_good_reg_cover;

// Class: xgmac_tx_stats_tx_large_good_reg
// Register xgmac_tx_stats.tx_large_good: TX_large_Good
class xgmac_tx_stats_tx_large_good_reg extends uvm_reg;

    // Variable: tx_large_good
    // TX large_Good frames count [31:0]
    rand uvm_reg_field tx_large_good;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_tx_stats_tx_large_good_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_tx_stats_tx_large_good_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_large_good_reg)

    // Constructor: new
    function new(string name = "xgmac_tx_stats_tx_large_good");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        tx_large_good = uvm_reg_field::type_id::create("tx_large_good", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        tx_large_good.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_tx_stats_tx_large_good_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_tx_stats_tx_large_good_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_large_good.get_name, tx_large_good.value);
        return s;
    endfunction

endclass


// Class: xgmac_tx_stats_tx_large_good_reg_cover
// Register coverage object.
class xgmac_tx_stats_tx_large_good_reg_cover extends uvm_object;

    static local xgmac_tx_stats_tx_large_good_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_tx_stats_tx_large_good_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        tx_large_good_wr: coverpoint r.tx_large_good.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        tx_large_good_rd: coverpoint r.tx_large_good.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_large_good_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_tx_stats_tx_large_good_reg_cover");
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
    static function xgmac_tx_stats_tx_large_good_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_tx_stats_tx_large_good_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_tx_stats_tx_large_good_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_tx_stats_tx_large_bad_reg_cover;

// Class: xgmac_tx_stats_tx_large_bad_reg
// Register xgmac_tx_stats.tx_large_bad: TX_large_Bad
class xgmac_tx_stats_tx_large_bad_reg extends uvm_reg;

    // Variable: tx_large_bad
    // TX large_Bad frames count [31:0]
    rand uvm_reg_field tx_large_bad;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_tx_stats_tx_large_bad_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_tx_stats_tx_large_bad_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_large_bad_reg)

    // Constructor: new
    function new(string name = "xgmac_tx_stats_tx_large_bad");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        tx_large_bad = uvm_reg_field::type_id::create("tx_large_bad", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        tx_large_bad.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_tx_stats_tx_large_bad_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_tx_stats_tx_large_bad_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_large_bad.get_name, tx_large_bad.value);
        return s;
    endfunction

endclass


// Class: xgmac_tx_stats_tx_large_bad_reg_cover
// Register coverage object.
class xgmac_tx_stats_tx_large_bad_reg_cover extends uvm_object;

    static local xgmac_tx_stats_tx_large_bad_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_tx_stats_tx_large_bad_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        tx_large_bad_wr: coverpoint r.tx_large_bad.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        tx_large_bad_rd: coverpoint r.tx_large_bad.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_large_bad_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_tx_stats_tx_large_bad_reg_cover");
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
    static function xgmac_tx_stats_tx_large_bad_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_tx_stats_tx_large_bad_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_tx_stats_tx_large_bad_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_tx_stats_tx_fifo_overflow_reg_cover;

// Class: xgmac_tx_stats_tx_fifo_overflow_reg
// Register xgmac_tx_stats.tx_fifo_overflow: TX_FIFO_Overflow
class xgmac_tx_stats_tx_fifo_overflow_reg extends uvm_reg;

    // Variable: tx_fifo_overflow
    // TX FIFO Overflow frames count [31:0]
    rand uvm_reg_field tx_fifo_overflow;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_tx_stats_tx_fifo_overflow_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_tx_stats_tx_fifo_overflow_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_fifo_overflow_reg)

    // Constructor: new
    function new(string name = "xgmac_tx_stats_tx_fifo_overflow");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        tx_fifo_overflow = uvm_reg_field::type_id::create("tx_fifo_overflow", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        tx_fifo_overflow.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_tx_stats_tx_fifo_overflow_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_tx_stats_tx_fifo_overflow_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_fifo_overflow.get_name, tx_fifo_overflow.value);
        return s;
    endfunction

endclass


// Class: xgmac_tx_stats_tx_fifo_overflow_reg_cover
// Register coverage object.
class xgmac_tx_stats_tx_fifo_overflow_reg_cover extends uvm_object;

    static local xgmac_tx_stats_tx_fifo_overflow_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_tx_stats_tx_fifo_overflow_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        tx_fifo_overflow_wr: coverpoint r.tx_fifo_overflow.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        tx_fifo_overflow_rd: coverpoint r.tx_fifo_overflow.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_fifo_overflow_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_tx_stats_tx_fifo_overflow_reg_cover");
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
    static function xgmac_tx_stats_tx_fifo_overflow_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_tx_stats_tx_fifo_overflow_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_tx_stats_tx_fifo_overflow_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_tx_stats_tx_fifo_underflow_reg_cover;

// Class: xgmac_tx_stats_tx_fifo_underflow_reg
// Register xgmac_tx_stats.tx_fifo_underflow: TX_FIFO_Underflow
class xgmac_tx_stats_tx_fifo_underflow_reg extends uvm_reg;

    // Variable: tx_fifo_underflow
    // TX FIFO Underflow frames count [31:0]
    rand uvm_reg_field tx_fifo_underflow;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_tx_stats_tx_fifo_underflow_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_tx_stats_tx_fifo_underflow_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_fifo_underflow_reg)

    // Constructor: new
    function new(string name = "xgmac_tx_stats_tx_fifo_underflow");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        tx_fifo_underflow = uvm_reg_field::type_id::create("tx_fifo_underflow", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        tx_fifo_underflow.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_tx_stats_tx_fifo_underflow_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_tx_stats_tx_fifo_underflow_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_fifo_underflow.get_name, tx_fifo_underflow.value);
        return s;
    endfunction

endclass


// Class: xgmac_tx_stats_tx_fifo_underflow_reg_cover
// Register coverage object.
class xgmac_tx_stats_tx_fifo_underflow_reg_cover extends uvm_object;

    static local xgmac_tx_stats_tx_fifo_underflow_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_tx_stats_tx_fifo_underflow_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        tx_fifo_underflow_wr: coverpoint r.tx_fifo_underflow.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        tx_fifo_underflow_rd: coverpoint r.tx_fifo_underflow.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_fifo_underflow_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_tx_stats_tx_fifo_underflow_reg_cover");
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
    static function xgmac_tx_stats_tx_fifo_underflow_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_tx_stats_tx_fifo_underflow_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_tx_stats_tx_fifo_underflow_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_tx_stats_reserved4_reg_cover;

// Class: xgmac_tx_stats_reserved4_reg
// Register xgmac_tx_stats.reserved4: Reserved
class xgmac_tx_stats_reserved4_reg extends uvm_reg;

    // Variable: unused
    // Unused
    rand uvm_reg_field unused;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_tx_stats_reserved4_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_tx_stats_reserved4_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_reserved4_reg)

    // Constructor: new
    function new(string name = "xgmac_tx_stats_reserved4");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        unused = uvm_reg_field::type_id::create("unused", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        unused.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_tx_stats_reserved4_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_tx_stats_reserved4_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, unused.get_name, unused.value);
        return s;
    endfunction

endclass


// Class: xgmac_tx_stats_reserved4_reg_cover
// Register coverage object.
class xgmac_tx_stats_reserved4_reg_cover extends uvm_object;

    static local xgmac_tx_stats_reserved4_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_tx_stats_reserved4_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        unused_wr: coverpoint r.unused.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        unused_rd: coverpoint r.unused.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_reserved4_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_tx_stats_reserved4_reg_cover");
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
    static function xgmac_tx_stats_reserved4_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_tx_stats_reserved4_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_tx_stats_reserved4_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_tx_stats_tx_forced_error_reg_cover;

// Class: xgmac_tx_stats_tx_forced_error_reg
// Register xgmac_tx_stats.tx_forced_error: TX_Forced_Error
class xgmac_tx_stats_tx_forced_error_reg extends uvm_reg;

    // Variable: tx_forced_error
    // TX Forced Error frames count [31:0]
    rand uvm_reg_field tx_forced_error;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_tx_stats_tx_forced_error_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_tx_stats_tx_forced_error_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_forced_error_reg)

    // Constructor: new
    function new(string name = "xgmac_tx_stats_tx_forced_error");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        tx_forced_error = uvm_reg_field::type_id::create("tx_forced_error", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        tx_forced_error.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_tx_stats_tx_forced_error_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_tx_stats_tx_forced_error_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_forced_error.get_name, tx_forced_error.value);
        return s;
    endfunction

endclass


// Class: xgmac_tx_stats_tx_forced_error_reg_cover
// Register coverage object.
class xgmac_tx_stats_tx_forced_error_reg_cover extends uvm_object;

    static local xgmac_tx_stats_tx_forced_error_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_tx_stats_tx_forced_error_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        tx_forced_error_wr: coverpoint r.tx_forced_error.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        tx_forced_error_rd: coverpoint r.tx_forced_error.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_forced_error_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_tx_stats_tx_forced_error_reg_cover");
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
    static function xgmac_tx_stats_tx_forced_error_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_tx_stats_tx_forced_error_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_tx_stats_tx_forced_error_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_tx_stats_reserved5_reg_cover;

// Class: xgmac_tx_stats_reserved5_reg
// Register xgmac_tx_stats.reserved5: Reserved
class xgmac_tx_stats_reserved5_reg extends uvm_reg;

    // Variable: unused
    // Unused
    rand uvm_reg_field unused;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_tx_stats_reserved5_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_tx_stats_reserved5_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_reserved5_reg)

    // Constructor: new
    function new(string name = "xgmac_tx_stats_reserved5");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        unused = uvm_reg_field::type_id::create("unused", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        unused.configure(this, 64, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_tx_stats_reserved5_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_tx_stats_reserved5_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, unused.get_name, unused.value);
        return s;
    endfunction

endclass


// Class: xgmac_tx_stats_reserved5_reg_cover
// Register coverage object.
class xgmac_tx_stats_reserved5_reg_cover extends uvm_object;

    static local xgmac_tx_stats_reserved5_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_tx_stats_reserved5_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        unused_wr: coverpoint r.unused.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        unused_rd: coverpoint r.unused.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_reserved5_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_tx_stats_reserved5_reg_cover");
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
    static function xgmac_tx_stats_reserved5_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_tx_stats_reserved5_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_tx_stats_reserved5_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_tx_stats_tx_fault_reg_cover;

// Class: xgmac_tx_stats_tx_fault_reg
// Register xgmac_tx_stats.tx_fault: TX_Fault
class xgmac_tx_stats_tx_fault_reg extends uvm_reg;

    // Variable: tx_fault
    // TX Fault count [31:0]
    rand uvm_reg_field tx_fault;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_tx_stats_tx_fault_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_tx_stats_tx_fault_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_fault_reg)

    // Constructor: new
    function new(string name = "xgmac_tx_stats_tx_fault");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        tx_fault = uvm_reg_field::type_id::create("tx_fault", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        tx_fault.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_tx_stats_tx_fault_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_tx_stats_tx_fault_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_fault.get_name, tx_fault.value);
        return s;
    endfunction

endclass


// Class: xgmac_tx_stats_tx_fault_reg_cover
// Register coverage object.
class xgmac_tx_stats_tx_fault_reg_cover extends uvm_object;

    static local xgmac_tx_stats_tx_fault_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_tx_stats_tx_fault_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        tx_fault_wr: coverpoint r.tx_fault.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        tx_fault_rd: coverpoint r.tx_fault.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_tx_fault_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_tx_stats_tx_fault_reg_cover");
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
    static function xgmac_tx_stats_tx_fault_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_tx_stats_tx_fault_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_tx_stats_tx_fault_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class xgmac_tx_stats_reserved6_reg_cover;

// Class: xgmac_tx_stats_reserved6_reg
// Register xgmac_tx_stats.reserved6: Reserved
class xgmac_tx_stats_reserved6_reg extends uvm_reg;

    // Variable: unused
    // Unused
    rand uvm_reg_field unused;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static xgmac_tx_stats_reserved6_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    xgmac_tx_stats_reserved6_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_reserved6_reg)

    // Constructor: new
    function new(string name = "xgmac_tx_stats_reserved6");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        unused = uvm_reg_field::type_id::create("unused", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        unused.configure(this, 36, 0, "ro", 0, 'h0, 1, 1, 0);
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
                cg = xgmac_tx_stats_reserved6_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = xgmac_tx_stats_reserved6_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, unused.get_name, unused.value);
        return s;
    endfunction

endclass


// Class: xgmac_tx_stats_reserved6_reg_cover
// Register coverage object.
class xgmac_tx_stats_reserved6_reg_cover extends uvm_object;

    static local xgmac_tx_stats_reserved6_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    xgmac_tx_stats_reserved6_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        unused_wr: coverpoint r.unused.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        unused_rd: coverpoint r.unused.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_reserved6_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="xgmac_tx_stats_reserved6_reg_cover");
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
    static function xgmac_tx_stats_reserved6_reg_cover get();
        if (m_inst == null) begin
            m_inst = xgmac_tx_stats_reserved6_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(xgmac_tx_stats_reserved6_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass





// Class: xgmac_tx_stats_reg_block
// Register Block .xgmac_tx_stats: 
class xgmac_tx_stats_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand xgmac_tx_stats_tx_short_bad_reg tx_short_bad;
    rand xgmac_tx_stats_tx_short_good_reg tx_short_good;
    rand xgmac_tx_stats_tx_frame_size_equal_64_bytes_reg tx_frame_size_equal_64_bytes;
    rand xgmac_tx_stats_tx_64_lt_frame_size_lt_128_reg tx_64_lt_frame_size_lt_128;
    rand xgmac_tx_stats_tx_128_lte_frame_size_lt_256_reg tx_128_lte_frame_size_lt_256;
    rand xgmac_tx_stats_tx_256_lte_frame_size_lt_512_reg tx_256_lte_frame_size_lt_512;
    rand xgmac_tx_stats_tx_512_lte_frame_size_lt_1024_reg tx_512_lte_frame_size_lt_1024;
    rand xgmac_tx_stats_tx_1024_lte_frame_size_lt_1518_reg tx_1024_lte_frame_size_lt_1518;
    rand xgmac_tx_stats_tx_1518_lte_frame_size_lt_2048_reg tx_1518_lte_frame_size_lt_2048;
    rand xgmac_tx_stats_tx_2048_lte_frame_size_lt_4096_reg tx_2048_lte_frame_size_lt_4096;
    rand xgmac_tx_stats_tx_4096_lte_frame_size_lt_8192_reg tx_4096_lte_frame_size_lt_8192;
    rand xgmac_tx_stats_tx_8192_lte_frame_size_reg tx_8192_lte_frame_size;
    rand xgmac_tx_stats_reserved0_reg reserved0;
    rand xgmac_tx_stats_tx_unicast_reg tx_unicast;
    rand xgmac_tx_stats_tx_multicast_reg tx_multicast;
    rand xgmac_tx_stats_tx_broadcast_reg tx_broadcast;
    rand xgmac_tx_stats_reserved1_reg reserved1;
    rand xgmac_tx_stats_tx_pause_multicast_reg tx_pause_multicast;
    rand xgmac_tx_stats_reserved2_reg reserved2;
    rand xgmac_tx_stats_tx_vlan_x8100_good_reg tx_vlan_x8100_good;
    rand xgmac_tx_stats_tx_vlan_second_vlan_ethertype_good_reg tx_vlan_second_vlan_ethertype_good;
    rand xgmac_tx_stats_tx_stack_vlan_x8100_good_reg tx_stack_vlan_x8100_good;
    rand xgmac_tx_stats_tx_stack_vlan_second_vlan_ethertype_good_reg tx_stack_vlan_second_vlan_ethertype_good;
    rand xgmac_tx_stats_tx_octets_good_reg tx_octets_good;
    rand xgmac_tx_stats_tx_octets_bad_reg tx_octets_bad;
    rand xgmac_tx_stats_tx_large_good_reg tx_large_good;
    rand xgmac_tx_stats_tx_large_bad_reg tx_large_bad;
    rand xgmac_tx_stats_tx_fifo_overflow_reg tx_fifo_overflow;
    rand xgmac_tx_stats_tx_fifo_underflow_reg tx_fifo_underflow;
    rand xgmac_tx_stats_reserved4_reg reserved4;
    rand xgmac_tx_stats_tx_forced_error_reg tx_forced_error;
    rand xgmac_tx_stats_reserved5_reg reserved5;
    rand xgmac_tx_stats_tx_fault_reg tx_fault;
    rand xgmac_tx_stats_reserved6_reg reserved6;

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(xgmac_tx_stats_reg_pkg::xgmac_tx_stats_reg_block)

    // Constructor: new
    function new(string name = "xgmac_tx_stats_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})


        tx_short_bad = xgmac_tx_stats_tx_short_bad_reg::type_id::create("tx_short_bad", , get_full_name());
        tx_short_good = xgmac_tx_stats_tx_short_good_reg::type_id::create("tx_short_good", , get_full_name());
        tx_frame_size_equal_64_bytes = xgmac_tx_stats_tx_frame_size_equal_64_bytes_reg::type_id::create("tx_frame_size_equal_64_bytes", , get_full_name());
        tx_64_lt_frame_size_lt_128 = xgmac_tx_stats_tx_64_lt_frame_size_lt_128_reg::type_id::create("tx_64_lt_frame_size_lt_128", , get_full_name());
        tx_128_lte_frame_size_lt_256 = xgmac_tx_stats_tx_128_lte_frame_size_lt_256_reg::type_id::create("tx_128_lte_frame_size_lt_256", , get_full_name());
        tx_256_lte_frame_size_lt_512 = xgmac_tx_stats_tx_256_lte_frame_size_lt_512_reg::type_id::create("tx_256_lte_frame_size_lt_512", , get_full_name());
        tx_512_lte_frame_size_lt_1024 = xgmac_tx_stats_tx_512_lte_frame_size_lt_1024_reg::type_id::create("tx_512_lte_frame_size_lt_1024", , get_full_name());
        tx_1024_lte_frame_size_lt_1518 = xgmac_tx_stats_tx_1024_lte_frame_size_lt_1518_reg::type_id::create("tx_1024_lte_frame_size_lt_1518", , get_full_name());
        tx_1518_lte_frame_size_lt_2048 = xgmac_tx_stats_tx_1518_lte_frame_size_lt_2048_reg::type_id::create("tx_1518_lte_frame_size_lt_2048", , get_full_name());
        tx_2048_lte_frame_size_lt_4096 = xgmac_tx_stats_tx_2048_lte_frame_size_lt_4096_reg::type_id::create("tx_2048_lte_frame_size_lt_4096", , get_full_name());
        tx_4096_lte_frame_size_lt_8192 = xgmac_tx_stats_tx_4096_lte_frame_size_lt_8192_reg::type_id::create("tx_4096_lte_frame_size_lt_8192", , get_full_name());
        tx_8192_lte_frame_size = xgmac_tx_stats_tx_8192_lte_frame_size_reg::type_id::create("tx_8192_lte_frame_size", , get_full_name());
        reserved0 = xgmac_tx_stats_reserved0_reg::type_id::create("reserved0", , get_full_name());
        tx_unicast = xgmac_tx_stats_tx_unicast_reg::type_id::create("tx_unicast", , get_full_name());
        tx_multicast = xgmac_tx_stats_tx_multicast_reg::type_id::create("tx_multicast", , get_full_name());
        tx_broadcast = xgmac_tx_stats_tx_broadcast_reg::type_id::create("tx_broadcast", , get_full_name());
        reserved1 = xgmac_tx_stats_reserved1_reg::type_id::create("reserved1", , get_full_name());
        tx_pause_multicast = xgmac_tx_stats_tx_pause_multicast_reg::type_id::create("tx_pause_multicast", , get_full_name());
        reserved2 = xgmac_tx_stats_reserved2_reg::type_id::create("reserved2", , get_full_name());
        tx_vlan_x8100_good = xgmac_tx_stats_tx_vlan_x8100_good_reg::type_id::create("tx_vlan_x8100_good", , get_full_name());
        tx_vlan_second_vlan_ethertype_good = xgmac_tx_stats_tx_vlan_second_vlan_ethertype_good_reg::type_id::create("tx_vlan_second_vlan_ethertype_good", , get_full_name());
        tx_stack_vlan_x8100_good = xgmac_tx_stats_tx_stack_vlan_x8100_good_reg::type_id::create("tx_stack_vlan_x8100_good", , get_full_name());
        tx_stack_vlan_second_vlan_ethertype_good = xgmac_tx_stats_tx_stack_vlan_second_vlan_ethertype_good_reg::type_id::create("tx_stack_vlan_second_vlan_ethertype_good", , get_full_name());
        tx_octets_good = xgmac_tx_stats_tx_octets_good_reg::type_id::create("tx_octets_good", , get_full_name());
        tx_octets_bad = xgmac_tx_stats_tx_octets_bad_reg::type_id::create("tx_octets_bad", , get_full_name());
        tx_large_good = xgmac_tx_stats_tx_large_good_reg::type_id::create("tx_large_good", , get_full_name());
        tx_large_bad = xgmac_tx_stats_tx_large_bad_reg::type_id::create("tx_large_bad", , get_full_name());
        tx_fifo_overflow = xgmac_tx_stats_tx_fifo_overflow_reg::type_id::create("tx_fifo_overflow", , get_full_name());
        tx_fifo_underflow = xgmac_tx_stats_tx_fifo_underflow_reg::type_id::create("tx_fifo_underflow", , get_full_name());
        reserved4 = xgmac_tx_stats_reserved4_reg::type_id::create("reserved4", , get_full_name());
        tx_forced_error = xgmac_tx_stats_tx_forced_error_reg::type_id::create("tx_forced_error", , get_full_name());
        reserved5 = xgmac_tx_stats_reserved5_reg::type_id::create("reserved5", , get_full_name());
        tx_fault = xgmac_tx_stats_tx_fault_reg::type_id::create("tx_fault", , get_full_name());
        reserved6 = xgmac_tx_stats_reserved6_reg::type_id::create("reserved6", , get_full_name());

        tx_short_bad.configure(this);
        tx_short_good.configure(this);
        tx_frame_size_equal_64_bytes.configure(this);
        tx_64_lt_frame_size_lt_128.configure(this);
        tx_128_lte_frame_size_lt_256.configure(this);
        tx_256_lte_frame_size_lt_512.configure(this);
        tx_512_lte_frame_size_lt_1024.configure(this);
        tx_1024_lte_frame_size_lt_1518.configure(this);
        tx_1518_lte_frame_size_lt_2048.configure(this);
        tx_2048_lte_frame_size_lt_4096.configure(this);
        tx_4096_lte_frame_size_lt_8192.configure(this);
        tx_8192_lte_frame_size.configure(this);
        reserved0.configure(this);
        tx_unicast.configure(this);
        tx_multicast.configure(this);
        tx_broadcast.configure(this);
        reserved1.configure(this);
        tx_pause_multicast.configure(this);
        reserved2.configure(this);
        tx_vlan_x8100_good.configure(this);
        tx_vlan_second_vlan_ethertype_good.configure(this);
        tx_stack_vlan_x8100_good.configure(this);
        tx_stack_vlan_second_vlan_ethertype_good.configure(this);
        tx_octets_good.configure(this);
        tx_octets_bad.configure(this);
        tx_large_good.configure(this);
        tx_large_bad.configure(this);
        tx_fifo_overflow.configure(this);
        tx_fifo_underflow.configure(this);
        reserved4.configure(this);
        tx_forced_error.configure(this);
        reserved5.configure(this);
        tx_fault.configure(this);
        reserved6.configure(this);

        tx_short_bad.build();
        tx_short_good.build();
        tx_frame_size_equal_64_bytes.build();
        tx_64_lt_frame_size_lt_128.build();
        tx_128_lte_frame_size_lt_256.build();
        tx_256_lte_frame_size_lt_512.build();
        tx_512_lte_frame_size_lt_1024.build();
        tx_1024_lte_frame_size_lt_1518.build();
        tx_1518_lte_frame_size_lt_2048.build();
        tx_2048_lte_frame_size_lt_4096.build();
        tx_4096_lte_frame_size_lt_8192.build();
        tx_8192_lte_frame_size.build();
        reserved0.build();
        tx_unicast.build();
        tx_multicast.build();
        tx_broadcast.build();
        reserved1.build();
        tx_pause_multicast.build();
        reserved2.build();
        tx_vlan_x8100_good.build();
        tx_vlan_second_vlan_ethertype_good.build();
        tx_stack_vlan_x8100_good.build();
        tx_stack_vlan_second_vlan_ethertype_good.build();
        tx_octets_good.build();
        tx_octets_bad.build();
        tx_large_good.build();
        tx_large_bad.build();
        tx_fifo_overflow.build();
        tx_fifo_underflow.build();
        reserved4.build();
        tx_forced_error.build();
        reserved5.build();
        tx_fault.build();
        reserved6.build();

        // define default map
        default_map = create_map("xgmac_tx_stats_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        this.default_map.add_reg(tx_short_bad, 'h0, "RO");
        this.default_map.add_reg(tx_short_good, 'h2, "RO");
        this.default_map.add_reg(tx_frame_size_equal_64_bytes, 'h4, "RO");
        this.default_map.add_reg(tx_64_lt_frame_size_lt_128, 'h6, "RO");
        this.default_map.add_reg(tx_128_lte_frame_size_lt_256, 'h8, "RO");
        this.default_map.add_reg(tx_256_lte_frame_size_lt_512, 'hA, "RO");
        this.default_map.add_reg(tx_512_lte_frame_size_lt_1024, 'hC, "RO");
        this.default_map.add_reg(tx_1024_lte_frame_size_lt_1518, 'hE, "RO");
        this.default_map.add_reg(tx_1518_lte_frame_size_lt_2048, 'h10, "RO");
        this.default_map.add_reg(tx_2048_lte_frame_size_lt_4096, 'h12, "RO");
        this.default_map.add_reg(tx_4096_lte_frame_size_lt_8192, 'h14, "RO");
        this.default_map.add_reg(tx_8192_lte_frame_size, 'h16, "RO");
        this.default_map.add_reg(reserved0, 'h18, "RO");
        this.default_map.add_reg(tx_unicast, 'h20, "RO");
        this.default_map.add_reg(tx_multicast, 'h22, "RO");
        this.default_map.add_reg(tx_broadcast, 'h24, "RO");
        this.default_map.add_reg(reserved1, 'h26, "RO");
        this.default_map.add_reg(tx_pause_multicast, 'h2C, "RO");
        this.default_map.add_reg(reserved2, 'h2E, "RO");
        this.default_map.add_reg(tx_vlan_x8100_good, 'h30, "RO");
        this.default_map.add_reg(tx_vlan_second_vlan_ethertype_good, 'h32, "RO");
        this.default_map.add_reg(tx_stack_vlan_x8100_good, 'h34, "RO");
        this.default_map.add_reg(tx_stack_vlan_second_vlan_ethertype_good, 'h36, "RO");
        this.default_map.add_reg(tx_octets_good, 'h38, "RO");
        this.default_map.add_reg(tx_octets_bad, 'h3A, "RO");
        this.default_map.add_reg(tx_large_good, 'h3C, "RO");
        this.default_map.add_reg(tx_large_bad, 'h3E, "RO");
        this.default_map.add_reg(tx_fifo_overflow, 'h50, "RO");
        this.default_map.add_reg(tx_fifo_underflow, 'h52, "RO");
        this.default_map.add_reg(reserved4, 'h54, "RO");
        this.default_map.add_reg(tx_forced_error, 'h58, "RO");
        this.default_map.add_reg(reserved5, 'h5A, "RO");
        this.default_map.add_reg(tx_fault, 'h66, "RO");
        this.default_map.add_reg(reserved6, 'h68, "RO");

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
        tx_short_bad.enable_coverage(is_on, this.cg_per_instance);
        tx_short_good.enable_coverage(is_on, this.cg_per_instance);
        tx_frame_size_equal_64_bytes.enable_coverage(is_on, this.cg_per_instance);
        tx_64_lt_frame_size_lt_128.enable_coverage(is_on, this.cg_per_instance);
        tx_128_lte_frame_size_lt_256.enable_coverage(is_on, this.cg_per_instance);
        tx_256_lte_frame_size_lt_512.enable_coverage(is_on, this.cg_per_instance);
        tx_512_lte_frame_size_lt_1024.enable_coverage(is_on, this.cg_per_instance);
        tx_1024_lte_frame_size_lt_1518.enable_coverage(is_on, this.cg_per_instance);
        tx_1518_lte_frame_size_lt_2048.enable_coverage(is_on, this.cg_per_instance);
        tx_2048_lte_frame_size_lt_4096.enable_coverage(is_on, this.cg_per_instance);
        tx_4096_lte_frame_size_lt_8192.enable_coverage(is_on, this.cg_per_instance);
        tx_8192_lte_frame_size.enable_coverage(is_on, this.cg_per_instance);
        reserved0.enable_coverage(is_on, this.cg_per_instance);
        tx_unicast.enable_coverage(is_on, this.cg_per_instance);
        tx_multicast.enable_coverage(is_on, this.cg_per_instance);
        tx_broadcast.enable_coverage(is_on, this.cg_per_instance);
        reserved1.enable_coverage(is_on, this.cg_per_instance);
        tx_pause_multicast.enable_coverage(is_on, this.cg_per_instance);
        reserved2.enable_coverage(is_on, this.cg_per_instance);
        tx_vlan_x8100_good.enable_coverage(is_on, this.cg_per_instance);
        tx_vlan_second_vlan_ethertype_good.enable_coverage(is_on, this.cg_per_instance);
        tx_stack_vlan_x8100_good.enable_coverage(is_on, this.cg_per_instance);
        tx_stack_vlan_second_vlan_ethertype_good.enable_coverage(is_on, this.cg_per_instance);
        tx_octets_good.enable_coverage(is_on, this.cg_per_instance);
        tx_octets_bad.enable_coverage(is_on, this.cg_per_instance);
        tx_large_good.enable_coverage(is_on, this.cg_per_instance);
        tx_large_bad.enable_coverage(is_on, this.cg_per_instance);
        tx_fifo_overflow.enable_coverage(is_on, this.cg_per_instance);
        tx_fifo_underflow.enable_coverage(is_on, this.cg_per_instance);
        reserved4.enable_coverage(is_on, this.cg_per_instance);
        tx_forced_error.enable_coverage(is_on, this.cg_per_instance);
        reserved5.enable_coverage(is_on, this.cg_per_instance);
        tx_fault.enable_coverage(is_on, this.cg_per_instance);
        reserved6.enable_coverage(is_on, this.cg_per_instance);
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