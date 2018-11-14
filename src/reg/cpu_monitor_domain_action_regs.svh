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
// Register definitions for cpu_monitor_domain_action register block.
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
// Group: cpu_monitor_domain_action
//---------------------------------------------------------

package cpu_monitor_domain_action_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;

typedef class cpu_monitor_action_cpu_action_reg_cover;

// Class: cpu_monitor_action_cpu_action_reg
// Register cpu_monitor_action.cpu_action: CPU domain config
class cpu_monitor_action_cpu_action_reg extends uvm_reg;

    // Variable: cpu_forwarding
    // CPU forwarding (used with cpu index only). Index 5 to 26 are the hardcoded rules and must be programmed accordingly
    rand uvm_reg_field cpu_forwarding;
    // Variable: cpu_bucket
    // CPU bucket to use when packet is forwarded to CPU (used with cpu index only)
    rand uvm_reg_field cpu_bucket;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static cpu_monitor_action_cpu_action_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    cpu_monitor_action_cpu_action_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(cpu_monitor_domain_action_reg_pkg::cpu_monitor_action_cpu_action_reg)

    // Constructor: new
    function new(string name = "cpu_monitor_action_cpu_action");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        cpu_forwarding = uvm_reg_field::type_id::create("cpu_forwarding", , get_full_name());
        cpu_bucket = uvm_reg_field::type_id::create("cpu_bucket", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        cpu_forwarding.configure(this, 1, 0, "RW", 0, 'h0, 1, 1, 0);
        cpu_bucket.configure(this, 5, 4, "RW", 0, 'h0, 1, 1, 0);
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
                cg = cpu_monitor_action_cpu_action_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = cpu_monitor_action_cpu_action_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, cpu_forwarding.get_name, cpu_forwarding.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, cpu_bucket.get_name, cpu_bucket.value);
        return s;
    endfunction

endclass


// Class: cpu_monitor_action_cpu_action_reg_cover
// Register coverage object.
class cpu_monitor_action_cpu_action_reg_cover extends uvm_object;

    static local cpu_monitor_action_cpu_action_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    cpu_monitor_action_cpu_action_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        cpu_forwarding_wr: coverpoint r.cpu_forwarding.value iff (!is_read);
        cpu_forwarding_rd: coverpoint r.cpu_forwarding.value iff  (is_read);
        cpu_bucket_wr: coverpoint r.cpu_bucket.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        cpu_bucket_rd: coverpoint r.cpu_bucket.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(cpu_monitor_domain_action_reg_pkg::cpu_monitor_action_cpu_action_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="cpu_monitor_action_cpu_action_reg_cover");
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
    static function cpu_monitor_action_cpu_action_reg_cover get();
        if (m_inst == null) begin
            m_inst = cpu_monitor_action_cpu_action_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(cpu_monitor_action_cpu_action_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class cpu_monitor_action_mon1_action_reg_cover;

// Class: cpu_monitor_action_mon1_action_reg
// Register cpu_monitor_action.mon1_action: MON1 domain config
class cpu_monitor_action_mon1_action_reg extends uvm_reg;

    // Variable: monitor1_forwarding
    // Monitor1 forwarding (used with monitor1 index only)
    rand uvm_reg_field monitor1_forwarding;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static cpu_monitor_action_mon1_action_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    cpu_monitor_action_mon1_action_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(cpu_monitor_domain_action_reg_pkg::cpu_monitor_action_mon1_action_reg)

    // Constructor: new
    function new(string name = "cpu_monitor_action_mon1_action");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        monitor1_forwarding = uvm_reg_field::type_id::create("monitor1_forwarding", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        monitor1_forwarding.configure(this, 1, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = cpu_monitor_action_mon1_action_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = cpu_monitor_action_mon1_action_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, monitor1_forwarding.get_name, monitor1_forwarding.value);
        return s;
    endfunction

endclass


// Class: cpu_monitor_action_mon1_action_reg_cover
// Register coverage object.
class cpu_monitor_action_mon1_action_reg_cover extends uvm_object;

    static local cpu_monitor_action_mon1_action_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    cpu_monitor_action_mon1_action_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        monitor1_forwarding_wr: coverpoint r.monitor1_forwarding.value iff (!is_read);
        monitor1_forwarding_rd: coverpoint r.monitor1_forwarding.value iff  (is_read);
    endgroup

    `uvm_object_utils(cpu_monitor_domain_action_reg_pkg::cpu_monitor_action_mon1_action_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="cpu_monitor_action_mon1_action_reg_cover");
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
    static function cpu_monitor_action_mon1_action_reg_cover get();
        if (m_inst == null) begin
            m_inst = cpu_monitor_action_mon1_action_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(cpu_monitor_action_mon1_action_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class cpu_monitor_action_mon2_action_reg_cover;

// Class: cpu_monitor_action_mon2_action_reg
// Register cpu_monitor_action.mon2_action: MON2 domain config
class cpu_monitor_action_mon2_action_reg extends uvm_reg;

    // Variable: monitor2_forwarding
    // Monitor2 forwarding (used with monitor2 index only)
    rand uvm_reg_field monitor2_forwarding;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static cpu_monitor_action_mon2_action_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    cpu_monitor_action_mon2_action_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(cpu_monitor_domain_action_reg_pkg::cpu_monitor_action_mon2_action_reg)

    // Constructor: new
    function new(string name = "cpu_monitor_action_mon2_action");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        monitor2_forwarding = uvm_reg_field::type_id::create("monitor2_forwarding", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        monitor2_forwarding.configure(this, 1, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = cpu_monitor_action_mon2_action_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = cpu_monitor_action_mon2_action_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, monitor2_forwarding.get_name, monitor2_forwarding.value);
        return s;
    endfunction

endclass


// Class: cpu_monitor_action_mon2_action_reg_cover
// Register coverage object.
class cpu_monitor_action_mon2_action_reg_cover extends uvm_object;

    static local cpu_monitor_action_mon2_action_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    cpu_monitor_action_mon2_action_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        monitor2_forwarding_wr: coverpoint r.monitor2_forwarding.value iff (!is_read);
        monitor2_forwarding_rd: coverpoint r.monitor2_forwarding.value iff  (is_read);
    endgroup

    `uvm_object_utils(cpu_monitor_domain_action_reg_pkg::cpu_monitor_action_mon2_action_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="cpu_monitor_action_mon2_action_reg_cover");
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
    static function cpu_monitor_action_mon2_action_reg_cover get();
        if (m_inst == null) begin
            m_inst = cpu_monitor_action_mon2_action_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(cpu_monitor_action_mon2_action_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass





// Class: cpu_monitor_domain_action_reg_block
// Register Block .cpu_monitor_domain_action: 
class cpu_monitor_domain_action_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand cpu_monitor_action_cpu_action_reg cpu_action[];
    rand cpu_monitor_action_mon1_action_reg mon1_action[];
    rand cpu_monitor_action_mon2_action_reg mon2_action[];

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(cpu_monitor_domain_action_reg_pkg::cpu_monitor_domain_action_reg_block)

    // Constructor: new
    function new(string name = "cpu_monitor_domain_action_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        cpu_action = new[64];
        mon1_action = new[2];
        mon2_action = new[2];

        foreach(cpu_action[m]) begin
            cpu_action[m] = cpu_monitor_action_cpu_action_reg::type_id::create($sformatf("cpu_action[%0d]",m), , get_full_name());
        end
        foreach(mon1_action[m]) begin
            mon1_action[m] = cpu_monitor_action_mon1_action_reg::type_id::create($sformatf("mon1_action[%0d]",m), , get_full_name());
        end
        foreach(mon2_action[m]) begin
            mon2_action[m] = cpu_monitor_action_mon2_action_reg::type_id::create($sformatf("mon2_action[%0d]",m), , get_full_name());
        end

        foreach(cpu_action[m]) begin
            cpu_action[m].configure(this);
        end
        foreach(mon1_action[m]) begin
            mon1_action[m].configure(this);
        end
        foreach(mon2_action[m]) begin
            mon2_action[m].configure(this);
        end

        foreach(cpu_action[m]) begin
            cpu_action[m].build();
        end
        foreach(mon1_action[m]) begin
            mon1_action[m].build();
        end
        foreach(mon2_action[m]) begin
            mon2_action[m].build();
        end

        // define default map
        default_map = create_map("cpu_monitor_domain_action_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        foreach(cpu_action[m]) begin
            this.default_map.add_reg(this.cpu_action[m], 'h0 + m, "RW");
        end
        foreach(mon1_action[m]) begin
            this.default_map.add_reg(this.mon1_action[m], 'h80 + m, "RW");
        end
        foreach(mon2_action[m]) begin
            this.default_map.add_reg(this.mon2_action[m], 'h82 + m, "RW");
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
        foreach(cpu_action[m]) begin
            cpu_action[m].enable_coverage(is_on, this.cg_per_instance);
        end
        foreach(mon1_action[m]) begin
            mon1_action[m].enable_coverage(is_on, this.cg_per_instance);
        end
        foreach(mon2_action[m]) begin
            mon2_action[m].enable_coverage(is_on, this.cg_per_instance);
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