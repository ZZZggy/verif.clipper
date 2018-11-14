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
// Register definitions for inspector register block.
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
// Group: inspector
//---------------------------------------------------------

package inspector_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;

typedef class inspector_flow_latency_min_reg_cover;

// Class: inspector_flow_latency_min_reg
// Register inspector_flow.latency_min: 
class inspector_flow_latency_min_reg extends uvm_reg;

    // Variable: latency_min
    // 
    rand uvm_reg_field latency_min;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static inspector_flow_latency_min_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    inspector_flow_latency_min_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(inspector_reg_pkg::inspector_flow_latency_min_reg)

    // Constructor: new
    function new(string name = "inspector_flow_latency_min");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        latency_min = uvm_reg_field::type_id::create("latency_min", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        latency_min.configure(this, 36, 0, "rw", 0, 'h0, 1, 1, 0);
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
                cg = inspector_flow_latency_min_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = inspector_flow_latency_min_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, latency_min.get_name, latency_min.value);
        return s;
    endfunction

endclass


// Class: inspector_flow_latency_min_reg_cover
// Register coverage object.
class inspector_flow_latency_min_reg_cover extends uvm_object;

    static local inspector_flow_latency_min_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    inspector_flow_latency_min_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        latency_min_wr: coverpoint r.latency_min.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        latency_min_rd: coverpoint r.latency_min.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(inspector_reg_pkg::inspector_flow_latency_min_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="inspector_flow_latency_min_reg_cover");
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
    static function inspector_flow_latency_min_reg_cover get();
        if (m_inst == null) begin
            m_inst = inspector_flow_latency_min_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(inspector_flow_latency_min_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class inspector_flow_jitter_min_reg_cover;

// Class: inspector_flow_jitter_min_reg
// Register inspector_flow.jitter_min: 
class inspector_flow_jitter_min_reg extends uvm_reg;

    // Variable: jitter_min
    // 
    rand uvm_reg_field jitter_min;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static inspector_flow_jitter_min_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    inspector_flow_jitter_min_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(inspector_reg_pkg::inspector_flow_jitter_min_reg)

    // Constructor: new
    function new(string name = "inspector_flow_jitter_min");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        jitter_min = uvm_reg_field::type_id::create("jitter_min", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        jitter_min.configure(this, 36, 0, "rw", 0, 'h0, 1, 1, 0);
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
                cg = inspector_flow_jitter_min_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = inspector_flow_jitter_min_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, jitter_min.get_name, jitter_min.value);
        return s;
    endfunction

endclass


// Class: inspector_flow_jitter_min_reg_cover
// Register coverage object.
class inspector_flow_jitter_min_reg_cover extends uvm_object;

    static local inspector_flow_jitter_min_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    inspector_flow_jitter_min_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        jitter_min_wr: coverpoint r.jitter_min.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        jitter_min_rd: coverpoint r.jitter_min.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(inspector_reg_pkg::inspector_flow_jitter_min_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="inspector_flow_jitter_min_reg_cover");
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
    static function inspector_flow_jitter_min_reg_cover get();
        if (m_inst == null) begin
            m_inst = inspector_flow_jitter_min_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(inspector_flow_jitter_min_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class inspector_flow_sum_latency_reg_cover;

// Class: inspector_flow_sum_latency_reg
// Register inspector_flow.sum_latency: 
class inspector_flow_sum_latency_reg extends uvm_reg;

    // Variable: sum_latency
    // 
    rand uvm_reg_field sum_latency;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static inspector_flow_sum_latency_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    inspector_flow_sum_latency_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(inspector_reg_pkg::inspector_flow_sum_latency_reg)

    // Constructor: new
    function new(string name = "inspector_flow_sum_latency");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        sum_latency = uvm_reg_field::type_id::create("sum_latency", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        sum_latency.configure(this, 64, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = inspector_flow_sum_latency_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = inspector_flow_sum_latency_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, sum_latency.get_name, sum_latency.value);
        return s;
    endfunction

endclass


// Class: inspector_flow_sum_latency_reg_cover
// Register coverage object.
class inspector_flow_sum_latency_reg_cover extends uvm_object;

    static local inspector_flow_sum_latency_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    inspector_flow_sum_latency_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        sum_latency_wr: coverpoint r.sum_latency.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        sum_latency_rd: coverpoint r.sum_latency.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(inspector_reg_pkg::inspector_flow_sum_latency_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="inspector_flow_sum_latency_reg_cover");
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
    static function inspector_flow_sum_latency_reg_cover get();
        if (m_inst == null) begin
            m_inst = inspector_flow_sum_latency_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(inspector_flow_sum_latency_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class inspector_flow_sum_jitter_reg_cover;

// Class: inspector_flow_sum_jitter_reg
// Register inspector_flow.sum_jitter: 
class inspector_flow_sum_jitter_reg extends uvm_reg;

    // Variable: sum_jitter
    // 
    rand uvm_reg_field sum_jitter;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static inspector_flow_sum_jitter_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    inspector_flow_sum_jitter_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(inspector_reg_pkg::inspector_flow_sum_jitter_reg)

    // Constructor: new
    function new(string name = "inspector_flow_sum_jitter");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        sum_jitter = uvm_reg_field::type_id::create("sum_jitter", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        sum_jitter.configure(this, 64, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = inspector_flow_sum_jitter_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = inspector_flow_sum_jitter_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, sum_jitter.get_name, sum_jitter.value);
        return s;
    endfunction

endclass


// Class: inspector_flow_sum_jitter_reg_cover
// Register coverage object.
class inspector_flow_sum_jitter_reg_cover extends uvm_object;

    static local inspector_flow_sum_jitter_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    inspector_flow_sum_jitter_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        sum_jitter_wr: coverpoint r.sum_jitter.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        sum_jitter_rd: coverpoint r.sum_jitter.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(inspector_reg_pkg::inspector_flow_sum_jitter_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="inspector_flow_sum_jitter_reg_cover");
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
    static function inspector_flow_sum_jitter_reg_cover get();
        if (m_inst == null) begin
            m_inst = inspector_flow_sum_jitter_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(inspector_flow_sum_jitter_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class inspector_flow_bytes_good_reg_cover;

// Class: inspector_flow_bytes_good_reg
// Register inspector_flow.bytes_good: 
class inspector_flow_bytes_good_reg extends uvm_reg;

    // Variable: bytes_good
    // 
    rand uvm_reg_field bytes_good;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static inspector_flow_bytes_good_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    inspector_flow_bytes_good_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(inspector_reg_pkg::inspector_flow_bytes_good_reg)

    // Constructor: new
    function new(string name = "inspector_flow_bytes_good");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        bytes_good = uvm_reg_field::type_id::create("bytes_good", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        bytes_good.configure(this, 36, 0, "rw", 0, 'h0, 1, 1, 0);
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
                cg = inspector_flow_bytes_good_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = inspector_flow_bytes_good_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, bytes_good.get_name, bytes_good.value);
        return s;
    endfunction

endclass


// Class: inspector_flow_bytes_good_reg_cover
// Register coverage object.
class inspector_flow_bytes_good_reg_cover extends uvm_object;

    static local inspector_flow_bytes_good_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    inspector_flow_bytes_good_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        bytes_good_wr: coverpoint r.bytes_good.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        bytes_good_rd: coverpoint r.bytes_good.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(inspector_reg_pkg::inspector_flow_bytes_good_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="inspector_flow_bytes_good_reg_cover");
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
    static function inspector_flow_bytes_good_reg_cover get();
        if (m_inst == null) begin
            m_inst = inspector_flow_bytes_good_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(inspector_flow_bytes_good_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class inspector_flow_bytes_bad_reg_cover;

// Class: inspector_flow_bytes_bad_reg
// Register inspector_flow.bytes_bad: 
class inspector_flow_bytes_bad_reg extends uvm_reg;

    // Variable: bytes_bad
    // 
    rand uvm_reg_field bytes_bad;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static inspector_flow_bytes_bad_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    inspector_flow_bytes_bad_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(inspector_reg_pkg::inspector_flow_bytes_bad_reg)

    // Constructor: new
    function new(string name = "inspector_flow_bytes_bad");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        bytes_bad = uvm_reg_field::type_id::create("bytes_bad", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        bytes_bad.configure(this, 36, 0, "rw", 0, 'h0, 1, 1, 0);
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
                cg = inspector_flow_bytes_bad_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = inspector_flow_bytes_bad_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, bytes_bad.get_name, bytes_bad.value);
        return s;
    endfunction

endclass


// Class: inspector_flow_bytes_bad_reg_cover
// Register coverage object.
class inspector_flow_bytes_bad_reg_cover extends uvm_object;

    static local inspector_flow_bytes_bad_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    inspector_flow_bytes_bad_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        bytes_bad_wr: coverpoint r.bytes_bad.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        bytes_bad_rd: coverpoint r.bytes_bad.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(inspector_reg_pkg::inspector_flow_bytes_bad_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="inspector_flow_bytes_bad_reg_cover");
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
    static function inspector_flow_bytes_bad_reg_cover get();
        if (m_inst == null) begin
            m_inst = inspector_flow_bytes_bad_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(inspector_flow_bytes_bad_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class inspector_flow_first_ts_reg_cover;

// Class: inspector_flow_first_ts_reg
// Register inspector_flow.first_ts: 
class inspector_flow_first_ts_reg extends uvm_reg;

    // Variable: first_ts
    // 
    rand uvm_reg_field first_ts;
    // Variable: ts_select
    // bit [40] selects timebase : '0'(default) = regular, '1' = free run
    rand uvm_reg_field ts_select;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static inspector_flow_first_ts_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    inspector_flow_first_ts_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(inspector_reg_pkg::inspector_flow_first_ts_reg)

    // Constructor: new
    function new(string name = "inspector_flow_first_ts");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        first_ts = uvm_reg_field::type_id::create("first_ts", , get_full_name());
        ts_select = uvm_reg_field::type_id::create("ts_select", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        first_ts.configure(this, 40, 0, "RW", 0, 'h0, 1, 1, 0);
        ts_select.configure(this, 1, 40, "RW", 0, 'h0, 1, 1, 0);
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
                cg = inspector_flow_first_ts_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = inspector_flow_first_ts_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, first_ts.get_name, first_ts.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, ts_select.get_name, ts_select.value);
        return s;
    endfunction

endclass


// Class: inspector_flow_first_ts_reg_cover
// Register coverage object.
class inspector_flow_first_ts_reg_cover extends uvm_object;

    static local inspector_flow_first_ts_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    inspector_flow_first_ts_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        first_ts_wr: coverpoint r.first_ts.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        first_ts_rd: coverpoint r.first_ts.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        ts_select_wr: coverpoint r.ts_select.value iff (!is_read);
        ts_select_rd: coverpoint r.ts_select.value iff  (is_read);
    endgroup

    `uvm_object_utils(inspector_reg_pkg::inspector_flow_first_ts_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="inspector_flow_first_ts_reg_cover");
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
    static function inspector_flow_first_ts_reg_cover get();
        if (m_inst == null) begin
            m_inst = inspector_flow_first_ts_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(inspector_flow_first_ts_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class inspector_flow_last_ts_reg_cover;

// Class: inspector_flow_last_ts_reg
// Register inspector_flow.last_ts: 
class inspector_flow_last_ts_reg extends uvm_reg;

    // Variable: last_ts
    // 
    rand uvm_reg_field last_ts;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static inspector_flow_last_ts_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    inspector_flow_last_ts_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(inspector_reg_pkg::inspector_flow_last_ts_reg)

    // Constructor: new
    function new(string name = "inspector_flow_last_ts");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        last_ts = uvm_reg_field::type_id::create("last_ts", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        last_ts.configure(this, 40, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = inspector_flow_last_ts_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = inspector_flow_last_ts_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, last_ts.get_name, last_ts.value);
        return s;
    endfunction

endclass


// Class: inspector_flow_last_ts_reg_cover
// Register coverage object.
class inspector_flow_last_ts_reg_cover extends uvm_object;

    static local inspector_flow_last_ts_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    inspector_flow_last_ts_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        last_ts_wr: coverpoint r.last_ts.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        last_ts_rd: coverpoint r.last_ts.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(inspector_reg_pkg::inspector_flow_last_ts_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="inspector_flow_last_ts_reg_cover");
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
    static function inspector_flow_last_ts_reg_cover get();
        if (m_inst == null) begin
            m_inst = inspector_flow_last_ts_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(inspector_flow_last_ts_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class inspector_flow_next_seq_no_reg_cover;

// Class: inspector_flow_next_seq_no_reg
// Register inspector_flow.next_seq_no: 
class inspector_flow_next_seq_no_reg extends uvm_reg;

    // Variable: next_seq_no
    // 
    rand uvm_reg_field next_seq_no;
    // Variable: reserved
    // Removing this field will produce a fail in the bit bash test in sim.
    rand uvm_reg_field reserved;
    // Variable: overflow
    // 
    rand uvm_reg_field overflow;
    // Variable: first_bad
    // 
    rand uvm_reg_field first_bad;
    // Variable: gap
    // 
    rand uvm_reg_field gap;
    // Variable: first_good
    // 
    rand uvm_reg_field first_good;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static inspector_flow_next_seq_no_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    inspector_flow_next_seq_no_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(inspector_reg_pkg::inspector_flow_next_seq_no_reg)

    // Constructor: new
    function new(string name = "inspector_flow_next_seq_no");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        next_seq_no = uvm_reg_field::type_id::create("next_seq_no", , get_full_name());
        reserved = uvm_reg_field::type_id::create("reserved", , get_full_name());
        overflow = uvm_reg_field::type_id::create("overflow", , get_full_name());
        first_bad = uvm_reg_field::type_id::create("first_bad", , get_full_name());
        gap = uvm_reg_field::type_id::create("gap", , get_full_name());
        first_good = uvm_reg_field::type_id::create("first_good", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        next_seq_no.configure(this, 24, 0, "RW", 0, 'h0, 1, 1, 0);
        reserved.configure(this, 8, 24, "RW", 0, 'h0, 1, 1, 0);
        overflow.configure(this, 1, 32, "RW", 0, 'h0, 1, 1, 0);
        first_bad.configure(this, 1, 33, "RW", 0, 'h0, 1, 1, 0);
        gap.configure(this, 1, 34, "RW", 0, 'h0, 1, 1, 0);
        first_good.configure(this, 1, 35, "RW", 0, 'h0, 1, 1, 0);
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
                cg = inspector_flow_next_seq_no_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = inspector_flow_next_seq_no_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, next_seq_no.get_name, next_seq_no.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, reserved.get_name, reserved.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, overflow.get_name, overflow.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, first_bad.get_name, first_bad.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, gap.get_name, gap.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, first_good.get_name, first_good.value);
        return s;
    endfunction

endclass


// Class: inspector_flow_next_seq_no_reg_cover
// Register coverage object.
class inspector_flow_next_seq_no_reg_cover extends uvm_object;

    static local inspector_flow_next_seq_no_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    inspector_flow_next_seq_no_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        next_seq_no_wr: coverpoint r.next_seq_no.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        next_seq_no_rd: coverpoint r.next_seq_no.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        reserved_wr: coverpoint r.reserved.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        reserved_rd: coverpoint r.reserved.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        overflow_wr: coverpoint r.overflow.value iff (!is_read);
        overflow_rd: coverpoint r.overflow.value iff  (is_read);
        first_bad_wr: coverpoint r.first_bad.value iff (!is_read);
        first_bad_rd: coverpoint r.first_bad.value iff  (is_read);
        gap_wr: coverpoint r.gap.value iff (!is_read);
        gap_rd: coverpoint r.gap.value iff  (is_read);
        first_good_wr: coverpoint r.first_good.value iff (!is_read);
        first_good_rd: coverpoint r.first_good.value iff  (is_read);
    endgroup

    `uvm_object_utils(inspector_reg_pkg::inspector_flow_next_seq_no_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="inspector_flow_next_seq_no_reg_cover");
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
    static function inspector_flow_next_seq_no_reg_cover get();
        if (m_inst == null) begin
            m_inst = inspector_flow_next_seq_no_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(inspector_flow_next_seq_no_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class inspector_flow_last_latency_reg_cover;

// Class: inspector_flow_last_latency_reg
// Register inspector_flow.last_latency: 
class inspector_flow_last_latency_reg extends uvm_reg;

    // Variable: last_latency
    // 
    rand uvm_reg_field last_latency;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static inspector_flow_last_latency_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    inspector_flow_last_latency_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(inspector_reg_pkg::inspector_flow_last_latency_reg)

    // Constructor: new
    function new(string name = "inspector_flow_last_latency");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        last_latency = uvm_reg_field::type_id::create("last_latency", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        last_latency.configure(this, 36, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = inspector_flow_last_latency_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = inspector_flow_last_latency_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, last_latency.get_name, last_latency.value);
        return s;
    endfunction

endclass


// Class: inspector_flow_last_latency_reg_cover
// Register coverage object.
class inspector_flow_last_latency_reg_cover extends uvm_object;

    static local inspector_flow_last_latency_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    inspector_flow_last_latency_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        last_latency_wr: coverpoint r.last_latency.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        last_latency_rd: coverpoint r.last_latency.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(inspector_reg_pkg::inspector_flow_last_latency_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="inspector_flow_last_latency_reg_cover");
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
    static function inspector_flow_last_latency_reg_cover get();
        if (m_inst == null) begin
            m_inst = inspector_flow_last_latency_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(inspector_flow_last_latency_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class inspector_flow_last_jitter_reg_cover;

// Class: inspector_flow_last_jitter_reg
// Register inspector_flow.last_jitter: 
class inspector_flow_last_jitter_reg extends uvm_reg;

    // Variable: last_jitter
    // 
    rand uvm_reg_field last_jitter;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static inspector_flow_last_jitter_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    inspector_flow_last_jitter_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(inspector_reg_pkg::inspector_flow_last_jitter_reg)

    // Constructor: new
    function new(string name = "inspector_flow_last_jitter");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        last_jitter = uvm_reg_field::type_id::create("last_jitter", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        last_jitter.configure(this, 36, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = inspector_flow_last_jitter_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = inspector_flow_last_jitter_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, last_jitter.get_name, last_jitter.value);
        return s;
    endfunction

endclass


// Class: inspector_flow_last_jitter_reg_cover
// Register coverage object.
class inspector_flow_last_jitter_reg_cover extends uvm_object;

    static local inspector_flow_last_jitter_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    inspector_flow_last_jitter_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        last_jitter_wr: coverpoint r.last_jitter.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        last_jitter_rd: coverpoint r.last_jitter.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(inspector_reg_pkg::inspector_flow_last_jitter_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="inspector_flow_last_jitter_reg_cover");
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
    static function inspector_flow_last_jitter_reg_cover get();
        if (m_inst == null) begin
            m_inst = inspector_flow_last_jitter_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(inspector_flow_last_jitter_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class inspector_flow_gap_max_reg_cover;

// Class: inspector_flow_gap_max_reg
// Register inspector_flow.gap_max: 
class inspector_flow_gap_max_reg extends uvm_reg;

    // Variable: gap_max
    // 
    rand uvm_reg_field gap_max;
    // Variable: reserved
    // Removing this field will produce a fail in the bit bash test in sim.
    rand uvm_reg_field reserved;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static inspector_flow_gap_max_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    inspector_flow_gap_max_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(inspector_reg_pkg::inspector_flow_gap_max_reg)

    // Constructor: new
    function new(string name = "inspector_flow_gap_max");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        gap_max = uvm_reg_field::type_id::create("gap_max", , get_full_name());
        reserved = uvm_reg_field::type_id::create("reserved", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        gap_max.configure(this, 25, 0, "RW", 0, 'h0, 1, 1, 0);
        reserved.configure(this, 11, 25, "RW", 0, 'h0, 1, 1, 0);
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
                cg = inspector_flow_gap_max_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = inspector_flow_gap_max_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, gap_max.get_name, gap_max.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, reserved.get_name, reserved.value);
        return s;
    endfunction

endclass


// Class: inspector_flow_gap_max_reg_cover
// Register coverage object.
class inspector_flow_gap_max_reg_cover extends uvm_object;

    static local inspector_flow_gap_max_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    inspector_flow_gap_max_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        gap_max_wr: coverpoint r.gap_max.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        gap_max_rd: coverpoint r.gap_max.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        reserved_wr: coverpoint r.reserved.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        reserved_rd: coverpoint r.reserved.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(inspector_reg_pkg::inspector_flow_gap_max_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="inspector_flow_gap_max_reg_cover");
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
    static function inspector_flow_gap_max_reg_cover get();
        if (m_inst == null) begin
            m_inst = inspector_flow_gap_max_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(inspector_flow_gap_max_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class inspector_flow_gap_reg_cover;

// Class: inspector_flow_gap_reg
// Register inspector_flow.gap: 
class inspector_flow_gap_reg extends uvm_reg;

    // Variable: gap
    // 
    rand uvm_reg_field gap;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static inspector_flow_gap_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    inspector_flow_gap_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(inspector_reg_pkg::inspector_flow_gap_reg)

    // Constructor: new
    function new(string name = "inspector_flow_gap");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        gap = uvm_reg_field::type_id::create("gap", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        gap.configure(this, 36, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = inspector_flow_gap_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = inspector_flow_gap_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, gap.get_name, gap.value);
        return s;
    endfunction

endclass


// Class: inspector_flow_gap_reg_cover
// Register coverage object.
class inspector_flow_gap_reg_cover extends uvm_object;

    static local inspector_flow_gap_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    inspector_flow_gap_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        gap_wr: coverpoint r.gap.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        gap_rd: coverpoint r.gap.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(inspector_reg_pkg::inspector_flow_gap_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="inspector_flow_gap_reg_cover");
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
    static function inspector_flow_gap_reg_cover get();
        if (m_inst == null) begin
            m_inst = inspector_flow_gap_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(inspector_flow_gap_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class inspector_flow_out_of_seq_or_dup_reg_cover;

// Class: inspector_flow_out_of_seq_or_dup_reg
// Register inspector_flow.out_of_seq_or_dup: 
class inspector_flow_out_of_seq_or_dup_reg extends uvm_reg;

    // Variable: out_of_seq_or_dup
    // 
    rand uvm_reg_field out_of_seq_or_dup;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static inspector_flow_out_of_seq_or_dup_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    inspector_flow_out_of_seq_or_dup_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(inspector_reg_pkg::inspector_flow_out_of_seq_or_dup_reg)

    // Constructor: new
    function new(string name = "inspector_flow_out_of_seq_or_dup");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        out_of_seq_or_dup = uvm_reg_field::type_id::create("out_of_seq_or_dup", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        out_of_seq_or_dup.configure(this, 36, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = inspector_flow_out_of_seq_or_dup_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = inspector_flow_out_of_seq_or_dup_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, out_of_seq_or_dup.get_name, out_of_seq_or_dup.value);
        return s;
    endfunction

endclass


// Class: inspector_flow_out_of_seq_or_dup_reg_cover
// Register coverage object.
class inspector_flow_out_of_seq_or_dup_reg_cover extends uvm_object;

    static local inspector_flow_out_of_seq_or_dup_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    inspector_flow_out_of_seq_or_dup_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        out_of_seq_or_dup_wr: coverpoint r.out_of_seq_or_dup.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        out_of_seq_or_dup_rd: coverpoint r.out_of_seq_or_dup.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(inspector_reg_pkg::inspector_flow_out_of_seq_or_dup_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="inspector_flow_out_of_seq_or_dup_reg_cover");
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
    static function inspector_flow_out_of_seq_or_dup_reg_cover get();
        if (m_inst == null) begin
            m_inst = inspector_flow_out_of_seq_or_dup_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(inspector_flow_out_of_seq_or_dup_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class inspector_flow_first_gap_reg_cover;

// Class: inspector_flow_first_gap_reg
// Register inspector_flow.first_gap: 
class inspector_flow_first_gap_reg extends uvm_reg;

    // Variable: first_gap
    // 
    rand uvm_reg_field first_gap;
    // Variable: reserved
    // Removing this field will produce a fail in the bit bash test in sim.
    rand uvm_reg_field reserved;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static inspector_flow_first_gap_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    inspector_flow_first_gap_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(inspector_reg_pkg::inspector_flow_first_gap_reg)

    // Constructor: new
    function new(string name = "inspector_flow_first_gap");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        first_gap = uvm_reg_field::type_id::create("first_gap", , get_full_name());
        reserved = uvm_reg_field::type_id::create("reserved", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        first_gap.configure(this, 24, 0, "RW", 0, 'h0, 1, 1, 0);
        reserved.configure(this, 12, 24, "RW", 0, 'h0, 1, 1, 0);
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
                cg = inspector_flow_first_gap_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = inspector_flow_first_gap_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, first_gap.get_name, first_gap.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, reserved.get_name, reserved.value);
        return s;
    endfunction

endclass


// Class: inspector_flow_first_gap_reg_cover
// Register coverage object.
class inspector_flow_first_gap_reg_cover extends uvm_object;

    static local inspector_flow_first_gap_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    inspector_flow_first_gap_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        first_gap_wr: coverpoint r.first_gap.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        first_gap_rd: coverpoint r.first_gap.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        reserved_wr: coverpoint r.reserved.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        reserved_rd: coverpoint r.reserved.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(inspector_reg_pkg::inspector_flow_first_gap_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="inspector_flow_first_gap_reg_cover");
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
    static function inspector_flow_first_gap_reg_cover get();
        if (m_inst == null) begin
            m_inst = inspector_flow_first_gap_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(inspector_flow_first_gap_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class inspector_flow_last_pkt_size_reg_cover;

// Class: inspector_flow_last_pkt_size_reg
// Register inspector_flow.last_pkt_size: 
class inspector_flow_last_pkt_size_reg extends uvm_reg;

    // Variable: last_pkt_size
    // 
    rand uvm_reg_field last_pkt_size;
    // Variable: reserved
    // Removing this field will produce a fail in the bit bash test in sim.
    rand uvm_reg_field reserved;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static inspector_flow_last_pkt_size_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    inspector_flow_last_pkt_size_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(inspector_reg_pkg::inspector_flow_last_pkt_size_reg)

    // Constructor: new
    function new(string name = "inspector_flow_last_pkt_size");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        last_pkt_size = uvm_reg_field::type_id::create("last_pkt_size", , get_full_name());
        reserved = uvm_reg_field::type_id::create("reserved", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        last_pkt_size.configure(this, 14, 0, "RW", 0, 'h0, 1, 1, 0);
        reserved.configure(this, 22, 14, "RW", 0, 'h0, 1, 1, 0);
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
                cg = inspector_flow_last_pkt_size_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = inspector_flow_last_pkt_size_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, last_pkt_size.get_name, last_pkt_size.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, reserved.get_name, reserved.value);
        return s;
    endfunction

endclass


// Class: inspector_flow_last_pkt_size_reg_cover
// Register coverage object.
class inspector_flow_last_pkt_size_reg_cover extends uvm_object;

    static local inspector_flow_last_pkt_size_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    inspector_flow_last_pkt_size_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        last_pkt_size_wr: coverpoint r.last_pkt_size.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        last_pkt_size_rd: coverpoint r.last_pkt_size.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        reserved_wr: coverpoint r.reserved.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        reserved_rd: coverpoint r.reserved.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(inspector_reg_pkg::inspector_flow_last_pkt_size_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="inspector_flow_last_pkt_size_reg_cover");
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
    static function inspector_flow_last_pkt_size_reg_cover get();
        if (m_inst == null) begin
            m_inst = inspector_flow_last_pkt_size_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(inspector_flow_last_pkt_size_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class inspector_flow_latency_max_reg_cover;

// Class: inspector_flow_latency_max_reg
// Register inspector_flow.latency_max: 
class inspector_flow_latency_max_reg extends uvm_reg;

    // Variable: latency_max
    // 
    rand uvm_reg_field latency_max;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static inspector_flow_latency_max_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    inspector_flow_latency_max_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(inspector_reg_pkg::inspector_flow_latency_max_reg)

    // Constructor: new
    function new(string name = "inspector_flow_latency_max");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        latency_max = uvm_reg_field::type_id::create("latency_max", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        latency_max.configure(this, 36, 0, "rw", 0, 'h0, 1, 1, 0);
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
                cg = inspector_flow_latency_max_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = inspector_flow_latency_max_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, latency_max.get_name, latency_max.value);
        return s;
    endfunction

endclass


// Class: inspector_flow_latency_max_reg_cover
// Register coverage object.
class inspector_flow_latency_max_reg_cover extends uvm_object;

    static local inspector_flow_latency_max_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    inspector_flow_latency_max_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        latency_max_wr: coverpoint r.latency_max.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        latency_max_rd: coverpoint r.latency_max.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(inspector_reg_pkg::inspector_flow_latency_max_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="inspector_flow_latency_max_reg_cover");
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
    static function inspector_flow_latency_max_reg_cover get();
        if (m_inst == null) begin
            m_inst = inspector_flow_latency_max_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(inspector_flow_latency_max_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class inspector_flow_jitter_max_reg_cover;

// Class: inspector_flow_jitter_max_reg
// Register inspector_flow.jitter_max: 
class inspector_flow_jitter_max_reg extends uvm_reg;

    // Variable: jitter_max
    // 
    rand uvm_reg_field jitter_max;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static inspector_flow_jitter_max_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    inspector_flow_jitter_max_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(inspector_reg_pkg::inspector_flow_jitter_max_reg)

    // Constructor: new
    function new(string name = "inspector_flow_jitter_max");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        jitter_max = uvm_reg_field::type_id::create("jitter_max", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        jitter_max.configure(this, 36, 0, "rw", 0, 'h0, 1, 1, 0);
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
                cg = inspector_flow_jitter_max_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = inspector_flow_jitter_max_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, jitter_max.get_name, jitter_max.value);
        return s;
    endfunction

endclass


// Class: inspector_flow_jitter_max_reg_cover
// Register coverage object.
class inspector_flow_jitter_max_reg_cover extends uvm_object;

    static local inspector_flow_jitter_max_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    inspector_flow_jitter_max_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        jitter_max_wr: coverpoint r.jitter_max.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        jitter_max_rd: coverpoint r.jitter_max.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(inspector_reg_pkg::inspector_flow_jitter_max_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="inspector_flow_jitter_max_reg_cover");
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
    static function inspector_flow_jitter_max_reg_cover get();
        if (m_inst == null) begin
            m_inst = inspector_flow_jitter_max_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(inspector_flow_jitter_max_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class inspector_flow_pkts_good_reg_cover;

// Class: inspector_flow_pkts_good_reg
// Register inspector_flow.pkts_good: 
class inspector_flow_pkts_good_reg extends uvm_reg;

    // Variable: pkts_good
    // 
    rand uvm_reg_field pkts_good;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static inspector_flow_pkts_good_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    inspector_flow_pkts_good_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(inspector_reg_pkg::inspector_flow_pkts_good_reg)

    // Constructor: new
    function new(string name = "inspector_flow_pkts_good");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        pkts_good = uvm_reg_field::type_id::create("pkts_good", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        pkts_good.configure(this, 36, 0, "rw", 0, 'h0, 1, 1, 0);
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
                cg = inspector_flow_pkts_good_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = inspector_flow_pkts_good_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, pkts_good.get_name, pkts_good.value);
        return s;
    endfunction

endclass


// Class: inspector_flow_pkts_good_reg_cover
// Register coverage object.
class inspector_flow_pkts_good_reg_cover extends uvm_object;

    static local inspector_flow_pkts_good_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    inspector_flow_pkts_good_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        pkts_good_wr: coverpoint r.pkts_good.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        pkts_good_rd: coverpoint r.pkts_good.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(inspector_reg_pkg::inspector_flow_pkts_good_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="inspector_flow_pkts_good_reg_cover");
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
    static function inspector_flow_pkts_good_reg_cover get();
        if (m_inst == null) begin
            m_inst = inspector_flow_pkts_good_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(inspector_flow_pkts_good_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class inspector_flow_pkts_bad_reg_cover;

// Class: inspector_flow_pkts_bad_reg
// Register inspector_flow.pkts_bad: 
class inspector_flow_pkts_bad_reg extends uvm_reg;

    // Variable: pkts_bad
    // 
    rand uvm_reg_field pkts_bad;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static inspector_flow_pkts_bad_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    inspector_flow_pkts_bad_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(inspector_reg_pkg::inspector_flow_pkts_bad_reg)

    // Constructor: new
    function new(string name = "inspector_flow_pkts_bad");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        pkts_bad = uvm_reg_field::type_id::create("pkts_bad", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        pkts_bad.configure(this, 36, 0, "rw", 0, 'h0, 1, 1, 0);
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
                cg = inspector_flow_pkts_bad_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = inspector_flow_pkts_bad_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, pkts_bad.get_name, pkts_bad.value);
        return s;
    endfunction

endclass


// Class: inspector_flow_pkts_bad_reg_cover
// Register coverage object.
class inspector_flow_pkts_bad_reg_cover extends uvm_object;

    static local inspector_flow_pkts_bad_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    inspector_flow_pkts_bad_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        pkts_bad_wr: coverpoint r.pkts_bad.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        pkts_bad_rd: coverpoint r.pkts_bad.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(inspector_reg_pkg::inspector_flow_pkts_bad_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="inspector_flow_pkts_bad_reg_cover");
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
    static function inspector_flow_pkts_bad_reg_cover get();
        if (m_inst == null) begin
            m_inst = inspector_flow_pkts_bad_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(inspector_flow_pkts_bad_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass





// Class: inspector_reg_block
// Register Block .inspector: 
class inspector_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand inspector_flow_latency_min_reg latency_min;
    rand inspector_flow_jitter_min_reg jitter_min;
    rand inspector_flow_sum_latency_reg sum_latency;
    rand inspector_flow_sum_jitter_reg sum_jitter;
    rand inspector_flow_bytes_good_reg bytes_good;
    rand inspector_flow_bytes_bad_reg bytes_bad;
    rand inspector_flow_first_ts_reg first_ts;
    rand inspector_flow_last_ts_reg last_ts;
    rand inspector_flow_next_seq_no_reg next_seq_no;
    rand inspector_flow_last_latency_reg last_latency;
    rand inspector_flow_last_jitter_reg last_jitter;
    rand inspector_flow_gap_max_reg gap_max;
    rand inspector_flow_gap_reg gap;
    rand inspector_flow_out_of_seq_or_dup_reg out_of_seq_or_dup;
    rand inspector_flow_first_gap_reg first_gap;
    rand inspector_flow_last_pkt_size_reg last_pkt_size;
    rand inspector_flow_latency_max_reg latency_max;
    rand inspector_flow_jitter_max_reg jitter_max;
    rand inspector_flow_pkts_good_reg pkts_good;
    rand inspector_flow_pkts_bad_reg pkts_bad;

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(inspector_reg_pkg::inspector_reg_block)

    // Constructor: new
    function new(string name = "inspector_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})


        latency_min = inspector_flow_latency_min_reg::type_id::create("latency_min", , get_full_name());
        jitter_min = inspector_flow_jitter_min_reg::type_id::create("jitter_min", , get_full_name());
        sum_latency = inspector_flow_sum_latency_reg::type_id::create("sum_latency", , get_full_name());
        sum_jitter = inspector_flow_sum_jitter_reg::type_id::create("sum_jitter", , get_full_name());
        bytes_good = inspector_flow_bytes_good_reg::type_id::create("bytes_good", , get_full_name());
        bytes_bad = inspector_flow_bytes_bad_reg::type_id::create("bytes_bad", , get_full_name());
        first_ts = inspector_flow_first_ts_reg::type_id::create("first_ts", , get_full_name());
        last_ts = inspector_flow_last_ts_reg::type_id::create("last_ts", , get_full_name());
        next_seq_no = inspector_flow_next_seq_no_reg::type_id::create("next_seq_no", , get_full_name());
        last_latency = inspector_flow_last_latency_reg::type_id::create("last_latency", , get_full_name());
        last_jitter = inspector_flow_last_jitter_reg::type_id::create("last_jitter", , get_full_name());
        gap_max = inspector_flow_gap_max_reg::type_id::create("gap_max", , get_full_name());
        gap = inspector_flow_gap_reg::type_id::create("gap", , get_full_name());
        out_of_seq_or_dup = inspector_flow_out_of_seq_or_dup_reg::type_id::create("out_of_seq_or_dup", , get_full_name());
        first_gap = inspector_flow_first_gap_reg::type_id::create("first_gap", , get_full_name());
        last_pkt_size = inspector_flow_last_pkt_size_reg::type_id::create("last_pkt_size", , get_full_name());
        latency_max = inspector_flow_latency_max_reg::type_id::create("latency_max", , get_full_name());
        jitter_max = inspector_flow_jitter_max_reg::type_id::create("jitter_max", , get_full_name());
        pkts_good = inspector_flow_pkts_good_reg::type_id::create("pkts_good", , get_full_name());
        pkts_bad = inspector_flow_pkts_bad_reg::type_id::create("pkts_bad", , get_full_name());

        latency_min.configure(this);
        jitter_min.configure(this);
        sum_latency.configure(this);
        sum_jitter.configure(this);
        bytes_good.configure(this);
        bytes_bad.configure(this);
        first_ts.configure(this);
        last_ts.configure(this);
        next_seq_no.configure(this);
        last_latency.configure(this);
        last_jitter.configure(this);
        gap_max.configure(this);
        gap.configure(this);
        out_of_seq_or_dup.configure(this);
        first_gap.configure(this);
        last_pkt_size.configure(this);
        latency_max.configure(this);
        jitter_max.configure(this);
        pkts_good.configure(this);
        pkts_bad.configure(this);

        latency_min.build();
        jitter_min.build();
        sum_latency.build();
        sum_jitter.build();
        bytes_good.build();
        bytes_bad.build();
        first_ts.build();
        last_ts.build();
        next_seq_no.build();
        last_latency.build();
        last_jitter.build();
        gap_max.build();
        gap.build();
        out_of_seq_or_dup.build();
        first_gap.build();
        last_pkt_size.build();
        latency_max.build();
        jitter_max.build();
        pkts_good.build();
        pkts_bad.build();

        // define default map
        default_map = create_map("inspector_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        this.default_map.add_reg(latency_min, 'h0, "RW");
        this.default_map.add_reg(jitter_min, 'h1, "RW");
        this.default_map.add_reg(sum_latency, 'h2, "RW");
        this.default_map.add_reg(sum_jitter, 'h3, "RW");
        this.default_map.add_reg(bytes_good, 'h4, "RW");
        this.default_map.add_reg(bytes_bad, 'h5, "RW");
        this.default_map.add_reg(first_ts, 'h6, "RW");
        this.default_map.add_reg(last_ts, 'h7, "RW");
        this.default_map.add_reg(next_seq_no, 'h8, "RW");
        this.default_map.add_reg(last_latency, 'h9, "RW");
        this.default_map.add_reg(last_jitter, 'hA, "RW");
        this.default_map.add_reg(gap_max, 'hB, "RW");
        this.default_map.add_reg(gap, 'hC, "RW");
        this.default_map.add_reg(out_of_seq_or_dup, 'hD, "RW");
        this.default_map.add_reg(first_gap, 'hE, "RW");
        this.default_map.add_reg(last_pkt_size, 'hF, "RW");
        this.default_map.add_reg(latency_max, 'h10, "RW");
        this.default_map.add_reg(jitter_max, 'h11, "RW");
        this.default_map.add_reg(pkts_good, 'h14, "RW");
        this.default_map.add_reg(pkts_bad, 'h15, "RW");

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
        latency_min.enable_coverage(is_on, this.cg_per_instance);
        jitter_min.enable_coverage(is_on, this.cg_per_instance);
        sum_latency.enable_coverage(is_on, this.cg_per_instance);
        sum_jitter.enable_coverage(is_on, this.cg_per_instance);
        bytes_good.enable_coverage(is_on, this.cg_per_instance);
        bytes_bad.enable_coverage(is_on, this.cg_per_instance);
        first_ts.enable_coverage(is_on, this.cg_per_instance);
        last_ts.enable_coverage(is_on, this.cg_per_instance);
        next_seq_no.enable_coverage(is_on, this.cg_per_instance);
        last_latency.enable_coverage(is_on, this.cg_per_instance);
        last_jitter.enable_coverage(is_on, this.cg_per_instance);
        gap_max.enable_coverage(is_on, this.cg_per_instance);
        gap.enable_coverage(is_on, this.cg_per_instance);
        out_of_seq_or_dup.enable_coverage(is_on, this.cg_per_instance);
        first_gap.enable_coverage(is_on, this.cg_per_instance);
        last_pkt_size.enable_coverage(is_on, this.cg_per_instance);
        latency_max.enable_coverage(is_on, this.cg_per_instance);
        jitter_max.enable_coverage(is_on, this.cg_per_instance);
        pkts_good.enable_coverage(is_on, this.cg_per_instance);
        pkts_bad.enable_coverage(is_on, this.cg_per_instance);
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