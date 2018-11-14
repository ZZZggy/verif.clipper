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
// Register definitions for timebase register block.
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
// Group: timebase
//---------------------------------------------------------

package timebase_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;

typedef class timebase_ts_incr_reg_cover;

// Class: timebase_ts_incr_reg
// Register timebase.ts_incr: Quantas used by the timebase modules
class timebase_ts_incr_reg extends uvm_reg;

    // Variable: mode_add_fraction
    // quanta to add in fraction mode (default=20ns) (bit30 = 1/2^25 sec. ~29.8ns , bit29 =1/2^26, ? )
    rand uvm_reg_field mode_add_fraction;
    // Variable: mode_add_ns
    // quanta to add in nanosecond mode (bit20 = 1ns, bit19 = 0.5ns, ?) A design limitation requires the ns value to be slightly less or equal to the fractions value.
    rand uvm_reg_field mode_add_ns;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static timebase_ts_incr_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    timebase_ts_incr_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(timebase_reg_pkg::timebase_ts_incr_reg)

    // Constructor: new
    function new(string name = "timebase_ts_incr");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        mode_add_fraction = uvm_reg_field::type_id::create("mode_add_fraction", , get_full_name());
        mode_add_ns = uvm_reg_field::type_id::create("mode_add_ns", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        mode_add_fraction.configure(this, 31, 0, "RW", 0, 'h2AF31DC5, 1, 1, 0);
        mode_add_ns.configure(this, 25, 32, "RW", 0, 'h0, 1, 1, 0);
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
                cg = timebase_ts_incr_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = timebase_ts_incr_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, mode_add_fraction.get_name, mode_add_fraction.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, mode_add_ns.get_name, mode_add_ns.value);
        return s;
    endfunction

endclass


// Class: timebase_ts_incr_reg_cover
// Register coverage object.
class timebase_ts_incr_reg_cover extends uvm_object;

    static local timebase_ts_incr_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    timebase_ts_incr_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        mode_add_fraction_wr: coverpoint r.mode_add_fraction.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        mode_add_fraction_rd: coverpoint r.mode_add_fraction.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        mode_add_ns_wr: coverpoint r.mode_add_ns.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        mode_add_ns_rd: coverpoint r.mode_add_ns.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(timebase_reg_pkg::timebase_ts_incr_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="timebase_ts_incr_reg_cover");
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
    static function timebase_ts_incr_reg_cover get();
        if (m_inst == null) begin
            m_inst = timebase_ts_incr_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(timebase_ts_incr_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class timebase_ts_epoque_reg_cover;

// Class: timebase_ts_epoque_reg
// Register timebase.ts_epoque: 
class timebase_ts_epoque_reg extends uvm_reg;

    // Variable: epoque
    // Value to add to the timebase for nanosecond mode
    rand uvm_reg_field epoque;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static timebase_ts_epoque_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    timebase_ts_epoque_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(timebase_reg_pkg::timebase_ts_epoque_reg)

    // Constructor: new
    function new(string name = "timebase_ts_epoque");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        epoque = uvm_reg_field::type_id::create("epoque", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        epoque.configure(this, 32, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = timebase_ts_epoque_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = timebase_ts_epoque_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, epoque.get_name, epoque.value);
        return s;
    endfunction

endclass


// Class: timebase_ts_epoque_reg_cover
// Register coverage object.
class timebase_ts_epoque_reg_cover extends uvm_object;

    static local timebase_ts_epoque_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    timebase_ts_epoque_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        epoque_wr: coverpoint r.epoque.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        epoque_rd: coverpoint r.epoque.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(timebase_reg_pkg::timebase_ts_epoque_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="timebase_ts_epoque_reg_cover");
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
    static function timebase_ts_epoque_reg_cover get();
        if (m_inst == null) begin
            m_inst = timebase_ts_epoque_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(timebase_ts_epoque_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class timebase_ts_spc_reg_cover;

// Class: timebase_ts_spc_reg
// Register timebase.ts_spc:   When mode=1 (ns), the fraction and ns fields are updated every second. With mode=0 (fraction), when the internal timebase count equals the register value, both fraction and ns are cleared to 0.
class timebase_ts_spc_reg extends uvm_reg;

    // Variable: fraction
    // Value in fraction.
    rand uvm_reg_field fraction;
    // Variable: ns
    // value in nanoseconds.
    rand uvm_reg_field ns;
    // Variable: mode_sel
    // 0: fraction; 1: nanosecond
    rand uvm_reg_field mode_sel;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static timebase_ts_spc_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    timebase_ts_spc_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(timebase_reg_pkg::timebase_ts_spc_reg)

    // Constructor: new
    function new(string name = "timebase_ts_spc");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        fraction = uvm_reg_field::type_id::create("fraction", , get_full_name());
        ns = uvm_reg_field::type_id::create("ns", , get_full_name());
        mode_sel = uvm_reg_field::type_id::create("mode_sel", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        fraction.configure(this, 32, 0, "RW", 0, 'h0, 1, 1, 0);
        ns.configure(this, 31, 32, "RW", 0, 'h0, 1, 1, 0);
        mode_sel.configure(this, 1, 63, "RW", 0, 'h0, 1, 1, 0);
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
                cg = timebase_ts_spc_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = timebase_ts_spc_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, fraction.get_name, fraction.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, ns.get_name, ns.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, mode_sel.get_name, mode_sel.value);
        return s;
    endfunction

endclass


// Class: timebase_ts_spc_reg_cover
// Register coverage object.
class timebase_ts_spc_reg_cover extends uvm_object;

    static local timebase_ts_spc_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    timebase_ts_spc_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        fraction_wr: coverpoint r.fraction.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        fraction_rd: coverpoint r.fraction.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        ns_wr: coverpoint r.ns.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        ns_rd: coverpoint r.ns.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        mode_sel_wr: coverpoint r.mode_sel.value iff (!is_read);
        mode_sel_rd: coverpoint r.mode_sel.value iff  (is_read);
    endgroup

    `uvm_object_utils(timebase_reg_pkg::timebase_ts_spc_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="timebase_ts_spc_reg_cover");
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
    static function timebase_ts_spc_reg_cover get();
        if (m_inst == null) begin
            m_inst = timebase_ts_spc_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(timebase_ts_spc_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class timebase_ts_updt_reg_cover;

// Class: timebase_ts_updt_reg
// Register timebase.ts_updt: This permit to add a value to the current seconds or fraction of second
class timebase_ts_updt_reg extends uvm_reg;

    // Variable: value
    // 
    rand uvm_reg_field value;
    // Variable: lsb
    // 
    rand uvm_reg_field lsb;
    // Variable: msb
    // 
    rand uvm_reg_field msb;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static timebase_ts_updt_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    timebase_ts_updt_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(timebase_reg_pkg::timebase_ts_updt_reg)

    // Constructor: new
    function new(string name = "timebase_ts_updt");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        value = uvm_reg_field::type_id::create("value", , get_full_name());
        lsb = uvm_reg_field::type_id::create("lsb", , get_full_name());
        msb = uvm_reg_field::type_id::create("msb", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        value.configure(this, 32, 0, "RW", 0, 'h0, 1, 1, 0);
        lsb.configure(this, 1, 32, "RW", 0, 'h0, 1, 1, 0);
        msb.configure(this, 1, 33, "RW", 0, 'h0, 1, 1, 0);
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
                cg = timebase_ts_updt_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = timebase_ts_updt_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, lsb.get_name, lsb.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, msb.get_name, msb.value);
        return s;
    endfunction

endclass


// Class: timebase_ts_updt_reg_cover
// Register coverage object.
class timebase_ts_updt_reg_cover extends uvm_object;

    static local timebase_ts_updt_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    timebase_ts_updt_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        value_wr: coverpoint r.value.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        value_rd: coverpoint r.value.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        lsb_wr: coverpoint r.lsb.value iff (!is_read);
        lsb_rd: coverpoint r.lsb.value iff  (is_read);
        msb_wr: coverpoint r.msb.value iff (!is_read);
        msb_rd: coverpoint r.msb.value iff  (is_read);
    endgroup

    `uvm_object_utils(timebase_reg_pkg::timebase_ts_updt_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="timebase_ts_updt_reg_cover");
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
    static function timebase_ts_updt_reg_cover get();
        if (m_inst == null) begin
            m_inst = timebase_ts_updt_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(timebase_ts_updt_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class timebase_ts_rec_reg_cover;

// Class: timebase_ts_rec_reg
// Register timebase.ts_rec: Copy TimeStamp used when CPU request to punch a packet with this option (see THI CPU2IF)
class timebase_ts_rec_reg extends uvm_reg;

    // Variable: ts
    // Time in ns (lsb) of last recorded timestamp.
    rand uvm_reg_field ts;
    // Variable: port
    // Destination port that requested recording of the last timestamp.
    rand uvm_reg_field port;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static timebase_ts_rec_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    timebase_ts_rec_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(timebase_reg_pkg::timebase_ts_rec_reg)

    // Constructor: new
    function new(string name = "timebase_ts_rec");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        ts = uvm_reg_field::type_id::create("ts", , get_full_name());
        port = uvm_reg_field::type_id::create("port", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        ts.configure(this, 60, 0, "RO", 0, 'h0, 1, 1, 0);
        port.configure(this, 4, 60, "RO", 0, 'h0, 1, 1, 0);
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
                cg = timebase_ts_rec_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = timebase_ts_rec_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, ts.get_name, ts.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port.get_name, port.value);
        return s;
    endfunction

endclass


// Class: timebase_ts_rec_reg_cover
// Register coverage object.
class timebase_ts_rec_reg_cover extends uvm_object;

    static local timebase_ts_rec_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    timebase_ts_rec_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        ts_wr: coverpoint r.ts.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        ts_rd: coverpoint r.ts.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        port_wr: coverpoint r.port.value iff (!is_read);
        port_rd: coverpoint r.port.value iff  (is_read);
    endgroup

    `uvm_object_utils(timebase_reg_pkg::timebase_ts_rec_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="timebase_ts_rec_reg_cover");
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
    static function timebase_ts_rec_reg_cover get();
        if (m_inst == null) begin
            m_inst = timebase_ts_rec_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(timebase_ts_rec_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class timebase_pps_ctrl_reg_cover;

// Class: timebase_pps_ctrl_reg
// Register timebase.pps_ctrl: 
class timebase_pps_ctrl_reg extends uvm_reg;

    // Variable: pps_input_sel
    // Selects which PPS input will be used internally. 0: selects ppsin_pps1 1: selects ppsin_bits
    rand uvm_reg_field pps_input_sel;
    // Variable: pps_input_internal
    //  Selects if PPS input is from pps_input_select or from internal PPS. 0: selects from pps_input_select 1: internal
    rand uvm_reg_field pps_input_internal;
    // Variable: pps_input_delay_compensation
    // PPS input delay compensation in units of 1/(2^32) seconds.
    rand uvm_reg_field pps_input_delay_compensation;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static timebase_pps_ctrl_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    timebase_pps_ctrl_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(timebase_reg_pkg::timebase_pps_ctrl_reg)

    // Constructor: new
    function new(string name = "timebase_pps_ctrl");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        pps_input_sel = uvm_reg_field::type_id::create("pps_input_sel", , get_full_name());
        pps_input_internal = uvm_reg_field::type_id::create("pps_input_internal", , get_full_name());
        pps_input_delay_compensation = uvm_reg_field::type_id::create("pps_input_delay_compensation", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        pps_input_sel.configure(this, 1, 0, "RW", 0, 'h0, 1, 1, 0);
        pps_input_internal.configure(this, 1, 1, "RW", 0, 'h0, 1, 1, 0);
        pps_input_delay_compensation.configure(this, 16, 2, "RW", 0, 'hCF, 1, 1, 0);
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
                cg = timebase_pps_ctrl_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = timebase_pps_ctrl_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, pps_input_sel.get_name, pps_input_sel.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, pps_input_internal.get_name, pps_input_internal.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, pps_input_delay_compensation.get_name, pps_input_delay_compensation.value);
        return s;
    endfunction

endclass


// Class: timebase_pps_ctrl_reg_cover
// Register coverage object.
class timebase_pps_ctrl_reg_cover extends uvm_object;

    static local timebase_pps_ctrl_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    timebase_pps_ctrl_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        pps_input_sel_wr: coverpoint r.pps_input_sel.value iff (!is_read);
        pps_input_sel_rd: coverpoint r.pps_input_sel.value iff  (is_read);
        pps_input_internal_wr: coverpoint r.pps_input_internal.value iff (!is_read);
        pps_input_internal_rd: coverpoint r.pps_input_internal.value iff  (is_read);
        pps_input_delay_compensation_wr: coverpoint r.pps_input_delay_compensation.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        pps_input_delay_compensation_rd: coverpoint r.pps_input_delay_compensation.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(timebase_reg_pkg::timebase_pps_ctrl_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="timebase_pps_ctrl_reg_cover");
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
    static function timebase_pps_ctrl_reg_cover get();
        if (m_inst == null) begin
            m_inst = timebase_pps_ctrl_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(timebase_pps_ctrl_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class timebase_pps_status_reg_cover;

// Class: timebase_pps_status_reg
// Register timebase.pps_status: 
class timebase_pps_status_reg extends uvm_reg;

    // Variable: sampled_ts_on_pps
    // Sampled 64-bit timestamp in fractional format when a rising edge is detected on the selected PPS input
    rand uvm_reg_field sampled_ts_on_pps;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static timebase_pps_status_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    timebase_pps_status_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(timebase_reg_pkg::timebase_pps_status_reg)

    // Constructor: new
    function new(string name = "timebase_pps_status");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        sampled_ts_on_pps = uvm_reg_field::type_id::create("sampled_ts_on_pps", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        sampled_ts_on_pps.configure(this, 64, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = timebase_pps_status_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = timebase_pps_status_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, sampled_ts_on_pps.get_name, sampled_ts_on_pps.value);
        return s;
    endfunction

endclass


// Class: timebase_pps_status_reg_cover
// Register coverage object.
class timebase_pps_status_reg_cover extends uvm_object;

    static local timebase_pps_status_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    timebase_pps_status_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        sampled_ts_on_pps_wr: coverpoint r.sampled_ts_on_pps.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        sampled_ts_on_pps_rd: coverpoint r.sampled_ts_on_pps.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(timebase_reg_pkg::timebase_pps_status_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="timebase_pps_status_reg_cover");
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
    static function timebase_pps_status_reg_cover get();
        if (m_inst == null) begin
            m_inst = timebase_pps_status_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(timebase_pps_status_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass





// Class: timebase_reg_block
// Register Block .timebase: 
class timebase_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand timebase_ts_incr_reg ts_incr;
    rand timebase_ts_epoque_reg ts_epoque;
    rand timebase_ts_spc_reg ts_spc;
    rand timebase_ts_updt_reg ts_updt;
    rand timebase_ts_rec_reg ts_rec;
    rand timebase_pps_ctrl_reg pps_ctrl;
    rand timebase_pps_status_reg pps_status;

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(timebase_reg_pkg::timebase_reg_block)

    // Constructor: new
    function new(string name = "timebase_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})


        ts_incr = timebase_ts_incr_reg::type_id::create("ts_incr", , get_full_name());
        ts_epoque = timebase_ts_epoque_reg::type_id::create("ts_epoque", , get_full_name());
        ts_spc = timebase_ts_spc_reg::type_id::create("ts_spc", , get_full_name());
        ts_updt = timebase_ts_updt_reg::type_id::create("ts_updt", , get_full_name());
        ts_rec = timebase_ts_rec_reg::type_id::create("ts_rec", , get_full_name());
        pps_ctrl = timebase_pps_ctrl_reg::type_id::create("pps_ctrl", , get_full_name());
        pps_status = timebase_pps_status_reg::type_id::create("pps_status", , get_full_name());

        ts_incr.configure(this);
        ts_epoque.configure(this);
        ts_spc.configure(this);
        ts_updt.configure(this);
        ts_rec.configure(this);
        pps_ctrl.configure(this);
        pps_status.configure(this);

        ts_incr.build();
        ts_epoque.build();
        ts_spc.build();
        ts_updt.build();
        ts_rec.build();
        pps_ctrl.build();
        pps_status.build();

        // define default map
        default_map = create_map("timebase_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        this.default_map.add_reg(ts_incr, 'h0, "RW");
        this.default_map.add_reg(ts_epoque, 'h1, "RW");
        this.default_map.add_reg(ts_spc, 'h2, "RW");
        this.default_map.add_reg(ts_updt, 'h3, "RW");
        this.default_map.add_reg(ts_rec, 'h4, "RO");
        this.default_map.add_reg(pps_ctrl, 'h5, "RW");
        this.default_map.add_reg(pps_status, 'h6, "RO");

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
        ts_incr.enable_coverage(is_on, this.cg_per_instance);
        ts_epoque.enable_coverage(is_on, this.cg_per_instance);
        ts_spc.enable_coverage(is_on, this.cg_per_instance);
        ts_updt.enable_coverage(is_on, this.cg_per_instance);
        ts_rec.enable_coverage(is_on, this.cg_per_instance);
        pps_ctrl.enable_coverage(is_on, this.cg_per_instance);
        pps_status.enable_coverage(is_on, this.cg_per_instance);
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