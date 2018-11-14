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
// Register definitions for nni1_q_system register block.
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
// Group: nni1_q_system
//---------------------------------------------------------

package nni1_q_system_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;

typedef class nni1_q_system_level_cfg_reg_cover;

// Class: nni1_q_system_level_cfg_reg
// Register nni1_q_system.level_cfg: Queue level Configuration
class nni1_q_system_level_cfg_reg extends uvm_reg;

    // Variable: max_level_grn
    // Level from which tail drop begins for green packets (4k-byte granularity)
    rand uvm_reg_field max_level_grn;
    // Variable: max_level_yel
    // Level from which tail drop begins for yellow packets (4k-byte granularity)
    rand uvm_reg_field max_level_yel;
    // Variable: min_level
    // Level used for Q forwarding statistics. Establishes the threshold between no delay and with delay (4k-byte granularity).
    rand uvm_reg_field min_level;
    // Variable: profile_type
    // UNUSED FOR 6_3_2! Bandwidth profile type – used for statistics 
    rand uvm_reg_field profile_type;
    // Variable: force_accept
    // For debug purpose only.
    rand uvm_reg_field force_accept;
    // Variable: prio
    // UNUSED FOR 6_3_2! Queue Priority. This 4 state priority is used to drop frames when the available Data memory is under a threshold (see tm_globals.free_mau_almost_empty_level).
    rand uvm_reg_field prio;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static nni1_q_system_level_cfg_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    nni1_q_system_level_cfg_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(nni1_q_system_reg_pkg::nni1_q_system_level_cfg_reg)

    // Constructor: new
    function new(string name = "nni1_q_system_level_cfg");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        max_level_grn = uvm_reg_field::type_id::create("max_level_grn", , get_full_name());
        max_level_yel = uvm_reg_field::type_id::create("max_level_yel", , get_full_name());
        min_level = uvm_reg_field::type_id::create("min_level", , get_full_name());
        profile_type = uvm_reg_field::type_id::create("profile_type", , get_full_name());
        force_accept = uvm_reg_field::type_id::create("force_accept", , get_full_name());
        prio = uvm_reg_field::type_id::create("prio", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        max_level_grn.configure(this, 12, 0, "RW", 0, 'h0, 1, 1, 0);
        max_level_yel.configure(this, 12, 16, "RW", 0, 'h0, 1, 1, 0);
        min_level.configure(this, 12, 32, "RW", 0, 'h0, 1, 1, 0);
        profile_type.configure(this, 1, 48, "RW", 0, 'h0, 1, 1, 0);
        force_accept.configure(this, 1, 49, "RW", 0, 'h0, 1, 1, 0);
        prio.configure(this, 2, 50, "RW", 0, 'h0, 1, 1, 0);
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
                cg = nni1_q_system_level_cfg_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = nni1_q_system_level_cfg_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, max_level_grn.get_name, max_level_grn.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, max_level_yel.get_name, max_level_yel.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, min_level.get_name, min_level.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, profile_type.get_name, profile_type.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, force_accept.get_name, force_accept.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, prio.get_name, prio.value);
        return s;
    endfunction

endclass


// Class: nni1_q_system_level_cfg_reg_cover
// Register coverage object.
class nni1_q_system_level_cfg_reg_cover extends uvm_object;

    static local nni1_q_system_level_cfg_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    nni1_q_system_level_cfg_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        max_level_grn_wr: coverpoint r.max_level_grn.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        max_level_grn_rd: coverpoint r.max_level_grn.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        max_level_yel_wr: coverpoint r.max_level_yel.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        max_level_yel_rd: coverpoint r.max_level_yel.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        min_level_wr: coverpoint r.min_level.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        min_level_rd: coverpoint r.min_level.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        profile_type_wr: coverpoint r.profile_type.value iff (!is_read);
        profile_type_rd: coverpoint r.profile_type.value iff  (is_read);
        force_accept_wr: coverpoint r.force_accept.value iff (!is_read);
        force_accept_rd: coverpoint r.force_accept.value iff  (is_read);
        prio_wr: coverpoint r.prio.value iff (!is_read);
        prio_rd: coverpoint r.prio.value iff  (is_read);
    endgroup

    `uvm_object_utils(nni1_q_system_reg_pkg::nni1_q_system_level_cfg_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="nni1_q_system_level_cfg_reg_cover");
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
    static function nni1_q_system_level_cfg_reg_cover get();
        if (m_inst == null) begin
            m_inst = nni1_q_system_level_cfg_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(nni1_q_system_level_cfg_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class nni1_q_system_blue_cfg_reg_cover;

// Class: nni1_q_system_blue_cfg_reg
// Register nni1_q_system.blue_cfg: BLUE Configuration
class nni1_q_system_blue_cfg_reg extends uvm_reg;

    // Variable: max_blue_level
    // Level from which BLUE discard probablity is increased (4kB granularity)
    rand uvm_reg_field max_blue_level;
    // Variable: min_blue_level
    // Level from which BLUE discard probablity is decreasing (4kB granularity)
    rand uvm_reg_field min_blue_level;
    // Variable: blue_step_inc
    // BLUE step used when increasing probability (step ~0.196%)
    rand uvm_reg_field blue_step_inc;
    // Variable: blue_step_dec
    // BLUE step used when decreasing probability (step ~0.196%)
    rand uvm_reg_field blue_step_dec;
    // Variable: blue_freeze_time
    // BLUE freeze time is steps of 20us
    rand uvm_reg_field blue_freeze_time;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static nni1_q_system_blue_cfg_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    nni1_q_system_blue_cfg_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(nni1_q_system_reg_pkg::nni1_q_system_blue_cfg_reg)

    // Constructor: new
    function new(string name = "nni1_q_system_blue_cfg");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        max_blue_level = uvm_reg_field::type_id::create("max_blue_level", , get_full_name());
        min_blue_level = uvm_reg_field::type_id::create("min_blue_level", , get_full_name());
        blue_step_inc = uvm_reg_field::type_id::create("blue_step_inc", , get_full_name());
        blue_step_dec = uvm_reg_field::type_id::create("blue_step_dec", , get_full_name());
        blue_freeze_time = uvm_reg_field::type_id::create("blue_freeze_time", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        max_blue_level.configure(this, 12, 0, "RW", 0, 'h0, 1, 1, 0);
        min_blue_level.configure(this, 12, 12, "RW", 0, 'h0, 1, 1, 0);
        blue_step_inc.configure(this, 7, 24, "RW", 0, 'h0, 1, 1, 0);
        blue_step_dec.configure(this, 7, 32, "RW", 0, 'h0, 1, 1, 0);
        blue_freeze_time.configure(this, 15, 40, "RW", 0, 'h0, 1, 1, 0);
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
                cg = nni1_q_system_blue_cfg_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = nni1_q_system_blue_cfg_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, max_blue_level.get_name, max_blue_level.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, min_blue_level.get_name, min_blue_level.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, blue_step_inc.get_name, blue_step_inc.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, blue_step_dec.get_name, blue_step_dec.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, blue_freeze_time.get_name, blue_freeze_time.value);
        return s;
    endfunction

endclass


// Class: nni1_q_system_blue_cfg_reg_cover
// Register coverage object.
class nni1_q_system_blue_cfg_reg_cover extends uvm_object;

    static local nni1_q_system_blue_cfg_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    nni1_q_system_blue_cfg_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        max_blue_level_wr: coverpoint r.max_blue_level.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        max_blue_level_rd: coverpoint r.max_blue_level.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        min_blue_level_wr: coverpoint r.min_blue_level.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        min_blue_level_rd: coverpoint r.min_blue_level.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        blue_step_inc_wr: coverpoint r.blue_step_inc.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        blue_step_inc_rd: coverpoint r.blue_step_inc.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        blue_step_dec_wr: coverpoint r.blue_step_dec.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        blue_step_dec_rd: coverpoint r.blue_step_dec.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        blue_freeze_time_wr: coverpoint r.blue_freeze_time.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        blue_freeze_time_rd: coverpoint r.blue_freeze_time.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(nni1_q_system_reg_pkg::nni1_q_system_blue_cfg_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="nni1_q_system_blue_cfg_reg_cover");
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
    static function nni1_q_system_blue_cfg_reg_cover get();
        if (m_inst == null) begin
            m_inst = nni1_q_system_blue_cfg_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(nni1_q_system_blue_cfg_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class nni1_q_system_status_reg_cover;

// Class: nni1_q_system_status_reg
// Register nni1_q_system.status: Q status
class nni1_q_system_status_reg extends uvm_reg;

    // Variable: current_level
    // Q current level (4k-byte granularity)
    rand uvm_reg_field current_level;
    // Variable: max_level
    // Maximum Q level (4k-byte granularity) from the last read. Read this register reset this field.
    rand uvm_reg_field max_level;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static nni1_q_system_status_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    nni1_q_system_status_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(nni1_q_system_reg_pkg::nni1_q_system_status_reg)

    // Constructor: new
    function new(string name = "nni1_q_system_status");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        current_level = uvm_reg_field::type_id::create("current_level", , get_full_name());
        max_level = uvm_reg_field::type_id::create("max_level", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        current_level.configure(this, 16, 0, "RO", 0, 'h0, 1, 1, 0);
        max_level.configure(this, 16, 32, "RO", 0, 'h0, 1, 1, 0);
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
                cg = nni1_q_system_status_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = nni1_q_system_status_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, current_level.get_name, current_level.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, max_level.get_name, max_level.value);
        return s;
    endfunction

endclass


// Class: nni1_q_system_status_reg_cover
// Register coverage object.
class nni1_q_system_status_reg_cover extends uvm_object;

    static local nni1_q_system_status_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    nni1_q_system_status_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        current_level_wr: coverpoint r.current_level.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        current_level_rd: coverpoint r.current_level.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        max_level_wr: coverpoint r.max_level.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        max_level_rd: coverpoint r.max_level.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(nni1_q_system_reg_pkg::nni1_q_system_status_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="nni1_q_system_status_reg_cover");
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
    static function nni1_q_system_status_reg_cover get();
        if (m_inst == null) begin
            m_inst = nni1_q_system_status_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(nni1_q_system_status_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class nni1_q_system_blue_status_reg_cover;

// Class: nni1_q_system_blue_status_reg
// Register nni1_q_system.blue_status: Q status
class nni1_q_system_blue_status_reg extends uvm_reg;

    // Variable: blue_discard_probability
    // Give a status of the BLUE queue reaction. (color and DP (9 bits))
    rand uvm_reg_field blue_discard_probability;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static nni1_q_system_blue_status_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    nni1_q_system_blue_status_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(nni1_q_system_reg_pkg::nni1_q_system_blue_status_reg)

    // Constructor: new
    function new(string name = "nni1_q_system_blue_status");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        blue_discard_probability = uvm_reg_field::type_id::create("blue_discard_probability", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        blue_discard_probability.configure(this, 10, 20, "RO", 0, 'h0, 1, 1, 0);
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
                cg = nni1_q_system_blue_status_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = nni1_q_system_blue_status_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, blue_discard_probability.get_name, blue_discard_probability.value);
        return s;
    endfunction

endclass


// Class: nni1_q_system_blue_status_reg_cover
// Register coverage object.
class nni1_q_system_blue_status_reg_cover extends uvm_object;

    static local nni1_q_system_blue_status_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    nni1_q_system_blue_status_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        blue_discard_probability_wr: coverpoint r.blue_discard_probability.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        blue_discard_probability_rd: coverpoint r.blue_discard_probability.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(nni1_q_system_reg_pkg::nni1_q_system_blue_status_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="nni1_q_system_blue_status_reg_cover");
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
    static function nni1_q_system_blue_status_reg_cover get();
        if (m_inst == null) begin
            m_inst = nni1_q_system_blue_status_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(nni1_q_system_blue_status_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass





// Class: nni1_q_system_reg_block
// Register Block .nni1_q_system: 
class nni1_q_system_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand nni1_q_system_level_cfg_reg level_cfg[];
    rand nni1_q_system_blue_cfg_reg blue_cfg[];
    rand nni1_q_system_status_reg status[];
    rand nni1_q_system_blue_status_reg blue_status[];

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(nni1_q_system_reg_pkg::nni1_q_system_reg_block)

    // Constructor: new
    function new(string name = "nni1_q_system_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        level_cfg = new[32];
        blue_cfg = new[32];
        status = new[32];
        blue_status = new[32];

        foreach(level_cfg[m]) begin
            level_cfg[m] = nni1_q_system_level_cfg_reg::type_id::create($sformatf("level_cfg[%0d]",m), , get_full_name());
        end
        foreach(blue_cfg[m]) begin
            blue_cfg[m] = nni1_q_system_blue_cfg_reg::type_id::create($sformatf("blue_cfg[%0d]",m), , get_full_name());
        end
        foreach(status[m]) begin
            status[m] = nni1_q_system_status_reg::type_id::create($sformatf("status[%0d]",m), , get_full_name());
        end
        foreach(blue_status[m]) begin
            blue_status[m] = nni1_q_system_blue_status_reg::type_id::create($sformatf("blue_status[%0d]",m), , get_full_name());
        end

        foreach(level_cfg[m]) begin
            level_cfg[m].configure(this);
        end
        foreach(blue_cfg[m]) begin
            blue_cfg[m].configure(this);
        end
        foreach(status[m]) begin
            status[m].configure(this);
        end
        foreach(blue_status[m]) begin
            blue_status[m].configure(this);
        end

        foreach(level_cfg[m]) begin
            level_cfg[m].build();
        end
        foreach(blue_cfg[m]) begin
            blue_cfg[m].build();
        end
        foreach(status[m]) begin
            status[m].build();
        end
        foreach(blue_status[m]) begin
            blue_status[m].build();
        end

        // define default map
        default_map = create_map("nni1_q_system_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        foreach(level_cfg[m]) begin
            this.default_map.add_reg(this.level_cfg[m], 'h0 + m, "RW");
        end
        foreach(blue_cfg[m]) begin
            this.default_map.add_reg(this.blue_cfg[m], 'h100 + m, "RW");
        end
        foreach(status[m]) begin
            this.default_map.add_reg(this.status[m], 'h300 + m, "RO");
        end
        foreach(blue_status[m]) begin
            this.default_map.add_reg(this.blue_status[m], 'h400 + m, "RO");
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
        foreach(level_cfg[m]) begin
            level_cfg[m].enable_coverage(is_on, this.cg_per_instance);
        end
        foreach(blue_cfg[m]) begin
            blue_cfg[m].enable_coverage(is_on, this.cg_per_instance);
        end
        foreach(status[m]) begin
            status[m].enable_coverage(is_on, this.cg_per_instance);
        end
        foreach(blue_status[m]) begin
            blue_status[m].enable_coverage(is_on, this.cg_per_instance);
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