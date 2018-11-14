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
// Register definitions for shaper_group_1 register block.
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
// Group: shaper_group_1
//---------------------------------------------------------

package shaper_group_1_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;

typedef class shaper_group_1_status_reg_cover;

// Class: shaper_group_1_status_reg
// Register shaper_group_1.status: SHAPER Miscellaneous Status
class shaper_group_1_status_reg extends uvm_reg;

    // Variable: global_rank_page_ndx
    // Identifies the current shaper global ranking page used  for credit update sequencing.
    rand uvm_reg_field global_rank_page_ndx;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static shaper_group_1_status_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    shaper_group_1_status_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(shaper_group_1_reg_pkg::shaper_group_1_status_reg)

    // Constructor: new
    function new(string name = "shaper_group_1_status");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        global_rank_page_ndx = uvm_reg_field::type_id::create("global_rank_page_ndx", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        global_rank_page_ndx.configure(this, 1, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = shaper_group_1_status_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = shaper_group_1_status_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, global_rank_page_ndx.get_name, global_rank_page_ndx.value);
        return s;
    endfunction

endclass


// Class: shaper_group_1_status_reg_cover
// Register coverage object.
class shaper_group_1_status_reg_cover extends uvm_object;

    static local shaper_group_1_status_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    shaper_group_1_status_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        global_rank_page_ndx_wr: coverpoint r.global_rank_page_ndx.value iff (!is_read);
        global_rank_page_ndx_rd: coverpoint r.global_rank_page_ndx.value iff  (is_read);
    endgroup

    `uvm_object_utils(shaper_group_1_reg_pkg::shaper_group_1_status_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="shaper_group_1_status_reg_cover");
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
    static function shaper_group_1_status_reg_cover get();
        if (m_inst == null) begin
            m_inst = shaper_group_1_status_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(shaper_group_1_status_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class shaper_group_1_cfg_reg_cover;

// Class: shaper_group_1_cfg_reg
// Register shaper_group_1.cfg: SHAPER Miscellaneous Configuration
class shaper_group_1_cfg_reg extends uvm_reg;

    // Variable: global_rank_page_ndx
    // Identifies the shaper global ranking page to be used  for credit update sequencing.
    rand uvm_reg_field global_rank_page_ndx;
    // Variable: last_rank
    // Rank of last enabled profile in the range [0:15]. Scan process updates enabled profiles in the range [0:last_rank].
    rand uvm_reg_field last_rank;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static shaper_group_1_cfg_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    shaper_group_1_cfg_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(shaper_group_1_reg_pkg::shaper_group_1_cfg_reg)

    // Constructor: new
    function new(string name = "shaper_group_1_cfg");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        global_rank_page_ndx = uvm_reg_field::type_id::create("global_rank_page_ndx", , get_full_name());
        last_rank = uvm_reg_field::type_id::create("last_rank", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        global_rank_page_ndx.configure(this, 1, 0, "RW", 0, 'h0, 1, 1, 0);
        last_rank.configure(this, 4, 4, "RW", 0, 'h1, 1, 1, 0);
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
                cg = shaper_group_1_cfg_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = shaper_group_1_cfg_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, global_rank_page_ndx.get_name, global_rank_page_ndx.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, last_rank.get_name, last_rank.value);
        return s;
    endfunction

endclass


// Class: shaper_group_1_cfg_reg_cover
// Register coverage object.
class shaper_group_1_cfg_reg_cover extends uvm_object;

    static local shaper_group_1_cfg_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    shaper_group_1_cfg_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        global_rank_page_ndx_wr: coverpoint r.global_rank_page_ndx.value iff (!is_read);
        global_rank_page_ndx_rd: coverpoint r.global_rank_page_ndx.value iff  (is_read);
        last_rank_wr: coverpoint r.last_rank.value iff (!is_read);
        last_rank_rd: coverpoint r.last_rank.value iff  (is_read);
    endgroup

    `uvm_object_utils(shaper_group_1_reg_pkg::shaper_group_1_cfg_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="shaper_group_1_cfg_reg_cover");
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
    static function shaper_group_1_cfg_reg_cover get();
        if (m_inst == null) begin
            m_inst = shaper_group_1_cfg_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(shaper_group_1_cfg_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class shaper_group_1_rank_page_0_reg_cover;

// Class: shaper_group_1_rank_page_0_reg
// Register shaper_group_1.rank_page_0: SHAPER Ranking Page 0     The credit update process scans the Ranking Page from rank 0x00 up to shaper_cfg.last_rank so to retrieve      the proper shaper profiles sequencing that allow MEF 10.3 token sharing within an enveloppe.
class shaper_group_1_rank_page_0_reg extends uvm_reg;

    // Variable: shaper_ndx
    // Index to shaper profile
    rand uvm_reg_field shaper_ndx;
    // Variable: rank
    // Envelope rank (as per MEF 10.3).      Profiles assigned to an envelope must be entered in a contiguous fashion from highest rank to lowest rank.     An enveloppe is allowed to contain 1, 2 or N profiles.
    rand uvm_reg_field rank;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static shaper_group_1_rank_page_0_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    shaper_group_1_rank_page_0_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(shaper_group_1_reg_pkg::shaper_group_1_rank_page_0_reg)

    // Constructor: new
    function new(string name = "shaper_group_1_rank_page_0");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        shaper_ndx = uvm_reg_field::type_id::create("shaper_ndx", , get_full_name());
        rank = uvm_reg_field::type_id::create("rank", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        shaper_ndx.configure(this, 4, 0, "RW", 0, 'h0, 1, 1, 0);
        rank.configure(this, 2, 12, "RW", 0, 'h0, 1, 1, 0);
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
                cg = shaper_group_1_rank_page_0_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = shaper_group_1_rank_page_0_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rank.get_name, rank.value);
        return s;
    endfunction

endclass


// Class: shaper_group_1_rank_page_0_reg_cover
// Register coverage object.
class shaper_group_1_rank_page_0_reg_cover extends uvm_object;

    static local shaper_group_1_rank_page_0_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    shaper_group_1_rank_page_0_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        shaper_ndx_wr: coverpoint r.shaper_ndx.value iff (!is_read);
        shaper_ndx_rd: coverpoint r.shaper_ndx.value iff  (is_read);
        rank_wr: coverpoint r.rank.value iff (!is_read);
        rank_rd: coverpoint r.rank.value iff  (is_read);
    endgroup

    `uvm_object_utils(shaper_group_1_reg_pkg::shaper_group_1_rank_page_0_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="shaper_group_1_rank_page_0_reg_cover");
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
    static function shaper_group_1_rank_page_0_reg_cover get();
        if (m_inst == null) begin
            m_inst = shaper_group_1_rank_page_0_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(shaper_group_1_rank_page_0_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class shaper_group_1_rank_page_1_reg_cover;

// Class: shaper_group_1_rank_page_1_reg
// Register shaper_group_1.rank_page_1: SHAPER Ranking Page 1     The credit update process scans the Ranking Page from rank 0x00 up to shaper_cfg.last_rank so to retrieve      the proper shaper profiles sequencing that allow MEF 10.3 token sharing within an enveloppe.
class shaper_group_1_rank_page_1_reg extends uvm_reg;

    // Variable: shaper_ndx
    // Index to shaper profile
    rand uvm_reg_field shaper_ndx;
    // Variable: rank
    // Envelope rank (as per MEF 10.3).      Profiles assigned to an envelope must be entered in a contiguous fashion from highest rank to lowest rank.     An enveloppe is allowed to contain 1, 2 or N profiles.
    rand uvm_reg_field rank;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static shaper_group_1_rank_page_1_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    shaper_group_1_rank_page_1_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(shaper_group_1_reg_pkg::shaper_group_1_rank_page_1_reg)

    // Constructor: new
    function new(string name = "shaper_group_1_rank_page_1");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        shaper_ndx = uvm_reg_field::type_id::create("shaper_ndx", , get_full_name());
        rank = uvm_reg_field::type_id::create("rank", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        shaper_ndx.configure(this, 4, 0, "RW", 0, 'h0, 1, 1, 0);
        rank.configure(this, 2, 12, "RW", 0, 'h0, 1, 1, 0);
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
                cg = shaper_group_1_rank_page_1_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = shaper_group_1_rank_page_1_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rank.get_name, rank.value);
        return s;
    endfunction

endclass


// Class: shaper_group_1_rank_page_1_reg_cover
// Register coverage object.
class shaper_group_1_rank_page_1_reg_cover extends uvm_object;

    static local shaper_group_1_rank_page_1_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    shaper_group_1_rank_page_1_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        shaper_ndx_wr: coverpoint r.shaper_ndx.value iff (!is_read);
        shaper_ndx_rd: coverpoint r.shaper_ndx.value iff  (is_read);
        rank_wr: coverpoint r.rank.value iff (!is_read);
        rank_rd: coverpoint r.rank.value iff  (is_read);
    endgroup

    `uvm_object_utils(shaper_group_1_reg_pkg::shaper_group_1_rank_page_1_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="shaper_group_1_rank_page_1_reg_cover");
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
    static function shaper_group_1_rank_page_1_reg_cover get();
        if (m_inst == null) begin
            m_inst = shaper_group_1_rank_page_1_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(shaper_group_1_rank_page_1_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class shaper_group_1_params_cir_reg_cover;

// Class: shaper_group_1_params_cir_reg
// Register shaper_group_1.params_cir: Profiles bandwidth parameters for CIR buckets
class shaper_group_1_params_cir_reg extends uvm_reg;

    // Variable: cbs
    // Committed burst size in increments of 1kB (6MB max).     Though CBS = 0 is valid configuration, it may result in rate not being accurate.
    rand uvm_reg_field cbs;
    // Variable: cir
    // Committed information rate in increment of 125kbps.     Must be lower or equal to 0x27100 for 20Gbps maximum.
    rand uvm_reg_field cir;
    // Variable: cir_max
    // Committed information rate (maximum) in increment of 125kbps.     Cir_max is not tied to cir, it can be any value smaller, equal or larger than cir.     Must be lower or equal to 0x27100 for 20Gbps maximum.
    rand uvm_reg_field cir_max;
    // Variable: cf
    // Coupling Flag (as per MEF 10.3)
    rand uvm_reg_field cf;
    // Variable: cir_ena
    // Bandwidth profile enable
    rand uvm_reg_field cir_ena;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static shaper_group_1_params_cir_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    shaper_group_1_params_cir_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(shaper_group_1_reg_pkg::shaper_group_1_params_cir_reg)

    // Constructor: new
    function new(string name = "shaper_group_1_params_cir");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        cbs = uvm_reg_field::type_id::create("cbs", , get_full_name());
        cir = uvm_reg_field::type_id::create("cir", , get_full_name());
        cir_max = uvm_reg_field::type_id::create("cir_max", , get_full_name());
        cf = uvm_reg_field::type_id::create("cf", , get_full_name());
        cir_ena = uvm_reg_field::type_id::create("cir_ena", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        cbs.configure(this, 13, 0, "RW", 0, 'h0, 1, 1, 0);
        cir.configure(this, 18, 20, "RW", 0, 'h0, 1, 1, 0);
        cir_max.configure(this, 18, 40, "RW", 0, 'h0, 1, 1, 0);
        cf.configure(this, 1, 60, "RW", 0, 'h0, 1, 1, 0);
        cir_ena.configure(this, 1, 63, "RW", 0, 'h0, 1, 1, 0);
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
                cg = shaper_group_1_params_cir_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = shaper_group_1_params_cir_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, cbs.get_name, cbs.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, cir.get_name, cir.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, cir_max.get_name, cir_max.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, cf.get_name, cf.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, cir_ena.get_name, cir_ena.value);
        return s;
    endfunction

endclass


// Class: shaper_group_1_params_cir_reg_cover
// Register coverage object.
class shaper_group_1_params_cir_reg_cover extends uvm_object;

    static local shaper_group_1_params_cir_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    shaper_group_1_params_cir_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        cbs_wr: coverpoint r.cbs.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        cbs_rd: coverpoint r.cbs.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        cir_wr: coverpoint r.cir.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        cir_rd: coverpoint r.cir.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        cir_max_wr: coverpoint r.cir_max.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        cir_max_rd: coverpoint r.cir_max.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        cf_wr: coverpoint r.cf.value iff (!is_read);
        cf_rd: coverpoint r.cf.value iff  (is_read);
        cir_ena_wr: coverpoint r.cir_ena.value iff (!is_read);
        cir_ena_rd: coverpoint r.cir_ena.value iff  (is_read);
    endgroup

    `uvm_object_utils(shaper_group_1_reg_pkg::shaper_group_1_params_cir_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="shaper_group_1_params_cir_reg_cover");
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
    static function shaper_group_1_params_cir_reg_cover get();
        if (m_inst == null) begin
            m_inst = shaper_group_1_params_cir_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(shaper_group_1_params_cir_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class shaper_group_1_params_eir_reg_cover;

// Class: shaper_group_1_params_eir_reg
// Register shaper_group_1.params_eir: Profiles bandwidth parameters for EIR buckets
class shaper_group_1_params_eir_reg extends uvm_reg;

    // Variable: ebs
    // Excess burst size in increments of 1kB (6MB max).     Though EBS = 0 is valid configuration, it may result in rate not being accurate.
    rand uvm_reg_field ebs;
    // Variable: eir
    // Excess information rate in increment of 125kbps     Must be lower or equal to 0x27100 for 20Gbps maximum.
    rand uvm_reg_field eir;
    // Variable: eir_max
    // Excess information rate (maximum) in increment of 125kbps.     Eir_max is not tied to eir, it can be any value smaller, equal or larger than eir.     Must be lower or equal to 0x27100 for 20Gbps maximum.
    rand uvm_reg_field eir_max;
    // Variable: cf
    // Coupling Flag (as per MEF 10.3)
    rand uvm_reg_field cf;
    // Variable: eir_ena
    // Bandwidth profile enable
    rand uvm_reg_field eir_ena;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static shaper_group_1_params_eir_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    shaper_group_1_params_eir_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(shaper_group_1_reg_pkg::shaper_group_1_params_eir_reg)

    // Constructor: new
    function new(string name = "shaper_group_1_params_eir");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        ebs = uvm_reg_field::type_id::create("ebs", , get_full_name());
        eir = uvm_reg_field::type_id::create("eir", , get_full_name());
        eir_max = uvm_reg_field::type_id::create("eir_max", , get_full_name());
        cf = uvm_reg_field::type_id::create("cf", , get_full_name());
        eir_ena = uvm_reg_field::type_id::create("eir_ena", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        ebs.configure(this, 13, 0, "RW", 0, 'h0, 1, 1, 0);
        eir.configure(this, 18, 20, "RW", 0, 'h0, 1, 1, 0);
        eir_max.configure(this, 18, 40, "RW", 0, 'h0, 1, 1, 0);
        cf.configure(this, 1, 60, "RW", 0, 'h0, 1, 1, 0);
        eir_ena.configure(this, 1, 63, "RW", 0, 'h0, 1, 1, 0);
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
                cg = shaper_group_1_params_eir_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = shaper_group_1_params_eir_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, ebs.get_name, ebs.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, eir.get_name, eir.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, eir_max.get_name, eir_max.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, cf.get_name, cf.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, eir_ena.get_name, eir_ena.value);
        return s;
    endfunction

endclass


// Class: shaper_group_1_params_eir_reg_cover
// Register coverage object.
class shaper_group_1_params_eir_reg_cover extends uvm_object;

    static local shaper_group_1_params_eir_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    shaper_group_1_params_eir_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        ebs_wr: coverpoint r.ebs.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        ebs_rd: coverpoint r.ebs.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        eir_wr: coverpoint r.eir.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        eir_rd: coverpoint r.eir.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        eir_max_wr: coverpoint r.eir_max.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        eir_max_rd: coverpoint r.eir_max.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        cf_wr: coverpoint r.cf.value iff (!is_read);
        cf_rd: coverpoint r.cf.value iff  (is_read);
        eir_ena_wr: coverpoint r.eir_ena.value iff (!is_read);
        eir_ena_rd: coverpoint r.eir_ena.value iff  (is_read);
    endgroup

    `uvm_object_utils(shaper_group_1_reg_pkg::shaper_group_1_params_eir_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="shaper_group_1_params_eir_reg_cover");
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
    static function shaper_group_1_params_eir_reg_cover get();
        if (m_inst == null) begin
            m_inst = shaper_group_1_params_eir_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(shaper_group_1_params_eir_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass





// Class: shaper_group_1_reg_block
// Register Block .shaper_group_1: 
class shaper_group_1_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand shaper_group_1_status_reg status;
    rand shaper_group_1_cfg_reg cfg;
    rand shaper_group_1_rank_page_0_reg rank_page_0[];
    rand shaper_group_1_rank_page_1_reg rank_page_1[];
    rand shaper_group_1_params_cir_reg params_cir[];
    rand shaper_group_1_params_eir_reg params_eir[];

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(shaper_group_1_reg_pkg::shaper_group_1_reg_block)

    // Constructor: new
    function new(string name = "shaper_group_1_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rank_page_0 = new[16];
        rank_page_1 = new[16];
        params_cir = new[16];
        params_eir = new[16];

        status = shaper_group_1_status_reg::type_id::create("status", , get_full_name());
        cfg = shaper_group_1_cfg_reg::type_id::create("cfg", , get_full_name());
        foreach(rank_page_0[m]) begin
            rank_page_0[m] = shaper_group_1_rank_page_0_reg::type_id::create($sformatf("rank_page_0[%0d]",m), , get_full_name());
        end
        foreach(rank_page_1[m]) begin
            rank_page_1[m] = shaper_group_1_rank_page_1_reg::type_id::create($sformatf("rank_page_1[%0d]",m), , get_full_name());
        end
        foreach(params_cir[m]) begin
            params_cir[m] = shaper_group_1_params_cir_reg::type_id::create($sformatf("params_cir[%0d]",m), , get_full_name());
        end
        foreach(params_eir[m]) begin
            params_eir[m] = shaper_group_1_params_eir_reg::type_id::create($sformatf("params_eir[%0d]",m), , get_full_name());
        end

        status.configure(this);
        cfg.configure(this);
        foreach(rank_page_0[m]) begin
            rank_page_0[m].configure(this);
        end
        foreach(rank_page_1[m]) begin
            rank_page_1[m].configure(this);
        end
        foreach(params_cir[m]) begin
            params_cir[m].configure(this);
        end
        foreach(params_eir[m]) begin
            params_eir[m].configure(this);
        end

        status.build();
        cfg.build();
        foreach(rank_page_0[m]) begin
            rank_page_0[m].build();
        end
        foreach(rank_page_1[m]) begin
            rank_page_1[m].build();
        end
        foreach(params_cir[m]) begin
            params_cir[m].build();
        end
        foreach(params_eir[m]) begin
            params_eir[m].build();
        end

        // define default map
        default_map = create_map("shaper_group_1_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        this.default_map.add_reg(status, 'h1, "RO");
        this.default_map.add_reg(cfg, 'h11, "RW");
        foreach(rank_page_0[m]) begin
            this.default_map.add_reg(this.rank_page_0[m], 'h100 + m, "RW");
        end
        foreach(rank_page_1[m]) begin
            this.default_map.add_reg(this.rank_page_1[m], 'h200 + m, "RW");
        end
        foreach(params_cir[m]) begin
            this.default_map.add_reg(this.params_cir[m], 'h300 + m, "RW");
        end
        foreach(params_eir[m]) begin
            this.default_map.add_reg(this.params_eir[m], 'h400 + m, "RW");
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
        status.enable_coverage(is_on, this.cg_per_instance);
        cfg.enable_coverage(is_on, this.cg_per_instance);
        foreach(rank_page_0[m]) begin
            rank_page_0[m].enable_coverage(is_on, this.cg_per_instance);
        end
        foreach(rank_page_1[m]) begin
            rank_page_1[m].enable_coverage(is_on, this.cg_per_instance);
        end
        foreach(params_cir[m]) begin
            params_cir[m].enable_coverage(is_on, this.cg_per_instance);
        end
        foreach(params_eir[m]) begin
            params_eir[m].enable_coverage(is_on, this.cg_per_instance);
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