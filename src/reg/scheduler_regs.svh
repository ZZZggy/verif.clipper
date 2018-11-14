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
// Register definitions for scheduler register block.
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
// Group: scheduler
//---------------------------------------------------------

package scheduler_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;

typedef class scheduler_nni0_q_scheduler_reg_cover;

// Class: scheduler_nni0_q_scheduler_reg
// Register scheduler.nni0_q_scheduler: Q-to-SCHEDULER Configuration
class scheduler_nni0_q_scheduler_reg extends uvm_reg;

    // Variable: shaper_ndx
    // Write reset value for each write access. UNUSED FOR 6_3_2! Index to shaper profile.
    rand uvm_reg_field shaper_ndx;
    // Variable: shaper_ena
    // Write reset value for each write access. UNUSED FOR 6_3_2! shaper profile is applied
    rand uvm_reg_field shaper_ena;
    // Variable: default_compliance
    // Sets the Q compliance level when Q is not shaped (shaper_ena = 0)
    rand uvm_reg_field default_compliance;
    // Variable: shaper_debit_ena
    // Write reset value for each write access. UNUSED FOR 6_3_2! shaper is debited
    rand uvm_reg_field shaper_debit_ena;
    // Variable: scheduler_prio
    // Qs are served in strict priority from the highest (15) down to the lowest (0).       Qs assigned with the same priority are served in a round-robin fashion.
    rand uvm_reg_field scheduler_prio;
    // Variable: scheduler_map
    // Mapping to physical port number.
    rand uvm_reg_field scheduler_map;
    // Variable: port_shaper_ena
    // Write reset value for each write access. UNUSED FOR 6_3_2! port shaper profile is applied
    rand uvm_reg_field port_shaper_ena;
    // Variable: port_shaper_debit_ena
    // Write reset value for each write access. UNUSED FOR 6_3_2! port shaper is debited
    rand uvm_reg_field port_shaper_debit_ena;
    // Variable: profile_type
    // Write reset value for each write access. UNUSED FOR 6_3_2! Bandwidth profile type – used for statistics 
    rand uvm_reg_field profile_type;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static scheduler_nni0_q_scheduler_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    scheduler_nni0_q_scheduler_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(scheduler_reg_pkg::scheduler_nni0_q_scheduler_reg)

    // Constructor: new
    function new(string name = "scheduler_nni0_q_scheduler");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        shaper_ndx = uvm_reg_field::type_id::create("shaper_ndx", , get_full_name());
        shaper_ena = uvm_reg_field::type_id::create("shaper_ena", , get_full_name());
        default_compliance = uvm_reg_field::type_id::create("default_compliance", , get_full_name());
        shaper_debit_ena = uvm_reg_field::type_id::create("shaper_debit_ena", , get_full_name());
        scheduler_prio = uvm_reg_field::type_id::create("scheduler_prio", , get_full_name());
        scheduler_map = uvm_reg_field::type_id::create("scheduler_map", , get_full_name());
        port_shaper_ena = uvm_reg_field::type_id::create("port_shaper_ena", , get_full_name());
        port_shaper_debit_ena = uvm_reg_field::type_id::create("port_shaper_debit_ena", , get_full_name());
        profile_type = uvm_reg_field::type_id::create("profile_type", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        shaper_ndx.configure(this, 8, 0, "RW", 0, 'h0, 1, 1, 0);
        shaper_ena.configure(this, 1, 12, "RW", 0, 'h0, 1, 1, 0);
        default_compliance.configure(this, 1, 13, "RW", 0, 'h0, 1, 1, 0);
        shaper_debit_ena.configure(this, 1, 14, "RW", 0, 'h0, 1, 1, 0);
        scheduler_prio.configure(this, 4, 16, "RW", 0, 'h0, 1, 1, 0);
        scheduler_map.configure(this, 1, 20, "RW", 0, 'h0, 1, 1, 0);
        port_shaper_ena.configure(this, 1, 24, "RW", 0, 'h0, 1, 1, 0);
        port_shaper_debit_ena.configure(this, 1, 25, "RW", 0, 'h0, 1, 1, 0);
        profile_type.configure(this, 1, 48, "RW", 0, 'h0, 1, 1, 0);
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
                cg = scheduler_nni0_q_scheduler_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = scheduler_nni0_q_scheduler_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, shaper_ndx.get_name, shaper_ndx.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, shaper_ena.get_name, shaper_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, default_compliance.get_name, default_compliance.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, shaper_debit_ena.get_name, shaper_debit_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, scheduler_prio.get_name, scheduler_prio.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, scheduler_map.get_name, scheduler_map.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port_shaper_ena.get_name, port_shaper_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port_shaper_debit_ena.get_name, port_shaper_debit_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, profile_type.get_name, profile_type.value);
        return s;
    endfunction

endclass


// Class: scheduler_nni0_q_scheduler_reg_cover
// Register coverage object.
class scheduler_nni0_q_scheduler_reg_cover extends uvm_object;

    static local scheduler_nni0_q_scheduler_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    scheduler_nni0_q_scheduler_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        shaper_ndx_wr: coverpoint r.shaper_ndx.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        shaper_ndx_rd: coverpoint r.shaper_ndx.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        shaper_ena_wr: coverpoint r.shaper_ena.value iff (!is_read);
        shaper_ena_rd: coverpoint r.shaper_ena.value iff  (is_read);
        default_compliance_wr: coverpoint r.default_compliance.value iff (!is_read);
        default_compliance_rd: coverpoint r.default_compliance.value iff  (is_read);
        shaper_debit_ena_wr: coverpoint r.shaper_debit_ena.value iff (!is_read);
        shaper_debit_ena_rd: coverpoint r.shaper_debit_ena.value iff  (is_read);
        scheduler_prio_wr: coverpoint r.scheduler_prio.value iff (!is_read);
        scheduler_prio_rd: coverpoint r.scheduler_prio.value iff  (is_read);
        scheduler_map_wr: coverpoint r.scheduler_map.value iff (!is_read);
        scheduler_map_rd: coverpoint r.scheduler_map.value iff  (is_read);
        port_shaper_ena_wr: coverpoint r.port_shaper_ena.value iff (!is_read);
        port_shaper_ena_rd: coverpoint r.port_shaper_ena.value iff  (is_read);
        port_shaper_debit_ena_wr: coverpoint r.port_shaper_debit_ena.value iff (!is_read);
        port_shaper_debit_ena_rd: coverpoint r.port_shaper_debit_ena.value iff  (is_read);
        profile_type_wr: coverpoint r.profile_type.value iff (!is_read);
        profile_type_rd: coverpoint r.profile_type.value iff  (is_read);
    endgroup

    `uvm_object_utils(scheduler_reg_pkg::scheduler_nni0_q_scheduler_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="scheduler_nni0_q_scheduler_reg_cover");
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
    static function scheduler_nni0_q_scheduler_reg_cover get();
        if (m_inst == null) begin
            m_inst = scheduler_nni0_q_scheduler_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(scheduler_nni0_q_scheduler_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class scheduler_nni1_q_scheduler_reg_cover;

// Class: scheduler_nni1_q_scheduler_reg
// Register scheduler.nni1_q_scheduler: Q-to-SCHEDULER Configuration
class scheduler_nni1_q_scheduler_reg extends uvm_reg;

    // Variable: shaper_ndx
    // Write reset value for each write access. UNUSED FOR 6_3_2! Index to shaper profile.
    rand uvm_reg_field shaper_ndx;
    // Variable: shaper_ena
    // Write reset value for each write access. UNUSED FOR 6_3_2! shaper profile is applied
    rand uvm_reg_field shaper_ena;
    // Variable: default_compliance
    // Sets the Q compliance level when Q is not shaped (shaper_ena = 0)
    rand uvm_reg_field default_compliance;
    // Variable: shaper_debit_ena
    // Write reset value for each write access. UNUSED FOR 6_3_2! shaper is debited
    rand uvm_reg_field shaper_debit_ena;
    // Variable: scheduler_prio
    // Qs are served in strict priority from the highest (15) down to the lowest (0).       Qs assigned with the same priority are served in a round-robin fashion.
    rand uvm_reg_field scheduler_prio;
    // Variable: scheduler_map
    // Mapping to physical port number.
    rand uvm_reg_field scheduler_map;
    // Variable: port_shaper_ena
    // Write reset value for each write access. UNUSED FOR 6_3_2! port shaper profile is applied
    rand uvm_reg_field port_shaper_ena;
    // Variable: port_shaper_debit_ena
    // Write reset value for each write access. UNUSED FOR 6_3_2! port shaper is debited
    rand uvm_reg_field port_shaper_debit_ena;
    // Variable: profile_type
    // Write reset value for each write access. UNUSED FOR 6_3_2! Bandwidth profile type – used for statistics 
    rand uvm_reg_field profile_type;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static scheduler_nni1_q_scheduler_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    scheduler_nni1_q_scheduler_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(scheduler_reg_pkg::scheduler_nni1_q_scheduler_reg)

    // Constructor: new
    function new(string name = "scheduler_nni1_q_scheduler");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        shaper_ndx = uvm_reg_field::type_id::create("shaper_ndx", , get_full_name());
        shaper_ena = uvm_reg_field::type_id::create("shaper_ena", , get_full_name());
        default_compliance = uvm_reg_field::type_id::create("default_compliance", , get_full_name());
        shaper_debit_ena = uvm_reg_field::type_id::create("shaper_debit_ena", , get_full_name());
        scheduler_prio = uvm_reg_field::type_id::create("scheduler_prio", , get_full_name());
        scheduler_map = uvm_reg_field::type_id::create("scheduler_map", , get_full_name());
        port_shaper_ena = uvm_reg_field::type_id::create("port_shaper_ena", , get_full_name());
        port_shaper_debit_ena = uvm_reg_field::type_id::create("port_shaper_debit_ena", , get_full_name());
        profile_type = uvm_reg_field::type_id::create("profile_type", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        shaper_ndx.configure(this, 8, 0, "RW", 0, 'h0, 1, 1, 0);
        shaper_ena.configure(this, 1, 12, "RW", 0, 'h0, 1, 1, 0);
        default_compliance.configure(this, 1, 13, "RW", 0, 'h0, 1, 1, 0);
        shaper_debit_ena.configure(this, 1, 14, "RW", 0, 'h0, 1, 1, 0);
        scheduler_prio.configure(this, 4, 16, "RW", 0, 'h0, 1, 1, 0);
        scheduler_map.configure(this, 1, 20, "RW", 0, 'h0, 1, 1, 0);
        port_shaper_ena.configure(this, 1, 24, "RW", 0, 'h0, 1, 1, 0);
        port_shaper_debit_ena.configure(this, 1, 25, "RW", 0, 'h0, 1, 1, 0);
        profile_type.configure(this, 1, 48, "RW", 0, 'h0, 1, 1, 0);
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
                cg = scheduler_nni1_q_scheduler_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = scheduler_nni1_q_scheduler_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, shaper_ndx.get_name, shaper_ndx.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, shaper_ena.get_name, shaper_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, default_compliance.get_name, default_compliance.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, shaper_debit_ena.get_name, shaper_debit_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, scheduler_prio.get_name, scheduler_prio.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, scheduler_map.get_name, scheduler_map.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port_shaper_ena.get_name, port_shaper_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port_shaper_debit_ena.get_name, port_shaper_debit_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, profile_type.get_name, profile_type.value);
        return s;
    endfunction

endclass


// Class: scheduler_nni1_q_scheduler_reg_cover
// Register coverage object.
class scheduler_nni1_q_scheduler_reg_cover extends uvm_object;

    static local scheduler_nni1_q_scheduler_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    scheduler_nni1_q_scheduler_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        shaper_ndx_wr: coverpoint r.shaper_ndx.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        shaper_ndx_rd: coverpoint r.shaper_ndx.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        shaper_ena_wr: coverpoint r.shaper_ena.value iff (!is_read);
        shaper_ena_rd: coverpoint r.shaper_ena.value iff  (is_read);
        default_compliance_wr: coverpoint r.default_compliance.value iff (!is_read);
        default_compliance_rd: coverpoint r.default_compliance.value iff  (is_read);
        shaper_debit_ena_wr: coverpoint r.shaper_debit_ena.value iff (!is_read);
        shaper_debit_ena_rd: coverpoint r.shaper_debit_ena.value iff  (is_read);
        scheduler_prio_wr: coverpoint r.scheduler_prio.value iff (!is_read);
        scheduler_prio_rd: coverpoint r.scheduler_prio.value iff  (is_read);
        scheduler_map_wr: coverpoint r.scheduler_map.value iff (!is_read);
        scheduler_map_rd: coverpoint r.scheduler_map.value iff  (is_read);
        port_shaper_ena_wr: coverpoint r.port_shaper_ena.value iff (!is_read);
        port_shaper_ena_rd: coverpoint r.port_shaper_ena.value iff  (is_read);
        port_shaper_debit_ena_wr: coverpoint r.port_shaper_debit_ena.value iff (!is_read);
        port_shaper_debit_ena_rd: coverpoint r.port_shaper_debit_ena.value iff  (is_read);
        profile_type_wr: coverpoint r.profile_type.value iff (!is_read);
        profile_type_rd: coverpoint r.profile_type.value iff  (is_read);
    endgroup

    `uvm_object_utils(scheduler_reg_pkg::scheduler_nni1_q_scheduler_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="scheduler_nni1_q_scheduler_reg_cover");
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
    static function scheduler_nni1_q_scheduler_reg_cover get();
        if (m_inst == null) begin
            m_inst = scheduler_nni1_q_scheduler_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(scheduler_nni1_q_scheduler_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class scheduler_uni_q_scheduler_reg_cover;

// Class: scheduler_uni_q_scheduler_reg
// Register scheduler.uni_q_scheduler: Q-to-SCHEDULER Configuration
class scheduler_uni_q_scheduler_reg extends uvm_reg;

    // Variable: shaper_ndx
    // Write reset value for each write access. UNUSED FOR 6_3_2! Index to shaper profile.
    rand uvm_reg_field shaper_ndx;
    // Variable: shaper_ena
    // Write reset value for each write access. UNUSED FOR 6_3_2! shaper profile is applied / Shaper is debited
    rand uvm_reg_field shaper_ena;
    // Variable: default_compliance
    // Sets the Q compliance level when Q is not shaped (shaper_ena = 0)
    rand uvm_reg_field default_compliance;
    // Variable: shaper_debit_ena
    // Write reset value for each write access. UNUSED FOR 6_3_2! shaper is debited
    rand uvm_reg_field shaper_debit_ena;
    // Variable: scheduler_prio
    // Qs are served in strict priority from the highest (15) down to the lowest (0).       Qs assigned with the same priority are served in a round-robin fashion.
    rand uvm_reg_field scheduler_prio;
    // Variable: scheduler_map
    // Mapping to physical port number.
    rand uvm_reg_field scheduler_map;
    // Variable: port_shaper_ena
    // Write reset value for each write access. UNUSED FOR 6_3_2! port shaper profile is applied
    rand uvm_reg_field port_shaper_ena;
    // Variable: port_shaper_debit_ena
    // Write reset value for each write access. UNUSED FOR 6_3_2! port shaper is debited
    rand uvm_reg_field port_shaper_debit_ena;
    // Variable: profile_type
    // Write reset value for each write access. UNUSED FOR 6_3_2! Bandwidth profile type – used for statistics 
    rand uvm_reg_field profile_type;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static scheduler_uni_q_scheduler_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    scheduler_uni_q_scheduler_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(scheduler_reg_pkg::scheduler_uni_q_scheduler_reg)

    // Constructor: new
    function new(string name = "scheduler_uni_q_scheduler");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        shaper_ndx = uvm_reg_field::type_id::create("shaper_ndx", , get_full_name());
        shaper_ena = uvm_reg_field::type_id::create("shaper_ena", , get_full_name());
        default_compliance = uvm_reg_field::type_id::create("default_compliance", , get_full_name());
        shaper_debit_ena = uvm_reg_field::type_id::create("shaper_debit_ena", , get_full_name());
        scheduler_prio = uvm_reg_field::type_id::create("scheduler_prio", , get_full_name());
        scheduler_map = uvm_reg_field::type_id::create("scheduler_map", , get_full_name());
        port_shaper_ena = uvm_reg_field::type_id::create("port_shaper_ena", , get_full_name());
        port_shaper_debit_ena = uvm_reg_field::type_id::create("port_shaper_debit_ena", , get_full_name());
        profile_type = uvm_reg_field::type_id::create("profile_type", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        shaper_ndx.configure(this, 8, 0, "RW", 0, 'h0, 1, 1, 0);
        shaper_ena.configure(this, 1, 12, "RW", 0, 'h0, 1, 1, 0);
        default_compliance.configure(this, 1, 13, "RW", 0, 'h0, 1, 1, 0);
        shaper_debit_ena.configure(this, 1, 14, "RW", 0, 'h0, 1, 1, 0);
        scheduler_prio.configure(this, 4, 16, "RW", 0, 'h0, 1, 1, 0);
        scheduler_map.configure(this, 4, 20, "RW", 0, 'h0, 1, 1, 0);
        port_shaper_ena.configure(this, 1, 24, "RW", 0, 'h0, 1, 1, 0);
        port_shaper_debit_ena.configure(this, 1, 25, "RW", 0, 'h0, 1, 1, 0);
        profile_type.configure(this, 1, 48, "RW", 0, 'h0, 1, 1, 0);
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
                cg = scheduler_uni_q_scheduler_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = scheduler_uni_q_scheduler_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, shaper_ndx.get_name, shaper_ndx.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, shaper_ena.get_name, shaper_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, default_compliance.get_name, default_compliance.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, shaper_debit_ena.get_name, shaper_debit_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, scheduler_prio.get_name, scheduler_prio.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, scheduler_map.get_name, scheduler_map.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port_shaper_ena.get_name, port_shaper_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port_shaper_debit_ena.get_name, port_shaper_debit_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, profile_type.get_name, profile_type.value);
        return s;
    endfunction

endclass


// Class: scheduler_uni_q_scheduler_reg_cover
// Register coverage object.
class scheduler_uni_q_scheduler_reg_cover extends uvm_object;

    static local scheduler_uni_q_scheduler_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    scheduler_uni_q_scheduler_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        shaper_ndx_wr: coverpoint r.shaper_ndx.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        shaper_ndx_rd: coverpoint r.shaper_ndx.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        shaper_ena_wr: coverpoint r.shaper_ena.value iff (!is_read);
        shaper_ena_rd: coverpoint r.shaper_ena.value iff  (is_read);
        default_compliance_wr: coverpoint r.default_compliance.value iff (!is_read);
        default_compliance_rd: coverpoint r.default_compliance.value iff  (is_read);
        shaper_debit_ena_wr: coverpoint r.shaper_debit_ena.value iff (!is_read);
        shaper_debit_ena_rd: coverpoint r.shaper_debit_ena.value iff  (is_read);
        scheduler_prio_wr: coverpoint r.scheduler_prio.value iff (!is_read);
        scheduler_prio_rd: coverpoint r.scheduler_prio.value iff  (is_read);
        scheduler_map_wr: coverpoint r.scheduler_map.value iff (!is_read);
        scheduler_map_rd: coverpoint r.scheduler_map.value iff  (is_read);
        port_shaper_ena_wr: coverpoint r.port_shaper_ena.value iff (!is_read);
        port_shaper_ena_rd: coverpoint r.port_shaper_ena.value iff  (is_read);
        port_shaper_debit_ena_wr: coverpoint r.port_shaper_debit_ena.value iff (!is_read);
        port_shaper_debit_ena_rd: coverpoint r.port_shaper_debit_ena.value iff  (is_read);
        profile_type_wr: coverpoint r.profile_type.value iff (!is_read);
        profile_type_rd: coverpoint r.profile_type.value iff  (is_read);
    endgroup

    `uvm_object_utils(scheduler_reg_pkg::scheduler_uni_q_scheduler_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="scheduler_uni_q_scheduler_reg_cover");
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
    static function scheduler_uni_q_scheduler_reg_cover get();
        if (m_inst == null) begin
            m_inst = scheduler_uni_q_scheduler_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(scheduler_uni_q_scheduler_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class scheduler_port_shaper_config_group_0_reg_cover;

// Class: scheduler_port_shaper_config_group_0_reg
// Register scheduler.port_shaper_config_group_0: Port Shaper Configuration for NNI0 and NNI1 (see Channels_mapping.ods for more info)
class scheduler_port_shaper_config_group_0_reg extends uvm_reg;

    // Variable: port_shaper_ndx
    // Index to shaper profile. 
    rand uvm_reg_field port_shaper_ndx;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static scheduler_port_shaper_config_group_0_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    scheduler_port_shaper_config_group_0_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(scheduler_reg_pkg::scheduler_port_shaper_config_group_0_reg)

    // Constructor: new
    function new(string name = "scheduler_port_shaper_config_group_0");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        port_shaper_ndx = uvm_reg_field::type_id::create("port_shaper_ndx", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        port_shaper_ndx.configure(this, 1, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = scheduler_port_shaper_config_group_0_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = scheduler_port_shaper_config_group_0_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, port_shaper_ndx.get_name, port_shaper_ndx.value);
        return s;
    endfunction

endclass


// Class: scheduler_port_shaper_config_group_0_reg_cover
// Register coverage object.
class scheduler_port_shaper_config_group_0_reg_cover extends uvm_object;

    static local scheduler_port_shaper_config_group_0_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    scheduler_port_shaper_config_group_0_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        port_shaper_ndx_wr: coverpoint r.port_shaper_ndx.value iff (!is_read);
        port_shaper_ndx_rd: coverpoint r.port_shaper_ndx.value iff  (is_read);
    endgroup

    `uvm_object_utils(scheduler_reg_pkg::scheduler_port_shaper_config_group_0_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="scheduler_port_shaper_config_group_0_reg_cover");
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
    static function scheduler_port_shaper_config_group_0_reg_cover get();
        if (m_inst == null) begin
            m_inst = scheduler_port_shaper_config_group_0_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(scheduler_port_shaper_config_group_0_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class scheduler_port_shaper_config_group_1_reg_cover;

// Class: scheduler_port_shaper_config_group_1_reg
// Register scheduler.port_shaper_config_group_1: Port Shaper Configuration for UNI 0 to 9 (see Channels_mapping.ods for more info)
class scheduler_port_shaper_config_group_1_reg extends uvm_reg;

    // Variable: port_shaper_ndx
    // Index to shaper profile. 
    rand uvm_reg_field port_shaper_ndx;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static scheduler_port_shaper_config_group_1_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    scheduler_port_shaper_config_group_1_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(scheduler_reg_pkg::scheduler_port_shaper_config_group_1_reg)

    // Constructor: new
    function new(string name = "scheduler_port_shaper_config_group_1");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        port_shaper_ndx = uvm_reg_field::type_id::create("port_shaper_ndx", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        port_shaper_ndx.configure(this, 4, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = scheduler_port_shaper_config_group_1_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = scheduler_port_shaper_config_group_1_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, port_shaper_ndx.get_name, port_shaper_ndx.value);
        return s;
    endfunction

endclass


// Class: scheduler_port_shaper_config_group_1_reg_cover
// Register coverage object.
class scheduler_port_shaper_config_group_1_reg_cover extends uvm_object;

    static local scheduler_port_shaper_config_group_1_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    scheduler_port_shaper_config_group_1_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        port_shaper_ndx_wr: coverpoint r.port_shaper_ndx.value iff (!is_read);
        port_shaper_ndx_rd: coverpoint r.port_shaper_ndx.value iff  (is_read);
    endgroup

    `uvm_object_utils(scheduler_reg_pkg::scheduler_port_shaper_config_group_1_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="scheduler_port_shaper_config_group_1_reg_cover");
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
    static function scheduler_port_shaper_config_group_1_reg_cover get();
        if (m_inst == null) begin
            m_inst = scheduler_port_shaper_config_group_1_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(scheduler_port_shaper_config_group_1_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass





// Class: scheduler_reg_block
// Register Block .scheduler: 
class scheduler_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand scheduler_nni0_q_scheduler_reg nni0_q_scheduler[];
    rand scheduler_nni1_q_scheduler_reg nni1_q_scheduler[];
    rand scheduler_uni_q_scheduler_reg uni_q_scheduler[];
    rand scheduler_port_shaper_config_group_0_reg port_shaper_config_group_0[];
    rand scheduler_port_shaper_config_group_1_reg port_shaper_config_group_1[];

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(scheduler_reg_pkg::scheduler_reg_block)

    // Constructor: new
    function new(string name = "scheduler_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        nni0_q_scheduler = new[32];
        nni1_q_scheduler = new[32];
        uni_q_scheduler = new[64];
        port_shaper_config_group_0 = new[2];
        port_shaper_config_group_1 = new[10];

        foreach(nni0_q_scheduler[m]) begin
            nni0_q_scheduler[m] = scheduler_nni0_q_scheduler_reg::type_id::create($sformatf("nni0_q_scheduler[%0d]",m), , get_full_name());
        end
        foreach(nni1_q_scheduler[m]) begin
            nni1_q_scheduler[m] = scheduler_nni1_q_scheduler_reg::type_id::create($sformatf("nni1_q_scheduler[%0d]",m), , get_full_name());
        end
        foreach(uni_q_scheduler[m]) begin
            uni_q_scheduler[m] = scheduler_uni_q_scheduler_reg::type_id::create($sformatf("uni_q_scheduler[%0d]",m), , get_full_name());
        end
        foreach(port_shaper_config_group_0[m]) begin
            port_shaper_config_group_0[m] = scheduler_port_shaper_config_group_0_reg::type_id::create($sformatf("port_shaper_config_group_0[%0d]",m), , get_full_name());
        end
        foreach(port_shaper_config_group_1[m]) begin
            port_shaper_config_group_1[m] = scheduler_port_shaper_config_group_1_reg::type_id::create($sformatf("port_shaper_config_group_1[%0d]",m), , get_full_name());
        end

        foreach(nni0_q_scheduler[m]) begin
            nni0_q_scheduler[m].configure(this);
        end
        foreach(nni1_q_scheduler[m]) begin
            nni1_q_scheduler[m].configure(this);
        end
        foreach(uni_q_scheduler[m]) begin
            uni_q_scheduler[m].configure(this);
        end
        foreach(port_shaper_config_group_0[m]) begin
            port_shaper_config_group_0[m].configure(this);
        end
        foreach(port_shaper_config_group_1[m]) begin
            port_shaper_config_group_1[m].configure(this);
        end

        foreach(nni0_q_scheduler[m]) begin
            nni0_q_scheduler[m].build();
        end
        foreach(nni1_q_scheduler[m]) begin
            nni1_q_scheduler[m].build();
        end
        foreach(uni_q_scheduler[m]) begin
            uni_q_scheduler[m].build();
        end
        foreach(port_shaper_config_group_0[m]) begin
            port_shaper_config_group_0[m].build();
        end
        foreach(port_shaper_config_group_1[m]) begin
            port_shaper_config_group_1[m].build();
        end

        // define default map
        default_map = create_map("scheduler_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        foreach(nni0_q_scheduler[m]) begin
            this.default_map.add_reg(this.nni0_q_scheduler[m], 'h3000 + m, "RW");
        end
        foreach(nni1_q_scheduler[m]) begin
            this.default_map.add_reg(this.nni1_q_scheduler[m], 'h4000 + m, "RW");
        end
        foreach(uni_q_scheduler[m]) begin
            this.default_map.add_reg(this.uni_q_scheduler[m], 'h5000 + m, "RW");
        end
        foreach(port_shaper_config_group_0[m]) begin
            this.default_map.add_reg(this.port_shaper_config_group_0[m], 'h6000 + m, "RW");
        end
        foreach(port_shaper_config_group_1[m]) begin
            this.default_map.add_reg(this.port_shaper_config_group_1[m], 'h7000 + m, "RW");
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
        foreach(nni0_q_scheduler[m]) begin
            nni0_q_scheduler[m].enable_coverage(is_on, this.cg_per_instance);
        end
        foreach(nni1_q_scheduler[m]) begin
            nni1_q_scheduler[m].enable_coverage(is_on, this.cg_per_instance);
        end
        foreach(uni_q_scheduler[m]) begin
            uni_q_scheduler[m].enable_coverage(is_on, this.cg_per_instance);
        end
        foreach(port_shaper_config_group_0[m]) begin
            port_shaper_config_group_0[m].enable_coverage(is_on, this.cg_per_instance);
        end
        foreach(port_shaper_config_group_1[m]) begin
            port_shaper_config_group_1[m].enable_coverage(is_on, this.cg_per_instance);
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