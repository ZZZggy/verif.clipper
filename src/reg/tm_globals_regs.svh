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
// Register definitions for tm_globals register block.
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
// Group: tm_globals
//---------------------------------------------------------

package tm_globals_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;

typedef class tm_globals_free_mau_almost_empty_level_reg_cover;

// Class: tm_globals_free_mau_almost_empty_level_reg
// Register tm_globals.free_mau_almost_empty_level: UNUSED FOR 6_3_2! Almost empty level for free Memory Allocation Unit FIFO (The Free MAU level represents the available place into the Data RAM). The 3 almost empty levels are used to create 4 priority states (see q_system.level_cfg.queue_prior field).
class tm_globals_free_mau_almost_empty_level_reg extends uvm_reg;

    // Variable: free_mau_almost_empty_level_0
    // Almost empty level 0 for free MAU fifo module
    rand uvm_reg_field free_mau_almost_empty_level_0;
    // Variable: free_mau_almost_empty_level_1
    // Almost empty level 1 for free MAU fifo module
    rand uvm_reg_field free_mau_almost_empty_level_1;
    // Variable: free_mau_almost_empty_level_2
    // Almost empty level 2 for free MAU fifo module
    rand uvm_reg_field free_mau_almost_empty_level_2;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static tm_globals_free_mau_almost_empty_level_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    tm_globals_free_mau_almost_empty_level_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_free_mau_almost_empty_level_reg)

    // Constructor: new
    function new(string name = "tm_globals_free_mau_almost_empty_level");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        free_mau_almost_empty_level_0 = uvm_reg_field::type_id::create("free_mau_almost_empty_level_0", , get_full_name());
        free_mau_almost_empty_level_1 = uvm_reg_field::type_id::create("free_mau_almost_empty_level_1", , get_full_name());
        free_mau_almost_empty_level_2 = uvm_reg_field::type_id::create("free_mau_almost_empty_level_2", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        free_mau_almost_empty_level_0.configure(this, 20, 0, "RW", 0, 'h0, 1, 1, 0);
        free_mau_almost_empty_level_1.configure(this, 20, 21, "RW", 0, 'h0, 1, 1, 0);
        free_mau_almost_empty_level_2.configure(this, 20, 42, "RW", 0, 'h0, 1, 1, 0);
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
                cg = tm_globals_free_mau_almost_empty_level_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = tm_globals_free_mau_almost_empty_level_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, free_mau_almost_empty_level_0.get_name, free_mau_almost_empty_level_0.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, free_mau_almost_empty_level_1.get_name, free_mau_almost_empty_level_1.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, free_mau_almost_empty_level_2.get_name, free_mau_almost_empty_level_2.value);
        return s;
    endfunction

endclass


// Class: tm_globals_free_mau_almost_empty_level_reg_cover
// Register coverage object.
class tm_globals_free_mau_almost_empty_level_reg_cover extends uvm_object;

    static local tm_globals_free_mau_almost_empty_level_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    tm_globals_free_mau_almost_empty_level_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        free_mau_almost_empty_level_0_wr: coverpoint r.free_mau_almost_empty_level_0.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        free_mau_almost_empty_level_0_rd: coverpoint r.free_mau_almost_empty_level_0.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        free_mau_almost_empty_level_1_wr: coverpoint r.free_mau_almost_empty_level_1.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        free_mau_almost_empty_level_1_rd: coverpoint r.free_mau_almost_empty_level_1.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        free_mau_almost_empty_level_2_wr: coverpoint r.free_mau_almost_empty_level_2.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        free_mau_almost_empty_level_2_rd: coverpoint r.free_mau_almost_empty_level_2.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_free_mau_almost_empty_level_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="tm_globals_free_mau_almost_empty_level_reg_cover");
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
    static function tm_globals_free_mau_almost_empty_level_reg_cover get();
        if (m_inst == null) begin
            m_inst = tm_globals_free_mau_almost_empty_level_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(tm_globals_free_mau_almost_empty_level_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class tm_globals_tm_ready_reg_cover;

// Class: tm_globals_tm_ready_reg
// Register tm_globals.tm_ready: Traffic Manager Ready signal. No packets must be sent to the TM until ready is asserted.
class tm_globals_tm_ready_reg extends uvm_reg;

    // Variable: tm_ready
    // 0 -&gt; TM cannot accept data, 1 -&gt; TM is ready
    rand uvm_reg_field tm_ready;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static tm_globals_tm_ready_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    tm_globals_tm_ready_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_tm_ready_reg)

    // Constructor: new
    function new(string name = "tm_globals_tm_ready");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        tm_ready = uvm_reg_field::type_id::create("tm_ready", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        tm_ready.configure(this, 1, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = tm_globals_tm_ready_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = tm_globals_tm_ready_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, tm_ready.get_name, tm_ready.value);
        return s;
    endfunction

endclass


// Class: tm_globals_tm_ready_reg_cover
// Register coverage object.
class tm_globals_tm_ready_reg_cover extends uvm_object;

    static local tm_globals_tm_ready_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    tm_globals_tm_ready_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        tm_ready_wr: coverpoint r.tm_ready.value iff (!is_read);
        tm_ready_rd: coverpoint r.tm_ready.value iff  (is_read);
    endgroup

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_tm_ready_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="tm_globals_tm_ready_reg_cover");
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
    static function tm_globals_tm_ready_reg_cover get();
        if (m_inst == null) begin
            m_inst = tm_globals_tm_ready_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(tm_globals_tm_ready_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class tm_globals_fatal_queues_port_cpu_reg_cover;

// Class: tm_globals_fatal_queues_port_cpu_reg
// Register tm_globals.fatal_queues_port_cpu: UNUSED FOR 6_3_2! fatal_queues for port cpu (a queue is declared fatal if a parity error has been detected on the RLDRAM3 readed Data).
class tm_globals_fatal_queues_port_cpu_reg extends uvm_reg;

    // Variable: fatal_queues_port_cpu
    // fatal_queues for port cpu (one Hot encoded)
    rand uvm_reg_field fatal_queues_port_cpu;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static tm_globals_fatal_queues_port_cpu_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    tm_globals_fatal_queues_port_cpu_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_fatal_queues_port_cpu_reg)

    // Constructor: new
    function new(string name = "tm_globals_fatal_queues_port_cpu");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        fatal_queues_port_cpu = uvm_reg_field::type_id::create("fatal_queues_port_cpu", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        fatal_queues_port_cpu.configure(this, 16, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = tm_globals_fatal_queues_port_cpu_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = tm_globals_fatal_queues_port_cpu_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, fatal_queues_port_cpu.get_name, fatal_queues_port_cpu.value);
        return s;
    endfunction

endclass


// Class: tm_globals_fatal_queues_port_cpu_reg_cover
// Register coverage object.
class tm_globals_fatal_queues_port_cpu_reg_cover extends uvm_object;

    static local tm_globals_fatal_queues_port_cpu_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    tm_globals_fatal_queues_port_cpu_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        fatal_queues_port_cpu_wr: coverpoint r.fatal_queues_port_cpu.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        fatal_queues_port_cpu_rd: coverpoint r.fatal_queues_port_cpu.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_fatal_queues_port_cpu_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="tm_globals_fatal_queues_port_cpu_reg_cover");
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
    static function tm_globals_fatal_queues_port_cpu_reg_cover get();
        if (m_inst == null) begin
            m_inst = tm_globals_fatal_queues_port_cpu_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(tm_globals_fatal_queues_port_cpu_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class tm_globals_fatal_queues_port_mon0_reg_cover;

// Class: tm_globals_fatal_queues_port_mon0_reg
// Register tm_globals.fatal_queues_port_mon0: UNUSED FOR 6_3_2! fatal_queues for port mon0 (a queue is declared fatal if a parity error has been detected on the RLDRAM3 readed Data).
class tm_globals_fatal_queues_port_mon0_reg extends uvm_reg;

    // Variable: fatal_queues_port_mon0
    // fatal_queues for port mon0 (one Hot encoded)
    rand uvm_reg_field fatal_queues_port_mon0;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static tm_globals_fatal_queues_port_mon0_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    tm_globals_fatal_queues_port_mon0_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_fatal_queues_port_mon0_reg)

    // Constructor: new
    function new(string name = "tm_globals_fatal_queues_port_mon0");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        fatal_queues_port_mon0 = uvm_reg_field::type_id::create("fatal_queues_port_mon0", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        fatal_queues_port_mon0.configure(this, 16, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = tm_globals_fatal_queues_port_mon0_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = tm_globals_fatal_queues_port_mon0_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, fatal_queues_port_mon0.get_name, fatal_queues_port_mon0.value);
        return s;
    endfunction

endclass


// Class: tm_globals_fatal_queues_port_mon0_reg_cover
// Register coverage object.
class tm_globals_fatal_queues_port_mon0_reg_cover extends uvm_object;

    static local tm_globals_fatal_queues_port_mon0_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    tm_globals_fatal_queues_port_mon0_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        fatal_queues_port_mon0_wr: coverpoint r.fatal_queues_port_mon0.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        fatal_queues_port_mon0_rd: coverpoint r.fatal_queues_port_mon0.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_fatal_queues_port_mon0_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="tm_globals_fatal_queues_port_mon0_reg_cover");
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
    static function tm_globals_fatal_queues_port_mon0_reg_cover get();
        if (m_inst == null) begin
            m_inst = tm_globals_fatal_queues_port_mon0_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(tm_globals_fatal_queues_port_mon0_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class tm_globals_fatal_queues_port_mon1_reg_cover;

// Class: tm_globals_fatal_queues_port_mon1_reg
// Register tm_globals.fatal_queues_port_mon1: UNUSED FOR 6_3_2! fatal_queues for port mon1 (a queue is declared fatal if a parity error has been detected on the RLDRAM3 readed Data).
class tm_globals_fatal_queues_port_mon1_reg extends uvm_reg;

    // Variable: fatal_queues_port_mon1
    // fatal_queues for port mon1 (one Hot encoded)
    rand uvm_reg_field fatal_queues_port_mon1;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static tm_globals_fatal_queues_port_mon1_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    tm_globals_fatal_queues_port_mon1_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_fatal_queues_port_mon1_reg)

    // Constructor: new
    function new(string name = "tm_globals_fatal_queues_port_mon1");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        fatal_queues_port_mon1 = uvm_reg_field::type_id::create("fatal_queues_port_mon1", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        fatal_queues_port_mon1.configure(this, 16, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = tm_globals_fatal_queues_port_mon1_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = tm_globals_fatal_queues_port_mon1_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, fatal_queues_port_mon1.get_name, fatal_queues_port_mon1.value);
        return s;
    endfunction

endclass


// Class: tm_globals_fatal_queues_port_mon1_reg_cover
// Register coverage object.
class tm_globals_fatal_queues_port_mon1_reg_cover extends uvm_object;

    static local tm_globals_fatal_queues_port_mon1_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    tm_globals_fatal_queues_port_mon1_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        fatal_queues_port_mon1_wr: coverpoint r.fatal_queues_port_mon1.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        fatal_queues_port_mon1_rd: coverpoint r.fatal_queues_port_mon1.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_fatal_queues_port_mon1_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="tm_globals_fatal_queues_port_mon1_reg_cover");
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
    static function tm_globals_fatal_queues_port_mon1_reg_cover get();
        if (m_inst == null) begin
            m_inst = tm_globals_fatal_queues_port_mon1_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(tm_globals_fatal_queues_port_mon1_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class tm_globals_fatal_queues_port_nni0_reg_cover;

// Class: tm_globals_fatal_queues_port_nni0_reg
// Register tm_globals.fatal_queues_port_nni0: fatal_queues for port nni0 (a queue is declared fatal if a parity error has been detected on the RLDRAM3 readed Data).
class tm_globals_fatal_queues_port_nni0_reg extends uvm_reg;

    // Variable: fatal_queues_port_nni0
    // fatal_queues for port nni0 (one Hot encoded)
    rand uvm_reg_field fatal_queues_port_nni0;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static tm_globals_fatal_queues_port_nni0_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    tm_globals_fatal_queues_port_nni0_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_fatal_queues_port_nni0_reg)

    // Constructor: new
    function new(string name = "tm_globals_fatal_queues_port_nni0");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        fatal_queues_port_nni0 = uvm_reg_field::type_id::create("fatal_queues_port_nni0", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        fatal_queues_port_nni0.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = tm_globals_fatal_queues_port_nni0_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = tm_globals_fatal_queues_port_nni0_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, fatal_queues_port_nni0.get_name, fatal_queues_port_nni0.value);
        return s;
    endfunction

endclass


// Class: tm_globals_fatal_queues_port_nni0_reg_cover
// Register coverage object.
class tm_globals_fatal_queues_port_nni0_reg_cover extends uvm_object;

    static local tm_globals_fatal_queues_port_nni0_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    tm_globals_fatal_queues_port_nni0_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        fatal_queues_port_nni0_wr: coverpoint r.fatal_queues_port_nni0.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        fatal_queues_port_nni0_rd: coverpoint r.fatal_queues_port_nni0.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_fatal_queues_port_nni0_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="tm_globals_fatal_queues_port_nni0_reg_cover");
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
    static function tm_globals_fatal_queues_port_nni0_reg_cover get();
        if (m_inst == null) begin
            m_inst = tm_globals_fatal_queues_port_nni0_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(tm_globals_fatal_queues_port_nni0_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class tm_globals_fatal_queues_port_nni1_reg_cover;

// Class: tm_globals_fatal_queues_port_nni1_reg
// Register tm_globals.fatal_queues_port_nni1: fatal_queues for port nni1 (a queue is declared fatal if a parity error has been detected on the RLDRAM3 readed Data).
class tm_globals_fatal_queues_port_nni1_reg extends uvm_reg;

    // Variable: fatal_queues_port_nni1
    // fatal_queues for port nni1 (one Hot encoded)
    rand uvm_reg_field fatal_queues_port_nni1;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static tm_globals_fatal_queues_port_nni1_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    tm_globals_fatal_queues_port_nni1_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_fatal_queues_port_nni1_reg)

    // Constructor: new
    function new(string name = "tm_globals_fatal_queues_port_nni1");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        fatal_queues_port_nni1 = uvm_reg_field::type_id::create("fatal_queues_port_nni1", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        fatal_queues_port_nni1.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = tm_globals_fatal_queues_port_nni1_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = tm_globals_fatal_queues_port_nni1_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, fatal_queues_port_nni1.get_name, fatal_queues_port_nni1.value);
        return s;
    endfunction

endclass


// Class: tm_globals_fatal_queues_port_nni1_reg_cover
// Register coverage object.
class tm_globals_fatal_queues_port_nni1_reg_cover extends uvm_object;

    static local tm_globals_fatal_queues_port_nni1_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    tm_globals_fatal_queues_port_nni1_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        fatal_queues_port_nni1_wr: coverpoint r.fatal_queues_port_nni1.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        fatal_queues_port_nni1_rd: coverpoint r.fatal_queues_port_nni1.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_fatal_queues_port_nni1_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="tm_globals_fatal_queues_port_nni1_reg_cover");
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
    static function tm_globals_fatal_queues_port_nni1_reg_cover get();
        if (m_inst == null) begin
            m_inst = tm_globals_fatal_queues_port_nni1_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(tm_globals_fatal_queues_port_nni1_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class tm_globals_fatal_queues_port_uni_reg_cover;

// Class: tm_globals_fatal_queues_port_uni_reg
// Register tm_globals.fatal_queues_port_uni: fatal_queues for port uni (a queue is declared fatal if a parity error has been detected on the RLDRAM3 readed Data).
class tm_globals_fatal_queues_port_uni_reg extends uvm_reg;

    // Variable: fatal_queues_port_uni
    // fatal_queues for port uni (one Hot encoded)
    rand uvm_reg_field fatal_queues_port_uni;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static tm_globals_fatal_queues_port_uni_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    tm_globals_fatal_queues_port_uni_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_fatal_queues_port_uni_reg)

    // Constructor: new
    function new(string name = "tm_globals_fatal_queues_port_uni");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        fatal_queues_port_uni = uvm_reg_field::type_id::create("fatal_queues_port_uni", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        fatal_queues_port_uni.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = tm_globals_fatal_queues_port_uni_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = tm_globals_fatal_queues_port_uni_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, fatal_queues_port_uni.get_name, fatal_queues_port_uni.value);
        return s;
    endfunction

endclass


// Class: tm_globals_fatal_queues_port_uni_reg_cover
// Register coverage object.
class tm_globals_fatal_queues_port_uni_reg_cover extends uvm_object;

    static local tm_globals_fatal_queues_port_uni_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    tm_globals_fatal_queues_port_uni_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        fatal_queues_port_uni_wr: coverpoint r.fatal_queues_port_uni.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        fatal_queues_port_uni_rd: coverpoint r.fatal_queues_port_uni.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_fatal_queues_port_uni_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="tm_globals_fatal_queues_port_uni_reg_cover");
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
    static function tm_globals_fatal_queues_port_uni_reg_cover get();
        if (m_inst == null) begin
            m_inst = tm_globals_fatal_queues_port_uni_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(tm_globals_fatal_queues_port_uni_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class tm_globals_fatal_queues_global_status_reg_cover;

// Class: tm_globals_fatal_queues_global_status_reg
// Register tm_globals.fatal_queues_global_status: fatal_queues status for each structure (a queue is declared fatal if a parity error has been detected on the RLDRAM3 readed Data).
class tm_globals_fatal_queues_global_status_reg extends uvm_reg;

    // Variable: fatal_queues_global_status
    // fatal queues status per structure [MSB=UNI, NNI1, NNI0, MON1, MON0, CPU].
    rand uvm_reg_field fatal_queues_global_status;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static tm_globals_fatal_queues_global_status_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    tm_globals_fatal_queues_global_status_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_fatal_queues_global_status_reg)

    // Constructor: new
    function new(string name = "tm_globals_fatal_queues_global_status");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        fatal_queues_global_status = uvm_reg_field::type_id::create("fatal_queues_global_status", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        fatal_queues_global_status.configure(this, 6, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = tm_globals_fatal_queues_global_status_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = tm_globals_fatal_queues_global_status_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, fatal_queues_global_status.get_name, fatal_queues_global_status.value);
        return s;
    endfunction

endclass


// Class: tm_globals_fatal_queues_global_status_reg_cover
// Register coverage object.
class tm_globals_fatal_queues_global_status_reg_cover extends uvm_object;

    static local tm_globals_fatal_queues_global_status_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    tm_globals_fatal_queues_global_status_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        fatal_queues_global_status_wr: coverpoint r.fatal_queues_global_status.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        fatal_queues_global_status_rd: coverpoint r.fatal_queues_global_status.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_fatal_queues_global_status_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="tm_globals_fatal_queues_global_status_reg_cover");
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
    static function tm_globals_fatal_queues_global_status_reg_cover get();
        if (m_inst == null) begin
            m_inst = tm_globals_fatal_queues_global_status_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(tm_globals_fatal_queues_global_status_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class tm_globals_arbiter_parity_error_counter_reg_cover;

// Class: tm_globals_arbiter_parity_error_counter_reg
// Register tm_globals.arbiter_parity_error_counter: Counter for parity error detected at the RAM arbiter for control RAM. If this counter is different from 0 and there is no fatal_queues, it means that some mau are lost.
class tm_globals_arbiter_parity_error_counter_reg extends uvm_reg;

    // Variable: p_err_cnt_cqb
    // Counter is incremented each time a parity error is detected when reading context data at the RAM arbiter for the control RAM.
    rand uvm_reg_field p_err_cnt_cqb;
    // Variable: p_err_cnt_fmau_bnk0
    // Counter is incremented each time a parity error is detected when reading FMAU bank 0 at the RAM arbiter for the control RAM.
    rand uvm_reg_field p_err_cnt_fmau_bnk0;
    // Variable: p_err_cnt_fmau_bnk1
    // Counter is incremented each time a parity error is detected when reading FMAU bank 1 at the RAM arbiter for the control RAM.
    rand uvm_reg_field p_err_cnt_fmau_bnk1;
    // Variable: p_err_cnt_crtl_ram
    // Counter is incremented each time a parity error is detected when reading control RAM.
    rand uvm_reg_field p_err_cnt_crtl_ram;
    // Variable: p_err_cnt_wr_ctrl_ram
    // Counter is incremented each time a parity error is detected when writing control RAM.
    rand uvm_reg_field p_err_cnt_wr_ctrl_ram;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static tm_globals_arbiter_parity_error_counter_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    tm_globals_arbiter_parity_error_counter_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_arbiter_parity_error_counter_reg)

    // Constructor: new
    function new(string name = "tm_globals_arbiter_parity_error_counter");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        p_err_cnt_cqb = uvm_reg_field::type_id::create("p_err_cnt_cqb", , get_full_name());
        p_err_cnt_fmau_bnk0 = uvm_reg_field::type_id::create("p_err_cnt_fmau_bnk0", , get_full_name());
        p_err_cnt_fmau_bnk1 = uvm_reg_field::type_id::create("p_err_cnt_fmau_bnk1", , get_full_name());
        p_err_cnt_crtl_ram = uvm_reg_field::type_id::create("p_err_cnt_crtl_ram", , get_full_name());
        p_err_cnt_wr_ctrl_ram = uvm_reg_field::type_id::create("p_err_cnt_wr_ctrl_ram", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        p_err_cnt_cqb.configure(this, 8, 0, "RO", 0, 'h0, 1, 1, 0);
        p_err_cnt_fmau_bnk0.configure(this, 8, 8, "RO", 0, 'h0, 1, 1, 0);
        p_err_cnt_fmau_bnk1.configure(this, 8, 16, "RO", 0, 'h0, 1, 1, 0);
        p_err_cnt_crtl_ram.configure(this, 8, 24, "RO", 0, 'h0, 1, 1, 0);
        p_err_cnt_wr_ctrl_ram.configure(this, 8, 32, "RO", 0, 'h0, 1, 1, 0);
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
                cg = tm_globals_arbiter_parity_error_counter_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = tm_globals_arbiter_parity_error_counter_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, p_err_cnt_cqb.get_name, p_err_cnt_cqb.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p_err_cnt_fmau_bnk0.get_name, p_err_cnt_fmau_bnk0.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p_err_cnt_fmau_bnk1.get_name, p_err_cnt_fmau_bnk1.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p_err_cnt_crtl_ram.get_name, p_err_cnt_crtl_ram.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, p_err_cnt_wr_ctrl_ram.get_name, p_err_cnt_wr_ctrl_ram.value);
        return s;
    endfunction

endclass


// Class: tm_globals_arbiter_parity_error_counter_reg_cover
// Register coverage object.
class tm_globals_arbiter_parity_error_counter_reg_cover extends uvm_object;

    static local tm_globals_arbiter_parity_error_counter_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    tm_globals_arbiter_parity_error_counter_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        p_err_cnt_cqb_wr: coverpoint r.p_err_cnt_cqb.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        p_err_cnt_cqb_rd: coverpoint r.p_err_cnt_cqb.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        p_err_cnt_fmau_bnk0_wr: coverpoint r.p_err_cnt_fmau_bnk0.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        p_err_cnt_fmau_bnk0_rd: coverpoint r.p_err_cnt_fmau_bnk0.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        p_err_cnt_fmau_bnk1_wr: coverpoint r.p_err_cnt_fmau_bnk1.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        p_err_cnt_fmau_bnk1_rd: coverpoint r.p_err_cnt_fmau_bnk1.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        p_err_cnt_crtl_ram_wr: coverpoint r.p_err_cnt_crtl_ram.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        p_err_cnt_crtl_ram_rd: coverpoint r.p_err_cnt_crtl_ram.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        p_err_cnt_wr_ctrl_ram_wr: coverpoint r.p_err_cnt_wr_ctrl_ram.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        p_err_cnt_wr_ctrl_ram_rd: coverpoint r.p_err_cnt_wr_ctrl_ram.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_arbiter_parity_error_counter_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="tm_globals_arbiter_parity_error_counter_reg_cover");
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
    static function tm_globals_arbiter_parity_error_counter_reg_cover get();
        if (m_inst == null) begin
            m_inst = tm_globals_arbiter_parity_error_counter_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(tm_globals_arbiter_parity_error_counter_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class tm_globals_discard_error_config_reg_cover;

// Class: tm_globals_discard_error_config_reg
// Register tm_globals.discard_error_config: UNUSED FOR 6_3_2! Discard Error Frames configuration.
class tm_globals_discard_error_config_reg extends uvm_reg;

    // Variable: discard_error_config
    // Indicate if error frames are discarded (configuration per physical port ID, see Channels_mapping.ods for more info).
    rand uvm_reg_field discard_error_config;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static tm_globals_discard_error_config_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    tm_globals_discard_error_config_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_discard_error_config_reg)

    // Constructor: new
    function new(string name = "tm_globals_discard_error_config");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        discard_error_config = uvm_reg_field::type_id::create("discard_error_config", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        discard_error_config.configure(this, 14, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = tm_globals_discard_error_config_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = tm_globals_discard_error_config_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, discard_error_config.get_name, discard_error_config.value);
        return s;
    endfunction

endclass


// Class: tm_globals_discard_error_config_reg_cover
// Register coverage object.
class tm_globals_discard_error_config_reg_cover extends uvm_object;

    static local tm_globals_discard_error_config_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    tm_globals_discard_error_config_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        discard_error_config_wr: coverpoint r.discard_error_config.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        discard_error_config_rd: coverpoint r.discard_error_config.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_discard_error_config_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="tm_globals_discard_error_config_reg_cover");
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
    static function tm_globals_discard_error_config_reg_cover get();
        if (m_inst == null) begin
            m_inst = tm_globals_discard_error_config_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(tm_globals_discard_error_config_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class tm_globals_debug_system_reg_cover;

// Class: tm_globals_debug_system_reg
// Register tm_globals.debug_system: registers for debug. Should be always 0.
class tm_globals_debug_system_reg extends uvm_reg;

    // Variable: tbb_busy
    // Latch for tbb back pressure signal. 
    rand uvm_reg_field tbb_busy;
    // Variable: ce_busy
    // Latch for Context Engine Busy signal. 
    rand uvm_reg_field ce_busy;
    // Variable: i_ctx_fifo_afull
    // Latch for context builder fifo almost full
    rand uvm_reg_field i_ctx_fifo_afull;
    // Variable: link_list_fail
    // Pointer lost detected when reading the Link list
    rand uvm_reg_field link_list_fail;
    // Variable: bmau_ill
    // BMAU malade :)
    rand uvm_reg_field bmau_ill;
    // Variable: bmau_empty
    // Latch for bmau fifo empty signal
    rand uvm_reg_field bmau_empty;
    // Variable: bmau_almost_empty
    // Latch for bmau fifo almost empty signal
    rand uvm_reg_field bmau_almost_empty;
    // Variable: i_mau_avail
    // Latch for mau fifo not available
    rand uvm_reg_field i_mau_avail;
    // Variable: i_mau_almost_empty
    // Latch for mau fifo almost empty
    rand uvm_reg_field i_mau_almost_empty;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static tm_globals_debug_system_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    tm_globals_debug_system_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_debug_system_reg)

    // Constructor: new
    function new(string name = "tm_globals_debug_system");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        tbb_busy = uvm_reg_field::type_id::create("tbb_busy", , get_full_name());
        ce_busy = uvm_reg_field::type_id::create("ce_busy", , get_full_name());
        i_ctx_fifo_afull = uvm_reg_field::type_id::create("i_ctx_fifo_afull", , get_full_name());
        link_list_fail = uvm_reg_field::type_id::create("link_list_fail", , get_full_name());
        bmau_ill = uvm_reg_field::type_id::create("bmau_ill", , get_full_name());
        bmau_empty = uvm_reg_field::type_id::create("bmau_empty", , get_full_name());
        bmau_almost_empty = uvm_reg_field::type_id::create("bmau_almost_empty", , get_full_name());
        i_mau_avail = uvm_reg_field::type_id::create("i_mau_avail", , get_full_name());
        i_mau_almost_empty = uvm_reg_field::type_id::create("i_mau_almost_empty", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        tbb_busy.configure(this, 14, 0, "RO", 0, 'h0, 1, 1, 0);
        ce_busy.configure(this, 14, 16, "RO", 0, 'h0, 1, 1, 0);
        i_ctx_fifo_afull.configure(this, 14, 32, "RO", 0, 'h0, 1, 1, 0);
        link_list_fail.configure(this, 1, 46, "RO", 0, 'h0, 1, 1, 0);
        bmau_ill.configure(this, 1, 47, "RO", 0, 'h0, 1, 1, 0);
        bmau_empty.configure(this, 1, 48, "RO", 0, 'h0, 1, 1, 0);
        bmau_almost_empty.configure(this, 1, 49, "RO", 0, 'h0, 1, 1, 0);
        i_mau_avail.configure(this, 1, 50, "RO", 0, 'h0, 1, 1, 0);
        i_mau_almost_empty.configure(this, 3, 51, "RO", 0, 'h0, 1, 1, 0);
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
                cg = tm_globals_debug_system_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = tm_globals_debug_system_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, tbb_busy.get_name, tbb_busy.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, ce_busy.get_name, ce_busy.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, i_ctx_fifo_afull.get_name, i_ctx_fifo_afull.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, link_list_fail.get_name, link_list_fail.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, bmau_ill.get_name, bmau_ill.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, bmau_empty.get_name, bmau_empty.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, bmau_almost_empty.get_name, bmau_almost_empty.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, i_mau_avail.get_name, i_mau_avail.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, i_mau_almost_empty.get_name, i_mau_almost_empty.value);
        return s;
    endfunction

endclass


// Class: tm_globals_debug_system_reg_cover
// Register coverage object.
class tm_globals_debug_system_reg_cover extends uvm_object;

    static local tm_globals_debug_system_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    tm_globals_debug_system_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        tbb_busy_wr: coverpoint r.tbb_busy.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        tbb_busy_rd: coverpoint r.tbb_busy.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        ce_busy_wr: coverpoint r.ce_busy.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        ce_busy_rd: coverpoint r.ce_busy.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        i_ctx_fifo_afull_wr: coverpoint r.i_ctx_fifo_afull.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        i_ctx_fifo_afull_rd: coverpoint r.i_ctx_fifo_afull.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        link_list_fail_wr: coverpoint r.link_list_fail.value iff (!is_read);
        link_list_fail_rd: coverpoint r.link_list_fail.value iff  (is_read);
        bmau_ill_wr: coverpoint r.bmau_ill.value iff (!is_read);
        bmau_ill_rd: coverpoint r.bmau_ill.value iff  (is_read);
        bmau_empty_wr: coverpoint r.bmau_empty.value iff (!is_read);
        bmau_empty_rd: coverpoint r.bmau_empty.value iff  (is_read);
        bmau_almost_empty_wr: coverpoint r.bmau_almost_empty.value iff (!is_read);
        bmau_almost_empty_rd: coverpoint r.bmau_almost_empty.value iff  (is_read);
        i_mau_avail_wr: coverpoint r.i_mau_avail.value iff (!is_read);
        i_mau_avail_rd: coverpoint r.i_mau_avail.value iff  (is_read);
        i_mau_almost_empty_wr: coverpoint r.i_mau_almost_empty.value iff (!is_read);
        i_mau_almost_empty_rd: coverpoint r.i_mau_almost_empty.value iff  (is_read);
    endgroup

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_debug_system_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="tm_globals_debug_system_reg_cover");
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
    static function tm_globals_debug_system_reg_cover get();
        if (m_inst == null) begin
            m_inst = tm_globals_debug_system_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(tm_globals_debug_system_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class tm_globals_debug_fmau_count_reg_cover;

// Class: tm_globals_debug_fmau_count_reg
// Register tm_globals.debug_fmau_count: registers for debug
class tm_globals_debug_fmau_count_reg extends uvm_reg;

    // Variable: i_debug_mau_rd_count
    // Counter is incremented each time Write Engine grab a mau.
    rand uvm_reg_field i_debug_mau_rd_count;
    // Variable: i_debug_mau_rel_count
    // Counter is incremented each time a mau is released. A mau is released only if all copy of a frame are sent. When no traffic is going through the TM those counters must be equals.
    rand uvm_reg_field i_debug_mau_rel_count;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static tm_globals_debug_fmau_count_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    tm_globals_debug_fmau_count_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_debug_fmau_count_reg)

    // Constructor: new
    function new(string name = "tm_globals_debug_fmau_count");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        i_debug_mau_rd_count = uvm_reg_field::type_id::create("i_debug_mau_rd_count", , get_full_name());
        i_debug_mau_rel_count = uvm_reg_field::type_id::create("i_debug_mau_rel_count", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        i_debug_mau_rd_count.configure(this, 16, 0, "RO", 0, 'h0, 1, 1, 0);
        i_debug_mau_rel_count.configure(this, 16, 32, "RO", 0, 'h0, 1, 1, 0);
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
                cg = tm_globals_debug_fmau_count_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = tm_globals_debug_fmau_count_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, i_debug_mau_rd_count.get_name, i_debug_mau_rd_count.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, i_debug_mau_rel_count.get_name, i_debug_mau_rel_count.value);
        return s;
    endfunction

endclass


// Class: tm_globals_debug_fmau_count_reg_cover
// Register coverage object.
class tm_globals_debug_fmau_count_reg_cover extends uvm_object;

    static local tm_globals_debug_fmau_count_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    tm_globals_debug_fmau_count_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        i_debug_mau_rd_count_wr: coverpoint r.i_debug_mau_rd_count.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        i_debug_mau_rd_count_rd: coverpoint r.i_debug_mau_rd_count.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        i_debug_mau_rel_count_wr: coverpoint r.i_debug_mau_rel_count.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        i_debug_mau_rel_count_rd: coverpoint r.i_debug_mau_rel_count.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_debug_fmau_count_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="tm_globals_debug_fmau_count_reg_cover");
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
    static function tm_globals_debug_fmau_count_reg_cover get();
        if (m_inst == null) begin
            m_inst = tm_globals_debug_fmau_count_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(tm_globals_debug_fmau_count_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class tm_globals_debug_level_fmau_count_reg_cover;

// Class: tm_globals_debug_level_fmau_count_reg
// Register tm_globals.debug_level_fmau_count: registers for debug
class tm_globals_debug_level_fmau_count_reg extends uvm_reg;

    // Variable: i_level_bank0
    // Level of mau fifo into external RAM. Level is given as number of address used into the RAM. Number of mau is given by level*14
    rand uvm_reg_field i_level_bank0;
    // Variable: i_level_bank1
    // Level of mau fifo into external RAM. Level is given as number of address used into the RAM. Number of mau is given by level*14
    rand uvm_reg_field i_level_bank1;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static tm_globals_debug_level_fmau_count_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    tm_globals_debug_level_fmau_count_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_debug_level_fmau_count_reg)

    // Constructor: new
    function new(string name = "tm_globals_debug_level_fmau_count");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        i_level_bank0 = uvm_reg_field::type_id::create("i_level_bank0", , get_full_name());
        i_level_bank1 = uvm_reg_field::type_id::create("i_level_bank1", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        i_level_bank0.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
        i_level_bank1.configure(this, 32, 32, "RO", 0, 'h0, 1, 1, 0);
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
                cg = tm_globals_debug_level_fmau_count_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = tm_globals_debug_level_fmau_count_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, i_level_bank0.get_name, i_level_bank0.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, i_level_bank1.get_name, i_level_bank1.value);
        return s;
    endfunction

endclass


// Class: tm_globals_debug_level_fmau_count_reg_cover
// Register coverage object.
class tm_globals_debug_level_fmau_count_reg_cover extends uvm_object;

    static local tm_globals_debug_level_fmau_count_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    tm_globals_debug_level_fmau_count_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        i_level_bank0_wr: coverpoint r.i_level_bank0.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        i_level_bank0_rd: coverpoint r.i_level_bank0.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        i_level_bank1_wr: coverpoint r.i_level_bank1.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        i_level_bank1_rd: coverpoint r.i_level_bank1.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_debug_level_fmau_count_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="tm_globals_debug_level_fmau_count_reg_cover");
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
    static function tm_globals_debug_level_fmau_count_reg_cover get();
        if (m_inst == null) begin
            m_inst = tm_globals_debug_level_fmau_count_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(tm_globals_debug_level_fmau_count_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class tm_globals_debug_ram_arbiter_reset_reg_cover;

// Class: tm_globals_debug_ram_arbiter_reset_reg
// Register tm_globals.debug_ram_arbiter_reset: registers for debug.
class tm_globals_debug_ram_arbiter_reset_reg extends uvm_reg;

    // Variable: arb_reset_count
    //  Reset all RAM related debug counters. Active High.
    rand uvm_reg_field arb_reset_count;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static tm_globals_debug_ram_arbiter_reset_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    tm_globals_debug_ram_arbiter_reset_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_debug_ram_arbiter_reset_reg)

    // Constructor: new
    function new(string name = "tm_globals_debug_ram_arbiter_reset");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        arb_reset_count = uvm_reg_field::type_id::create("arb_reset_count", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        arb_reset_count.configure(this, 1, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = tm_globals_debug_ram_arbiter_reset_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = tm_globals_debug_ram_arbiter_reset_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, arb_reset_count.get_name, arb_reset_count.value);
        return s;
    endfunction

endclass


// Class: tm_globals_debug_ram_arbiter_reset_reg_cover
// Register coverage object.
class tm_globals_debug_ram_arbiter_reset_reg_cover extends uvm_object;

    static local tm_globals_debug_ram_arbiter_reset_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    tm_globals_debug_ram_arbiter_reset_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        arb_reset_count_wr: coverpoint r.arb_reset_count.value iff (!is_read);
        arb_reset_count_rd: coverpoint r.arb_reset_count.value iff  (is_read);
    endgroup

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_debug_ram_arbiter_reset_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="tm_globals_debug_ram_arbiter_reset_reg_cover");
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
    static function tm_globals_debug_ram_arbiter_reset_reg_cover get();
        if (m_inst == null) begin
            m_inst = tm_globals_debug_ram_arbiter_reset_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(tm_globals_debug_ram_arbiter_reset_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class tm_globals_debug_ram_arbiter_time_busy_count_ctrl0_reg_cover;

// Class: tm_globals_debug_ram_arbiter_time_busy_count_ctrl0_reg
// Register tm_globals.debug_ram_arbiter_time_busy_count_ctrl0: registers for debug
class tm_globals_debug_ram_arbiter_time_busy_count_ctrl0_reg extends uvm_reg;

    // Variable: i_ctrl_time_count
    // Number of cycle since last reset.
    rand uvm_reg_field i_ctrl_time_count;
    // Variable: i_ctrl_busy_count0
    // Number of cycle where queue buffer cannot make RAM access since last reset.
    rand uvm_reg_field i_ctrl_busy_count0;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static tm_globals_debug_ram_arbiter_time_busy_count_ctrl0_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    tm_globals_debug_ram_arbiter_time_busy_count_ctrl0_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_debug_ram_arbiter_time_busy_count_ctrl0_reg)

    // Constructor: new
    function new(string name = "tm_globals_debug_ram_arbiter_time_busy_count_ctrl0");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        i_ctrl_time_count = uvm_reg_field::type_id::create("i_ctrl_time_count", , get_full_name());
        i_ctrl_busy_count0 = uvm_reg_field::type_id::create("i_ctrl_busy_count0", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        i_ctrl_time_count.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
        i_ctrl_busy_count0.configure(this, 32, 32, "RO", 0, 'h0, 1, 1, 0);
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
                cg = tm_globals_debug_ram_arbiter_time_busy_count_ctrl0_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = tm_globals_debug_ram_arbiter_time_busy_count_ctrl0_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, i_ctrl_time_count.get_name, i_ctrl_time_count.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, i_ctrl_busy_count0.get_name, i_ctrl_busy_count0.value);
        return s;
    endfunction

endclass


// Class: tm_globals_debug_ram_arbiter_time_busy_count_ctrl0_reg_cover
// Register coverage object.
class tm_globals_debug_ram_arbiter_time_busy_count_ctrl0_reg_cover extends uvm_object;

    static local tm_globals_debug_ram_arbiter_time_busy_count_ctrl0_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    tm_globals_debug_ram_arbiter_time_busy_count_ctrl0_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        i_ctrl_time_count_wr: coverpoint r.i_ctrl_time_count.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        i_ctrl_time_count_rd: coverpoint r.i_ctrl_time_count.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        i_ctrl_busy_count0_wr: coverpoint r.i_ctrl_busy_count0.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        i_ctrl_busy_count0_rd: coverpoint r.i_ctrl_busy_count0.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_debug_ram_arbiter_time_busy_count_ctrl0_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="tm_globals_debug_ram_arbiter_time_busy_count_ctrl0_reg_cover");
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
    static function tm_globals_debug_ram_arbiter_time_busy_count_ctrl0_reg_cover get();
        if (m_inst == null) begin
            m_inst = tm_globals_debug_ram_arbiter_time_busy_count_ctrl0_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(tm_globals_debug_ram_arbiter_time_busy_count_ctrl0_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class tm_globals_debug_ram_arbiter_wr_rd_count_ctrl0_reg_cover;

// Class: tm_globals_debug_ram_arbiter_wr_rd_count_ctrl0_reg
// Register tm_globals.debug_ram_arbiter_wr_rd_count_ctrl0: registers for debug
class tm_globals_debug_ram_arbiter_wr_rd_count_ctrl0_reg extends uvm_reg;

    // Variable: i_ctrl_wr_count0
    // Number of cycle where queue buffer make WR RAM access since last reset.
    rand uvm_reg_field i_ctrl_wr_count0;
    // Variable: i_ctrl_rd_count0
    // Number of cycle where queue buffer make RD RAM access since last reset.
    rand uvm_reg_field i_ctrl_rd_count0;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static tm_globals_debug_ram_arbiter_wr_rd_count_ctrl0_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    tm_globals_debug_ram_arbiter_wr_rd_count_ctrl0_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_debug_ram_arbiter_wr_rd_count_ctrl0_reg)

    // Constructor: new
    function new(string name = "tm_globals_debug_ram_arbiter_wr_rd_count_ctrl0");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        i_ctrl_wr_count0 = uvm_reg_field::type_id::create("i_ctrl_wr_count0", , get_full_name());
        i_ctrl_rd_count0 = uvm_reg_field::type_id::create("i_ctrl_rd_count0", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        i_ctrl_wr_count0.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
        i_ctrl_rd_count0.configure(this, 32, 32, "RO", 0, 'h0, 1, 1, 0);
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
                cg = tm_globals_debug_ram_arbiter_wr_rd_count_ctrl0_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = tm_globals_debug_ram_arbiter_wr_rd_count_ctrl0_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, i_ctrl_wr_count0.get_name, i_ctrl_wr_count0.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, i_ctrl_rd_count0.get_name, i_ctrl_rd_count0.value);
        return s;
    endfunction

endclass


// Class: tm_globals_debug_ram_arbiter_wr_rd_count_ctrl0_reg_cover
// Register coverage object.
class tm_globals_debug_ram_arbiter_wr_rd_count_ctrl0_reg_cover extends uvm_object;

    static local tm_globals_debug_ram_arbiter_wr_rd_count_ctrl0_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    tm_globals_debug_ram_arbiter_wr_rd_count_ctrl0_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        i_ctrl_wr_count0_wr: coverpoint r.i_ctrl_wr_count0.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        i_ctrl_wr_count0_rd: coverpoint r.i_ctrl_wr_count0.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        i_ctrl_rd_count0_wr: coverpoint r.i_ctrl_rd_count0.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        i_ctrl_rd_count0_rd: coverpoint r.i_ctrl_rd_count0.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_debug_ram_arbiter_wr_rd_count_ctrl0_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="tm_globals_debug_ram_arbiter_wr_rd_count_ctrl0_reg_cover");
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
    static function tm_globals_debug_ram_arbiter_wr_rd_count_ctrl0_reg_cover get();
        if (m_inst == null) begin
            m_inst = tm_globals_debug_ram_arbiter_wr_rd_count_ctrl0_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(tm_globals_debug_ram_arbiter_wr_rd_count_ctrl0_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class tm_globals_debug_ram_arbiter_busy_count_ctrl1_reg_cover;

// Class: tm_globals_debug_ram_arbiter_busy_count_ctrl1_reg
// Register tm_globals.debug_ram_arbiter_busy_count_ctrl1: registers for debug
class tm_globals_debug_ram_arbiter_busy_count_ctrl1_reg extends uvm_reg;

    // Variable: i_ctrl_busy_count1
    // Number of cycle where queue buffer cannot make RAM access since last reset.
    rand uvm_reg_field i_ctrl_busy_count1;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static tm_globals_debug_ram_arbiter_busy_count_ctrl1_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    tm_globals_debug_ram_arbiter_busy_count_ctrl1_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_debug_ram_arbiter_busy_count_ctrl1_reg)

    // Constructor: new
    function new(string name = "tm_globals_debug_ram_arbiter_busy_count_ctrl1");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        i_ctrl_busy_count1 = uvm_reg_field::type_id::create("i_ctrl_busy_count1", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        i_ctrl_busy_count1.configure(this, 32, 32, "RO", 0, 'h0, 1, 1, 0);
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
                cg = tm_globals_debug_ram_arbiter_busy_count_ctrl1_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = tm_globals_debug_ram_arbiter_busy_count_ctrl1_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, i_ctrl_busy_count1.get_name, i_ctrl_busy_count1.value);
        return s;
    endfunction

endclass


// Class: tm_globals_debug_ram_arbiter_busy_count_ctrl1_reg_cover
// Register coverage object.
class tm_globals_debug_ram_arbiter_busy_count_ctrl1_reg_cover extends uvm_object;

    static local tm_globals_debug_ram_arbiter_busy_count_ctrl1_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    tm_globals_debug_ram_arbiter_busy_count_ctrl1_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        i_ctrl_busy_count1_wr: coverpoint r.i_ctrl_busy_count1.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        i_ctrl_busy_count1_rd: coverpoint r.i_ctrl_busy_count1.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_debug_ram_arbiter_busy_count_ctrl1_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="tm_globals_debug_ram_arbiter_busy_count_ctrl1_reg_cover");
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
    static function tm_globals_debug_ram_arbiter_busy_count_ctrl1_reg_cover get();
        if (m_inst == null) begin
            m_inst = tm_globals_debug_ram_arbiter_busy_count_ctrl1_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(tm_globals_debug_ram_arbiter_busy_count_ctrl1_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class tm_globals_debug_ram_arbiter_wr_rd_count_ctrl1_reg_cover;

// Class: tm_globals_debug_ram_arbiter_wr_rd_count_ctrl1_reg
// Register tm_globals.debug_ram_arbiter_wr_rd_count_ctrl1: registers for debug
class tm_globals_debug_ram_arbiter_wr_rd_count_ctrl1_reg extends uvm_reg;

    // Variable: i_ctrl_wr_count1
    // Number of cycle where queue buffer make WR RAM access since last reset.
    rand uvm_reg_field i_ctrl_wr_count1;
    // Variable: i_ctrl_rd_count1
    // Number of cycle where queue buffer make RD RAM access since last reset.
    rand uvm_reg_field i_ctrl_rd_count1;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static tm_globals_debug_ram_arbiter_wr_rd_count_ctrl1_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    tm_globals_debug_ram_arbiter_wr_rd_count_ctrl1_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_debug_ram_arbiter_wr_rd_count_ctrl1_reg)

    // Constructor: new
    function new(string name = "tm_globals_debug_ram_arbiter_wr_rd_count_ctrl1");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        i_ctrl_wr_count1 = uvm_reg_field::type_id::create("i_ctrl_wr_count1", , get_full_name());
        i_ctrl_rd_count1 = uvm_reg_field::type_id::create("i_ctrl_rd_count1", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        i_ctrl_wr_count1.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
        i_ctrl_rd_count1.configure(this, 32, 32, "RO", 0, 'h0, 1, 1, 0);
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
                cg = tm_globals_debug_ram_arbiter_wr_rd_count_ctrl1_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = tm_globals_debug_ram_arbiter_wr_rd_count_ctrl1_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, i_ctrl_wr_count1.get_name, i_ctrl_wr_count1.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, i_ctrl_rd_count1.get_name, i_ctrl_rd_count1.value);
        return s;
    endfunction

endclass


// Class: tm_globals_debug_ram_arbiter_wr_rd_count_ctrl1_reg_cover
// Register coverage object.
class tm_globals_debug_ram_arbiter_wr_rd_count_ctrl1_reg_cover extends uvm_object;

    static local tm_globals_debug_ram_arbiter_wr_rd_count_ctrl1_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    tm_globals_debug_ram_arbiter_wr_rd_count_ctrl1_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        i_ctrl_wr_count1_wr: coverpoint r.i_ctrl_wr_count1.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        i_ctrl_wr_count1_rd: coverpoint r.i_ctrl_wr_count1.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        i_ctrl_rd_count1_wr: coverpoint r.i_ctrl_rd_count1.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        i_ctrl_rd_count1_rd: coverpoint r.i_ctrl_rd_count1.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_debug_ram_arbiter_wr_rd_count_ctrl1_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="tm_globals_debug_ram_arbiter_wr_rd_count_ctrl1_reg_cover");
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
    static function tm_globals_debug_ram_arbiter_wr_rd_count_ctrl1_reg_cover get();
        if (m_inst == null) begin
            m_inst = tm_globals_debug_ram_arbiter_wr_rd_count_ctrl1_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(tm_globals_debug_ram_arbiter_wr_rd_count_ctrl1_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class tm_globals_debug_ram_arbiter_busy_count_ctrl2_reg_cover;

// Class: tm_globals_debug_ram_arbiter_busy_count_ctrl2_reg
// Register tm_globals.debug_ram_arbiter_busy_count_ctrl2: registers for debug
class tm_globals_debug_ram_arbiter_busy_count_ctrl2_reg extends uvm_reg;

    // Variable: i_ctrl_busy_count2
    // Number of cycle where fmau_fifo bank 0 cannot make RAM access since last reset.
    rand uvm_reg_field i_ctrl_busy_count2;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static tm_globals_debug_ram_arbiter_busy_count_ctrl2_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    tm_globals_debug_ram_arbiter_busy_count_ctrl2_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_debug_ram_arbiter_busy_count_ctrl2_reg)

    // Constructor: new
    function new(string name = "tm_globals_debug_ram_arbiter_busy_count_ctrl2");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        i_ctrl_busy_count2 = uvm_reg_field::type_id::create("i_ctrl_busy_count2", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        i_ctrl_busy_count2.configure(this, 32, 32, "RO", 0, 'h0, 1, 1, 0);
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
                cg = tm_globals_debug_ram_arbiter_busy_count_ctrl2_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = tm_globals_debug_ram_arbiter_busy_count_ctrl2_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, i_ctrl_busy_count2.get_name, i_ctrl_busy_count2.value);
        return s;
    endfunction

endclass


// Class: tm_globals_debug_ram_arbiter_busy_count_ctrl2_reg_cover
// Register coverage object.
class tm_globals_debug_ram_arbiter_busy_count_ctrl2_reg_cover extends uvm_object;

    static local tm_globals_debug_ram_arbiter_busy_count_ctrl2_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    tm_globals_debug_ram_arbiter_busy_count_ctrl2_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        i_ctrl_busy_count2_wr: coverpoint r.i_ctrl_busy_count2.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        i_ctrl_busy_count2_rd: coverpoint r.i_ctrl_busy_count2.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_debug_ram_arbiter_busy_count_ctrl2_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="tm_globals_debug_ram_arbiter_busy_count_ctrl2_reg_cover");
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
    static function tm_globals_debug_ram_arbiter_busy_count_ctrl2_reg_cover get();
        if (m_inst == null) begin
            m_inst = tm_globals_debug_ram_arbiter_busy_count_ctrl2_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(tm_globals_debug_ram_arbiter_busy_count_ctrl2_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class tm_globals_debug_ram_arbiter_wr_rd_count_ctrl2_reg_cover;

// Class: tm_globals_debug_ram_arbiter_wr_rd_count_ctrl2_reg
// Register tm_globals.debug_ram_arbiter_wr_rd_count_ctrl2: registers for debug
class tm_globals_debug_ram_arbiter_wr_rd_count_ctrl2_reg extends uvm_reg;

    // Variable: i_ctrl_wr_count2
    // Number of cycle where queue buffer make WR RAM access since last reset.
    rand uvm_reg_field i_ctrl_wr_count2;
    // Variable: i_ctrl_rd_count2
    // Number of cycle where queue buffer make RD RAM access since last reset.
    rand uvm_reg_field i_ctrl_rd_count2;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static tm_globals_debug_ram_arbiter_wr_rd_count_ctrl2_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    tm_globals_debug_ram_arbiter_wr_rd_count_ctrl2_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_debug_ram_arbiter_wr_rd_count_ctrl2_reg)

    // Constructor: new
    function new(string name = "tm_globals_debug_ram_arbiter_wr_rd_count_ctrl2");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        i_ctrl_wr_count2 = uvm_reg_field::type_id::create("i_ctrl_wr_count2", , get_full_name());
        i_ctrl_rd_count2 = uvm_reg_field::type_id::create("i_ctrl_rd_count2", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        i_ctrl_wr_count2.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
        i_ctrl_rd_count2.configure(this, 32, 32, "RO", 0, 'h0, 1, 1, 0);
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
                cg = tm_globals_debug_ram_arbiter_wr_rd_count_ctrl2_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = tm_globals_debug_ram_arbiter_wr_rd_count_ctrl2_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, i_ctrl_wr_count2.get_name, i_ctrl_wr_count2.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, i_ctrl_rd_count2.get_name, i_ctrl_rd_count2.value);
        return s;
    endfunction

endclass


// Class: tm_globals_debug_ram_arbiter_wr_rd_count_ctrl2_reg_cover
// Register coverage object.
class tm_globals_debug_ram_arbiter_wr_rd_count_ctrl2_reg_cover extends uvm_object;

    static local tm_globals_debug_ram_arbiter_wr_rd_count_ctrl2_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    tm_globals_debug_ram_arbiter_wr_rd_count_ctrl2_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        i_ctrl_wr_count2_wr: coverpoint r.i_ctrl_wr_count2.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        i_ctrl_wr_count2_rd: coverpoint r.i_ctrl_wr_count2.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        i_ctrl_rd_count2_wr: coverpoint r.i_ctrl_rd_count2.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        i_ctrl_rd_count2_rd: coverpoint r.i_ctrl_rd_count2.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_debug_ram_arbiter_wr_rd_count_ctrl2_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="tm_globals_debug_ram_arbiter_wr_rd_count_ctrl2_reg_cover");
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
    static function tm_globals_debug_ram_arbiter_wr_rd_count_ctrl2_reg_cover get();
        if (m_inst == null) begin
            m_inst = tm_globals_debug_ram_arbiter_wr_rd_count_ctrl2_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(tm_globals_debug_ram_arbiter_wr_rd_count_ctrl2_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class tm_globals_debug_ram_arbiter_time_busy_count_data_reg_cover;

// Class: tm_globals_debug_ram_arbiter_time_busy_count_data_reg
// Register tm_globals.debug_ram_arbiter_time_busy_count_data: registers for debug
class tm_globals_debug_ram_arbiter_time_busy_count_data_reg extends uvm_reg;

    // Variable: i_data_time_count0
    // Number of cycle since last reset.
    rand uvm_reg_field i_data_time_count0;
    // Variable: i_data_busy_count0
    // Number of cycle where DataBuffer cannot make RAM access since last reset.
    rand uvm_reg_field i_data_busy_count0;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static tm_globals_debug_ram_arbiter_time_busy_count_data_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    tm_globals_debug_ram_arbiter_time_busy_count_data_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_debug_ram_arbiter_time_busy_count_data_reg)

    // Constructor: new
    function new(string name = "tm_globals_debug_ram_arbiter_time_busy_count_data");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        i_data_time_count0 = uvm_reg_field::type_id::create("i_data_time_count0", , get_full_name());
        i_data_busy_count0 = uvm_reg_field::type_id::create("i_data_busy_count0", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        i_data_time_count0.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
        i_data_busy_count0.configure(this, 32, 32, "RO", 0, 'h0, 1, 1, 0);
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
                cg = tm_globals_debug_ram_arbiter_time_busy_count_data_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = tm_globals_debug_ram_arbiter_time_busy_count_data_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, i_data_time_count0.get_name, i_data_time_count0.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, i_data_busy_count0.get_name, i_data_busy_count0.value);
        return s;
    endfunction

endclass


// Class: tm_globals_debug_ram_arbiter_time_busy_count_data_reg_cover
// Register coverage object.
class tm_globals_debug_ram_arbiter_time_busy_count_data_reg_cover extends uvm_object;

    static local tm_globals_debug_ram_arbiter_time_busy_count_data_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    tm_globals_debug_ram_arbiter_time_busy_count_data_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        i_data_time_count0_wr: coverpoint r.i_data_time_count0.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        i_data_time_count0_rd: coverpoint r.i_data_time_count0.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        i_data_busy_count0_wr: coverpoint r.i_data_busy_count0.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        i_data_busy_count0_rd: coverpoint r.i_data_busy_count0.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_debug_ram_arbiter_time_busy_count_data_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="tm_globals_debug_ram_arbiter_time_busy_count_data_reg_cover");
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
    static function tm_globals_debug_ram_arbiter_time_busy_count_data_reg_cover get();
        if (m_inst == null) begin
            m_inst = tm_globals_debug_ram_arbiter_time_busy_count_data_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(tm_globals_debug_ram_arbiter_time_busy_count_data_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class tm_globals_debug_ram_arbiter_wr_rd_count_data_reg_cover;

// Class: tm_globals_debug_ram_arbiter_wr_rd_count_data_reg
// Register tm_globals.debug_ram_arbiter_wr_rd_count_data: registers for debug
class tm_globals_debug_ram_arbiter_wr_rd_count_data_reg extends uvm_reg;

    // Variable: i_data_wr_count0
    // Number of cycle where Write Engine make RAM access since last reset.
    rand uvm_reg_field i_data_wr_count0;
    // Variable: i_data_rd_count0
    // Number of cycle where Read Engine make RAM access since last reset.
    rand uvm_reg_field i_data_rd_count0;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static tm_globals_debug_ram_arbiter_wr_rd_count_data_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    tm_globals_debug_ram_arbiter_wr_rd_count_data_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_debug_ram_arbiter_wr_rd_count_data_reg)

    // Constructor: new
    function new(string name = "tm_globals_debug_ram_arbiter_wr_rd_count_data");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        i_data_wr_count0 = uvm_reg_field::type_id::create("i_data_wr_count0", , get_full_name());
        i_data_rd_count0 = uvm_reg_field::type_id::create("i_data_rd_count0", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        i_data_wr_count0.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
        i_data_rd_count0.configure(this, 32, 32, "RO", 0, 'h0, 1, 1, 0);
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
                cg = tm_globals_debug_ram_arbiter_wr_rd_count_data_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = tm_globals_debug_ram_arbiter_wr_rd_count_data_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, i_data_wr_count0.get_name, i_data_wr_count0.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, i_data_rd_count0.get_name, i_data_rd_count0.value);
        return s;
    endfunction

endclass


// Class: tm_globals_debug_ram_arbiter_wr_rd_count_data_reg_cover
// Register coverage object.
class tm_globals_debug_ram_arbiter_wr_rd_count_data_reg_cover extends uvm_object;

    static local tm_globals_debug_ram_arbiter_wr_rd_count_data_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    tm_globals_debug_ram_arbiter_wr_rd_count_data_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        i_data_wr_count0_wr: coverpoint r.i_data_wr_count0.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        i_data_wr_count0_rd: coverpoint r.i_data_wr_count0.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        i_data_rd_count0_wr: coverpoint r.i_data_rd_count0.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        i_data_rd_count0_rd: coverpoint r.i_data_rd_count0.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_debug_ram_arbiter_wr_rd_count_data_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="tm_globals_debug_ram_arbiter_wr_rd_count_data_reg_cover");
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
    static function tm_globals_debug_ram_arbiter_wr_rd_count_data_reg_cover get();
        if (m_inst == null) begin
            m_inst = tm_globals_debug_ram_arbiter_wr_rd_count_data_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(tm_globals_debug_ram_arbiter_wr_rd_count_data_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class tm_globals_debug_sop_in_count_if4_reg_cover;

// Class: tm_globals_debug_sop_in_count_if4_reg
// Register tm_globals.debug_sop_in_count_if4: Counter On acd_stream SOP IN for each channel of interface 4.
class tm_globals_debug_sop_in_count_if4_reg extends uvm_reg;

    // Variable: debug_sop_in_count_if4
    // Sop in Count.
    rand uvm_reg_field debug_sop_in_count_if4;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static tm_globals_debug_sop_in_count_if4_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    tm_globals_debug_sop_in_count_if4_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_debug_sop_in_count_if4_reg)

    // Constructor: new
    function new(string name = "tm_globals_debug_sop_in_count_if4");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        debug_sop_in_count_if4 = uvm_reg_field::type_id::create("debug_sop_in_count_if4", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        debug_sop_in_count_if4.configure(this, 40, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = tm_globals_debug_sop_in_count_if4_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = tm_globals_debug_sop_in_count_if4_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, debug_sop_in_count_if4.get_name, debug_sop_in_count_if4.value);
        return s;
    endfunction

endclass


// Class: tm_globals_debug_sop_in_count_if4_reg_cover
// Register coverage object.
class tm_globals_debug_sop_in_count_if4_reg_cover extends uvm_object;

    static local tm_globals_debug_sop_in_count_if4_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    tm_globals_debug_sop_in_count_if4_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        debug_sop_in_count_if4_wr: coverpoint r.debug_sop_in_count_if4.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        debug_sop_in_count_if4_rd: coverpoint r.debug_sop_in_count_if4.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_debug_sop_in_count_if4_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="tm_globals_debug_sop_in_count_if4_reg_cover");
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
    static function tm_globals_debug_sop_in_count_if4_reg_cover get();
        if (m_inst == null) begin
            m_inst = tm_globals_debug_sop_in_count_if4_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(tm_globals_debug_sop_in_count_if4_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class tm_globals_debug_eop_in_count_if4_reg_cover;

// Class: tm_globals_debug_eop_in_count_if4_reg
// Register tm_globals.debug_eop_in_count_if4: Counter On acd_stream EOP IN for each channel of interface 4.
class tm_globals_debug_eop_in_count_if4_reg extends uvm_reg;

    // Variable: debug_eop_in_count_if4
    // Eop in Count.
    rand uvm_reg_field debug_eop_in_count_if4;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static tm_globals_debug_eop_in_count_if4_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    tm_globals_debug_eop_in_count_if4_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_debug_eop_in_count_if4_reg)

    // Constructor: new
    function new(string name = "tm_globals_debug_eop_in_count_if4");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        debug_eop_in_count_if4 = uvm_reg_field::type_id::create("debug_eop_in_count_if4", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        debug_eop_in_count_if4.configure(this, 40, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = tm_globals_debug_eop_in_count_if4_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = tm_globals_debug_eop_in_count_if4_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, debug_eop_in_count_if4.get_name, debug_eop_in_count_if4.value);
        return s;
    endfunction

endclass


// Class: tm_globals_debug_eop_in_count_if4_reg_cover
// Register coverage object.
class tm_globals_debug_eop_in_count_if4_reg_cover extends uvm_object;

    static local tm_globals_debug_eop_in_count_if4_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    tm_globals_debug_eop_in_count_if4_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        debug_eop_in_count_if4_wr: coverpoint r.debug_eop_in_count_if4.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        debug_eop_in_count_if4_rd: coverpoint r.debug_eop_in_count_if4.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_debug_eop_in_count_if4_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="tm_globals_debug_eop_in_count_if4_reg_cover");
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
    static function tm_globals_debug_eop_in_count_if4_reg_cover get();
        if (m_inst == null) begin
            m_inst = tm_globals_debug_eop_in_count_if4_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(tm_globals_debug_eop_in_count_if4_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class tm_globals_debug_sop_out_count_if4_reg_cover;

// Class: tm_globals_debug_sop_out_count_if4_reg
// Register tm_globals.debug_sop_out_count_if4: Counter On acd_stream SOP OUT for each channel of interface 4.
class tm_globals_debug_sop_out_count_if4_reg extends uvm_reg;

    // Variable: debug_sop_out_count_if4
    // Sop in Count.
    rand uvm_reg_field debug_sop_out_count_if4;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static tm_globals_debug_sop_out_count_if4_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    tm_globals_debug_sop_out_count_if4_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_debug_sop_out_count_if4_reg)

    // Constructor: new
    function new(string name = "tm_globals_debug_sop_out_count_if4");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        debug_sop_out_count_if4 = uvm_reg_field::type_id::create("debug_sop_out_count_if4", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        debug_sop_out_count_if4.configure(this, 40, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = tm_globals_debug_sop_out_count_if4_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = tm_globals_debug_sop_out_count_if4_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, debug_sop_out_count_if4.get_name, debug_sop_out_count_if4.value);
        return s;
    endfunction

endclass


// Class: tm_globals_debug_sop_out_count_if4_reg_cover
// Register coverage object.
class tm_globals_debug_sop_out_count_if4_reg_cover extends uvm_object;

    static local tm_globals_debug_sop_out_count_if4_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    tm_globals_debug_sop_out_count_if4_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        debug_sop_out_count_if4_wr: coverpoint r.debug_sop_out_count_if4.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        debug_sop_out_count_if4_rd: coverpoint r.debug_sop_out_count_if4.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_debug_sop_out_count_if4_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="tm_globals_debug_sop_out_count_if4_reg_cover");
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
    static function tm_globals_debug_sop_out_count_if4_reg_cover get();
        if (m_inst == null) begin
            m_inst = tm_globals_debug_sop_out_count_if4_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(tm_globals_debug_sop_out_count_if4_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class tm_globals_debug_eop_out_count_if4_reg_cover;

// Class: tm_globals_debug_eop_out_count_if4_reg
// Register tm_globals.debug_eop_out_count_if4: Counter On acd_stream EOP OUT for each channel of interface 4.
class tm_globals_debug_eop_out_count_if4_reg extends uvm_reg;

    // Variable: debug_eop_out_count_if4
    // Eop in Count.
    rand uvm_reg_field debug_eop_out_count_if4;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static tm_globals_debug_eop_out_count_if4_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    tm_globals_debug_eop_out_count_if4_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_debug_eop_out_count_if4_reg)

    // Constructor: new
    function new(string name = "tm_globals_debug_eop_out_count_if4");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        debug_eop_out_count_if4 = uvm_reg_field::type_id::create("debug_eop_out_count_if4", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        debug_eop_out_count_if4.configure(this, 40, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = tm_globals_debug_eop_out_count_if4_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = tm_globals_debug_eop_out_count_if4_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, debug_eop_out_count_if4.get_name, debug_eop_out_count_if4.value);
        return s;
    endfunction

endclass


// Class: tm_globals_debug_eop_out_count_if4_reg_cover
// Register coverage object.
class tm_globals_debug_eop_out_count_if4_reg_cover extends uvm_object;

    static local tm_globals_debug_eop_out_count_if4_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    tm_globals_debug_eop_out_count_if4_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        debug_eop_out_count_if4_wr: coverpoint r.debug_eop_out_count_if4.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        debug_eop_out_count_if4_rd: coverpoint r.debug_eop_out_count_if4.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_debug_eop_out_count_if4_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="tm_globals_debug_eop_out_count_if4_reg_cover");
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
    static function tm_globals_debug_eop_out_count_if4_reg_cover get();
        if (m_inst == null) begin
            m_inst = tm_globals_debug_eop_out_count_if4_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(tm_globals_debug_eop_out_count_if4_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class tm_globals_debug_sop_in_count_if0_3_reg_cover;

// Class: tm_globals_debug_sop_in_count_if0_3_reg
// Register tm_globals.debug_sop_in_count_if0_3: Counter On acd_stream SOP IN for interfaces 0 to 3.
class tm_globals_debug_sop_in_count_if0_3_reg extends uvm_reg;

    // Variable: debug_sop_in_count_if0_3
    // Sop in Count.
    rand uvm_reg_field debug_sop_in_count_if0_3;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static tm_globals_debug_sop_in_count_if0_3_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    tm_globals_debug_sop_in_count_if0_3_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_debug_sop_in_count_if0_3_reg)

    // Constructor: new
    function new(string name = "tm_globals_debug_sop_in_count_if0_3");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        debug_sop_in_count_if0_3 = uvm_reg_field::type_id::create("debug_sop_in_count_if0_3", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        debug_sop_in_count_if0_3.configure(this, 40, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = tm_globals_debug_sop_in_count_if0_3_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = tm_globals_debug_sop_in_count_if0_3_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, debug_sop_in_count_if0_3.get_name, debug_sop_in_count_if0_3.value);
        return s;
    endfunction

endclass


// Class: tm_globals_debug_sop_in_count_if0_3_reg_cover
// Register coverage object.
class tm_globals_debug_sop_in_count_if0_3_reg_cover extends uvm_object;

    static local tm_globals_debug_sop_in_count_if0_3_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    tm_globals_debug_sop_in_count_if0_3_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        debug_sop_in_count_if0_3_wr: coverpoint r.debug_sop_in_count_if0_3.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        debug_sop_in_count_if0_3_rd: coverpoint r.debug_sop_in_count_if0_3.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_debug_sop_in_count_if0_3_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="tm_globals_debug_sop_in_count_if0_3_reg_cover");
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
    static function tm_globals_debug_sop_in_count_if0_3_reg_cover get();
        if (m_inst == null) begin
            m_inst = tm_globals_debug_sop_in_count_if0_3_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(tm_globals_debug_sop_in_count_if0_3_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class tm_globals_debug_eop_in_count_if0_3_reg_cover;

// Class: tm_globals_debug_eop_in_count_if0_3_reg
// Register tm_globals.debug_eop_in_count_if0_3: Counter On acd_stream EOP IN for interfaces 0 to 3.
class tm_globals_debug_eop_in_count_if0_3_reg extends uvm_reg;

    // Variable: debug_eop_in_count_if0_3
    // Eop in Count.
    rand uvm_reg_field debug_eop_in_count_if0_3;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static tm_globals_debug_eop_in_count_if0_3_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    tm_globals_debug_eop_in_count_if0_3_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_debug_eop_in_count_if0_3_reg)

    // Constructor: new
    function new(string name = "tm_globals_debug_eop_in_count_if0_3");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        debug_eop_in_count_if0_3 = uvm_reg_field::type_id::create("debug_eop_in_count_if0_3", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        debug_eop_in_count_if0_3.configure(this, 40, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = tm_globals_debug_eop_in_count_if0_3_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = tm_globals_debug_eop_in_count_if0_3_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, debug_eop_in_count_if0_3.get_name, debug_eop_in_count_if0_3.value);
        return s;
    endfunction

endclass


// Class: tm_globals_debug_eop_in_count_if0_3_reg_cover
// Register coverage object.
class tm_globals_debug_eop_in_count_if0_3_reg_cover extends uvm_object;

    static local tm_globals_debug_eop_in_count_if0_3_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    tm_globals_debug_eop_in_count_if0_3_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        debug_eop_in_count_if0_3_wr: coverpoint r.debug_eop_in_count_if0_3.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        debug_eop_in_count_if0_3_rd: coverpoint r.debug_eop_in_count_if0_3.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_debug_eop_in_count_if0_3_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="tm_globals_debug_eop_in_count_if0_3_reg_cover");
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
    static function tm_globals_debug_eop_in_count_if0_3_reg_cover get();
        if (m_inst == null) begin
            m_inst = tm_globals_debug_eop_in_count_if0_3_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(tm_globals_debug_eop_in_count_if0_3_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class tm_globals_debug_sop_out_count_if0_3_reg_cover;

// Class: tm_globals_debug_sop_out_count_if0_3_reg
// Register tm_globals.debug_sop_out_count_if0_3: Counter On acd_stream SOP OUT for interfaces 0 to 3.
class tm_globals_debug_sop_out_count_if0_3_reg extends uvm_reg;

    // Variable: debug_sop_out_count_if0_3
    // Sop in Count.
    rand uvm_reg_field debug_sop_out_count_if0_3;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static tm_globals_debug_sop_out_count_if0_3_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    tm_globals_debug_sop_out_count_if0_3_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_debug_sop_out_count_if0_3_reg)

    // Constructor: new
    function new(string name = "tm_globals_debug_sop_out_count_if0_3");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        debug_sop_out_count_if0_3 = uvm_reg_field::type_id::create("debug_sop_out_count_if0_3", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        debug_sop_out_count_if0_3.configure(this, 40, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = tm_globals_debug_sop_out_count_if0_3_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = tm_globals_debug_sop_out_count_if0_3_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, debug_sop_out_count_if0_3.get_name, debug_sop_out_count_if0_3.value);
        return s;
    endfunction

endclass


// Class: tm_globals_debug_sop_out_count_if0_3_reg_cover
// Register coverage object.
class tm_globals_debug_sop_out_count_if0_3_reg_cover extends uvm_object;

    static local tm_globals_debug_sop_out_count_if0_3_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    tm_globals_debug_sop_out_count_if0_3_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        debug_sop_out_count_if0_3_wr: coverpoint r.debug_sop_out_count_if0_3.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        debug_sop_out_count_if0_3_rd: coverpoint r.debug_sop_out_count_if0_3.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_debug_sop_out_count_if0_3_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="tm_globals_debug_sop_out_count_if0_3_reg_cover");
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
    static function tm_globals_debug_sop_out_count_if0_3_reg_cover get();
        if (m_inst == null) begin
            m_inst = tm_globals_debug_sop_out_count_if0_3_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(tm_globals_debug_sop_out_count_if0_3_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class tm_globals_debug_eop_out_count_if0_3_reg_cover;

// Class: tm_globals_debug_eop_out_count_if0_3_reg
// Register tm_globals.debug_eop_out_count_if0_3: Counter On acd_stream EOP OUT for interfaces 0 to 3.
class tm_globals_debug_eop_out_count_if0_3_reg extends uvm_reg;

    // Variable: debug_eop_out_count_if0_3
    // Sop in Count.
    rand uvm_reg_field debug_eop_out_count_if0_3;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static tm_globals_debug_eop_out_count_if0_3_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    tm_globals_debug_eop_out_count_if0_3_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_debug_eop_out_count_if0_3_reg)

    // Constructor: new
    function new(string name = "tm_globals_debug_eop_out_count_if0_3");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        debug_eop_out_count_if0_3 = uvm_reg_field::type_id::create("debug_eop_out_count_if0_3", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        debug_eop_out_count_if0_3.configure(this, 40, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = tm_globals_debug_eop_out_count_if0_3_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = tm_globals_debug_eop_out_count_if0_3_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, debug_eop_out_count_if0_3.get_name, debug_eop_out_count_if0_3.value);
        return s;
    endfunction

endclass


// Class: tm_globals_debug_eop_out_count_if0_3_reg_cover
// Register coverage object.
class tm_globals_debug_eop_out_count_if0_3_reg_cover extends uvm_object;

    static local tm_globals_debug_eop_out_count_if0_3_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    tm_globals_debug_eop_out_count_if0_3_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        debug_eop_out_count_if0_3_wr: coverpoint r.debug_eop_out_count_if0_3.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        debug_eop_out_count_if0_3_rd: coverpoint r.debug_eop_out_count_if0_3.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_debug_eop_out_count_if0_3_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="tm_globals_debug_eop_out_count_if0_3_reg_cover");
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
    static function tm_globals_debug_eop_out_count_if0_3_reg_cover get();
        if (m_inst == null) begin
            m_inst = tm_globals_debug_eop_out_count_if0_3_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(tm_globals_debug_eop_out_count_if0_3_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class tm_globals_queue_not_empty_cpu_reg_cover;

// Class: tm_globals_queue_not_empty_cpu_reg
// Register tm_globals.queue_not_empty_cpu: UNUSED FOR 6_3_2! Queue Not Empty Status for CPU queues.
class tm_globals_queue_not_empty_cpu_reg extends uvm_reg;

    // Variable: queue_not_empty_cpu
    // Indicate if a queue is not empty (One Hot Encoded).
    rand uvm_reg_field queue_not_empty_cpu;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static tm_globals_queue_not_empty_cpu_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    tm_globals_queue_not_empty_cpu_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_queue_not_empty_cpu_reg)

    // Constructor: new
    function new(string name = "tm_globals_queue_not_empty_cpu");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        queue_not_empty_cpu = uvm_reg_field::type_id::create("queue_not_empty_cpu", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        queue_not_empty_cpu.configure(this, 16, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = tm_globals_queue_not_empty_cpu_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = tm_globals_queue_not_empty_cpu_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, queue_not_empty_cpu.get_name, queue_not_empty_cpu.value);
        return s;
    endfunction

endclass


// Class: tm_globals_queue_not_empty_cpu_reg_cover
// Register coverage object.
class tm_globals_queue_not_empty_cpu_reg_cover extends uvm_object;

    static local tm_globals_queue_not_empty_cpu_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    tm_globals_queue_not_empty_cpu_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        queue_not_empty_cpu_wr: coverpoint r.queue_not_empty_cpu.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        queue_not_empty_cpu_rd: coverpoint r.queue_not_empty_cpu.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_queue_not_empty_cpu_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="tm_globals_queue_not_empty_cpu_reg_cover");
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
    static function tm_globals_queue_not_empty_cpu_reg_cover get();
        if (m_inst == null) begin
            m_inst = tm_globals_queue_not_empty_cpu_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(tm_globals_queue_not_empty_cpu_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class tm_globals_queue_not_empty_mon0_reg_cover;

// Class: tm_globals_queue_not_empty_mon0_reg
// Register tm_globals.queue_not_empty_mon0: UNUSED FOR 6_3_2! Queue Not Empty Status for MON0 queues.
class tm_globals_queue_not_empty_mon0_reg extends uvm_reg;

    // Variable: queue_not_empty_mon0
    // Indicate if a queue is not empty (One Hot Encoded).
    rand uvm_reg_field queue_not_empty_mon0;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static tm_globals_queue_not_empty_mon0_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    tm_globals_queue_not_empty_mon0_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_queue_not_empty_mon0_reg)

    // Constructor: new
    function new(string name = "tm_globals_queue_not_empty_mon0");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        queue_not_empty_mon0 = uvm_reg_field::type_id::create("queue_not_empty_mon0", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        queue_not_empty_mon0.configure(this, 16, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = tm_globals_queue_not_empty_mon0_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = tm_globals_queue_not_empty_mon0_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, queue_not_empty_mon0.get_name, queue_not_empty_mon0.value);
        return s;
    endfunction

endclass


// Class: tm_globals_queue_not_empty_mon0_reg_cover
// Register coverage object.
class tm_globals_queue_not_empty_mon0_reg_cover extends uvm_object;

    static local tm_globals_queue_not_empty_mon0_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    tm_globals_queue_not_empty_mon0_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        queue_not_empty_mon0_wr: coverpoint r.queue_not_empty_mon0.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        queue_not_empty_mon0_rd: coverpoint r.queue_not_empty_mon0.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_queue_not_empty_mon0_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="tm_globals_queue_not_empty_mon0_reg_cover");
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
    static function tm_globals_queue_not_empty_mon0_reg_cover get();
        if (m_inst == null) begin
            m_inst = tm_globals_queue_not_empty_mon0_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(tm_globals_queue_not_empty_mon0_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class tm_globals_queue_not_empty_mon1_reg_cover;

// Class: tm_globals_queue_not_empty_mon1_reg
// Register tm_globals.queue_not_empty_mon1: UNUSED FOR 6_3_2! Queue Not Empty Status for MON1 queues.
class tm_globals_queue_not_empty_mon1_reg extends uvm_reg;

    // Variable: queue_not_empty_mon1
    // Indicate if a queue is not empty (One Hot Encoded).
    rand uvm_reg_field queue_not_empty_mon1;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static tm_globals_queue_not_empty_mon1_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    tm_globals_queue_not_empty_mon1_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_queue_not_empty_mon1_reg)

    // Constructor: new
    function new(string name = "tm_globals_queue_not_empty_mon1");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        queue_not_empty_mon1 = uvm_reg_field::type_id::create("queue_not_empty_mon1", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        queue_not_empty_mon1.configure(this, 16, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = tm_globals_queue_not_empty_mon1_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = tm_globals_queue_not_empty_mon1_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, queue_not_empty_mon1.get_name, queue_not_empty_mon1.value);
        return s;
    endfunction

endclass


// Class: tm_globals_queue_not_empty_mon1_reg_cover
// Register coverage object.
class tm_globals_queue_not_empty_mon1_reg_cover extends uvm_object;

    static local tm_globals_queue_not_empty_mon1_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    tm_globals_queue_not_empty_mon1_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        queue_not_empty_mon1_wr: coverpoint r.queue_not_empty_mon1.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        queue_not_empty_mon1_rd: coverpoint r.queue_not_empty_mon1.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_queue_not_empty_mon1_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="tm_globals_queue_not_empty_mon1_reg_cover");
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
    static function tm_globals_queue_not_empty_mon1_reg_cover get();
        if (m_inst == null) begin
            m_inst = tm_globals_queue_not_empty_mon1_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(tm_globals_queue_not_empty_mon1_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class tm_globals_queue_not_empty_nni0_reg_cover;

// Class: tm_globals_queue_not_empty_nni0_reg
// Register tm_globals.queue_not_empty_nni0: Queue Not Empty Status for NNI0 queues.
class tm_globals_queue_not_empty_nni0_reg extends uvm_reg;

    // Variable: queue_not_empty_nni0
    // Indicate if a queue is not empty (One Hot Encoded).
    rand uvm_reg_field queue_not_empty_nni0;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static tm_globals_queue_not_empty_nni0_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    tm_globals_queue_not_empty_nni0_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_queue_not_empty_nni0_reg)

    // Constructor: new
    function new(string name = "tm_globals_queue_not_empty_nni0");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        queue_not_empty_nni0 = uvm_reg_field::type_id::create("queue_not_empty_nni0", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        queue_not_empty_nni0.configure(this, 64, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = tm_globals_queue_not_empty_nni0_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = tm_globals_queue_not_empty_nni0_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, queue_not_empty_nni0.get_name, queue_not_empty_nni0.value);
        return s;
    endfunction

endclass


// Class: tm_globals_queue_not_empty_nni0_reg_cover
// Register coverage object.
class tm_globals_queue_not_empty_nni0_reg_cover extends uvm_object;

    static local tm_globals_queue_not_empty_nni0_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    tm_globals_queue_not_empty_nni0_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        queue_not_empty_nni0_wr: coverpoint r.queue_not_empty_nni0.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        queue_not_empty_nni0_rd: coverpoint r.queue_not_empty_nni0.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_queue_not_empty_nni0_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="tm_globals_queue_not_empty_nni0_reg_cover");
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
    static function tm_globals_queue_not_empty_nni0_reg_cover get();
        if (m_inst == null) begin
            m_inst = tm_globals_queue_not_empty_nni0_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(tm_globals_queue_not_empty_nni0_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class tm_globals_queue_not_empty_nni1_reg_cover;

// Class: tm_globals_queue_not_empty_nni1_reg
// Register tm_globals.queue_not_empty_nni1: Queue Not Empty Status for NNI1 queues.
class tm_globals_queue_not_empty_nni1_reg extends uvm_reg;

    // Variable: queue_not_empty_nni0
    // Indicate if a queue is not empty (One Hot Encoded).
    rand uvm_reg_field queue_not_empty_nni0;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static tm_globals_queue_not_empty_nni1_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    tm_globals_queue_not_empty_nni1_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_queue_not_empty_nni1_reg)

    // Constructor: new
    function new(string name = "tm_globals_queue_not_empty_nni1");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        queue_not_empty_nni0 = uvm_reg_field::type_id::create("queue_not_empty_nni0", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        queue_not_empty_nni0.configure(this, 64, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = tm_globals_queue_not_empty_nni1_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = tm_globals_queue_not_empty_nni1_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, queue_not_empty_nni0.get_name, queue_not_empty_nni0.value);
        return s;
    endfunction

endclass


// Class: tm_globals_queue_not_empty_nni1_reg_cover
// Register coverage object.
class tm_globals_queue_not_empty_nni1_reg_cover extends uvm_object;

    static local tm_globals_queue_not_empty_nni1_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    tm_globals_queue_not_empty_nni1_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        queue_not_empty_nni0_wr: coverpoint r.queue_not_empty_nni0.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        queue_not_empty_nni0_rd: coverpoint r.queue_not_empty_nni0.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_queue_not_empty_nni1_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="tm_globals_queue_not_empty_nni1_reg_cover");
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
    static function tm_globals_queue_not_empty_nni1_reg_cover get();
        if (m_inst == null) begin
            m_inst = tm_globals_queue_not_empty_nni1_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(tm_globals_queue_not_empty_nni1_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class tm_globals_queue_not_empty_uni_reg_cover;

// Class: tm_globals_queue_not_empty_uni_reg
// Register tm_globals.queue_not_empty_uni: Queue Not Empty Status for UNI queues.
class tm_globals_queue_not_empty_uni_reg extends uvm_reg;

    // Variable: queue_not_empty_uni
    // Indicate if a queue is not empty (One Hot Encoded).
    rand uvm_reg_field queue_not_empty_uni;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static tm_globals_queue_not_empty_uni_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    tm_globals_queue_not_empty_uni_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_queue_not_empty_uni_reg)

    // Constructor: new
    function new(string name = "tm_globals_queue_not_empty_uni");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        queue_not_empty_uni = uvm_reg_field::type_id::create("queue_not_empty_uni", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        queue_not_empty_uni.configure(this, 64, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = tm_globals_queue_not_empty_uni_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = tm_globals_queue_not_empty_uni_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, queue_not_empty_uni.get_name, queue_not_empty_uni.value);
        return s;
    endfunction

endclass


// Class: tm_globals_queue_not_empty_uni_reg_cover
// Register coverage object.
class tm_globals_queue_not_empty_uni_reg_cover extends uvm_object;

    static local tm_globals_queue_not_empty_uni_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    tm_globals_queue_not_empty_uni_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        queue_not_empty_uni_wr: coverpoint r.queue_not_empty_uni.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        queue_not_empty_uni_rd: coverpoint r.queue_not_empty_uni.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_queue_not_empty_uni_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="tm_globals_queue_not_empty_uni_reg_cover");
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
    static function tm_globals_queue_not_empty_uni_reg_cover get();
        if (m_inst == null) begin
            m_inst = tm_globals_queue_not_empty_uni_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(tm_globals_queue_not_empty_uni_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class tm_globals_input_packet_drop_counters_reg_cover;

// Class: tm_globals_input_packet_drop_counters_reg
// Register tm_globals.input_packet_drop_counters: Counters are incremented when write engine cannot handle the input packet because the RAM is busy. It should never append.
class tm_globals_input_packet_drop_counters_reg extends uvm_reg;

    // Variable: input_packet_drop_counter
    // Count drop of complete packets.
    rand uvm_reg_field input_packet_drop_counter;
    // Variable: input_packet_trunc_counter
    // Count truncated packets.
    rand uvm_reg_field input_packet_trunc_counter;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static tm_globals_input_packet_drop_counters_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    tm_globals_input_packet_drop_counters_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_input_packet_drop_counters_reg)

    // Constructor: new
    function new(string name = "tm_globals_input_packet_drop_counters");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        input_packet_drop_counter = uvm_reg_field::type_id::create("input_packet_drop_counter", , get_full_name());
        input_packet_trunc_counter = uvm_reg_field::type_id::create("input_packet_trunc_counter", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        input_packet_drop_counter.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
        input_packet_trunc_counter.configure(this, 32, 32, "RO", 0, 'h0, 1, 1, 0);
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
                cg = tm_globals_input_packet_drop_counters_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = tm_globals_input_packet_drop_counters_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, input_packet_drop_counter.get_name, input_packet_drop_counter.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, input_packet_trunc_counter.get_name, input_packet_trunc_counter.value);
        return s;
    endfunction

endclass


// Class: tm_globals_input_packet_drop_counters_reg_cover
// Register coverage object.
class tm_globals_input_packet_drop_counters_reg_cover extends uvm_object;

    static local tm_globals_input_packet_drop_counters_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    tm_globals_input_packet_drop_counters_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        input_packet_drop_counter_wr: coverpoint r.input_packet_drop_counter.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        input_packet_drop_counter_rd: coverpoint r.input_packet_drop_counter.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        input_packet_trunc_counter_wr: coverpoint r.input_packet_trunc_counter.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        input_packet_trunc_counter_rd: coverpoint r.input_packet_trunc_counter.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_input_packet_drop_counters_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="tm_globals_input_packet_drop_counters_reg_cover");
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
    static function tm_globals_input_packet_drop_counters_reg_cover get();
        if (m_inst == null) begin
            m_inst = tm_globals_input_packet_drop_counters_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(tm_globals_input_packet_drop_counters_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass





// Class: tm_globals_reg_block
// Register Block .tm_globals: 
class tm_globals_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand tm_globals_free_mau_almost_empty_level_reg free_mau_almost_empty_level;
    rand tm_globals_tm_ready_reg tm_ready;
    rand tm_globals_fatal_queues_port_cpu_reg fatal_queues_port_cpu;
    rand tm_globals_fatal_queues_port_mon0_reg fatal_queues_port_mon0;
    rand tm_globals_fatal_queues_port_mon1_reg fatal_queues_port_mon1;
    rand tm_globals_fatal_queues_global_status_reg fatal_queues_global_status;
    rand tm_globals_arbiter_parity_error_counter_reg arbiter_parity_error_counter;
    rand tm_globals_discard_error_config_reg discard_error_config;
    rand tm_globals_debug_system_reg debug_system;
    rand tm_globals_debug_fmau_count_reg debug_fmau_count;
    rand tm_globals_debug_level_fmau_count_reg debug_level_fmau_count;
    rand tm_globals_debug_ram_arbiter_reset_reg debug_ram_arbiter_reset;
    rand tm_globals_debug_ram_arbiter_time_busy_count_ctrl0_reg debug_ram_arbiter_time_busy_count_ctrl0;
    rand tm_globals_debug_ram_arbiter_wr_rd_count_ctrl0_reg debug_ram_arbiter_wr_rd_count_ctrl0;
    rand tm_globals_debug_ram_arbiter_busy_count_ctrl1_reg debug_ram_arbiter_busy_count_ctrl1;
    rand tm_globals_debug_ram_arbiter_wr_rd_count_ctrl1_reg debug_ram_arbiter_wr_rd_count_ctrl1;
    rand tm_globals_debug_ram_arbiter_busy_count_ctrl2_reg debug_ram_arbiter_busy_count_ctrl2;
    rand tm_globals_debug_ram_arbiter_wr_rd_count_ctrl2_reg debug_ram_arbiter_wr_rd_count_ctrl2;
    rand tm_globals_debug_ram_arbiter_time_busy_count_data_reg debug_ram_arbiter_time_busy_count_data;
    rand tm_globals_debug_ram_arbiter_wr_rd_count_data_reg debug_ram_arbiter_wr_rd_count_data;
    rand tm_globals_queue_not_empty_cpu_reg queue_not_empty_cpu;
    rand tm_globals_queue_not_empty_mon0_reg queue_not_empty_mon0;
    rand tm_globals_queue_not_empty_mon1_reg queue_not_empty_mon1;
    rand tm_globals_fatal_queues_port_nni0_reg fatal_queues_port_nni0[];
    rand tm_globals_fatal_queues_port_nni1_reg fatal_queues_port_nni1[];
    rand tm_globals_fatal_queues_port_uni_reg fatal_queues_port_uni[];
    rand tm_globals_debug_sop_in_count_if4_reg debug_sop_in_count_if4[];
    rand tm_globals_debug_eop_in_count_if4_reg debug_eop_in_count_if4[];
    rand tm_globals_debug_sop_out_count_if4_reg debug_sop_out_count_if4[];
    rand tm_globals_debug_eop_out_count_if4_reg debug_eop_out_count_if4[];
    rand tm_globals_debug_sop_in_count_if0_3_reg debug_sop_in_count_if0_3[];
    rand tm_globals_debug_eop_in_count_if0_3_reg debug_eop_in_count_if0_3[];
    rand tm_globals_debug_sop_out_count_if0_3_reg debug_sop_out_count_if0_3[];
    rand tm_globals_debug_eop_out_count_if0_3_reg debug_eop_out_count_if0_3[];
    rand tm_globals_queue_not_empty_nni0_reg queue_not_empty_nni0[];
    rand tm_globals_queue_not_empty_nni1_reg queue_not_empty_nni1[];
    rand tm_globals_queue_not_empty_uni_reg queue_not_empty_uni[];
    rand tm_globals_input_packet_drop_counters_reg input_packet_drop_counters[];

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(tm_globals_reg_pkg::tm_globals_reg_block)

    // Constructor: new
    function new(string name = "tm_globals_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        fatal_queues_port_nni0 = new[4];
        fatal_queues_port_nni1 = new[4];
        fatal_queues_port_uni = new[6];
        debug_sop_in_count_if4 = new[10];
        debug_eop_in_count_if4 = new[10];
        debug_sop_out_count_if4 = new[10];
        debug_eop_out_count_if4 = new[10];
        debug_sop_in_count_if0_3 = new[4];
        debug_eop_in_count_if0_3 = new[4];
        debug_sop_out_count_if0_3 = new[4];
        debug_eop_out_count_if0_3 = new[4];
        queue_not_empty_nni0 = new[2];
        queue_not_empty_nni1 = new[2];
        queue_not_empty_uni = new[3];
        input_packet_drop_counters = new[5];

        free_mau_almost_empty_level = tm_globals_free_mau_almost_empty_level_reg::type_id::create("free_mau_almost_empty_level", , get_full_name());
        tm_ready = tm_globals_tm_ready_reg::type_id::create("tm_ready", , get_full_name());
        fatal_queues_port_cpu = tm_globals_fatal_queues_port_cpu_reg::type_id::create("fatal_queues_port_cpu", , get_full_name());
        fatal_queues_port_mon0 = tm_globals_fatal_queues_port_mon0_reg::type_id::create("fatal_queues_port_mon0", , get_full_name());
        fatal_queues_port_mon1 = tm_globals_fatal_queues_port_mon1_reg::type_id::create("fatal_queues_port_mon1", , get_full_name());
        fatal_queues_global_status = tm_globals_fatal_queues_global_status_reg::type_id::create("fatal_queues_global_status", , get_full_name());
        arbiter_parity_error_counter = tm_globals_arbiter_parity_error_counter_reg::type_id::create("arbiter_parity_error_counter", , get_full_name());
        discard_error_config = tm_globals_discard_error_config_reg::type_id::create("discard_error_config", , get_full_name());
        debug_system = tm_globals_debug_system_reg::type_id::create("debug_system", , get_full_name());
        debug_fmau_count = tm_globals_debug_fmau_count_reg::type_id::create("debug_fmau_count", , get_full_name());
        debug_level_fmau_count = tm_globals_debug_level_fmau_count_reg::type_id::create("debug_level_fmau_count", , get_full_name());
        debug_ram_arbiter_reset = tm_globals_debug_ram_arbiter_reset_reg::type_id::create("debug_ram_arbiter_reset", , get_full_name());
        debug_ram_arbiter_time_busy_count_ctrl0 = tm_globals_debug_ram_arbiter_time_busy_count_ctrl0_reg::type_id::create("debug_ram_arbiter_time_busy_count_ctrl0", , get_full_name());
        debug_ram_arbiter_wr_rd_count_ctrl0 = tm_globals_debug_ram_arbiter_wr_rd_count_ctrl0_reg::type_id::create("debug_ram_arbiter_wr_rd_count_ctrl0", , get_full_name());
        debug_ram_arbiter_busy_count_ctrl1 = tm_globals_debug_ram_arbiter_busy_count_ctrl1_reg::type_id::create("debug_ram_arbiter_busy_count_ctrl1", , get_full_name());
        debug_ram_arbiter_wr_rd_count_ctrl1 = tm_globals_debug_ram_arbiter_wr_rd_count_ctrl1_reg::type_id::create("debug_ram_arbiter_wr_rd_count_ctrl1", , get_full_name());
        debug_ram_arbiter_busy_count_ctrl2 = tm_globals_debug_ram_arbiter_busy_count_ctrl2_reg::type_id::create("debug_ram_arbiter_busy_count_ctrl2", , get_full_name());
        debug_ram_arbiter_wr_rd_count_ctrl2 = tm_globals_debug_ram_arbiter_wr_rd_count_ctrl2_reg::type_id::create("debug_ram_arbiter_wr_rd_count_ctrl2", , get_full_name());
        debug_ram_arbiter_time_busy_count_data = tm_globals_debug_ram_arbiter_time_busy_count_data_reg::type_id::create("debug_ram_arbiter_time_busy_count_data", , get_full_name());
        debug_ram_arbiter_wr_rd_count_data = tm_globals_debug_ram_arbiter_wr_rd_count_data_reg::type_id::create("debug_ram_arbiter_wr_rd_count_data", , get_full_name());
        queue_not_empty_cpu = tm_globals_queue_not_empty_cpu_reg::type_id::create("queue_not_empty_cpu", , get_full_name());
        queue_not_empty_mon0 = tm_globals_queue_not_empty_mon0_reg::type_id::create("queue_not_empty_mon0", , get_full_name());
        queue_not_empty_mon1 = tm_globals_queue_not_empty_mon1_reg::type_id::create("queue_not_empty_mon1", , get_full_name());
        foreach(fatal_queues_port_nni0[m]) begin
            fatal_queues_port_nni0[m] = tm_globals_fatal_queues_port_nni0_reg::type_id::create($sformatf("fatal_queues_port_nni0[%0d]",m), , get_full_name());
        end
        foreach(fatal_queues_port_nni1[m]) begin
            fatal_queues_port_nni1[m] = tm_globals_fatal_queues_port_nni1_reg::type_id::create($sformatf("fatal_queues_port_nni1[%0d]",m), , get_full_name());
        end
        foreach(fatal_queues_port_uni[m]) begin
            fatal_queues_port_uni[m] = tm_globals_fatal_queues_port_uni_reg::type_id::create($sformatf("fatal_queues_port_uni[%0d]",m), , get_full_name());
        end
        foreach(debug_sop_in_count_if4[m]) begin
            debug_sop_in_count_if4[m] = tm_globals_debug_sop_in_count_if4_reg::type_id::create($sformatf("debug_sop_in_count_if4[%0d]",m), , get_full_name());
        end
        foreach(debug_eop_in_count_if4[m]) begin
            debug_eop_in_count_if4[m] = tm_globals_debug_eop_in_count_if4_reg::type_id::create($sformatf("debug_eop_in_count_if4[%0d]",m), , get_full_name());
        end
        foreach(debug_sop_out_count_if4[m]) begin
            debug_sop_out_count_if4[m] = tm_globals_debug_sop_out_count_if4_reg::type_id::create($sformatf("debug_sop_out_count_if4[%0d]",m), , get_full_name());
        end
        foreach(debug_eop_out_count_if4[m]) begin
            debug_eop_out_count_if4[m] = tm_globals_debug_eop_out_count_if4_reg::type_id::create($sformatf("debug_eop_out_count_if4[%0d]",m), , get_full_name());
        end
        foreach(debug_sop_in_count_if0_3[m]) begin
            debug_sop_in_count_if0_3[m] = tm_globals_debug_sop_in_count_if0_3_reg::type_id::create($sformatf("debug_sop_in_count_if0_3[%0d]",m), , get_full_name());
        end
        foreach(debug_eop_in_count_if0_3[m]) begin
            debug_eop_in_count_if0_3[m] = tm_globals_debug_eop_in_count_if0_3_reg::type_id::create($sformatf("debug_eop_in_count_if0_3[%0d]",m), , get_full_name());
        end
        foreach(debug_sop_out_count_if0_3[m]) begin
            debug_sop_out_count_if0_3[m] = tm_globals_debug_sop_out_count_if0_3_reg::type_id::create($sformatf("debug_sop_out_count_if0_3[%0d]",m), , get_full_name());
        end
        foreach(debug_eop_out_count_if0_3[m]) begin
            debug_eop_out_count_if0_3[m] = tm_globals_debug_eop_out_count_if0_3_reg::type_id::create($sformatf("debug_eop_out_count_if0_3[%0d]",m), , get_full_name());
        end
        foreach(queue_not_empty_nni0[m]) begin
            queue_not_empty_nni0[m] = tm_globals_queue_not_empty_nni0_reg::type_id::create($sformatf("queue_not_empty_nni0[%0d]",m), , get_full_name());
        end
        foreach(queue_not_empty_nni1[m]) begin
            queue_not_empty_nni1[m] = tm_globals_queue_not_empty_nni1_reg::type_id::create($sformatf("queue_not_empty_nni1[%0d]",m), , get_full_name());
        end
        foreach(queue_not_empty_uni[m]) begin
            queue_not_empty_uni[m] = tm_globals_queue_not_empty_uni_reg::type_id::create($sformatf("queue_not_empty_uni[%0d]",m), , get_full_name());
        end
        foreach(input_packet_drop_counters[m]) begin
            input_packet_drop_counters[m] = tm_globals_input_packet_drop_counters_reg::type_id::create($sformatf("input_packet_drop_counters[%0d]",m), , get_full_name());
        end

        free_mau_almost_empty_level.configure(this);
        tm_ready.configure(this);
        fatal_queues_port_cpu.configure(this);
        fatal_queues_port_mon0.configure(this);
        fatal_queues_port_mon1.configure(this);
        fatal_queues_global_status.configure(this);
        arbiter_parity_error_counter.configure(this);
        discard_error_config.configure(this);
        debug_system.configure(this);
        debug_fmau_count.configure(this);
        debug_level_fmau_count.configure(this);
        debug_ram_arbiter_reset.configure(this);
        debug_ram_arbiter_time_busy_count_ctrl0.configure(this);
        debug_ram_arbiter_wr_rd_count_ctrl0.configure(this);
        debug_ram_arbiter_busy_count_ctrl1.configure(this);
        debug_ram_arbiter_wr_rd_count_ctrl1.configure(this);
        debug_ram_arbiter_busy_count_ctrl2.configure(this);
        debug_ram_arbiter_wr_rd_count_ctrl2.configure(this);
        debug_ram_arbiter_time_busy_count_data.configure(this);
        debug_ram_arbiter_wr_rd_count_data.configure(this);
        queue_not_empty_cpu.configure(this);
        queue_not_empty_mon0.configure(this);
        queue_not_empty_mon1.configure(this);
        foreach(fatal_queues_port_nni0[m]) begin
            fatal_queues_port_nni0[m].configure(this);
        end
        foreach(fatal_queues_port_nni1[m]) begin
            fatal_queues_port_nni1[m].configure(this);
        end
        foreach(fatal_queues_port_uni[m]) begin
            fatal_queues_port_uni[m].configure(this);
        end
        foreach(debug_sop_in_count_if4[m]) begin
            debug_sop_in_count_if4[m].configure(this);
        end
        foreach(debug_eop_in_count_if4[m]) begin
            debug_eop_in_count_if4[m].configure(this);
        end
        foreach(debug_sop_out_count_if4[m]) begin
            debug_sop_out_count_if4[m].configure(this);
        end
        foreach(debug_eop_out_count_if4[m]) begin
            debug_eop_out_count_if4[m].configure(this);
        end
        foreach(debug_sop_in_count_if0_3[m]) begin
            debug_sop_in_count_if0_3[m].configure(this);
        end
        foreach(debug_eop_in_count_if0_3[m]) begin
            debug_eop_in_count_if0_3[m].configure(this);
        end
        foreach(debug_sop_out_count_if0_3[m]) begin
            debug_sop_out_count_if0_3[m].configure(this);
        end
        foreach(debug_eop_out_count_if0_3[m]) begin
            debug_eop_out_count_if0_3[m].configure(this);
        end
        foreach(queue_not_empty_nni0[m]) begin
            queue_not_empty_nni0[m].configure(this);
        end
        foreach(queue_not_empty_nni1[m]) begin
            queue_not_empty_nni1[m].configure(this);
        end
        foreach(queue_not_empty_uni[m]) begin
            queue_not_empty_uni[m].configure(this);
        end
        foreach(input_packet_drop_counters[m]) begin
            input_packet_drop_counters[m].configure(this);
        end

        free_mau_almost_empty_level.build();
        tm_ready.build();
        fatal_queues_port_cpu.build();
        fatal_queues_port_mon0.build();
        fatal_queues_port_mon1.build();
        fatal_queues_global_status.build();
        arbiter_parity_error_counter.build();
        discard_error_config.build();
        debug_system.build();
        debug_fmau_count.build();
        debug_level_fmau_count.build();
        debug_ram_arbiter_reset.build();
        debug_ram_arbiter_time_busy_count_ctrl0.build();
        debug_ram_arbiter_wr_rd_count_ctrl0.build();
        debug_ram_arbiter_busy_count_ctrl1.build();
        debug_ram_arbiter_wr_rd_count_ctrl1.build();
        debug_ram_arbiter_busy_count_ctrl2.build();
        debug_ram_arbiter_wr_rd_count_ctrl2.build();
        debug_ram_arbiter_time_busy_count_data.build();
        debug_ram_arbiter_wr_rd_count_data.build();
        queue_not_empty_cpu.build();
        queue_not_empty_mon0.build();
        queue_not_empty_mon1.build();
        foreach(fatal_queues_port_nni0[m]) begin
            fatal_queues_port_nni0[m].build();
        end
        foreach(fatal_queues_port_nni1[m]) begin
            fatal_queues_port_nni1[m].build();
        end
        foreach(fatal_queues_port_uni[m]) begin
            fatal_queues_port_uni[m].build();
        end
        foreach(debug_sop_in_count_if4[m]) begin
            debug_sop_in_count_if4[m].build();
        end
        foreach(debug_eop_in_count_if4[m]) begin
            debug_eop_in_count_if4[m].build();
        end
        foreach(debug_sop_out_count_if4[m]) begin
            debug_sop_out_count_if4[m].build();
        end
        foreach(debug_eop_out_count_if4[m]) begin
            debug_eop_out_count_if4[m].build();
        end
        foreach(debug_sop_in_count_if0_3[m]) begin
            debug_sop_in_count_if0_3[m].build();
        end
        foreach(debug_eop_in_count_if0_3[m]) begin
            debug_eop_in_count_if0_3[m].build();
        end
        foreach(debug_sop_out_count_if0_3[m]) begin
            debug_sop_out_count_if0_3[m].build();
        end
        foreach(debug_eop_out_count_if0_3[m]) begin
            debug_eop_out_count_if0_3[m].build();
        end
        foreach(queue_not_empty_nni0[m]) begin
            queue_not_empty_nni0[m].build();
        end
        foreach(queue_not_empty_nni1[m]) begin
            queue_not_empty_nni1[m].build();
        end
        foreach(queue_not_empty_uni[m]) begin
            queue_not_empty_uni[m].build();
        end
        foreach(input_packet_drop_counters[m]) begin
            input_packet_drop_counters[m].build();
        end

        // define default map
        default_map = create_map("tm_globals_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        this.default_map.add_reg(free_mau_almost_empty_level, 'h0, "RW");
        this.default_map.add_reg(tm_ready, 'h1, "RO");
        this.default_map.add_reg(fatal_queues_port_cpu, 'h100, "RO");
        this.default_map.add_reg(fatal_queues_port_mon0, 'h110, "RO");
        this.default_map.add_reg(fatal_queues_port_mon1, 'h120, "RO");
        this.default_map.add_reg(fatal_queues_global_status, 'h160, "RO");
        this.default_map.add_reg(arbiter_parity_error_counter, 'h170, "RO");
        this.default_map.add_reg(discard_error_config, 'h300, "RW");
        this.default_map.add_reg(debug_system, 'h400, "RO");
        this.default_map.add_reg(debug_fmau_count, 'h401, "RO");
        this.default_map.add_reg(debug_level_fmau_count, 'h402, "RO");
        this.default_map.add_reg(debug_ram_arbiter_reset, 'h403, "RW");
        this.default_map.add_reg(debug_ram_arbiter_time_busy_count_ctrl0, 'h404, "RO");
        this.default_map.add_reg(debug_ram_arbiter_wr_rd_count_ctrl0, 'h405, "RO");
        this.default_map.add_reg(debug_ram_arbiter_busy_count_ctrl1, 'h406, "RO");
        this.default_map.add_reg(debug_ram_arbiter_wr_rd_count_ctrl1, 'h407, "RO");
        this.default_map.add_reg(debug_ram_arbiter_busy_count_ctrl2, 'h408, "RO");
        this.default_map.add_reg(debug_ram_arbiter_wr_rd_count_ctrl2, 'h409, "RO");
        this.default_map.add_reg(debug_ram_arbiter_time_busy_count_data, 'h40A, "RO");
        this.default_map.add_reg(debug_ram_arbiter_wr_rd_count_data, 'h40B, "RO");
        this.default_map.add_reg(queue_not_empty_cpu, 'h500, "RO");
        this.default_map.add_reg(queue_not_empty_mon0, 'h501, "RO");
        this.default_map.add_reg(queue_not_empty_mon1, 'h502, "RO");
        foreach(fatal_queues_port_nni0[m]) begin
            this.default_map.add_reg(this.fatal_queues_port_nni0[m], 'h130 + m, "RO");
        end
        foreach(fatal_queues_port_nni1[m]) begin
            this.default_map.add_reg(this.fatal_queues_port_nni1[m], 'h140 + m, "RO");
        end
        foreach(fatal_queues_port_uni[m]) begin
            this.default_map.add_reg(this.fatal_queues_port_uni[m], 'h150 + m, "RO");
        end
        foreach(debug_sop_in_count_if4[m]) begin
            this.default_map.add_reg(this.debug_sop_in_count_if4[m], 'h440 + m, "RO");
        end
        foreach(debug_eop_in_count_if4[m]) begin
            this.default_map.add_reg(this.debug_eop_in_count_if4[m], 'h450 + m, "RO");
        end
        foreach(debug_sop_out_count_if4[m]) begin
            this.default_map.add_reg(this.debug_sop_out_count_if4[m], 'h460 + m, "RO");
        end
        foreach(debug_eop_out_count_if4[m]) begin
            this.default_map.add_reg(this.debug_eop_out_count_if4[m], 'h470 + m, "RO");
        end
        foreach(debug_sop_in_count_if0_3[m]) begin
            this.default_map.add_reg(this.debug_sop_in_count_if0_3[m], 'h480 + m, "RO");
        end
        foreach(debug_eop_in_count_if0_3[m]) begin
            this.default_map.add_reg(this.debug_eop_in_count_if0_3[m], 'h490 + m, "RO");
        end
        foreach(debug_sop_out_count_if0_3[m]) begin
            this.default_map.add_reg(this.debug_sop_out_count_if0_3[m], 'h4A0 + m, "RO");
        end
        foreach(debug_eop_out_count_if0_3[m]) begin
            this.default_map.add_reg(this.debug_eop_out_count_if0_3[m], 'h4B0 + m, "RO");
        end
        foreach(queue_not_empty_nni0[m]) begin
            this.default_map.add_reg(this.queue_not_empty_nni0[m], 'h504 + m, "RO");
        end
        foreach(queue_not_empty_nni1[m]) begin
            this.default_map.add_reg(this.queue_not_empty_nni1[m], 'h506 + m, "RO");
        end
        foreach(queue_not_empty_uni[m]) begin
            this.default_map.add_reg(this.queue_not_empty_uni[m], 'h508 + m, "RO");
        end
        foreach(input_packet_drop_counters[m]) begin
            this.default_map.add_reg(this.input_packet_drop_counters[m], 'h600 + m, "RO");
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
        free_mau_almost_empty_level.enable_coverage(is_on, this.cg_per_instance);
        tm_ready.enable_coverage(is_on, this.cg_per_instance);
        fatal_queues_port_cpu.enable_coverage(is_on, this.cg_per_instance);
        fatal_queues_port_mon0.enable_coverage(is_on, this.cg_per_instance);
        fatal_queues_port_mon1.enable_coverage(is_on, this.cg_per_instance);
        fatal_queues_global_status.enable_coverage(is_on, this.cg_per_instance);
        arbiter_parity_error_counter.enable_coverage(is_on, this.cg_per_instance);
        discard_error_config.enable_coverage(is_on, this.cg_per_instance);
        debug_system.enable_coverage(is_on, this.cg_per_instance);
        debug_fmau_count.enable_coverage(is_on, this.cg_per_instance);
        debug_level_fmau_count.enable_coverage(is_on, this.cg_per_instance);
        debug_ram_arbiter_reset.enable_coverage(is_on, this.cg_per_instance);
        debug_ram_arbiter_time_busy_count_ctrl0.enable_coverage(is_on, this.cg_per_instance);
        debug_ram_arbiter_wr_rd_count_ctrl0.enable_coverage(is_on, this.cg_per_instance);
        debug_ram_arbiter_busy_count_ctrl1.enable_coverage(is_on, this.cg_per_instance);
        debug_ram_arbiter_wr_rd_count_ctrl1.enable_coverage(is_on, this.cg_per_instance);
        debug_ram_arbiter_busy_count_ctrl2.enable_coverage(is_on, this.cg_per_instance);
        debug_ram_arbiter_wr_rd_count_ctrl2.enable_coverage(is_on, this.cg_per_instance);
        debug_ram_arbiter_time_busy_count_data.enable_coverage(is_on, this.cg_per_instance);
        debug_ram_arbiter_wr_rd_count_data.enable_coverage(is_on, this.cg_per_instance);
        queue_not_empty_cpu.enable_coverage(is_on, this.cg_per_instance);
        queue_not_empty_mon0.enable_coverage(is_on, this.cg_per_instance);
        queue_not_empty_mon1.enable_coverage(is_on, this.cg_per_instance);
        foreach(fatal_queues_port_nni0[m]) begin
            fatal_queues_port_nni0[m].enable_coverage(is_on, this.cg_per_instance);
        end
        foreach(fatal_queues_port_nni1[m]) begin
            fatal_queues_port_nni1[m].enable_coverage(is_on, this.cg_per_instance);
        end
        foreach(fatal_queues_port_uni[m]) begin
            fatal_queues_port_uni[m].enable_coverage(is_on, this.cg_per_instance);
        end
        foreach(debug_sop_in_count_if4[m]) begin
            debug_sop_in_count_if4[m].enable_coverage(is_on, this.cg_per_instance);
        end
        foreach(debug_eop_in_count_if4[m]) begin
            debug_eop_in_count_if4[m].enable_coverage(is_on, this.cg_per_instance);
        end
        foreach(debug_sop_out_count_if4[m]) begin
            debug_sop_out_count_if4[m].enable_coverage(is_on, this.cg_per_instance);
        end
        foreach(debug_eop_out_count_if4[m]) begin
            debug_eop_out_count_if4[m].enable_coverage(is_on, this.cg_per_instance);
        end
        foreach(debug_sop_in_count_if0_3[m]) begin
            debug_sop_in_count_if0_3[m].enable_coverage(is_on, this.cg_per_instance);
        end
        foreach(debug_eop_in_count_if0_3[m]) begin
            debug_eop_in_count_if0_3[m].enable_coverage(is_on, this.cg_per_instance);
        end
        foreach(debug_sop_out_count_if0_3[m]) begin
            debug_sop_out_count_if0_3[m].enable_coverage(is_on, this.cg_per_instance);
        end
        foreach(debug_eop_out_count_if0_3[m]) begin
            debug_eop_out_count_if0_3[m].enable_coverage(is_on, this.cg_per_instance);
        end
        foreach(queue_not_empty_nni0[m]) begin
            queue_not_empty_nni0[m].enable_coverage(is_on, this.cg_per_instance);
        end
        foreach(queue_not_empty_nni1[m]) begin
            queue_not_empty_nni1[m].enable_coverage(is_on, this.cg_per_instance);
        end
        foreach(queue_not_empty_uni[m]) begin
            queue_not_empty_uni[m].enable_coverage(is_on, this.cg_per_instance);
        end
        foreach(input_packet_drop_counters[m]) begin
            input_packet_drop_counters[m].enable_coverage(is_on, this.cg_per_instance);
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