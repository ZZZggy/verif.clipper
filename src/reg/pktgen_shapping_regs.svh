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
// Register definitions for pktgen_shapping register block.
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
// Group: pktgen_shapping
//---------------------------------------------------------

package pktgen_shapping_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;

typedef class shapping_shapping_bucket_reg_cover;

// Class: shapping_shapping_bucket_reg
// Register shapping.shapping_bucket: 32 bits value, offset binary representation!!!(example 0x7fffffff represent value -1)
class shapping_shapping_bucket_reg extends uvm_reg;

    // Variable: signbit
    // 0=minus  ; 1=plus
    rand uvm_reg_field signbit;
    // Variable: bucket_val
    // Bucket Value
    rand uvm_reg_field bucket_val;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static shapping_shapping_bucket_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    shapping_shapping_bucket_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pktgen_shapping_reg_pkg::shapping_shapping_bucket_reg)

    // Constructor: new
    function new(string name = "shapping_shapping_bucket");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        signbit = uvm_reg_field::type_id::create("signbit", , get_full_name());
        bucket_val = uvm_reg_field::type_id::create("bucket_val", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        signbit.configure(this, 1, 31, "RW", 0, 'h0, 1, 1, 0);
        bucket_val.configure(this, 31, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = shapping_shapping_bucket_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = shapping_shapping_bucket_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, signbit.get_name, signbit.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, bucket_val.get_name, bucket_val.value);
        return s;
    endfunction

endclass


// Class: shapping_shapping_bucket_reg_cover
// Register coverage object.
class shapping_shapping_bucket_reg_cover extends uvm_object;

    static local shapping_shapping_bucket_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    shapping_shapping_bucket_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        signbit_wr: coverpoint r.signbit.value iff (!is_read);
        signbit_rd: coverpoint r.signbit.value iff  (is_read);
        bucket_val_wr: coverpoint r.bucket_val.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        bucket_val_rd: coverpoint r.bucket_val.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(pktgen_shapping_reg_pkg::shapping_shapping_bucket_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="shapping_shapping_bucket_reg_cover");
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
    static function shapping_shapping_bucket_reg_cover get();
        if (m_inst == null) begin
            m_inst = shapping_shapping_bucket_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(shapping_shapping_bucket_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class shapping_credit_reg_cover;

// Class: shapping_credit_reg
// Register shapping.credit: credit_value added into bucket at every total_period (total_period programmed in next register)
class shapping_credit_reg extends uvm_reg;

    // Variable: credit_value
    // credit_value[bytes] = (rate[bit/sec] * total_period [sec] ) / 8
    rand uvm_reg_field credit_value;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static shapping_credit_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    shapping_credit_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pktgen_shapping_reg_pkg::shapping_credit_reg)

    // Constructor: new
    function new(string name = "shapping_credit");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        credit_value = uvm_reg_field::type_id::create("credit_value", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        credit_value.configure(this, 32, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = shapping_credit_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = shapping_credit_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, credit_value.get_name, credit_value.value);
        return s;
    endfunction

endclass


// Class: shapping_credit_reg_cover
// Register coverage object.
class shapping_credit_reg_cover extends uvm_object;

    static local shapping_credit_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    shapping_credit_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        credit_value_wr: coverpoint r.credit_value.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        credit_value_rd: coverpoint r.credit_value.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(pktgen_shapping_reg_pkg::shapping_credit_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="shapping_credit_reg_cover");
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
    static function shapping_credit_reg_cover get();
        if (m_inst == null) begin
            m_inst = shapping_credit_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(shapping_credit_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class shapping_period_reg_cover;

// Class: shapping_period_reg
// Register shapping.period: period at which credits are added into bucket
class shapping_period_reg extends uvm_reg;

    // Variable: period_factor
    // total period = period_value x (period_factor + 1) where period_value is 320E-09 for 1G plateforms and 160E-09 for 10G plateforms
    rand uvm_reg_field period_factor;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static shapping_period_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    shapping_period_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pktgen_shapping_reg_pkg::shapping_period_reg)

    // Constructor: new
    function new(string name = "shapping_period");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        period_factor = uvm_reg_field::type_id::create("period_factor", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        period_factor.configure(this, 32, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = shapping_period_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = shapping_period_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, period_factor.get_name, period_factor.value);
        return s;
    endfunction

endclass


// Class: shapping_period_reg_cover
// Register coverage object.
class shapping_period_reg_cover extends uvm_object;

    static local shapping_period_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    shapping_period_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        period_factor_wr: coverpoint r.period_factor.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        period_factor_rd: coverpoint r.period_factor.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(pktgen_shapping_reg_pkg::shapping_period_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="shapping_period_reg_cover");
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
    static function shapping_period_reg_cover get();
        if (m_inst == null) begin
            m_inst = shapping_period_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(shapping_period_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class shapping_shapping_mode_reg_cover;

// Class: shapping_shapping_mode_reg
// Register shapping.shapping_mode: 
class shapping_shapping_mode_reg extends uvm_reg;

    // Variable: shapping_mode_sel
    // shaping mode selection
    rand uvm_reg_field shapping_mode_sel;
    // Variable: shapping_ena
    // 
    rand uvm_reg_field shapping_ena;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static shapping_shapping_mode_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    shapping_shapping_mode_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pktgen_shapping_reg_pkg::shapping_shapping_mode_reg)

    // Constructor: new
    function new(string name = "shapping_shapping_mode");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        shapping_mode_sel = uvm_reg_field::type_id::create("shapping_mode_sel", , get_full_name());
        shapping_ena = uvm_reg_field::type_id::create("shapping_ena", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        shapping_mode_sel.configure(this, 2, 0, "RW", 0, 'h0, 1, 1, 0);
        shapping_ena.configure(this, 1, 3, "RW", 0, 'h0, 1, 1, 0);
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
                cg = shapping_shapping_mode_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = shapping_shapping_mode_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, shapping_mode_sel.get_name, shapping_mode_sel.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, shapping_ena.get_name, shapping_ena.value);
        return s;
    endfunction

endclass


// Class: shapping_shapping_mode_reg_cover
// Register coverage object.
class shapping_shapping_mode_reg_cover extends uvm_object;

    static local shapping_shapping_mode_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    shapping_shapping_mode_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        shapping_mode_sel_wr: coverpoint r.shapping_mode_sel.value iff (!is_read);
        shapping_mode_sel_rd: coverpoint r.shapping_mode_sel.value iff  (is_read);
        shapping_ena_wr: coverpoint r.shapping_ena.value iff (!is_read);
        shapping_ena_rd: coverpoint r.shapping_ena.value iff  (is_read);
    endgroup

    `uvm_object_utils(pktgen_shapping_reg_pkg::shapping_shapping_mode_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="shapping_shapping_mode_reg_cover");
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
    static function shapping_shapping_mode_reg_cover get();
        if (m_inst == null) begin
            m_inst = shapping_shapping_mode_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(shapping_shapping_mode_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class shapping_duration_bucket_reg_cover;

// Class: shapping_duration_bucket_reg
// Register shapping.duration_bucket: 
class shapping_duration_bucket_reg extends uvm_reg;

    // Variable: duration_bucket
    // 
    rand uvm_reg_field duration_bucket;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static shapping_duration_bucket_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    shapping_duration_bucket_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pktgen_shapping_reg_pkg::shapping_duration_bucket_reg)

    // Constructor: new
    function new(string name = "shapping_duration_bucket");
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
                cg = shapping_duration_bucket_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = shapping_duration_bucket_reg_cover::get();
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


// Class: shapping_duration_bucket_reg_cover
// Register coverage object.
class shapping_duration_bucket_reg_cover extends uvm_object;

    static local shapping_duration_bucket_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    shapping_duration_bucket_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        duration_bucket_wr: coverpoint r.duration_bucket.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        duration_bucket_rd: coverpoint r.duration_bucket.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(pktgen_shapping_reg_pkg::shapping_duration_bucket_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="shapping_duration_bucket_reg_cover");
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
    static function shapping_duration_bucket_reg_cover get();
        if (m_inst == null) begin
            m_inst = shapping_duration_bucket_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(shapping_duration_bucket_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class shapping_duration_mode_reg_cover;

// Class: shapping_duration_mode_reg
// Register shapping.duration_mode: 
class shapping_duration_mode_reg extends uvm_reg;

    // Variable: duration_mode_sel
    // 00:  Bytes 01:  Packets 10:  Seconds 11:   Infinite
    rand uvm_reg_field duration_mode_sel;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static shapping_duration_mode_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    shapping_duration_mode_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pktgen_shapping_reg_pkg::shapping_duration_mode_reg)

    // Constructor: new
    function new(string name = "shapping_duration_mode");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        duration_mode_sel = uvm_reg_field::type_id::create("duration_mode_sel", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        duration_mode_sel.configure(this, 2, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = shapping_duration_mode_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = shapping_duration_mode_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, duration_mode_sel.get_name, duration_mode_sel.value);
        return s;
    endfunction

endclass


// Class: shapping_duration_mode_reg_cover
// Register coverage object.
class shapping_duration_mode_reg_cover extends uvm_object;

    static local shapping_duration_mode_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    shapping_duration_mode_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        duration_mode_sel_wr: coverpoint r.duration_mode_sel.value iff (!is_read);
        duration_mode_sel_rd: coverpoint r.duration_mode_sel.value iff  (is_read);
    endgroup

    `uvm_object_utils(pktgen_shapping_reg_pkg::shapping_duration_mode_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="shapping_duration_mode_reg_cover");
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
    static function shapping_duration_mode_reg_cover get();
        if (m_inst == null) begin
            m_inst = shapping_duration_mode_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(shapping_duration_mode_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class shapping_emix_table_reg_cover;

// Class: shapping_emix_table_reg
// Register shapping.emix_table: E-MIX packet size table (for readback : consecutive accesses will auto increment index.  Read 8 times to retrieve complete table)
class shapping_emix_table_reg extends uvm_reg;

    // Variable: unused2
    // 
    rand uvm_reg_field unused2;
    // Variable: sequence_value_index
    // selects E-MIX packet size value being programmed in field sequence value[13:0]
    rand uvm_reg_field sequence_value_index;
    // Variable: unused1
    // 
    rand uvm_reg_field unused1;
    // Variable: sequence_value
    // E-MIX packet size value 0 to 7     
    rand uvm_reg_field sequence_value;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static shapping_emix_table_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    shapping_emix_table_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pktgen_shapping_reg_pkg::shapping_emix_table_reg)

    // Constructor: new
    function new(string name = "shapping_emix_table");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        unused2 = uvm_reg_field::type_id::create("unused2", , get_full_name());
        sequence_value_index = uvm_reg_field::type_id::create("sequence_value_index", , get_full_name());
        unused1 = uvm_reg_field::type_id::create("unused1", , get_full_name());
        sequence_value = uvm_reg_field::type_id::create("sequence_value", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        unused2.configure(this, 1, 31, "RW", 0, 'h0, 1, 1, 0);
        sequence_value_index.configure(this, 3, 28, "RW", 0, 'h0, 1, 1, 0);
        unused1.configure(this, 14, 14, "RW", 0, 'h0, 1, 1, 0);
        sequence_value.configure(this, 14, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = shapping_emix_table_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = shapping_emix_table_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, unused2.get_name, unused2.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sequence_value_index.get_name, sequence_value_index.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, unused1.get_name, unused1.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sequence_value.get_name, sequence_value.value);
        return s;
    endfunction

endclass


// Class: shapping_emix_table_reg_cover
// Register coverage object.
class shapping_emix_table_reg_cover extends uvm_object;

    static local shapping_emix_table_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    shapping_emix_table_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        unused2_wr: coverpoint r.unused2.value iff (!is_read);
        unused2_rd: coverpoint r.unused2.value iff  (is_read);
        sequence_value_index_wr: coverpoint r.sequence_value_index.value iff (!is_read);
        sequence_value_index_rd: coverpoint r.sequence_value_index.value iff  (is_read);
        unused1_wr: coverpoint r.unused1.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        unused1_rd: coverpoint r.unused1.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        sequence_value_wr: coverpoint r.sequence_value.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        sequence_value_rd: coverpoint r.sequence_value.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(pktgen_shapping_reg_pkg::shapping_emix_table_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="shapping_emix_table_reg_cover");
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
    static function shapping_emix_table_reg_cover get();
        if (m_inst == null) begin
            m_inst = shapping_emix_table_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(shapping_emix_table_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class shapping_info0_mode_emix_reg_cover;

// Class: shapping_info0_mode_emix_reg
// Register shapping.info0_mode_emix: Info0 register definition in mode EMIX
class shapping_info0_mode_emix_reg extends uvm_reg;

    // Variable: mode
    // 00: E-MIX, 01: undefined, 10: step_interval, 11: pseudo_random
    rand uvm_reg_field mode;
    // Variable: last_ptr
    // points to the last value used in E-MIX packet size table
    rand uvm_reg_field last_ptr;
    // Variable: first_ptr
    // points to the first value used in E-MIX packet size table
    rand uvm_reg_field first_ptr;
    // Variable: ptr_weight7
    // Number of consecutive times sequence_value7 will be repeated.
    rand uvm_reg_field ptr_weight7;
    // Variable: ptr_weight6
    //    &quot;    &quot;      &quot;        &quot;   sequence value6   &quot;   &quot;     &quot;    
    rand uvm_reg_field ptr_weight6;
    // Variable: ptr_weight5
    //    &quot;    &quot;      &quot;        &quot;   sequence value5   &quot;   &quot;     &quot;    
    rand uvm_reg_field ptr_weight5;
    // Variable: ptr_weight4
    //    &quot;    &quot;      &quot;        &quot;   sequence value4   &quot;   &quot;     &quot;    
    rand uvm_reg_field ptr_weight4;
    // Variable: ptr_weight3
    //    &quot;    &quot;      &quot;        &quot;   sequence value3   &quot;   &quot;     &quot;    
    rand uvm_reg_field ptr_weight3;
    // Variable: ptr_weight2
    //    &quot;    &quot;      &quot;        &quot;   sequence value2   &quot;   &quot;     &quot;    
    rand uvm_reg_field ptr_weight2;
    // Variable: ptr_weight1
    //    &quot;    &quot;      &quot;        &quot;   sequence value1   &quot;   &quot;     &quot;    
    rand uvm_reg_field ptr_weight1;
    // Variable: ptr_weight0
    //    &quot;    &quot;      &quot;        &quot;   sequence value0   &quot;   &quot;     &quot;    
    rand uvm_reg_field ptr_weight0;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static shapping_info0_mode_emix_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    shapping_info0_mode_emix_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pktgen_shapping_reg_pkg::shapping_info0_mode_emix_reg)

    // Constructor: new
    function new(string name = "shapping_info0_mode_emix");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        mode = uvm_reg_field::type_id::create("mode", , get_full_name());
        last_ptr = uvm_reg_field::type_id::create("last_ptr", , get_full_name());
        first_ptr = uvm_reg_field::type_id::create("first_ptr", , get_full_name());
        ptr_weight7 = uvm_reg_field::type_id::create("ptr_weight7", , get_full_name());
        ptr_weight6 = uvm_reg_field::type_id::create("ptr_weight6", , get_full_name());
        ptr_weight5 = uvm_reg_field::type_id::create("ptr_weight5", , get_full_name());
        ptr_weight4 = uvm_reg_field::type_id::create("ptr_weight4", , get_full_name());
        ptr_weight3 = uvm_reg_field::type_id::create("ptr_weight3", , get_full_name());
        ptr_weight2 = uvm_reg_field::type_id::create("ptr_weight2", , get_full_name());
        ptr_weight1 = uvm_reg_field::type_id::create("ptr_weight1", , get_full_name());
        ptr_weight0 = uvm_reg_field::type_id::create("ptr_weight0", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        mode.configure(this, 2, 30, "RW", 0, 'h0, 1, 1, 0);
        last_ptr.configure(this, 3, 27, "RW", 0, 'h0, 1, 1, 0);
        first_ptr.configure(this, 3, 24, "RW", 0, 'h0, 1, 1, 0);
        ptr_weight7.configure(this, 3, 21, "RW", 0, 'h0, 1, 1, 0);
        ptr_weight6.configure(this, 3, 18, "RW", 0, 'h0, 1, 1, 0);
        ptr_weight5.configure(this, 3, 15, "RW", 0, 'h0, 1, 1, 0);
        ptr_weight4.configure(this, 3, 12, "RW", 0, 'h0, 1, 1, 0);
        ptr_weight3.configure(this, 3, 9, "RW", 0, 'h0, 1, 1, 0);
        ptr_weight2.configure(this, 3, 6, "RW", 0, 'h0, 1, 1, 0);
        ptr_weight1.configure(this, 3, 3, "RW", 0, 'h0, 1, 1, 0);
        ptr_weight0.configure(this, 3, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = shapping_info0_mode_emix_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = shapping_info0_mode_emix_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, last_ptr.get_name, last_ptr.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, first_ptr.get_name, first_ptr.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, ptr_weight7.get_name, ptr_weight7.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, ptr_weight6.get_name, ptr_weight6.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, ptr_weight5.get_name, ptr_weight5.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, ptr_weight4.get_name, ptr_weight4.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, ptr_weight3.get_name, ptr_weight3.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, ptr_weight2.get_name, ptr_weight2.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, ptr_weight1.get_name, ptr_weight1.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, ptr_weight0.get_name, ptr_weight0.value);
        return s;
    endfunction

endclass


// Class: shapping_info0_mode_emix_reg_cover
// Register coverage object.
class shapping_info0_mode_emix_reg_cover extends uvm_object;

    static local shapping_info0_mode_emix_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    shapping_info0_mode_emix_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        mode_wr: coverpoint r.mode.value iff (!is_read);
        mode_rd: coverpoint r.mode.value iff  (is_read);
        last_ptr_wr: coverpoint r.last_ptr.value iff (!is_read);
        last_ptr_rd: coverpoint r.last_ptr.value iff  (is_read);
        first_ptr_wr: coverpoint r.first_ptr.value iff (!is_read);
        first_ptr_rd: coverpoint r.first_ptr.value iff  (is_read);
        ptr_weight7_wr: coverpoint r.ptr_weight7.value iff (!is_read);
        ptr_weight7_rd: coverpoint r.ptr_weight7.value iff  (is_read);
        ptr_weight6_wr: coverpoint r.ptr_weight6.value iff (!is_read);
        ptr_weight6_rd: coverpoint r.ptr_weight6.value iff  (is_read);
        ptr_weight5_wr: coverpoint r.ptr_weight5.value iff (!is_read);
        ptr_weight5_rd: coverpoint r.ptr_weight5.value iff  (is_read);
        ptr_weight4_wr: coverpoint r.ptr_weight4.value iff (!is_read);
        ptr_weight4_rd: coverpoint r.ptr_weight4.value iff  (is_read);
        ptr_weight3_wr: coverpoint r.ptr_weight3.value iff (!is_read);
        ptr_weight3_rd: coverpoint r.ptr_weight3.value iff  (is_read);
        ptr_weight2_wr: coverpoint r.ptr_weight2.value iff (!is_read);
        ptr_weight2_rd: coverpoint r.ptr_weight2.value iff  (is_read);
        ptr_weight1_wr: coverpoint r.ptr_weight1.value iff (!is_read);
        ptr_weight1_rd: coverpoint r.ptr_weight1.value iff  (is_read);
        ptr_weight0_wr: coverpoint r.ptr_weight0.value iff (!is_read);
        ptr_weight0_rd: coverpoint r.ptr_weight0.value iff  (is_read);
    endgroup

    `uvm_object_utils(pktgen_shapping_reg_pkg::shapping_info0_mode_emix_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="shapping_info0_mode_emix_reg_cover");
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
    static function shapping_info0_mode_emix_reg_cover get();
        if (m_inst == null) begin
            m_inst = shapping_info0_mode_emix_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(shapping_info0_mode_emix_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class shapping_info0_mode_step_interval_reg_cover;

// Class: shapping_info0_mode_step_interval_reg
// Register shapping.info0_mode_step_interval: Info0 register definition in mode step interval (FPGA SIMULATION -&gt; SOFT SHOULD IGNORE)
class shapping_info0_mode_step_interval_reg extends uvm_reg;

    // Variable: mode
    // 00: e-mix, 01: undefined, 10: STEP_INTERVAL, 11: pseudo_random
    rand uvm_reg_field mode;
    // Variable: direction_init
    // 
    rand uvm_reg_field direction_init;
    // Variable: direction_mode
    // 0: one; 1: two
    rand uvm_reg_field direction_mode;
    // Variable: max_size
    // 
    rand uvm_reg_field max_size;
    // Variable: min_size
    // 
    rand uvm_reg_field min_size;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static shapping_info0_mode_step_interval_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    shapping_info0_mode_step_interval_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pktgen_shapping_reg_pkg::shapping_info0_mode_step_interval_reg)

    // Constructor: new
    function new(string name = "shapping_info0_mode_step_interval");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        mode = uvm_reg_field::type_id::create("mode", , get_full_name());
        direction_init = uvm_reg_field::type_id::create("direction_init", , get_full_name());
        direction_mode = uvm_reg_field::type_id::create("direction_mode", , get_full_name());
        max_size = uvm_reg_field::type_id::create("max_size", , get_full_name());
        min_size = uvm_reg_field::type_id::create("min_size", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        mode.configure(this, 2, 30, "RW", 0, 'h0, 1, 1, 0);
        direction_init.configure(this, 1, 29, "RW", 0, 'h0, 1, 1, 0);
        direction_mode.configure(this, 1, 28, "RW", 0, 'h0, 1, 1, 0);
        max_size.configure(this, 14, 14, "RW", 0, 'h0, 1, 1, 0);
        min_size.configure(this, 14, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = shapping_info0_mode_step_interval_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = shapping_info0_mode_step_interval_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, direction_init.get_name, direction_init.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, direction_mode.get_name, direction_mode.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, max_size.get_name, max_size.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, min_size.get_name, min_size.value);
        return s;
    endfunction

endclass


// Class: shapping_info0_mode_step_interval_reg_cover
// Register coverage object.
class shapping_info0_mode_step_interval_reg_cover extends uvm_object;

    static local shapping_info0_mode_step_interval_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    shapping_info0_mode_step_interval_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        mode_wr: coverpoint r.mode.value iff (!is_read);
        mode_rd: coverpoint r.mode.value iff  (is_read);
        direction_init_wr: coverpoint r.direction_init.value iff (!is_read);
        direction_init_rd: coverpoint r.direction_init.value iff  (is_read);
        direction_mode_wr: coverpoint r.direction_mode.value iff (!is_read);
        direction_mode_rd: coverpoint r.direction_mode.value iff  (is_read);
        max_size_wr: coverpoint r.max_size.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        max_size_rd: coverpoint r.max_size.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        min_size_wr: coverpoint r.min_size.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        min_size_rd: coverpoint r.min_size.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(pktgen_shapping_reg_pkg::shapping_info0_mode_step_interval_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="shapping_info0_mode_step_interval_reg_cover");
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
    static function shapping_info0_mode_step_interval_reg_cover get();
        if (m_inst == null) begin
            m_inst = shapping_info0_mode_step_interval_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(shapping_info0_mode_step_interval_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class shapping_info0_mode_pseudo_random_reg_cover;

// Class: shapping_info0_mode_pseudo_random_reg
// Register shapping.info0_mode_pseudo_random: Info0 register definition in mode pseudo random
class shapping_info0_mode_pseudo_random_reg extends uvm_reg;

    // Variable: mode
    // 00: e-mix, 01: undefined, 10: step_interval, 11:PSEUDO_RANDOM
    rand uvm_reg_field mode;
    // Variable: max_size_offset
    // equals to (max_pkt_size - min_pkt_size) setting max_size_offset field to 0 is equivalent to selecting constant packet size example1 [31:0] = 0xC0000040 (max_size_offset = 0) -&gt; sets to constant packet size 64 bytes&gt; example1 [31:0] = 0xC16B8040 (max_size_offset = 1454) -&gt; sets to pseudo random 64-1518 bytes
    rand uvm_reg_field max_size_offset;
    // Variable: min_size
    // minimum pkt size
    rand uvm_reg_field min_size;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static shapping_info0_mode_pseudo_random_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    shapping_info0_mode_pseudo_random_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pktgen_shapping_reg_pkg::shapping_info0_mode_pseudo_random_reg)

    // Constructor: new
    function new(string name = "shapping_info0_mode_pseudo_random");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        mode = uvm_reg_field::type_id::create("mode", , get_full_name());
        max_size_offset = uvm_reg_field::type_id::create("max_size_offset", , get_full_name());
        min_size = uvm_reg_field::type_id::create("min_size", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        mode.configure(this, 2, 30, "RW", 0, 'h0, 1, 1, 0);
        max_size_offset.configure(this, 14, 14, "RW", 0, 'h0, 1, 1, 0);
        min_size.configure(this, 14, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = shapping_info0_mode_pseudo_random_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = shapping_info0_mode_pseudo_random_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, max_size_offset.get_name, max_size_offset.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, min_size.get_name, min_size.value);
        return s;
    endfunction

endclass


// Class: shapping_info0_mode_pseudo_random_reg_cover
// Register coverage object.
class shapping_info0_mode_pseudo_random_reg_cover extends uvm_object;

    static local shapping_info0_mode_pseudo_random_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    shapping_info0_mode_pseudo_random_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        mode_wr: coverpoint r.mode.value iff (!is_read);
        mode_rd: coverpoint r.mode.value iff  (is_read);
        max_size_offset_wr: coverpoint r.max_size_offset.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        max_size_offset_rd: coverpoint r.max_size_offset.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        min_size_wr: coverpoint r.min_size.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        min_size_rd: coverpoint r.min_size.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(pktgen_shapping_reg_pkg::shapping_info0_mode_pseudo_random_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="shapping_info0_mode_pseudo_random_reg_cover");
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
    static function shapping_info0_mode_pseudo_random_reg_cover get();
        if (m_inst == null) begin
            m_inst = shapping_info0_mode_pseudo_random_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(shapping_info0_mode_pseudo_random_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class shapping_info1_mode_step_interval_reg_cover;

// Class: shapping_info1_mode_step_interval_reg
// Register shapping.info1_mode_step_interval: Info1 register definition in mode step_interval (FPGA SIMULATION -&gt; SOFT SHOULD IGNORE)
class shapping_info1_mode_step_interval_reg extends uvm_reg;

    // Variable: step_size
    // 
    rand uvm_reg_field step_size;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static shapping_info1_mode_step_interval_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    shapping_info1_mode_step_interval_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pktgen_shapping_reg_pkg::shapping_info1_mode_step_interval_reg)

    // Constructor: new
    function new(string name = "shapping_info1_mode_step_interval");
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
                cg = shapping_info1_mode_step_interval_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = shapping_info1_mode_step_interval_reg_cover::get();
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


// Class: shapping_info1_mode_step_interval_reg_cover
// Register coverage object.
class shapping_info1_mode_step_interval_reg_cover extends uvm_object;

    static local shapping_info1_mode_step_interval_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    shapping_info1_mode_step_interval_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        step_size_wr: coverpoint r.step_size.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        step_size_rd: coverpoint r.step_size.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(pktgen_shapping_reg_pkg::shapping_info1_mode_step_interval_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="shapping_info1_mode_step_interval_reg_cover");
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
    static function shapping_info1_mode_step_interval_reg_cover get();
        if (m_inst == null) begin
            m_inst = shapping_info1_mode_step_interval_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(shapping_info1_mode_step_interval_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class shapping_info2_emix_reg_cover;

// Class: shapping_info2_emix_reg
// Register shapping.info2_emix: Info2 register definition in E-mix mode
class shapping_info2_emix_reg extends uvm_reg;

    // Variable: ptr_weight2
    // field written by pktgen only, CPU write access is blocked
    rand uvm_reg_field ptr_weight2;
    // Variable: next_weight
    // field written by pktgen only, CPU write access is blocked
    rand uvm_reg_field next_weight;
    // Variable: next_size
    // field written by pktgen only, CPU write access is blocked
    rand uvm_reg_field next_size;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static shapping_info2_emix_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    shapping_info2_emix_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pktgen_shapping_reg_pkg::shapping_info2_emix_reg)

    // Constructor: new
    function new(string name = "shapping_info2_emix");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        ptr_weight2 = uvm_reg_field::type_id::create("ptr_weight2", , get_full_name());
        next_weight = uvm_reg_field::type_id::create("next_weight", , get_full_name());
        next_size = uvm_reg_field::type_id::create("next_size", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        ptr_weight2.configure(this, 3, 17, "RW", 0, 'h0, 1, 1, 0);
        next_weight.configure(this, 3, 14, "RW", 0, 'h0, 1, 1, 0);
        next_size.configure(this, 13, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = shapping_info2_emix_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = shapping_info2_emix_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, ptr_weight2.get_name, ptr_weight2.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, next_weight.get_name, next_weight.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, next_size.get_name, next_size.value);
        return s;
    endfunction

endclass


// Class: shapping_info2_emix_reg_cover
// Register coverage object.
class shapping_info2_emix_reg_cover extends uvm_object;

    static local shapping_info2_emix_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    shapping_info2_emix_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        ptr_weight2_wr: coverpoint r.ptr_weight2.value iff (!is_read);
        ptr_weight2_rd: coverpoint r.ptr_weight2.value iff  (is_read);
        next_weight_wr: coverpoint r.next_weight.value iff (!is_read);
        next_weight_rd: coverpoint r.next_weight.value iff  (is_read);
        next_size_wr: coverpoint r.next_size.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        next_size_rd: coverpoint r.next_size.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(pktgen_shapping_reg_pkg::shapping_info2_emix_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="shapping_info2_emix_reg_cover");
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
    static function shapping_info2_emix_reg_cover get();
        if (m_inst == null) begin
            m_inst = shapping_info2_emix_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(shapping_info2_emix_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class shapping_info2_mode_step_interval_reg_cover;

// Class: shapping_info2_mode_step_interval_reg
// Register shapping.info2_mode_step_interval: Info2 register definition in step interval mode (FPGA SIMULATION -&gt; SOFT SHOULD IGNORE)
class shapping_info2_mode_step_interval_reg extends uvm_reg;

    // Variable: next_direction
    // 0:+; 1:-
    rand uvm_reg_field next_direction;
    // Variable: next_size
    // 
    rand uvm_reg_field next_size;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static shapping_info2_mode_step_interval_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    shapping_info2_mode_step_interval_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pktgen_shapping_reg_pkg::shapping_info2_mode_step_interval_reg)

    // Constructor: new
    function new(string name = "shapping_info2_mode_step_interval");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        next_direction = uvm_reg_field::type_id::create("next_direction", , get_full_name());
        next_size = uvm_reg_field::type_id::create("next_size", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        next_direction.configure(this, 1, 14, "RW", 0, 'h0, 1, 1, 0);
        next_size.configure(this, 14, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = shapping_info2_mode_step_interval_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = shapping_info2_mode_step_interval_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, next_direction.get_name, next_direction.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, next_size.get_name, next_size.value);
        return s;
    endfunction

endclass


// Class: shapping_info2_mode_step_interval_reg_cover
// Register coverage object.
class shapping_info2_mode_step_interval_reg_cover extends uvm_object;

    static local shapping_info2_mode_step_interval_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    shapping_info2_mode_step_interval_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        next_direction_wr: coverpoint r.next_direction.value iff (!is_read);
        next_direction_rd: coverpoint r.next_direction.value iff  (is_read);
        next_size_wr: coverpoint r.next_size.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        next_size_rd: coverpoint r.next_size.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(pktgen_shapping_reg_pkg::shapping_info2_mode_step_interval_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="shapping_info2_mode_step_interval_reg_cover");
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
    static function shapping_info2_mode_step_interval_reg_cover get();
        if (m_inst == null) begin
            m_inst = shapping_info2_mode_step_interval_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(shapping_info2_mode_step_interval_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class shapping_info2_mode_pseudo_random_reg_cover;

// Class: shapping_info2_mode_pseudo_random_reg
// Register shapping.info2_mode_pseudo_random: Info2 register definition in pseudo random mode
class shapping_info2_mode_pseudo_random_reg extends uvm_reg;

    // Variable: last_random
    // 
    rand uvm_reg_field last_random;
    // Variable: random_special_zero
    // 
    rand uvm_reg_field random_special_zero;
    // Variable: next_size
    // Must initialize to min_size from info0_mode3 register
    rand uvm_reg_field next_size;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static shapping_info2_mode_pseudo_random_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    shapping_info2_mode_pseudo_random_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pktgen_shapping_reg_pkg::shapping_info2_mode_pseudo_random_reg)

    // Constructor: new
    function new(string name = "shapping_info2_mode_pseudo_random");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        last_random = uvm_reg_field::type_id::create("last_random", , get_full_name());
        random_special_zero = uvm_reg_field::type_id::create("random_special_zero", , get_full_name());
        next_size = uvm_reg_field::type_id::create("next_size", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        last_random.configure(this, 16, 15, "RW", 0, 'h0, 1, 1, 0);
        random_special_zero.configure(this, 1, 14, "RW", 0, 'h0, 1, 1, 0);
        next_size.configure(this, 14, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = shapping_info2_mode_pseudo_random_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = shapping_info2_mode_pseudo_random_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, last_random.get_name, last_random.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, random_special_zero.get_name, random_special_zero.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, next_size.get_name, next_size.value);
        return s;
    endfunction

endclass


// Class: shapping_info2_mode_pseudo_random_reg_cover
// Register coverage object.
class shapping_info2_mode_pseudo_random_reg_cover extends uvm_object;

    static local shapping_info2_mode_pseudo_random_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    shapping_info2_mode_pseudo_random_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        last_random_wr: coverpoint r.last_random.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        last_random_rd: coverpoint r.last_random.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        random_special_zero_wr: coverpoint r.random_special_zero.value iff (!is_read);
        random_special_zero_rd: coverpoint r.random_special_zero.value iff  (is_read);
        next_size_wr: coverpoint r.next_size.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        next_size_rd: coverpoint r.next_size.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(pktgen_shapping_reg_pkg::shapping_info2_mode_pseudo_random_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="shapping_info2_mode_pseudo_random_reg_cover");
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
    static function shapping_info2_mode_pseudo_random_reg_cover get();
        if (m_inst == null) begin
            m_inst = shapping_info2_mode_pseudo_random_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(shapping_info2_mode_pseudo_random_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class shapping_pkt_count_reg_cover;

// Class: shapping_pkt_count_reg
// Register shapping.pkt_count: 
class shapping_pkt_count_reg extends uvm_reg;

    // Variable: pkts
    // The counter is cleared on a low to high transition of the associated flow_ena control bit
    rand uvm_reg_field pkts;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static shapping_pkt_count_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    shapping_pkt_count_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pktgen_shapping_reg_pkg::shapping_pkt_count_reg)

    // Constructor: new
    function new(string name = "shapping_pkt_count");
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
                cg = shapping_pkt_count_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = shapping_pkt_count_reg_cover::get();
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


// Class: shapping_pkt_count_reg_cover
// Register coverage object.
class shapping_pkt_count_reg_cover extends uvm_object;

    static local shapping_pkt_count_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    shapping_pkt_count_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        pkts_wr: coverpoint r.pkts.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        pkts_rd: coverpoint r.pkts.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(pktgen_shapping_reg_pkg::shapping_pkt_count_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="shapping_pkt_count_reg_cover");
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
    static function shapping_pkt_count_reg_cover get();
        if (m_inst == null) begin
            m_inst = shapping_pkt_count_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(shapping_pkt_count_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class shapping_byte_count_reg_cover;

// Class: shapping_byte_count_reg
// Register shapping.byte_count: 
class shapping_byte_count_reg extends uvm_reg;

    // Variable: bytes
    // The counter is cleared on a low to high transition of the associated flow_ena control bit
    rand uvm_reg_field bytes;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static shapping_byte_count_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    shapping_byte_count_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pktgen_shapping_reg_pkg::shapping_byte_count_reg)

    // Constructor: new
    function new(string name = "shapping_byte_count");
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
                cg = shapping_byte_count_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = shapping_byte_count_reg_cover::get();
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


// Class: shapping_byte_count_reg_cover
// Register coverage object.
class shapping_byte_count_reg_cover extends uvm_object;

    static local shapping_byte_count_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    shapping_byte_count_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        bytes_wr: coverpoint r.bytes.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        bytes_rd: coverpoint r.bytes.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(pktgen_shapping_reg_pkg::shapping_byte_count_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="shapping_byte_count_reg_cover");
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
    static function shapping_byte_count_reg_cover get();
        if (m_inst == null) begin
            m_inst = shapping_byte_count_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(shapping_byte_count_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class shapping_last_pkt_size_reg_cover;

// Class: shapping_last_pkt_size_reg
// Register shapping.last_pkt_size: last pkt size field is flow based 0x0e[13:0] = flow 0, 0x1e[13:0] = flow1... 0x7e[13:0] = flow7 all other fields are applicable to all flows 0x0e[63:15] = 0x1e[63:15] ... = 0x7e[63:15]
class shapping_last_pkt_size_reg extends uvm_reg;

    // Variable: dbg_pkt_afull
    // debug signal : back bressure applied on pktgen
    rand uvm_reg_field dbg_pkt_afull;
    // Variable: dbg_pkt_request_valid
    // debug signal : indicate if there are packet requests in FIFO
    rand uvm_reg_field dbg_pkt_request_valid;
    // Variable: dbg_size_rdy
    // debug signal : size module readiness status
    rand uvm_reg_field dbg_size_rdy;
    // Variable: dbg_duration_rdy
    // debug signal : duration module readiness status -&gt; [flow3:0]
    rand uvm_reg_field dbg_duration_rdy;
    // Variable: dbg_shapping_ready
    // debug signal : shapping module readiness status (bucket positive) -&gt; [flow3:0]
    rand uvm_reg_field dbg_shapping_ready;
    // Variable: dbg_pktgen_fsm_state
    // debug signal : current fsm state (see pktgen instantiation for states definition (1G or 10G)
    rand uvm_reg_field dbg_pktgen_fsm_state;
    // Variable: dbg_unused
    // debug signal : unused
    rand uvm_reg_field dbg_unused;
    // Variable: dbg_pktgen_remain_bytes_cnt
    // debug signal : decrementing counter is state machine indicating remaining bytes to insert into current packet
    rand uvm_reg_field dbg_pktgen_remain_bytes_cnt;
    // Variable: last_pkt_sent_size
    // 
    rand uvm_reg_field last_pkt_sent_size;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static shapping_last_pkt_size_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    shapping_last_pkt_size_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pktgen_shapping_reg_pkg::shapping_last_pkt_size_reg)

    // Constructor: new
    function new(string name = "shapping_last_pkt_size");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        dbg_pkt_afull = uvm_reg_field::type_id::create("dbg_pkt_afull", , get_full_name());
        dbg_pkt_request_valid = uvm_reg_field::type_id::create("dbg_pkt_request_valid", , get_full_name());
        dbg_size_rdy = uvm_reg_field::type_id::create("dbg_size_rdy", , get_full_name());
        dbg_duration_rdy = uvm_reg_field::type_id::create("dbg_duration_rdy", , get_full_name());
        dbg_shapping_ready = uvm_reg_field::type_id::create("dbg_shapping_ready", , get_full_name());
        dbg_pktgen_fsm_state = uvm_reg_field::type_id::create("dbg_pktgen_fsm_state", , get_full_name());
        dbg_unused = uvm_reg_field::type_id::create("dbg_unused", , get_full_name());
        dbg_pktgen_remain_bytes_cnt = uvm_reg_field::type_id::create("dbg_pktgen_remain_bytes_cnt", , get_full_name());
        last_pkt_sent_size = uvm_reg_field::type_id::create("last_pkt_sent_size", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        dbg_pkt_afull.configure(this, 1, 62, "RO", 0, 'h0, 1, 1, 0);
        dbg_pkt_request_valid.configure(this, 1, 61, "RO", 0, 'h0, 1, 1, 0);
        dbg_size_rdy.configure(this, 1, 60, "RO", 0, 'h0, 1, 1, 0);
        dbg_duration_rdy.configure(this, 4, 56, "RO", 0, 'h0, 1, 1, 0);
        dbg_shapping_ready.configure(this, 4, 52, "RO", 0, 'h0, 1, 1, 0);
        dbg_pktgen_fsm_state.configure(this, 4, 48, "RO", 0, 'h0, 1, 1, 0);
        dbg_unused.configure(this, 1, 47, "RO", 0, 'h0, 1, 1, 0);
        dbg_pktgen_remain_bytes_cnt.configure(this, 15, 32, "RO", 0, 'h0, 1, 1, 0);
        last_pkt_sent_size.configure(this, 14, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = shapping_last_pkt_size_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = shapping_last_pkt_size_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, dbg_pkt_afull.get_name, dbg_pkt_afull.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, dbg_pkt_request_valid.get_name, dbg_pkt_request_valid.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, dbg_size_rdy.get_name, dbg_size_rdy.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, dbg_duration_rdy.get_name, dbg_duration_rdy.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, dbg_shapping_ready.get_name, dbg_shapping_ready.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, dbg_pktgen_fsm_state.get_name, dbg_pktgen_fsm_state.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, dbg_unused.get_name, dbg_unused.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, dbg_pktgen_remain_bytes_cnt.get_name, dbg_pktgen_remain_bytes_cnt.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, last_pkt_sent_size.get_name, last_pkt_sent_size.value);
        return s;
    endfunction

endclass


// Class: shapping_last_pkt_size_reg_cover
// Register coverage object.
class shapping_last_pkt_size_reg_cover extends uvm_object;

    static local shapping_last_pkt_size_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    shapping_last_pkt_size_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        dbg_pkt_afull_wr: coverpoint r.dbg_pkt_afull.value iff (!is_read);
        dbg_pkt_afull_rd: coverpoint r.dbg_pkt_afull.value iff  (is_read);
        dbg_pkt_request_valid_wr: coverpoint r.dbg_pkt_request_valid.value iff (!is_read);
        dbg_pkt_request_valid_rd: coverpoint r.dbg_pkt_request_valid.value iff  (is_read);
        dbg_size_rdy_wr: coverpoint r.dbg_size_rdy.value iff (!is_read);
        dbg_size_rdy_rd: coverpoint r.dbg_size_rdy.value iff  (is_read);
        dbg_duration_rdy_wr: coverpoint r.dbg_duration_rdy.value iff (!is_read);
        dbg_duration_rdy_rd: coverpoint r.dbg_duration_rdy.value iff  (is_read);
        dbg_shapping_ready_wr: coverpoint r.dbg_shapping_ready.value iff (!is_read);
        dbg_shapping_ready_rd: coverpoint r.dbg_shapping_ready.value iff  (is_read);
        dbg_pktgen_fsm_state_wr: coverpoint r.dbg_pktgen_fsm_state.value iff (!is_read);
        dbg_pktgen_fsm_state_rd: coverpoint r.dbg_pktgen_fsm_state.value iff  (is_read);
        dbg_unused_wr: coverpoint r.dbg_unused.value iff (!is_read);
        dbg_unused_rd: coverpoint r.dbg_unused.value iff  (is_read);
        dbg_pktgen_remain_bytes_cnt_wr: coverpoint r.dbg_pktgen_remain_bytes_cnt.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        dbg_pktgen_remain_bytes_cnt_rd: coverpoint r.dbg_pktgen_remain_bytes_cnt.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        last_pkt_sent_size_wr: coverpoint r.last_pkt_sent_size.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        last_pkt_sent_size_rd: coverpoint r.last_pkt_sent_size.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(pktgen_shapping_reg_pkg::shapping_last_pkt_size_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="shapping_last_pkt_size_reg_cover");
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
    static function shapping_last_pkt_size_reg_cover get();
        if (m_inst == null) begin
            m_inst = shapping_last_pkt_size_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(shapping_last_pkt_size_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass





// Class: pktgen_shapping_reg_block
// Register Block .pktgen_shapping: 
class pktgen_shapping_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand shapping_shapping_bucket_reg shapping_bucket;
    rand shapping_credit_reg credit;
    rand shapping_period_reg period;
    rand shapping_shapping_mode_reg shapping_mode;
    rand shapping_duration_bucket_reg duration_bucket;
    rand shapping_duration_mode_reg duration_mode;
    rand shapping_emix_table_reg emix_table;
    rand shapping_info0_mode_emix_reg info0_mode_emix;
    rand shapping_info0_mode_step_interval_reg info0_mode_step_interval;
    rand shapping_info0_mode_pseudo_random_reg info0_mode_pseudo_random;
    rand shapping_info1_mode_step_interval_reg info1_mode_step_interval;
    rand shapping_info2_emix_reg info2_emix;
    rand shapping_info2_mode_step_interval_reg info2_mode_step_interval;
    rand shapping_info2_mode_pseudo_random_reg info2_mode_pseudo_random;
    rand shapping_pkt_count_reg pkt_count;
    rand shapping_byte_count_reg byte_count;
    rand shapping_last_pkt_size_reg last_pkt_size;

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(pktgen_shapping_reg_pkg::pktgen_shapping_reg_block)

    // Constructor: new
    function new(string name = "pktgen_shapping_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})


        shapping_bucket = shapping_shapping_bucket_reg::type_id::create("shapping_bucket", , get_full_name());
        credit = shapping_credit_reg::type_id::create("credit", , get_full_name());
        period = shapping_period_reg::type_id::create("period", , get_full_name());
        shapping_mode = shapping_shapping_mode_reg::type_id::create("shapping_mode", , get_full_name());
        duration_bucket = shapping_duration_bucket_reg::type_id::create("duration_bucket", , get_full_name());
        duration_mode = shapping_duration_mode_reg::type_id::create("duration_mode", , get_full_name());
        emix_table = shapping_emix_table_reg::type_id::create("emix_table", , get_full_name());
        info0_mode_emix = shapping_info0_mode_emix_reg::type_id::create("info0_mode_emix", , get_full_name());
        info0_mode_step_interval = shapping_info0_mode_step_interval_reg::type_id::create("info0_mode_step_interval", , get_full_name());
        info0_mode_pseudo_random = shapping_info0_mode_pseudo_random_reg::type_id::create("info0_mode_pseudo_random", , get_full_name());
        info1_mode_step_interval = shapping_info1_mode_step_interval_reg::type_id::create("info1_mode_step_interval", , get_full_name());
        info2_emix = shapping_info2_emix_reg::type_id::create("info2_emix", , get_full_name());
        info2_mode_step_interval = shapping_info2_mode_step_interval_reg::type_id::create("info2_mode_step_interval", , get_full_name());
        info2_mode_pseudo_random = shapping_info2_mode_pseudo_random_reg::type_id::create("info2_mode_pseudo_random", , get_full_name());
        pkt_count = shapping_pkt_count_reg::type_id::create("pkt_count", , get_full_name());
        byte_count = shapping_byte_count_reg::type_id::create("byte_count", , get_full_name());
        last_pkt_size = shapping_last_pkt_size_reg::type_id::create("last_pkt_size", , get_full_name());

        shapping_bucket.configure(this);
        credit.configure(this);
        period.configure(this);
        shapping_mode.configure(this);
        duration_bucket.configure(this);
        duration_mode.configure(this);
        emix_table.configure(this);
        info0_mode_emix.configure(this);
        info0_mode_step_interval.configure(this);
        info0_mode_pseudo_random.configure(this);
        info1_mode_step_interval.configure(this);
        info2_emix.configure(this);
        info2_mode_step_interval.configure(this);
        info2_mode_pseudo_random.configure(this);
        pkt_count.configure(this);
        byte_count.configure(this);
        last_pkt_size.configure(this);

        shapping_bucket.build();
        credit.build();
        period.build();
        shapping_mode.build();
        duration_bucket.build();
        duration_mode.build();
        emix_table.build();
        info0_mode_emix.build();
        info0_mode_step_interval.build();
        info0_mode_pseudo_random.build();
        info1_mode_step_interval.build();
        info2_emix.build();
        info2_mode_step_interval.build();
        info2_mode_pseudo_random.build();
        pkt_count.build();
        byte_count.build();
        last_pkt_size.build();

        // define default map
        default_map = create_map("pktgen_shapping_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        this.default_map.add_reg(shapping_bucket, 'h0, "RW");
        this.default_map.add_reg(credit, 'h1, "RW");
        this.default_map.add_reg(period, 'h2, "RW");
        this.default_map.add_reg(shapping_mode, 'h3, "RW");
        this.default_map.add_reg(duration_bucket, 'h4, "RW");
        this.default_map.add_reg(duration_mode, 'h5, "RW");
        this.default_map.add_reg(emix_table, 'h8, "RW");
        this.default_map.add_reg(info0_mode_emix, 'h9, "RW");
        this.default_map.add_reg(info0_mode_step_interval, 'h9, "RW");
        this.default_map.add_reg(info0_mode_pseudo_random, 'h9, "RW");
        this.default_map.add_reg(info1_mode_step_interval, 'hA, "RW");
        this.default_map.add_reg(info2_emix, 'hB, "RW");
        this.default_map.add_reg(info2_mode_step_interval, 'hB, "RW");
        this.default_map.add_reg(info2_mode_pseudo_random, 'hB, "RW");
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
        shapping_bucket.enable_coverage(is_on, this.cg_per_instance);
        credit.enable_coverage(is_on, this.cg_per_instance);
        period.enable_coverage(is_on, this.cg_per_instance);
        shapping_mode.enable_coverage(is_on, this.cg_per_instance);
        duration_bucket.enable_coverage(is_on, this.cg_per_instance);
        duration_mode.enable_coverage(is_on, this.cg_per_instance);
        emix_table.enable_coverage(is_on, this.cg_per_instance);
        info0_mode_emix.enable_coverage(is_on, this.cg_per_instance);
        info0_mode_step_interval.enable_coverage(is_on, this.cg_per_instance);
        info0_mode_pseudo_random.enable_coverage(is_on, this.cg_per_instance);
        info1_mode_step_interval.enable_coverage(is_on, this.cg_per_instance);
        info2_emix.enable_coverage(is_on, this.cg_per_instance);
        info2_mode_step_interval.enable_coverage(is_on, this.cg_per_instance);
        info2_mode_pseudo_random.enable_coverage(is_on, this.cg_per_instance);
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