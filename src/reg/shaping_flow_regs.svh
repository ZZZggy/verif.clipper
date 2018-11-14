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
// Register definitions for shaping_flow register block.
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
// Group: shaping_flow
//---------------------------------------------------------

package shaping_flow_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;

typedef class shaping_flow_shaping_bucket_reg_cover;

// Class: shaping_flow_shaping_bucket_reg
// Register shaping_flow.shaping_bucket: 32 bits value, offset binary representation!!!(example 0x7fffffff represent value -1)
class shaping_flow_shaping_bucket_reg extends uvm_reg;

    // Variable: bucket_val
    // Bucket Value
    rand uvm_reg_field bucket_val;
    // Variable: signbit
    // 
    rand uvm_reg_field signbit;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static shaping_flow_shaping_bucket_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    shaping_flow_shaping_bucket_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(shaping_flow_reg_pkg::shaping_flow_shaping_bucket_reg)

    // Constructor: new
    function new(string name = "shaping_flow_shaping_bucket");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        bucket_val = uvm_reg_field::type_id::create("bucket_val", , get_full_name());
        signbit = uvm_reg_field::type_id::create("signbit", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        bucket_val.configure(this, 31, 0, "RW", 0, 'h0, 1, 1, 0);
        signbit.configure(this, 1, 31, "RW", 0, 'h0, 1, 1, 0);
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
                cg = shaping_flow_shaping_bucket_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = shaping_flow_shaping_bucket_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, bucket_val.get_name, bucket_val.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, signbit.get_name, signbit.value);
        return s;
    endfunction

endclass


// Class: shaping_flow_shaping_bucket_reg_cover
// Register coverage object.
class shaping_flow_shaping_bucket_reg_cover extends uvm_object;

    static local shaping_flow_shaping_bucket_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    shaping_flow_shaping_bucket_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        bucket_val_wr: coverpoint r.bucket_val.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        bucket_val_rd: coverpoint r.bucket_val.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        signbit_wr: coverpoint r.signbit.value iff (!is_read);
        signbit_rd: coverpoint r.signbit.value iff  (is_read);
    endgroup

    `uvm_object_utils(shaping_flow_reg_pkg::shaping_flow_shaping_bucket_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="shaping_flow_shaping_bucket_reg_cover");
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
    static function shaping_flow_shaping_bucket_reg_cover get();
        if (m_inst == null) begin
            m_inst = shaping_flow_shaping_bucket_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(shaping_flow_shaping_bucket_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class shaping_flow_credit_reg_cover;

// Class: shaping_flow_credit_reg
// Register shaping_flow.credit: credit_value added into bucket at every total_period (total_period programmed in next register)
class shaping_flow_credit_reg extends uvm_reg;

    // Variable: value
    // credit_value[bytes] = (rate[bit/sec] * total_period [sec] ) / 8
    rand uvm_reg_field value;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static shaping_flow_credit_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    shaping_flow_credit_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(shaping_flow_reg_pkg::shaping_flow_credit_reg)

    // Constructor: new
    function new(string name = "shaping_flow_credit");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        value = uvm_reg_field::type_id::create("value", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        value.configure(this, 32, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = shaping_flow_credit_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = shaping_flow_credit_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, value.get_name, value.value);
        return s;
    endfunction

endclass


// Class: shaping_flow_credit_reg_cover
// Register coverage object.
class shaping_flow_credit_reg_cover extends uvm_object;

    static local shaping_flow_credit_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    shaping_flow_credit_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        value_wr: coverpoint r.value.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        value_rd: coverpoint r.value.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(shaping_flow_reg_pkg::shaping_flow_credit_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="shaping_flow_credit_reg_cover");
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
    static function shaping_flow_credit_reg_cover get();
        if (m_inst == null) begin
            m_inst = shaping_flow_credit_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(shaping_flow_credit_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class shaping_flow_period_reg_cover;

// Class: shaping_flow_period_reg
// Register shaping_flow.period: period at which credits are added into bucket
class shaping_flow_period_reg extends uvm_reg;

    // Variable: factor
    // total period = period_value x (period_factor + 1) where period_value is 320E-09 for 1G plateforms and 160E-09 for 10G plateforms
    rand uvm_reg_field factor;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static shaping_flow_period_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    shaping_flow_period_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(shaping_flow_reg_pkg::shaping_flow_period_reg)

    // Constructor: new
    function new(string name = "shaping_flow_period");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        factor = uvm_reg_field::type_id::create("factor", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        factor.configure(this, 32, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = shaping_flow_period_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = shaping_flow_period_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, factor.get_name, factor.value);
        return s;
    endfunction

endclass


// Class: shaping_flow_period_reg_cover
// Register coverage object.
class shaping_flow_period_reg_cover extends uvm_object;

    static local shaping_flow_period_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    shaping_flow_period_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        factor_wr: coverpoint r.factor.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        factor_rd: coverpoint r.factor.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(shaping_flow_reg_pkg::shaping_flow_period_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="shaping_flow_period_reg_cover");
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
    static function shaping_flow_period_reg_cover get();
        if (m_inst == null) begin
            m_inst = shaping_flow_period_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(shaping_flow_period_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class shaping_flow_shaping_mode_reg_cover;

// Class: shaping_flow_shaping_mode_reg
// Register shaping_flow.shaping_mode: 
class shaping_flow_shaping_mode_reg extends uvm_reg;

    // Variable: sel
    // 
    rand uvm_reg_field sel;
    // Variable: ena
    // 
    rand uvm_reg_field ena;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static shaping_flow_shaping_mode_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    shaping_flow_shaping_mode_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(shaping_flow_reg_pkg::shaping_flow_shaping_mode_reg)

    // Constructor: new
    function new(string name = "shaping_flow_shaping_mode");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        sel = uvm_reg_field::type_id::create("sel", , get_full_name());
        ena = uvm_reg_field::type_id::create("ena", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        sel.configure(this, 2, 0, "RW", 0, 'h0, 1, 1, 0);
        ena.configure(this, 1, 3, "RW", 0, 'h0, 1, 1, 0);
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
                cg = shaping_flow_shaping_mode_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = shaping_flow_shaping_mode_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, ena.get_name, ena.value);
        return s;
    endfunction

endclass


// Class: shaping_flow_shaping_mode_reg_cover
// Register coverage object.
class shaping_flow_shaping_mode_reg_cover extends uvm_object;

    static local shaping_flow_shaping_mode_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    shaping_flow_shaping_mode_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        sel_wr: coverpoint r.sel.value iff (!is_read);
        sel_rd: coverpoint r.sel.value iff  (is_read);
        ena_wr: coverpoint r.ena.value iff (!is_read);
        ena_rd: coverpoint r.ena.value iff  (is_read);
    endgroup

    `uvm_object_utils(shaping_flow_reg_pkg::shaping_flow_shaping_mode_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="shaping_flow_shaping_mode_reg_cover");
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
    static function shaping_flow_shaping_mode_reg_cover get();
        if (m_inst == null) begin
            m_inst = shaping_flow_shaping_mode_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(shaping_flow_shaping_mode_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class shaping_flow_duration_bucket_reg_cover;

// Class: shaping_flow_duration_bucket_reg
// Register shaping_flow.duration_bucket: 
class shaping_flow_duration_bucket_reg extends uvm_reg;

    // Variable: duration_bucket
    // 
    rand uvm_reg_field duration_bucket;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static shaping_flow_duration_bucket_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    shaping_flow_duration_bucket_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(shaping_flow_reg_pkg::shaping_flow_duration_bucket_reg)

    // Constructor: new
    function new(string name = "shaping_flow_duration_bucket");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        duration_bucket = uvm_reg_field::type_id::create("duration_bucket", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        duration_bucket.configure(this, 48, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = shaping_flow_duration_bucket_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = shaping_flow_duration_bucket_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, duration_bucket.get_name, duration_bucket.value);
        return s;
    endfunction

endclass


// Class: shaping_flow_duration_bucket_reg_cover
// Register coverage object.
class shaping_flow_duration_bucket_reg_cover extends uvm_object;

    static local shaping_flow_duration_bucket_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    shaping_flow_duration_bucket_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        duration_bucket_wr: coverpoint r.duration_bucket.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        duration_bucket_rd: coverpoint r.duration_bucket.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(shaping_flow_reg_pkg::shaping_flow_duration_bucket_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="shaping_flow_duration_bucket_reg_cover");
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
    static function shaping_flow_duration_bucket_reg_cover get();
        if (m_inst == null) begin
            m_inst = shaping_flow_duration_bucket_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(shaping_flow_duration_bucket_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class shaping_flow_duration_mode_reg_cover;

// Class: shaping_flow_duration_mode_reg
// Register shaping_flow.duration_mode: 
class shaping_flow_duration_mode_reg extends uvm_reg;

    // Variable: sel
    // 
    rand uvm_reg_field sel;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static shaping_flow_duration_mode_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    shaping_flow_duration_mode_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(shaping_flow_reg_pkg::shaping_flow_duration_mode_reg)

    // Constructor: new
    function new(string name = "shaping_flow_duration_mode");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        sel = uvm_reg_field::type_id::create("sel", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        sel.configure(this, 2, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = shaping_flow_duration_mode_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = shaping_flow_duration_mode_reg_cover::get();
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


// Class: shaping_flow_duration_mode_reg_cover
// Register coverage object.
class shaping_flow_duration_mode_reg_cover extends uvm_object;

    static local shaping_flow_duration_mode_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    shaping_flow_duration_mode_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        sel_wr: coverpoint r.sel.value iff (!is_read);
        sel_rd: coverpoint r.sel.value iff  (is_read);
    endgroup

    `uvm_object_utils(shaping_flow_reg_pkg::shaping_flow_duration_mode_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="shaping_flow_duration_mode_reg_cover");
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
    static function shaping_flow_duration_mode_reg_cover get();
        if (m_inst == null) begin
            m_inst = shaping_flow_duration_mode_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(shaping_flow_duration_mode_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class shaping_flow_emix_table_reg_cover;

// Class: shaping_flow_emix_table_reg
// Register shaping_flow.emix_table: E-MIX packet size table (for readback : consecutive accesses will auto increment index.  Read 8 times to retrieve complete table)
class shaping_flow_emix_table_reg extends uvm_reg;

    // Variable: sequence_value
    // E-MIX packet size value 0 to 7
    rand uvm_reg_field sequence_value;
    // Variable: sequence_value_index
    // selects E-MIX packet size value being programmed in field sequence value[13:0]
    rand uvm_reg_field sequence_value_index;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static shaping_flow_emix_table_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    shaping_flow_emix_table_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(shaping_flow_reg_pkg::shaping_flow_emix_table_reg)

    // Constructor: new
    function new(string name = "shaping_flow_emix_table");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        sequence_value = uvm_reg_field::type_id::create("sequence_value", , get_full_name());
        sequence_value_index = uvm_reg_field::type_id::create("sequence_value_index", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        sequence_value.configure(this, 14, 0, "RW", 0, 'h0, 1, 1, 0);
        sequence_value_index.configure(this, 3, 28, "RW", 0, 'h0, 1, 1, 0);
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
                cg = shaping_flow_emix_table_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = shaping_flow_emix_table_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, sequence_value.get_name, sequence_value.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sequence_value_index.get_name, sequence_value_index.value);
        return s;
    endfunction

endclass


// Class: shaping_flow_emix_table_reg_cover
// Register coverage object.
class shaping_flow_emix_table_reg_cover extends uvm_object;

    static local shaping_flow_emix_table_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    shaping_flow_emix_table_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        sequence_value_wr: coverpoint r.sequence_value.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        sequence_value_rd: coverpoint r.sequence_value.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        sequence_value_index_wr: coverpoint r.sequence_value_index.value iff (!is_read);
        sequence_value_index_rd: coverpoint r.sequence_value_index.value iff  (is_read);
    endgroup

    `uvm_object_utils(shaping_flow_reg_pkg::shaping_flow_emix_table_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="shaping_flow_emix_table_reg_cover");
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
    static function shaping_flow_emix_table_reg_cover get();
        if (m_inst == null) begin
            m_inst = shaping_flow_emix_table_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(shaping_flow_emix_table_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class shaping_flow_info0_reg_cover;

// Class: shaping_flow_info0_reg
// Register shaping_flow.info0: Info0 register definition
class shaping_flow_info0_reg extends uvm_reg;

    // Variable: value
    // 
    rand uvm_reg_field value;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static shaping_flow_info0_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    shaping_flow_info0_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(shaping_flow_reg_pkg::shaping_flow_info0_reg)

    // Constructor: new
    function new(string name = "shaping_flow_info0");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        value = uvm_reg_field::type_id::create("value", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        value.configure(this, 32, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = shaping_flow_info0_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = shaping_flow_info0_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, value.get_name, value.value);
        return s;
    endfunction

endclass


// Class: shaping_flow_info0_reg_cover
// Register coverage object.
class shaping_flow_info0_reg_cover extends uvm_object;

    static local shaping_flow_info0_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    shaping_flow_info0_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        value_wr: coverpoint r.value.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        value_rd: coverpoint r.value.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(shaping_flow_reg_pkg::shaping_flow_info0_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="shaping_flow_info0_reg_cover");
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
    static function shaping_flow_info0_reg_cover get();
        if (m_inst == null) begin
            m_inst = shaping_flow_info0_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(shaping_flow_info0_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class shaping_flow_info1_mode_step_interval_reg_cover;

// Class: shaping_flow_info1_mode_step_interval_reg
// Register shaping_flow.info1_mode_step_interval: Info1 register definition in mode step_interval (FPGA SIMULATION -&gt; SOFT SHOULD IGNORE)
class shaping_flow_info1_mode_step_interval_reg extends uvm_reg;

    // Variable: step_size
    // 
    rand uvm_reg_field step_size;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static shaping_flow_info1_mode_step_interval_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    shaping_flow_info1_mode_step_interval_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(shaping_flow_reg_pkg::shaping_flow_info1_mode_step_interval_reg)

    // Constructor: new
    function new(string name = "shaping_flow_info1_mode_step_interval");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        step_size = uvm_reg_field::type_id::create("step_size", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        step_size.configure(this, 10, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = shaping_flow_info1_mode_step_interval_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = shaping_flow_info1_mode_step_interval_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, step_size.get_name, step_size.value);
        return s;
    endfunction

endclass


// Class: shaping_flow_info1_mode_step_interval_reg_cover
// Register coverage object.
class shaping_flow_info1_mode_step_interval_reg_cover extends uvm_object;

    static local shaping_flow_info1_mode_step_interval_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    shaping_flow_info1_mode_step_interval_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        step_size_wr: coverpoint r.step_size.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        step_size_rd: coverpoint r.step_size.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(shaping_flow_reg_pkg::shaping_flow_info1_mode_step_interval_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="shaping_flow_info1_mode_step_interval_reg_cover");
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
    static function shaping_flow_info1_mode_step_interval_reg_cover get();
        if (m_inst == null) begin
            m_inst = shaping_flow_info1_mode_step_interval_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(shaping_flow_info1_mode_step_interval_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class shaping_flow_info2_reg_cover;

// Class: shaping_flow_info2_reg
// Register shaping_flow.info2: Info2 register used to store floe context
class shaping_flow_info2_reg extends uvm_reg;

    // Variable: value
    // 
    rand uvm_reg_field value;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static shaping_flow_info2_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    shaping_flow_info2_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(shaping_flow_reg_pkg::shaping_flow_info2_reg)

    // Constructor: new
    function new(string name = "shaping_flow_info2");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        value = uvm_reg_field::type_id::create("value", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        value.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = shaping_flow_info2_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = shaping_flow_info2_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, value.get_name, value.value);
        return s;
    endfunction

endclass


// Class: shaping_flow_info2_reg_cover
// Register coverage object.
class shaping_flow_info2_reg_cover extends uvm_object;

    static local shaping_flow_info2_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    shaping_flow_info2_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        value_wr: coverpoint r.value.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        value_rd: coverpoint r.value.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(shaping_flow_reg_pkg::shaping_flow_info2_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="shaping_flow_info2_reg_cover");
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
    static function shaping_flow_info2_reg_cover get();
        if (m_inst == null) begin
            m_inst = shaping_flow_info2_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(shaping_flow_info2_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class shaping_flow_pkt_count_reg_cover;

// Class: shaping_flow_pkt_count_reg
// Register shaping_flow.pkt_count: 
class shaping_flow_pkt_count_reg extends uvm_reg;

    // Variable: pkts
    // The counter is cleared on a low to high transition of the associated flow_ena control bit
    rand uvm_reg_field pkts;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static shaping_flow_pkt_count_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    shaping_flow_pkt_count_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(shaping_flow_reg_pkg::shaping_flow_pkt_count_reg)

    // Constructor: new
    function new(string name = "shaping_flow_pkt_count");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        pkts = uvm_reg_field::type_id::create("pkts", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        pkts.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = shaping_flow_pkt_count_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = shaping_flow_pkt_count_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, pkts.get_name, pkts.value);
        return s;
    endfunction

endclass


// Class: shaping_flow_pkt_count_reg_cover
// Register coverage object.
class shaping_flow_pkt_count_reg_cover extends uvm_object;

    static local shaping_flow_pkt_count_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    shaping_flow_pkt_count_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        pkts_wr: coverpoint r.pkts.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        pkts_rd: coverpoint r.pkts.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(shaping_flow_reg_pkg::shaping_flow_pkt_count_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="shaping_flow_pkt_count_reg_cover");
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
    static function shaping_flow_pkt_count_reg_cover get();
        if (m_inst == null) begin
            m_inst = shaping_flow_pkt_count_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(shaping_flow_pkt_count_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class shaping_flow_byte_count_reg_cover;

// Class: shaping_flow_byte_count_reg
// Register shaping_flow.byte_count: 
class shaping_flow_byte_count_reg extends uvm_reg;

    // Variable: bytes
    // The counter is cleared on a low to high transition of the associated flow_ena control bit
    rand uvm_reg_field bytes;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static shaping_flow_byte_count_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    shaping_flow_byte_count_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(shaping_flow_reg_pkg::shaping_flow_byte_count_reg)

    // Constructor: new
    function new(string name = "shaping_flow_byte_count");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        bytes = uvm_reg_field::type_id::create("bytes", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        bytes.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = shaping_flow_byte_count_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = shaping_flow_byte_count_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, bytes.get_name, bytes.value);
        return s;
    endfunction

endclass


// Class: shaping_flow_byte_count_reg_cover
// Register coverage object.
class shaping_flow_byte_count_reg_cover extends uvm_object;

    static local shaping_flow_byte_count_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    shaping_flow_byte_count_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        bytes_wr: coverpoint r.bytes.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        bytes_rd: coverpoint r.bytes.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(shaping_flow_reg_pkg::shaping_flow_byte_count_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="shaping_flow_byte_count_reg_cover");
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
    static function shaping_flow_byte_count_reg_cover get();
        if (m_inst == null) begin
            m_inst = shaping_flow_byte_count_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(shaping_flow_byte_count_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class shaping_flow_last_pkt_size_reg_cover;

// Class: shaping_flow_last_pkt_size_reg
// Register shaping_flow.last_pkt_size: last pkt size field is flow based 0x0e[13:0] = flow 0, 0x1e[13:0] = flow1... 0xfe[13:0] = flow7 all other fields are applicable to all flows 0x0e[63:15] = 0x1e[63:15] ... = 0xfe[63:15]
class shaping_flow_last_pkt_size_reg extends uvm_reg;

    // Variable: last_pkt_sent_size
    // 
    rand uvm_reg_field last_pkt_sent_size;
    // Variable: dbg_pktgen_remain_bytes_cnt
    // debug signal : decrementing counter is state machine indicating remaining bytes to insert into current packet
    rand uvm_reg_field dbg_pktgen_remain_bytes_cnt;
    // Variable: dbg_pktgen_fsm_state
    // debug signal : current fsm state (see pktgen instantiation for states definition (1G or 10G)
    rand uvm_reg_field dbg_pktgen_fsm_state;
    // Variable: dbg_shaping_ready
    // debug signal : shaping module readiness status (bucket positive) -&gt; [flow3:0]
    rand uvm_reg_field dbg_shaping_ready;
    // Variable: dbg_duration_rdy
    // debug signal : duration module readiness status -&gt; [flow3:0]
    rand uvm_reg_field dbg_duration_rdy;
    // Variable: dbg_size_rdy
    // debug signal : size module readiness status
    rand uvm_reg_field dbg_size_rdy;
    // Variable: dbg_pkt_request_valid
    // debug signal : indicate if there are packet requests in FIFO
    rand uvm_reg_field dbg_pkt_request_valid;
    // Variable: dbg_pkt_afull
    // debug signal : back bressure applied on pktgen
    rand uvm_reg_field dbg_pkt_afull;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static shaping_flow_last_pkt_size_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    shaping_flow_last_pkt_size_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(shaping_flow_reg_pkg::shaping_flow_last_pkt_size_reg)

    // Constructor: new
    function new(string name = "shaping_flow_last_pkt_size");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        last_pkt_sent_size = uvm_reg_field::type_id::create("last_pkt_sent_size", , get_full_name());
        dbg_pktgen_remain_bytes_cnt = uvm_reg_field::type_id::create("dbg_pktgen_remain_bytes_cnt", , get_full_name());
        dbg_pktgen_fsm_state = uvm_reg_field::type_id::create("dbg_pktgen_fsm_state", , get_full_name());
        dbg_shaping_ready = uvm_reg_field::type_id::create("dbg_shaping_ready", , get_full_name());
        dbg_duration_rdy = uvm_reg_field::type_id::create("dbg_duration_rdy", , get_full_name());
        dbg_size_rdy = uvm_reg_field::type_id::create("dbg_size_rdy", , get_full_name());
        dbg_pkt_request_valid = uvm_reg_field::type_id::create("dbg_pkt_request_valid", , get_full_name());
        dbg_pkt_afull = uvm_reg_field::type_id::create("dbg_pkt_afull", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        last_pkt_sent_size.configure(this, 14, 0, "RO", 0, 'h0, 1, 1, 0);
        dbg_pktgen_remain_bytes_cnt.configure(this, 15, 32, "RO", 0, 'h0, 1, 1, 0);
        dbg_pktgen_fsm_state.configure(this, 4, 48, "RO", 0, 'h0, 1, 1, 0);
        dbg_shaping_ready.configure(this, 4, 52, "RO", 0, 'h0, 1, 1, 0);
        dbg_duration_rdy.configure(this, 4, 56, "RO", 0, 'h0, 1, 1, 0);
        dbg_size_rdy.configure(this, 1, 60, "RO", 0, 'h0, 1, 1, 0);
        dbg_pkt_request_valid.configure(this, 1, 61, "RO", 0, 'h0, 1, 1, 0);
        dbg_pkt_afull.configure(this, 1, 62, "RO", 0, 'h0, 1, 1, 0);
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
                cg = shaping_flow_last_pkt_size_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = shaping_flow_last_pkt_size_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, last_pkt_sent_size.get_name, last_pkt_sent_size.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, dbg_pktgen_remain_bytes_cnt.get_name, dbg_pktgen_remain_bytes_cnt.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, dbg_pktgen_fsm_state.get_name, dbg_pktgen_fsm_state.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, dbg_shaping_ready.get_name, dbg_shaping_ready.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, dbg_duration_rdy.get_name, dbg_duration_rdy.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, dbg_size_rdy.get_name, dbg_size_rdy.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, dbg_pkt_request_valid.get_name, dbg_pkt_request_valid.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, dbg_pkt_afull.get_name, dbg_pkt_afull.value);
        return s;
    endfunction

endclass


// Class: shaping_flow_last_pkt_size_reg_cover
// Register coverage object.
class shaping_flow_last_pkt_size_reg_cover extends uvm_object;

    static local shaping_flow_last_pkt_size_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    shaping_flow_last_pkt_size_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        last_pkt_sent_size_wr: coverpoint r.last_pkt_sent_size.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        last_pkt_sent_size_rd: coverpoint r.last_pkt_sent_size.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        dbg_pktgen_remain_bytes_cnt_wr: coverpoint r.dbg_pktgen_remain_bytes_cnt.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        dbg_pktgen_remain_bytes_cnt_rd: coverpoint r.dbg_pktgen_remain_bytes_cnt.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        dbg_pktgen_fsm_state_wr: coverpoint r.dbg_pktgen_fsm_state.value iff (!is_read);
        dbg_pktgen_fsm_state_rd: coverpoint r.dbg_pktgen_fsm_state.value iff  (is_read);
        dbg_shaping_ready_wr: coverpoint r.dbg_shaping_ready.value iff (!is_read);
        dbg_shaping_ready_rd: coverpoint r.dbg_shaping_ready.value iff  (is_read);
        dbg_duration_rdy_wr: coverpoint r.dbg_duration_rdy.value iff (!is_read);
        dbg_duration_rdy_rd: coverpoint r.dbg_duration_rdy.value iff  (is_read);
        dbg_size_rdy_wr: coverpoint r.dbg_size_rdy.value iff (!is_read);
        dbg_size_rdy_rd: coverpoint r.dbg_size_rdy.value iff  (is_read);
        dbg_pkt_request_valid_wr: coverpoint r.dbg_pkt_request_valid.value iff (!is_read);
        dbg_pkt_request_valid_rd: coverpoint r.dbg_pkt_request_valid.value iff  (is_read);
        dbg_pkt_afull_wr: coverpoint r.dbg_pkt_afull.value iff (!is_read);
        dbg_pkt_afull_rd: coverpoint r.dbg_pkt_afull.value iff  (is_read);
    endgroup

    `uvm_object_utils(shaping_flow_reg_pkg::shaping_flow_last_pkt_size_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="shaping_flow_last_pkt_size_reg_cover");
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
    static function shaping_flow_last_pkt_size_reg_cover get();
        if (m_inst == null) begin
            m_inst = shaping_flow_last_pkt_size_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(shaping_flow_last_pkt_size_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass





// Class: shaping_flow_reg_block
// Register Block .shaping_flow: 
class shaping_flow_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand shaping_flow_shaping_bucket_reg shaping_bucket;
    rand shaping_flow_credit_reg credit;
    rand shaping_flow_period_reg period;
    rand shaping_flow_shaping_mode_reg shaping_mode;
    rand shaping_flow_duration_bucket_reg duration_bucket;
    rand shaping_flow_duration_mode_reg duration_mode;
    rand shaping_flow_emix_table_reg emix_table;
    rand shaping_flow_info0_reg info0;
    rand shaping_flow_info1_mode_step_interval_reg info1_mode_step_interval;
    rand shaping_flow_info2_reg info2;
    rand shaping_flow_pkt_count_reg pkt_count;
    rand shaping_flow_byte_count_reg byte_count;
    rand shaping_flow_last_pkt_size_reg last_pkt_size;

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(shaping_flow_reg_pkg::shaping_flow_reg_block)

    // Constructor: new
    function new(string name = "shaping_flow_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})


        shaping_bucket = shaping_flow_shaping_bucket_reg::type_id::create("shaping_bucket", , get_full_name());
        credit = shaping_flow_credit_reg::type_id::create("credit", , get_full_name());
        period = shaping_flow_period_reg::type_id::create("period", , get_full_name());
        shaping_mode = shaping_flow_shaping_mode_reg::type_id::create("shaping_mode", , get_full_name());
        duration_bucket = shaping_flow_duration_bucket_reg::type_id::create("duration_bucket", , get_full_name());
        duration_mode = shaping_flow_duration_mode_reg::type_id::create("duration_mode", , get_full_name());
        emix_table = shaping_flow_emix_table_reg::type_id::create("emix_table", , get_full_name());
        info0 = shaping_flow_info0_reg::type_id::create("info0", , get_full_name());
        info1_mode_step_interval = shaping_flow_info1_mode_step_interval_reg::type_id::create("info1_mode_step_interval", , get_full_name());
        info2 = shaping_flow_info2_reg::type_id::create("info2", , get_full_name());
        pkt_count = shaping_flow_pkt_count_reg::type_id::create("pkt_count", , get_full_name());
        byte_count = shaping_flow_byte_count_reg::type_id::create("byte_count", , get_full_name());
        last_pkt_size = shaping_flow_last_pkt_size_reg::type_id::create("last_pkt_size", , get_full_name());

        shaping_bucket.configure(this);
        credit.configure(this);
        period.configure(this);
        shaping_mode.configure(this);
        duration_bucket.configure(this);
        duration_mode.configure(this);
        emix_table.configure(this);
        info0.configure(this);
        info1_mode_step_interval.configure(this);
        info2.configure(this);
        pkt_count.configure(this);
        byte_count.configure(this);
        last_pkt_size.configure(this);

        shaping_bucket.build();
        credit.build();
        period.build();
        shaping_mode.build();
        duration_bucket.build();
        duration_mode.build();
        emix_table.build();
        info0.build();
        info1_mode_step_interval.build();
        info2.build();
        pkt_count.build();
        byte_count.build();
        last_pkt_size.build();

        // define default map
        default_map = create_map("shaping_flow_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        this.default_map.add_reg(shaping_bucket, 'h0, "RW");
        this.default_map.add_reg(credit, 'h1, "RW");
        this.default_map.add_reg(period, 'h2, "RW");
        this.default_map.add_reg(shaping_mode, 'h3, "RW");
        this.default_map.add_reg(duration_bucket, 'h4, "RW");
        this.default_map.add_reg(duration_mode, 'h5, "RW");
        this.default_map.add_reg(emix_table, 'h8, "RW");
        this.default_map.add_reg(info0, 'h9, "RW");
        this.default_map.add_reg(info1_mode_step_interval, 'hA, "RW");
        this.default_map.add_reg(info2, 'hB, "RO");
        this.default_map.add_reg(pkt_count, 'hC, "RO");
        this.default_map.add_reg(byte_count, 'hD, "RO");
        this.default_map.add_reg(last_pkt_size, 'hE, "RO");

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
        shaping_bucket.enable_coverage(is_on, this.cg_per_instance);
        credit.enable_coverage(is_on, this.cg_per_instance);
        period.enable_coverage(is_on, this.cg_per_instance);
        shaping_mode.enable_coverage(is_on, this.cg_per_instance);
        duration_bucket.enable_coverage(is_on, this.cg_per_instance);
        duration_mode.enable_coverage(is_on, this.cg_per_instance);
        emix_table.enable_coverage(is_on, this.cg_per_instance);
        info0.enable_coverage(is_on, this.cg_per_instance);
        info1_mode_step_interval.enable_coverage(is_on, this.cg_per_instance);
        info2.enable_coverage(is_on, this.cg_per_instance);
        pkt_count.enable_coverage(is_on, this.cg_per_instance);
        byte_count.enable_coverage(is_on, this.cg_per_instance);
        last_pkt_size.enable_coverage(is_on, this.cg_per_instance);
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