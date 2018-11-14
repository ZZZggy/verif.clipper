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
// Register definitions for platform_ctrl register block.
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
// Group: platform_ctrl
//---------------------------------------------------------

package platform_ctrl_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;

typedef class platform_ctrl_sfp_ctrl_1_reg_cover;

// Class: platform_ctrl_sfp_ctrl_1_reg
// Register platform_ctrl.sfp_ctrl_1: Controls SFPs
class platform_ctrl_sfp_ctrl_1_reg extends uvm_reg;

    // Variable: sfp1_ena_n
    // enable at 0
    rand uvm_reg_field sfp1_ena_n;
    // Variable: sfp1_txdisable
    // tx disable at 1
    rand uvm_reg_field sfp1_txdisable;
    // Variable: sfp1_ratesel
    // rate selelction
    rand uvm_reg_field sfp1_ratesel;
    // Variable: sfp2_ena_n
    // 
    rand uvm_reg_field sfp2_ena_n;
    // Variable: sfp2_txdisable
    // 
    rand uvm_reg_field sfp2_txdisable;
    // Variable: sfp2_ratesel
    // 
    rand uvm_reg_field sfp2_ratesel;
    // Variable: sfp3_ena_n
    // 
    rand uvm_reg_field sfp3_ena_n;
    // Variable: sfp3_txdisable
    // 
    rand uvm_reg_field sfp3_txdisable;
    // Variable: sfp3_ratesel
    // 
    rand uvm_reg_field sfp3_ratesel;
    // Variable: sfp4_ena_n
    // 
    rand uvm_reg_field sfp4_ena_n;
    // Variable: sfp4_txdisable
    // 
    rand uvm_reg_field sfp4_txdisable;
    // Variable: sfp4_ratesel
    // 
    rand uvm_reg_field sfp4_ratesel;
    // Variable: sfp5_ena_n
    // 
    rand uvm_reg_field sfp5_ena_n;
    // Variable: sfp5_txdisable
    // 
    rand uvm_reg_field sfp5_txdisable;
    // Variable: sfp5_ratesel
    // 
    rand uvm_reg_field sfp5_ratesel;
    // Variable: sfp6_ena_n
    // 
    rand uvm_reg_field sfp6_ena_n;
    // Variable: sfp6_txdisable
    // 
    rand uvm_reg_field sfp6_txdisable;
    // Variable: sfp6_ratesel
    // 
    rand uvm_reg_field sfp6_ratesel;
    // Variable: sfp7_ena_n
    // 
    rand uvm_reg_field sfp7_ena_n;
    // Variable: sfp7_txdisable
    // 
    rand uvm_reg_field sfp7_txdisable;
    // Variable: sfp7_ratesel
    // 
    rand uvm_reg_field sfp7_ratesel;
    // Variable: sfp8_ena_n
    // 
    rand uvm_reg_field sfp8_ena_n;
    // Variable: sfp8_txdisable
    // 
    rand uvm_reg_field sfp8_txdisable;
    // Variable: sfp8_ratesel
    // 
    rand uvm_reg_field sfp8_ratesel;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static platform_ctrl_sfp_ctrl_1_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    platform_ctrl_sfp_ctrl_1_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(platform_ctrl_reg_pkg::platform_ctrl_sfp_ctrl_1_reg)

    // Constructor: new
    function new(string name = "platform_ctrl_sfp_ctrl_1");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        sfp1_ena_n = uvm_reg_field::type_id::create("sfp1_ena_n", , get_full_name());
        sfp1_txdisable = uvm_reg_field::type_id::create("sfp1_txdisable", , get_full_name());
        sfp1_ratesel = uvm_reg_field::type_id::create("sfp1_ratesel", , get_full_name());
        sfp2_ena_n = uvm_reg_field::type_id::create("sfp2_ena_n", , get_full_name());
        sfp2_txdisable = uvm_reg_field::type_id::create("sfp2_txdisable", , get_full_name());
        sfp2_ratesel = uvm_reg_field::type_id::create("sfp2_ratesel", , get_full_name());
        sfp3_ena_n = uvm_reg_field::type_id::create("sfp3_ena_n", , get_full_name());
        sfp3_txdisable = uvm_reg_field::type_id::create("sfp3_txdisable", , get_full_name());
        sfp3_ratesel = uvm_reg_field::type_id::create("sfp3_ratesel", , get_full_name());
        sfp4_ena_n = uvm_reg_field::type_id::create("sfp4_ena_n", , get_full_name());
        sfp4_txdisable = uvm_reg_field::type_id::create("sfp4_txdisable", , get_full_name());
        sfp4_ratesel = uvm_reg_field::type_id::create("sfp4_ratesel", , get_full_name());
        sfp5_ena_n = uvm_reg_field::type_id::create("sfp5_ena_n", , get_full_name());
        sfp5_txdisable = uvm_reg_field::type_id::create("sfp5_txdisable", , get_full_name());
        sfp5_ratesel = uvm_reg_field::type_id::create("sfp5_ratesel", , get_full_name());
        sfp6_ena_n = uvm_reg_field::type_id::create("sfp6_ena_n", , get_full_name());
        sfp6_txdisable = uvm_reg_field::type_id::create("sfp6_txdisable", , get_full_name());
        sfp6_ratesel = uvm_reg_field::type_id::create("sfp6_ratesel", , get_full_name());
        sfp7_ena_n = uvm_reg_field::type_id::create("sfp7_ena_n", , get_full_name());
        sfp7_txdisable = uvm_reg_field::type_id::create("sfp7_txdisable", , get_full_name());
        sfp7_ratesel = uvm_reg_field::type_id::create("sfp7_ratesel", , get_full_name());
        sfp8_ena_n = uvm_reg_field::type_id::create("sfp8_ena_n", , get_full_name());
        sfp8_txdisable = uvm_reg_field::type_id::create("sfp8_txdisable", , get_full_name());
        sfp8_ratesel = uvm_reg_field::type_id::create("sfp8_ratesel", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        sfp1_ena_n.configure(this, 1, 0, "RW", 0, 'h1, 1, 1, 0);
        sfp1_txdisable.configure(this, 1, 1, "RW", 0, 'h1, 1, 1, 0);
        sfp1_ratesel.configure(this, 1, 2, "RW", 0, 'h0, 1, 1, 0);
        sfp2_ena_n.configure(this, 1, 4, "RW", 0, 'h1, 1, 1, 0);
        sfp2_txdisable.configure(this, 1, 5, "RW", 0, 'h1, 1, 1, 0);
        sfp2_ratesel.configure(this, 1, 6, "RW", 0, 'h0, 1, 1, 0);
        sfp3_ena_n.configure(this, 1, 8, "RW", 0, 'h1, 1, 1, 0);
        sfp3_txdisable.configure(this, 1, 9, "RW", 0, 'h1, 1, 1, 0);
        sfp3_ratesel.configure(this, 1, 10, "RW", 0, 'h0, 1, 1, 0);
        sfp4_ena_n.configure(this, 1, 12, "RW", 0, 'h1, 1, 1, 0);
        sfp4_txdisable.configure(this, 1, 13, "RW", 0, 'h1, 1, 1, 0);
        sfp4_ratesel.configure(this, 1, 14, "RW", 0, 'h0, 1, 1, 0);
        sfp5_ena_n.configure(this, 1, 16, "RW", 0, 'h1, 1, 1, 0);
        sfp5_txdisable.configure(this, 1, 17, "RW", 0, 'h1, 1, 1, 0);
        sfp5_ratesel.configure(this, 2, 18, "RW", 0, 'h0, 1, 1, 0);
        sfp6_ena_n.configure(this, 1, 20, "RW", 0, 'h1, 1, 1, 0);
        sfp6_txdisable.configure(this, 1, 21, "RW", 0, 'h1, 1, 1, 0);
        sfp6_ratesel.configure(this, 2, 22, "RW", 0, 'h0, 1, 1, 0);
        sfp7_ena_n.configure(this, 1, 24, "RW", 0, 'h1, 1, 1, 0);
        sfp7_txdisable.configure(this, 1, 25, "RW", 0, 'h1, 1, 1, 0);
        sfp7_ratesel.configure(this, 2, 26, "RW", 0, 'h0, 1, 1, 0);
        sfp8_ena_n.configure(this, 1, 28, "RW", 0, 'h1, 1, 1, 0);
        sfp8_txdisable.configure(this, 1, 29, "RW", 0, 'h1, 1, 1, 0);
        sfp8_ratesel.configure(this, 2, 30, "RW", 0, 'h0, 1, 1, 0);
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
                cg = platform_ctrl_sfp_ctrl_1_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = platform_ctrl_sfp_ctrl_1_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp1_ena_n.get_name, sfp1_ena_n.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp1_txdisable.get_name, sfp1_txdisable.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp1_ratesel.get_name, sfp1_ratesel.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp2_ena_n.get_name, sfp2_ena_n.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp2_txdisable.get_name, sfp2_txdisable.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp2_ratesel.get_name, sfp2_ratesel.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp3_ena_n.get_name, sfp3_ena_n.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp3_txdisable.get_name, sfp3_txdisable.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp3_ratesel.get_name, sfp3_ratesel.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp4_ena_n.get_name, sfp4_ena_n.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp4_txdisable.get_name, sfp4_txdisable.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp4_ratesel.get_name, sfp4_ratesel.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp5_ena_n.get_name, sfp5_ena_n.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp5_txdisable.get_name, sfp5_txdisable.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp5_ratesel.get_name, sfp5_ratesel.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp6_ena_n.get_name, sfp6_ena_n.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp6_txdisable.get_name, sfp6_txdisable.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp6_ratesel.get_name, sfp6_ratesel.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp7_ena_n.get_name, sfp7_ena_n.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp7_txdisable.get_name, sfp7_txdisable.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp7_ratesel.get_name, sfp7_ratesel.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp8_ena_n.get_name, sfp8_ena_n.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp8_txdisable.get_name, sfp8_txdisable.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp8_ratesel.get_name, sfp8_ratesel.value);
        return s;
    endfunction

endclass


// Class: platform_ctrl_sfp_ctrl_1_reg_cover
// Register coverage object.
class platform_ctrl_sfp_ctrl_1_reg_cover extends uvm_object;

    static local platform_ctrl_sfp_ctrl_1_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    platform_ctrl_sfp_ctrl_1_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        sfp1_ena_n_wr: coverpoint r.sfp1_ena_n.value iff (!is_read);
        sfp1_ena_n_rd: coverpoint r.sfp1_ena_n.value iff  (is_read);
        sfp1_txdisable_wr: coverpoint r.sfp1_txdisable.value iff (!is_read);
        sfp1_txdisable_rd: coverpoint r.sfp1_txdisable.value iff  (is_read);
        sfp1_ratesel_wr: coverpoint r.sfp1_ratesel.value iff (!is_read);
        sfp1_ratesel_rd: coverpoint r.sfp1_ratesel.value iff  (is_read);
        sfp2_ena_n_wr: coverpoint r.sfp2_ena_n.value iff (!is_read);
        sfp2_ena_n_rd: coverpoint r.sfp2_ena_n.value iff  (is_read);
        sfp2_txdisable_wr: coverpoint r.sfp2_txdisable.value iff (!is_read);
        sfp2_txdisable_rd: coverpoint r.sfp2_txdisable.value iff  (is_read);
        sfp2_ratesel_wr: coverpoint r.sfp2_ratesel.value iff (!is_read);
        sfp2_ratesel_rd: coverpoint r.sfp2_ratesel.value iff  (is_read);
        sfp3_ena_n_wr: coverpoint r.sfp3_ena_n.value iff (!is_read);
        sfp3_ena_n_rd: coverpoint r.sfp3_ena_n.value iff  (is_read);
        sfp3_txdisable_wr: coverpoint r.sfp3_txdisable.value iff (!is_read);
        sfp3_txdisable_rd: coverpoint r.sfp3_txdisable.value iff  (is_read);
        sfp3_ratesel_wr: coverpoint r.sfp3_ratesel.value iff (!is_read);
        sfp3_ratesel_rd: coverpoint r.sfp3_ratesel.value iff  (is_read);
        sfp4_ena_n_wr: coverpoint r.sfp4_ena_n.value iff (!is_read);
        sfp4_ena_n_rd: coverpoint r.sfp4_ena_n.value iff  (is_read);
        sfp4_txdisable_wr: coverpoint r.sfp4_txdisable.value iff (!is_read);
        sfp4_txdisable_rd: coverpoint r.sfp4_txdisable.value iff  (is_read);
        sfp4_ratesel_wr: coverpoint r.sfp4_ratesel.value iff (!is_read);
        sfp4_ratesel_rd: coverpoint r.sfp4_ratesel.value iff  (is_read);
        sfp5_ena_n_wr: coverpoint r.sfp5_ena_n.value iff (!is_read);
        sfp5_ena_n_rd: coverpoint r.sfp5_ena_n.value iff  (is_read);
        sfp5_txdisable_wr: coverpoint r.sfp5_txdisable.value iff (!is_read);
        sfp5_txdisable_rd: coverpoint r.sfp5_txdisable.value iff  (is_read);
        sfp5_ratesel_wr: coverpoint r.sfp5_ratesel.value iff (!is_read);
        sfp5_ratesel_rd: coverpoint r.sfp5_ratesel.value iff  (is_read);
        sfp6_ena_n_wr: coverpoint r.sfp6_ena_n.value iff (!is_read);
        sfp6_ena_n_rd: coverpoint r.sfp6_ena_n.value iff  (is_read);
        sfp6_txdisable_wr: coverpoint r.sfp6_txdisable.value iff (!is_read);
        sfp6_txdisable_rd: coverpoint r.sfp6_txdisable.value iff  (is_read);
        sfp6_ratesel_wr: coverpoint r.sfp6_ratesel.value iff (!is_read);
        sfp6_ratesel_rd: coverpoint r.sfp6_ratesel.value iff  (is_read);
        sfp7_ena_n_wr: coverpoint r.sfp7_ena_n.value iff (!is_read);
        sfp7_ena_n_rd: coverpoint r.sfp7_ena_n.value iff  (is_read);
        sfp7_txdisable_wr: coverpoint r.sfp7_txdisable.value iff (!is_read);
        sfp7_txdisable_rd: coverpoint r.sfp7_txdisable.value iff  (is_read);
        sfp7_ratesel_wr: coverpoint r.sfp7_ratesel.value iff (!is_read);
        sfp7_ratesel_rd: coverpoint r.sfp7_ratesel.value iff  (is_read);
        sfp8_ena_n_wr: coverpoint r.sfp8_ena_n.value iff (!is_read);
        sfp8_ena_n_rd: coverpoint r.sfp8_ena_n.value iff  (is_read);
        sfp8_txdisable_wr: coverpoint r.sfp8_txdisable.value iff (!is_read);
        sfp8_txdisable_rd: coverpoint r.sfp8_txdisable.value iff  (is_read);
        sfp8_ratesel_wr: coverpoint r.sfp8_ratesel.value iff (!is_read);
        sfp8_ratesel_rd: coverpoint r.sfp8_ratesel.value iff  (is_read);
    endgroup

    `uvm_object_utils(platform_ctrl_reg_pkg::platform_ctrl_sfp_ctrl_1_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="platform_ctrl_sfp_ctrl_1_reg_cover");
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
    static function platform_ctrl_sfp_ctrl_1_reg_cover get();
        if (m_inst == null) begin
            m_inst = platform_ctrl_sfp_ctrl_1_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(platform_ctrl_sfp_ctrl_1_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class platform_ctrl_sfp_ctrl_2_reg_cover;

// Class: platform_ctrl_sfp_ctrl_2_reg
// Register platform_ctrl.sfp_ctrl_2: Controls SFPs
class platform_ctrl_sfp_ctrl_2_reg extends uvm_reg;

    // Variable: sfp9_ena_n
    // 
    rand uvm_reg_field sfp9_ena_n;
    // Variable: sfp9_txdisable
    // 
    rand uvm_reg_field sfp9_txdisable;
    // Variable: sfp9_ratesel
    // 
    rand uvm_reg_field sfp9_ratesel;
    // Variable: sfp10_ena_n
    // 
    rand uvm_reg_field sfp10_ena_n;
    // Variable: sfp10_txdisable
    // 
    rand uvm_reg_field sfp10_txdisable;
    // Variable: sfp10_ratesel
    // 
    rand uvm_reg_field sfp10_ratesel;
    // Variable: sfp11_ena_n
    // 
    rand uvm_reg_field sfp11_ena_n;
    // Variable: sfp11_txdisable
    // 
    rand uvm_reg_field sfp11_txdisable;
    // Variable: sfp11_ratesel
    // 
    rand uvm_reg_field sfp11_ratesel;
    // Variable: sfp12_ena_n
    // 
    rand uvm_reg_field sfp12_ena_n;
    // Variable: sfp12_txdisable
    // 
    rand uvm_reg_field sfp12_txdisable;
    // Variable: sfp12_ratesel
    // 
    rand uvm_reg_field sfp12_ratesel;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static platform_ctrl_sfp_ctrl_2_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    platform_ctrl_sfp_ctrl_2_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(platform_ctrl_reg_pkg::platform_ctrl_sfp_ctrl_2_reg)

    // Constructor: new
    function new(string name = "platform_ctrl_sfp_ctrl_2");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        sfp9_ena_n = uvm_reg_field::type_id::create("sfp9_ena_n", , get_full_name());
        sfp9_txdisable = uvm_reg_field::type_id::create("sfp9_txdisable", , get_full_name());
        sfp9_ratesel = uvm_reg_field::type_id::create("sfp9_ratesel", , get_full_name());
        sfp10_ena_n = uvm_reg_field::type_id::create("sfp10_ena_n", , get_full_name());
        sfp10_txdisable = uvm_reg_field::type_id::create("sfp10_txdisable", , get_full_name());
        sfp10_ratesel = uvm_reg_field::type_id::create("sfp10_ratesel", , get_full_name());
        sfp11_ena_n = uvm_reg_field::type_id::create("sfp11_ena_n", , get_full_name());
        sfp11_txdisable = uvm_reg_field::type_id::create("sfp11_txdisable", , get_full_name());
        sfp11_ratesel = uvm_reg_field::type_id::create("sfp11_ratesel", , get_full_name());
        sfp12_ena_n = uvm_reg_field::type_id::create("sfp12_ena_n", , get_full_name());
        sfp12_txdisable = uvm_reg_field::type_id::create("sfp12_txdisable", , get_full_name());
        sfp12_ratesel = uvm_reg_field::type_id::create("sfp12_ratesel", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        sfp9_ena_n.configure(this, 1, 0, "RW", 0, 'h1, 1, 1, 0);
        sfp9_txdisable.configure(this, 1, 1, "RW", 0, 'h1, 1, 1, 0);
        sfp9_ratesel.configure(this, 1, 2, "RW", 0, 'h0, 1, 1, 0);
        sfp10_ena_n.configure(this, 1, 4, "RW", 0, 'h1, 1, 1, 0);
        sfp10_txdisable.configure(this, 1, 5, "RW", 0, 'h1, 1, 1, 0);
        sfp10_ratesel.configure(this, 1, 6, "RW", 0, 'h0, 1, 1, 0);
        sfp11_ena_n.configure(this, 1, 8, "RW", 0, 'h1, 1, 1, 0);
        sfp11_txdisable.configure(this, 1, 9, "RW", 0, 'h1, 1, 1, 0);
        sfp11_ratesel.configure(this, 1, 10, "RW", 0, 'h0, 1, 1, 0);
        sfp12_ena_n.configure(this, 1, 12, "RW", 0, 'h1, 1, 1, 0);
        sfp12_txdisable.configure(this, 1, 13, "RW", 0, 'h1, 1, 1, 0);
        sfp12_ratesel.configure(this, 1, 14, "RW", 0, 'h0, 1, 1, 0);
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
                cg = platform_ctrl_sfp_ctrl_2_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = platform_ctrl_sfp_ctrl_2_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp9_ena_n.get_name, sfp9_ena_n.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp9_txdisable.get_name, sfp9_txdisable.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp9_ratesel.get_name, sfp9_ratesel.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp10_ena_n.get_name, sfp10_ena_n.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp10_txdisable.get_name, sfp10_txdisable.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp10_ratesel.get_name, sfp10_ratesel.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp11_ena_n.get_name, sfp11_ena_n.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp11_txdisable.get_name, sfp11_txdisable.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp11_ratesel.get_name, sfp11_ratesel.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp12_ena_n.get_name, sfp12_ena_n.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp12_txdisable.get_name, sfp12_txdisable.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp12_ratesel.get_name, sfp12_ratesel.value);
        return s;
    endfunction

endclass


// Class: platform_ctrl_sfp_ctrl_2_reg_cover
// Register coverage object.
class platform_ctrl_sfp_ctrl_2_reg_cover extends uvm_object;

    static local platform_ctrl_sfp_ctrl_2_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    platform_ctrl_sfp_ctrl_2_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        sfp9_ena_n_wr: coverpoint r.sfp9_ena_n.value iff (!is_read);
        sfp9_ena_n_rd: coverpoint r.sfp9_ena_n.value iff  (is_read);
        sfp9_txdisable_wr: coverpoint r.sfp9_txdisable.value iff (!is_read);
        sfp9_txdisable_rd: coverpoint r.sfp9_txdisable.value iff  (is_read);
        sfp9_ratesel_wr: coverpoint r.sfp9_ratesel.value iff (!is_read);
        sfp9_ratesel_rd: coverpoint r.sfp9_ratesel.value iff  (is_read);
        sfp10_ena_n_wr: coverpoint r.sfp10_ena_n.value iff (!is_read);
        sfp10_ena_n_rd: coverpoint r.sfp10_ena_n.value iff  (is_read);
        sfp10_txdisable_wr: coverpoint r.sfp10_txdisable.value iff (!is_read);
        sfp10_txdisable_rd: coverpoint r.sfp10_txdisable.value iff  (is_read);
        sfp10_ratesel_wr: coverpoint r.sfp10_ratesel.value iff (!is_read);
        sfp10_ratesel_rd: coverpoint r.sfp10_ratesel.value iff  (is_read);
        sfp11_ena_n_wr: coverpoint r.sfp11_ena_n.value iff (!is_read);
        sfp11_ena_n_rd: coverpoint r.sfp11_ena_n.value iff  (is_read);
        sfp11_txdisable_wr: coverpoint r.sfp11_txdisable.value iff (!is_read);
        sfp11_txdisable_rd: coverpoint r.sfp11_txdisable.value iff  (is_read);
        sfp11_ratesel_wr: coverpoint r.sfp11_ratesel.value iff (!is_read);
        sfp11_ratesel_rd: coverpoint r.sfp11_ratesel.value iff  (is_read);
        sfp12_ena_n_wr: coverpoint r.sfp12_ena_n.value iff (!is_read);
        sfp12_ena_n_rd: coverpoint r.sfp12_ena_n.value iff  (is_read);
        sfp12_txdisable_wr: coverpoint r.sfp12_txdisable.value iff (!is_read);
        sfp12_txdisable_rd: coverpoint r.sfp12_txdisable.value iff  (is_read);
        sfp12_ratesel_wr: coverpoint r.sfp12_ratesel.value iff (!is_read);
        sfp12_ratesel_rd: coverpoint r.sfp12_ratesel.value iff  (is_read);
    endgroup

    `uvm_object_utils(platform_ctrl_reg_pkg::platform_ctrl_sfp_ctrl_2_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="platform_ctrl_sfp_ctrl_2_reg_cover");
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
    static function platform_ctrl_sfp_ctrl_2_reg_cover get();
        if (m_inst == null) begin
            m_inst = platform_ctrl_sfp_ctrl_2_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(platform_ctrl_sfp_ctrl_2_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class platform_ctrl_sfp_status_1_reg_cover;

// Class: platform_ctrl_sfp_status_1_reg
// Register platform_ctrl.sfp_status_1: 
class platform_ctrl_sfp_status_1_reg extends uvm_reg;

    // Variable: sfp1_ena_n_status
    // actual status of the sfp1_ena_n pin
    rand uvm_reg_field sfp1_ena_n_status;
    // Variable: sfp1_detect_n
    // Presence detect from sfp
    rand uvm_reg_field sfp1_detect_n;
    // Variable: sfp1_sdet_n
    // Signal detected from sfp
    rand uvm_reg_field sfp1_sdet_n;
    // Variable: sfp1_txfault
    // Tx Fault from sfp
    rand uvm_reg_field sfp1_txfault;
    // Variable: sfp2_ena_n_status
    // actual status of the sfp2_ena_n pin
    rand uvm_reg_field sfp2_ena_n_status;
    // Variable: sfp2_detect_n
    // Presence detect from sfp
    rand uvm_reg_field sfp2_detect_n;
    // Variable: sfp2_sdet_n
    // Signal detect from sfp
    rand uvm_reg_field sfp2_sdet_n;
    // Variable: sfp2_txfault
    // Tx Fault from sfp
    rand uvm_reg_field sfp2_txfault;
    // Variable: sfp3_ena_n_status
    // actual status of the sfp3_ena_n pin
    rand uvm_reg_field sfp3_ena_n_status;
    // Variable: sfp3_detect_n
    // Presence detect from sfp
    rand uvm_reg_field sfp3_detect_n;
    // Variable: sfp3_sdet_n
    // Signal detected from sfp
    rand uvm_reg_field sfp3_sdet_n;
    // Variable: sfp3_txfault
    // Tx Fault from sfp
    rand uvm_reg_field sfp3_txfault;
    // Variable: sfp4_ena_n_status
    // actual status of the sfp4_ena_n pin
    rand uvm_reg_field sfp4_ena_n_status;
    // Variable: sfp4_detect_n
    // Presence detect from sfp
    rand uvm_reg_field sfp4_detect_n;
    // Variable: sfp4_sdet_n
    // Signal detected from sfp
    rand uvm_reg_field sfp4_sdet_n;
    // Variable: sfp4_txfault
    // Tx Fault from sfp
    rand uvm_reg_field sfp4_txfault;
    // Variable: sfp5_ena_n_status
    // actual status of the sfp5_ena_n pin
    rand uvm_reg_field sfp5_ena_n_status;
    // Variable: sfp5_detect_n
    // Presence detect from sfp
    rand uvm_reg_field sfp5_detect_n;
    // Variable: sfp5_sdet_n
    // Signal detected from sfp
    rand uvm_reg_field sfp5_sdet_n;
    // Variable: sfp5_txfault
    // Tx Fault from sfp
    rand uvm_reg_field sfp5_txfault;
    // Variable: sfp6_ena_n_status
    // actual status of the sfp6_ena_n pin
    rand uvm_reg_field sfp6_ena_n_status;
    // Variable: sfp6_detect_n
    // Presence detect from sfp
    rand uvm_reg_field sfp6_detect_n;
    // Variable: sfp6_sdet_n
    // Signal detected from sfp
    rand uvm_reg_field sfp6_sdet_n;
    // Variable: sfp6_txfault
    // Tx Fault from sfp
    rand uvm_reg_field sfp6_txfault;
    // Variable: sfp7_ena_n_status
    // actual status of the sfp7_ena_n pin
    rand uvm_reg_field sfp7_ena_n_status;
    // Variable: sfp7_detect_n
    // Presence detect from sfp
    rand uvm_reg_field sfp7_detect_n;
    // Variable: sfp7_sdet_n
    // Signal detected from sfp
    rand uvm_reg_field sfp7_sdet_n;
    // Variable: sfp7_txfault
    // Tx Fault from sfp
    rand uvm_reg_field sfp7_txfault;
    // Variable: sfp8_ena_n_status
    // actual status of the sfp8_ena_n pin
    rand uvm_reg_field sfp8_ena_n_status;
    // Variable: sfp8_detect_n
    // Presence detect from sfp
    rand uvm_reg_field sfp8_detect_n;
    // Variable: sfp8_sdet_n
    // Signal detected from sfp
    rand uvm_reg_field sfp8_sdet_n;
    // Variable: sfp8_txfault
    // Tx Fault from sfp
    rand uvm_reg_field sfp8_txfault;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static platform_ctrl_sfp_status_1_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    platform_ctrl_sfp_status_1_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(platform_ctrl_reg_pkg::platform_ctrl_sfp_status_1_reg)

    // Constructor: new
    function new(string name = "platform_ctrl_sfp_status_1");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        sfp1_ena_n_status = uvm_reg_field::type_id::create("sfp1_ena_n_status", , get_full_name());
        sfp1_detect_n = uvm_reg_field::type_id::create("sfp1_detect_n", , get_full_name());
        sfp1_sdet_n = uvm_reg_field::type_id::create("sfp1_sdet_n", , get_full_name());
        sfp1_txfault = uvm_reg_field::type_id::create("sfp1_txfault", , get_full_name());
        sfp2_ena_n_status = uvm_reg_field::type_id::create("sfp2_ena_n_status", , get_full_name());
        sfp2_detect_n = uvm_reg_field::type_id::create("sfp2_detect_n", , get_full_name());
        sfp2_sdet_n = uvm_reg_field::type_id::create("sfp2_sdet_n", , get_full_name());
        sfp2_txfault = uvm_reg_field::type_id::create("sfp2_txfault", , get_full_name());
        sfp3_ena_n_status = uvm_reg_field::type_id::create("sfp3_ena_n_status", , get_full_name());
        sfp3_detect_n = uvm_reg_field::type_id::create("sfp3_detect_n", , get_full_name());
        sfp3_sdet_n = uvm_reg_field::type_id::create("sfp3_sdet_n", , get_full_name());
        sfp3_txfault = uvm_reg_field::type_id::create("sfp3_txfault", , get_full_name());
        sfp4_ena_n_status = uvm_reg_field::type_id::create("sfp4_ena_n_status", , get_full_name());
        sfp4_detect_n = uvm_reg_field::type_id::create("sfp4_detect_n", , get_full_name());
        sfp4_sdet_n = uvm_reg_field::type_id::create("sfp4_sdet_n", , get_full_name());
        sfp4_txfault = uvm_reg_field::type_id::create("sfp4_txfault", , get_full_name());
        sfp5_ena_n_status = uvm_reg_field::type_id::create("sfp5_ena_n_status", , get_full_name());
        sfp5_detect_n = uvm_reg_field::type_id::create("sfp5_detect_n", , get_full_name());
        sfp5_sdet_n = uvm_reg_field::type_id::create("sfp5_sdet_n", , get_full_name());
        sfp5_txfault = uvm_reg_field::type_id::create("sfp5_txfault", , get_full_name());
        sfp6_ena_n_status = uvm_reg_field::type_id::create("sfp6_ena_n_status", , get_full_name());
        sfp6_detect_n = uvm_reg_field::type_id::create("sfp6_detect_n", , get_full_name());
        sfp6_sdet_n = uvm_reg_field::type_id::create("sfp6_sdet_n", , get_full_name());
        sfp6_txfault = uvm_reg_field::type_id::create("sfp6_txfault", , get_full_name());
        sfp7_ena_n_status = uvm_reg_field::type_id::create("sfp7_ena_n_status", , get_full_name());
        sfp7_detect_n = uvm_reg_field::type_id::create("sfp7_detect_n", , get_full_name());
        sfp7_sdet_n = uvm_reg_field::type_id::create("sfp7_sdet_n", , get_full_name());
        sfp7_txfault = uvm_reg_field::type_id::create("sfp7_txfault", , get_full_name());
        sfp8_ena_n_status = uvm_reg_field::type_id::create("sfp8_ena_n_status", , get_full_name());
        sfp8_detect_n = uvm_reg_field::type_id::create("sfp8_detect_n", , get_full_name());
        sfp8_sdet_n = uvm_reg_field::type_id::create("sfp8_sdet_n", , get_full_name());
        sfp8_txfault = uvm_reg_field::type_id::create("sfp8_txfault", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        sfp1_ena_n_status.configure(this, 1, 0, "RO", 0, 'h0, 1, 1, 0);
        sfp1_detect_n.configure(this, 1, 1, "RO", 0, 'h0, 1, 1, 0);
        sfp1_sdet_n.configure(this, 1, 2, "RO", 0, 'h0, 1, 1, 0);
        sfp1_txfault.configure(this, 1, 3, "RO", 0, 'h0, 1, 1, 0);
        sfp2_ena_n_status.configure(this, 1, 4, "RO", 0, 'h0, 1, 1, 0);
        sfp2_detect_n.configure(this, 1, 5, "RO", 0, 'h0, 1, 1, 0);
        sfp2_sdet_n.configure(this, 1, 6, "RO", 0, 'h0, 1, 1, 0);
        sfp2_txfault.configure(this, 1, 7, "RO", 0, 'h0, 1, 1, 0);
        sfp3_ena_n_status.configure(this, 1, 8, "RO", 0, 'h0, 1, 1, 0);
        sfp3_detect_n.configure(this, 1, 9, "RO", 0, 'h0, 1, 1, 0);
        sfp3_sdet_n.configure(this, 1, 10, "RO", 0, 'h0, 1, 1, 0);
        sfp3_txfault.configure(this, 1, 11, "RO", 0, 'h0, 1, 1, 0);
        sfp4_ena_n_status.configure(this, 1, 12, "RO", 0, 'h0, 1, 1, 0);
        sfp4_detect_n.configure(this, 1, 13, "RO", 0, 'h0, 1, 1, 0);
        sfp4_sdet_n.configure(this, 1, 14, "RO", 0, 'h0, 1, 1, 0);
        sfp4_txfault.configure(this, 1, 15, "RO", 0, 'h0, 1, 1, 0);
        sfp5_ena_n_status.configure(this, 1, 16, "RO", 0, 'h0, 1, 1, 0);
        sfp5_detect_n.configure(this, 1, 17, "RO", 0, 'h0, 1, 1, 0);
        sfp5_sdet_n.configure(this, 1, 18, "RO", 0, 'h0, 1, 1, 0);
        sfp5_txfault.configure(this, 1, 19, "RO", 0, 'h0, 1, 1, 0);
        sfp6_ena_n_status.configure(this, 1, 20, "RO", 0, 'h0, 1, 1, 0);
        sfp6_detect_n.configure(this, 1, 21, "RO", 0, 'h0, 1, 1, 0);
        sfp6_sdet_n.configure(this, 1, 22, "RO", 0, 'h0, 1, 1, 0);
        sfp6_txfault.configure(this, 1, 23, "RO", 0, 'h0, 1, 1, 0);
        sfp7_ena_n_status.configure(this, 1, 24, "RO", 0, 'h0, 1, 1, 0);
        sfp7_detect_n.configure(this, 1, 25, "RO", 0, 'h0, 1, 1, 0);
        sfp7_sdet_n.configure(this, 1, 26, "RO", 0, 'h0, 1, 1, 0);
        sfp7_txfault.configure(this, 1, 27, "RO", 0, 'h0, 1, 1, 0);
        sfp8_ena_n_status.configure(this, 1, 28, "RO", 0, 'h0, 1, 1, 0);
        sfp8_detect_n.configure(this, 1, 29, "RO", 0, 'h0, 1, 1, 0);
        sfp8_sdet_n.configure(this, 1, 30, "RO", 0, 'h0, 1, 1, 0);
        sfp8_txfault.configure(this, 1, 31, "RO", 0, 'h0, 1, 1, 0);
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
                cg = platform_ctrl_sfp_status_1_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = platform_ctrl_sfp_status_1_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp1_ena_n_status.get_name, sfp1_ena_n_status.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp1_detect_n.get_name, sfp1_detect_n.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp1_sdet_n.get_name, sfp1_sdet_n.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp1_txfault.get_name, sfp1_txfault.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp2_ena_n_status.get_name, sfp2_ena_n_status.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp2_detect_n.get_name, sfp2_detect_n.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp2_sdet_n.get_name, sfp2_sdet_n.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp2_txfault.get_name, sfp2_txfault.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp3_ena_n_status.get_name, sfp3_ena_n_status.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp3_detect_n.get_name, sfp3_detect_n.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp3_sdet_n.get_name, sfp3_sdet_n.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp3_txfault.get_name, sfp3_txfault.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp4_ena_n_status.get_name, sfp4_ena_n_status.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp4_detect_n.get_name, sfp4_detect_n.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp4_sdet_n.get_name, sfp4_sdet_n.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp4_txfault.get_name, sfp4_txfault.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp5_ena_n_status.get_name, sfp5_ena_n_status.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp5_detect_n.get_name, sfp5_detect_n.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp5_sdet_n.get_name, sfp5_sdet_n.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp5_txfault.get_name, sfp5_txfault.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp6_ena_n_status.get_name, sfp6_ena_n_status.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp6_detect_n.get_name, sfp6_detect_n.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp6_sdet_n.get_name, sfp6_sdet_n.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp6_txfault.get_name, sfp6_txfault.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp7_ena_n_status.get_name, sfp7_ena_n_status.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp7_detect_n.get_name, sfp7_detect_n.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp7_sdet_n.get_name, sfp7_sdet_n.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp7_txfault.get_name, sfp7_txfault.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp8_ena_n_status.get_name, sfp8_ena_n_status.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp8_detect_n.get_name, sfp8_detect_n.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp8_sdet_n.get_name, sfp8_sdet_n.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp8_txfault.get_name, sfp8_txfault.value);
        return s;
    endfunction

endclass


// Class: platform_ctrl_sfp_status_1_reg_cover
// Register coverage object.
class platform_ctrl_sfp_status_1_reg_cover extends uvm_object;

    static local platform_ctrl_sfp_status_1_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    platform_ctrl_sfp_status_1_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        sfp1_ena_n_status_wr: coverpoint r.sfp1_ena_n_status.value iff (!is_read);
        sfp1_ena_n_status_rd: coverpoint r.sfp1_ena_n_status.value iff  (is_read);
        sfp1_detect_n_wr: coverpoint r.sfp1_detect_n.value iff (!is_read);
        sfp1_detect_n_rd: coverpoint r.sfp1_detect_n.value iff  (is_read);
        sfp1_sdet_n_wr: coverpoint r.sfp1_sdet_n.value iff (!is_read);
        sfp1_sdet_n_rd: coverpoint r.sfp1_sdet_n.value iff  (is_read);
        sfp1_txfault_wr: coverpoint r.sfp1_txfault.value iff (!is_read);
        sfp1_txfault_rd: coverpoint r.sfp1_txfault.value iff  (is_read);
        sfp2_ena_n_status_wr: coverpoint r.sfp2_ena_n_status.value iff (!is_read);
        sfp2_ena_n_status_rd: coverpoint r.sfp2_ena_n_status.value iff  (is_read);
        sfp2_detect_n_wr: coverpoint r.sfp2_detect_n.value iff (!is_read);
        sfp2_detect_n_rd: coverpoint r.sfp2_detect_n.value iff  (is_read);
        sfp2_sdet_n_wr: coverpoint r.sfp2_sdet_n.value iff (!is_read);
        sfp2_sdet_n_rd: coverpoint r.sfp2_sdet_n.value iff  (is_read);
        sfp2_txfault_wr: coverpoint r.sfp2_txfault.value iff (!is_read);
        sfp2_txfault_rd: coverpoint r.sfp2_txfault.value iff  (is_read);
        sfp3_ena_n_status_wr: coverpoint r.sfp3_ena_n_status.value iff (!is_read);
        sfp3_ena_n_status_rd: coverpoint r.sfp3_ena_n_status.value iff  (is_read);
        sfp3_detect_n_wr: coverpoint r.sfp3_detect_n.value iff (!is_read);
        sfp3_detect_n_rd: coverpoint r.sfp3_detect_n.value iff  (is_read);
        sfp3_sdet_n_wr: coverpoint r.sfp3_sdet_n.value iff (!is_read);
        sfp3_sdet_n_rd: coverpoint r.sfp3_sdet_n.value iff  (is_read);
        sfp3_txfault_wr: coverpoint r.sfp3_txfault.value iff (!is_read);
        sfp3_txfault_rd: coverpoint r.sfp3_txfault.value iff  (is_read);
        sfp4_ena_n_status_wr: coverpoint r.sfp4_ena_n_status.value iff (!is_read);
        sfp4_ena_n_status_rd: coverpoint r.sfp4_ena_n_status.value iff  (is_read);
        sfp4_detect_n_wr: coverpoint r.sfp4_detect_n.value iff (!is_read);
        sfp4_detect_n_rd: coverpoint r.sfp4_detect_n.value iff  (is_read);
        sfp4_sdet_n_wr: coverpoint r.sfp4_sdet_n.value iff (!is_read);
        sfp4_sdet_n_rd: coverpoint r.sfp4_sdet_n.value iff  (is_read);
        sfp4_txfault_wr: coverpoint r.sfp4_txfault.value iff (!is_read);
        sfp4_txfault_rd: coverpoint r.sfp4_txfault.value iff  (is_read);
        sfp5_ena_n_status_wr: coverpoint r.sfp5_ena_n_status.value iff (!is_read);
        sfp5_ena_n_status_rd: coverpoint r.sfp5_ena_n_status.value iff  (is_read);
        sfp5_detect_n_wr: coverpoint r.sfp5_detect_n.value iff (!is_read);
        sfp5_detect_n_rd: coverpoint r.sfp5_detect_n.value iff  (is_read);
        sfp5_sdet_n_wr: coverpoint r.sfp5_sdet_n.value iff (!is_read);
        sfp5_sdet_n_rd: coverpoint r.sfp5_sdet_n.value iff  (is_read);
        sfp5_txfault_wr: coverpoint r.sfp5_txfault.value iff (!is_read);
        sfp5_txfault_rd: coverpoint r.sfp5_txfault.value iff  (is_read);
        sfp6_ena_n_status_wr: coverpoint r.sfp6_ena_n_status.value iff (!is_read);
        sfp6_ena_n_status_rd: coverpoint r.sfp6_ena_n_status.value iff  (is_read);
        sfp6_detect_n_wr: coverpoint r.sfp6_detect_n.value iff (!is_read);
        sfp6_detect_n_rd: coverpoint r.sfp6_detect_n.value iff  (is_read);
        sfp6_sdet_n_wr: coverpoint r.sfp6_sdet_n.value iff (!is_read);
        sfp6_sdet_n_rd: coverpoint r.sfp6_sdet_n.value iff  (is_read);
        sfp6_txfault_wr: coverpoint r.sfp6_txfault.value iff (!is_read);
        sfp6_txfault_rd: coverpoint r.sfp6_txfault.value iff  (is_read);
        sfp7_ena_n_status_wr: coverpoint r.sfp7_ena_n_status.value iff (!is_read);
        sfp7_ena_n_status_rd: coverpoint r.sfp7_ena_n_status.value iff  (is_read);
        sfp7_detect_n_wr: coverpoint r.sfp7_detect_n.value iff (!is_read);
        sfp7_detect_n_rd: coverpoint r.sfp7_detect_n.value iff  (is_read);
        sfp7_sdet_n_wr: coverpoint r.sfp7_sdet_n.value iff (!is_read);
        sfp7_sdet_n_rd: coverpoint r.sfp7_sdet_n.value iff  (is_read);
        sfp7_txfault_wr: coverpoint r.sfp7_txfault.value iff (!is_read);
        sfp7_txfault_rd: coverpoint r.sfp7_txfault.value iff  (is_read);
        sfp8_ena_n_status_wr: coverpoint r.sfp8_ena_n_status.value iff (!is_read);
        sfp8_ena_n_status_rd: coverpoint r.sfp8_ena_n_status.value iff  (is_read);
        sfp8_detect_n_wr: coverpoint r.sfp8_detect_n.value iff (!is_read);
        sfp8_detect_n_rd: coverpoint r.sfp8_detect_n.value iff  (is_read);
        sfp8_sdet_n_wr: coverpoint r.sfp8_sdet_n.value iff (!is_read);
        sfp8_sdet_n_rd: coverpoint r.sfp8_sdet_n.value iff  (is_read);
        sfp8_txfault_wr: coverpoint r.sfp8_txfault.value iff (!is_read);
        sfp8_txfault_rd: coverpoint r.sfp8_txfault.value iff  (is_read);
    endgroup

    `uvm_object_utils(platform_ctrl_reg_pkg::platform_ctrl_sfp_status_1_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="platform_ctrl_sfp_status_1_reg_cover");
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
    static function platform_ctrl_sfp_status_1_reg_cover get();
        if (m_inst == null) begin
            m_inst = platform_ctrl_sfp_status_1_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(platform_ctrl_sfp_status_1_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class platform_ctrl_sfp_status_2_reg_cover;

// Class: platform_ctrl_sfp_status_2_reg
// Register platform_ctrl.sfp_status_2: 
class platform_ctrl_sfp_status_2_reg extends uvm_reg;

    // Variable: sfp9_ena_n_status
    // actual status of the sfp9_ena_n pin
    rand uvm_reg_field sfp9_ena_n_status;
    // Variable: sfp9_detect_n
    // Presence detect from sfp
    rand uvm_reg_field sfp9_detect_n;
    // Variable: sfp9_sdet_n
    // Signal detected from sfp
    rand uvm_reg_field sfp9_sdet_n;
    // Variable: sfp9_txfault
    // Tx Fault from sfp
    rand uvm_reg_field sfp9_txfault;
    // Variable: sfp10_ena_n_status
    // actual status of the sfp10_ena_n pin
    rand uvm_reg_field sfp10_ena_n_status;
    // Variable: sfp10_detect_n
    // Presence detect from sfp
    rand uvm_reg_field sfp10_detect_n;
    // Variable: sfp10_sdet_n
    // Signal detected from sfp
    rand uvm_reg_field sfp10_sdet_n;
    // Variable: sfp10_txfault
    // Tx Fault from sfp
    rand uvm_reg_field sfp10_txfault;
    // Variable: sfp11_ena_n_status
    // actual status of the sfp11_ena_n pin
    rand uvm_reg_field sfp11_ena_n_status;
    // Variable: sfp11_detect_n
    // Presence detect from sfp
    rand uvm_reg_field sfp11_detect_n;
    // Variable: sfp11_sdet_n
    // Signal detected from sfp
    rand uvm_reg_field sfp11_sdet_n;
    // Variable: sfp11_txfault
    // Tx Fault from sfp
    rand uvm_reg_field sfp11_txfault;
    // Variable: sfp12_ena_n_status
    // actual status of the sfp12_ena_n pin
    rand uvm_reg_field sfp12_ena_n_status;
    // Variable: sfp12_detect_n
    // Presence detect from sfp
    rand uvm_reg_field sfp12_detect_n;
    // Variable: sfp12_sdet_n
    // Signal detected from sfp
    rand uvm_reg_field sfp12_sdet_n;
    // Variable: sfp12_txfault
    // Tx Fault from sfp
    rand uvm_reg_field sfp12_txfault;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static platform_ctrl_sfp_status_2_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    platform_ctrl_sfp_status_2_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(platform_ctrl_reg_pkg::platform_ctrl_sfp_status_2_reg)

    // Constructor: new
    function new(string name = "platform_ctrl_sfp_status_2");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        sfp9_ena_n_status = uvm_reg_field::type_id::create("sfp9_ena_n_status", , get_full_name());
        sfp9_detect_n = uvm_reg_field::type_id::create("sfp9_detect_n", , get_full_name());
        sfp9_sdet_n = uvm_reg_field::type_id::create("sfp9_sdet_n", , get_full_name());
        sfp9_txfault = uvm_reg_field::type_id::create("sfp9_txfault", , get_full_name());
        sfp10_ena_n_status = uvm_reg_field::type_id::create("sfp10_ena_n_status", , get_full_name());
        sfp10_detect_n = uvm_reg_field::type_id::create("sfp10_detect_n", , get_full_name());
        sfp10_sdet_n = uvm_reg_field::type_id::create("sfp10_sdet_n", , get_full_name());
        sfp10_txfault = uvm_reg_field::type_id::create("sfp10_txfault", , get_full_name());
        sfp11_ena_n_status = uvm_reg_field::type_id::create("sfp11_ena_n_status", , get_full_name());
        sfp11_detect_n = uvm_reg_field::type_id::create("sfp11_detect_n", , get_full_name());
        sfp11_sdet_n = uvm_reg_field::type_id::create("sfp11_sdet_n", , get_full_name());
        sfp11_txfault = uvm_reg_field::type_id::create("sfp11_txfault", , get_full_name());
        sfp12_ena_n_status = uvm_reg_field::type_id::create("sfp12_ena_n_status", , get_full_name());
        sfp12_detect_n = uvm_reg_field::type_id::create("sfp12_detect_n", , get_full_name());
        sfp12_sdet_n = uvm_reg_field::type_id::create("sfp12_sdet_n", , get_full_name());
        sfp12_txfault = uvm_reg_field::type_id::create("sfp12_txfault", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        sfp9_ena_n_status.configure(this, 1, 0, "RO", 0, 'h0, 1, 1, 0);
        sfp9_detect_n.configure(this, 1, 1, "RO", 0, 'h0, 1, 1, 0);
        sfp9_sdet_n.configure(this, 1, 2, "RO", 0, 'h0, 1, 1, 0);
        sfp9_txfault.configure(this, 1, 3, "RO", 0, 'h0, 1, 1, 0);
        sfp10_ena_n_status.configure(this, 1, 4, "RO", 0, 'h0, 1, 1, 0);
        sfp10_detect_n.configure(this, 1, 5, "RO", 0, 'h0, 1, 1, 0);
        sfp10_sdet_n.configure(this, 1, 6, "RO", 0, 'h0, 1, 1, 0);
        sfp10_txfault.configure(this, 1, 7, "RO", 0, 'h0, 1, 1, 0);
        sfp11_ena_n_status.configure(this, 1, 8, "RO", 0, 'h0, 1, 1, 0);
        sfp11_detect_n.configure(this, 1, 9, "RO", 0, 'h0, 1, 1, 0);
        sfp11_sdet_n.configure(this, 1, 10, "RO", 0, 'h0, 1, 1, 0);
        sfp11_txfault.configure(this, 1, 11, "RO", 0, 'h0, 1, 1, 0);
        sfp12_ena_n_status.configure(this, 1, 12, "RO", 0, 'h0, 1, 1, 0);
        sfp12_detect_n.configure(this, 1, 13, "RO", 0, 'h0, 1, 1, 0);
        sfp12_sdet_n.configure(this, 1, 14, "RO", 0, 'h0, 1, 1, 0);
        sfp12_txfault.configure(this, 1, 15, "RO", 0, 'h0, 1, 1, 0);
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
                cg = platform_ctrl_sfp_status_2_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = platform_ctrl_sfp_status_2_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp9_ena_n_status.get_name, sfp9_ena_n_status.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp9_detect_n.get_name, sfp9_detect_n.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp9_sdet_n.get_name, sfp9_sdet_n.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp9_txfault.get_name, sfp9_txfault.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp10_ena_n_status.get_name, sfp10_ena_n_status.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp10_detect_n.get_name, sfp10_detect_n.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp10_sdet_n.get_name, sfp10_sdet_n.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp10_txfault.get_name, sfp10_txfault.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp11_ena_n_status.get_name, sfp11_ena_n_status.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp11_detect_n.get_name, sfp11_detect_n.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp11_sdet_n.get_name, sfp11_sdet_n.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp11_txfault.get_name, sfp11_txfault.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp12_ena_n_status.get_name, sfp12_ena_n_status.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp12_detect_n.get_name, sfp12_detect_n.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp12_sdet_n.get_name, sfp12_sdet_n.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sfp12_txfault.get_name, sfp12_txfault.value);
        return s;
    endfunction

endclass


// Class: platform_ctrl_sfp_status_2_reg_cover
// Register coverage object.
class platform_ctrl_sfp_status_2_reg_cover extends uvm_object;

    static local platform_ctrl_sfp_status_2_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    platform_ctrl_sfp_status_2_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        sfp9_ena_n_status_wr: coverpoint r.sfp9_ena_n_status.value iff (!is_read);
        sfp9_ena_n_status_rd: coverpoint r.sfp9_ena_n_status.value iff  (is_read);
        sfp9_detect_n_wr: coverpoint r.sfp9_detect_n.value iff (!is_read);
        sfp9_detect_n_rd: coverpoint r.sfp9_detect_n.value iff  (is_read);
        sfp9_sdet_n_wr: coverpoint r.sfp9_sdet_n.value iff (!is_read);
        sfp9_sdet_n_rd: coverpoint r.sfp9_sdet_n.value iff  (is_read);
        sfp9_txfault_wr: coverpoint r.sfp9_txfault.value iff (!is_read);
        sfp9_txfault_rd: coverpoint r.sfp9_txfault.value iff  (is_read);
        sfp10_ena_n_status_wr: coverpoint r.sfp10_ena_n_status.value iff (!is_read);
        sfp10_ena_n_status_rd: coverpoint r.sfp10_ena_n_status.value iff  (is_read);
        sfp10_detect_n_wr: coverpoint r.sfp10_detect_n.value iff (!is_read);
        sfp10_detect_n_rd: coverpoint r.sfp10_detect_n.value iff  (is_read);
        sfp10_sdet_n_wr: coverpoint r.sfp10_sdet_n.value iff (!is_read);
        sfp10_sdet_n_rd: coverpoint r.sfp10_sdet_n.value iff  (is_read);
        sfp10_txfault_wr: coverpoint r.sfp10_txfault.value iff (!is_read);
        sfp10_txfault_rd: coverpoint r.sfp10_txfault.value iff  (is_read);
        sfp11_ena_n_status_wr: coverpoint r.sfp11_ena_n_status.value iff (!is_read);
        sfp11_ena_n_status_rd: coverpoint r.sfp11_ena_n_status.value iff  (is_read);
        sfp11_detect_n_wr: coverpoint r.sfp11_detect_n.value iff (!is_read);
        sfp11_detect_n_rd: coverpoint r.sfp11_detect_n.value iff  (is_read);
        sfp11_sdet_n_wr: coverpoint r.sfp11_sdet_n.value iff (!is_read);
        sfp11_sdet_n_rd: coverpoint r.sfp11_sdet_n.value iff  (is_read);
        sfp11_txfault_wr: coverpoint r.sfp11_txfault.value iff (!is_read);
        sfp11_txfault_rd: coverpoint r.sfp11_txfault.value iff  (is_read);
        sfp12_ena_n_status_wr: coverpoint r.sfp12_ena_n_status.value iff (!is_read);
        sfp12_ena_n_status_rd: coverpoint r.sfp12_ena_n_status.value iff  (is_read);
        sfp12_detect_n_wr: coverpoint r.sfp12_detect_n.value iff (!is_read);
        sfp12_detect_n_rd: coverpoint r.sfp12_detect_n.value iff  (is_read);
        sfp12_sdet_n_wr: coverpoint r.sfp12_sdet_n.value iff (!is_read);
        sfp12_sdet_n_rd: coverpoint r.sfp12_sdet_n.value iff  (is_read);
        sfp12_txfault_wr: coverpoint r.sfp12_txfault.value iff (!is_read);
        sfp12_txfault_rd: coverpoint r.sfp12_txfault.value iff  (is_read);
    endgroup

    `uvm_object_utils(platform_ctrl_reg_pkg::platform_ctrl_sfp_status_2_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="platform_ctrl_sfp_status_2_reg_cover");
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
    static function platform_ctrl_sfp_status_2_reg_cover get();
        if (m_inst == null) begin
            m_inst = platform_ctrl_sfp_status_2_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(platform_ctrl_sfp_status_2_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class platform_ctrl_fan_control_reg_cover;

// Class: platform_ctrl_fan_control_reg
// Register platform_ctrl.fan_control: 
class platform_ctrl_fan_control_reg extends uvm_reg;

    // Variable: fan_prescaler
    // 1MHz / fan base control frequency (Eg 40 for a 25KHz fan)
    rand uvm_reg_field fan_prescaler;
    // Variable: fan_1_speed
    // Desired fan speed in % (0 : stop; 30 : minimum start speed from stop; 100 : maximum speed)
    rand uvm_reg_field fan_1_speed;
    // Variable: fan_2_speed
    // Desired fan speed in % (0 : stop; 30 : minimum start speed from stop; 100 : maximum speed)
    rand uvm_reg_field fan_2_speed;
    // Variable: fan_1_enable
    // 0 : off; 1: on
    rand uvm_reg_field fan_1_enable;
    // Variable: fan_2_enable
    // 0 : off; 1: on
    rand uvm_reg_field fan_2_enable;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static platform_ctrl_fan_control_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    platform_ctrl_fan_control_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(platform_ctrl_reg_pkg::platform_ctrl_fan_control_reg)

    // Constructor: new
    function new(string name = "platform_ctrl_fan_control");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        fan_prescaler = uvm_reg_field::type_id::create("fan_prescaler", , get_full_name());
        fan_1_speed = uvm_reg_field::type_id::create("fan_1_speed", , get_full_name());
        fan_2_speed = uvm_reg_field::type_id::create("fan_2_speed", , get_full_name());
        fan_1_enable = uvm_reg_field::type_id::create("fan_1_enable", , get_full_name());
        fan_2_enable = uvm_reg_field::type_id::create("fan_2_enable", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        fan_prescaler.configure(this, 8, 0, "RW", 0, 'h0, 1, 1, 0);
        fan_1_speed.configure(this, 8, 8, "RW", 0, 'h32, 1, 1, 0);
        fan_2_speed.configure(this, 8, 16, "RW", 0, 'h32, 1, 1, 0);
        fan_1_enable.configure(this, 1, 24, "RW", 0, 'h1, 1, 1, 0);
        fan_2_enable.configure(this, 1, 25, "RW", 0, 'h1, 1, 1, 0);
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
                cg = platform_ctrl_fan_control_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = platform_ctrl_fan_control_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, fan_prescaler.get_name, fan_prescaler.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, fan_1_speed.get_name, fan_1_speed.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, fan_2_speed.get_name, fan_2_speed.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, fan_1_enable.get_name, fan_1_enable.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, fan_2_enable.get_name, fan_2_enable.value);
        return s;
    endfunction

endclass


// Class: platform_ctrl_fan_control_reg_cover
// Register coverage object.
class platform_ctrl_fan_control_reg_cover extends uvm_object;

    static local platform_ctrl_fan_control_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    platform_ctrl_fan_control_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        fan_prescaler_wr: coverpoint r.fan_prescaler.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        fan_prescaler_rd: coverpoint r.fan_prescaler.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        fan_1_speed_wr: coverpoint r.fan_1_speed.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        fan_1_speed_rd: coverpoint r.fan_1_speed.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        fan_2_speed_wr: coverpoint r.fan_2_speed.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        fan_2_speed_rd: coverpoint r.fan_2_speed.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        fan_1_enable_wr: coverpoint r.fan_1_enable.value iff (!is_read);
        fan_1_enable_rd: coverpoint r.fan_1_enable.value iff  (is_read);
        fan_2_enable_wr: coverpoint r.fan_2_enable.value iff (!is_read);
        fan_2_enable_rd: coverpoint r.fan_2_enable.value iff  (is_read);
    endgroup

    `uvm_object_utils(platform_ctrl_reg_pkg::platform_ctrl_fan_control_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="platform_ctrl_fan_control_reg_cover");
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
    static function platform_ctrl_fan_control_reg_cover get();
        if (m_inst == null) begin
            m_inst = platform_ctrl_fan_control_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(platform_ctrl_fan_control_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class platform_ctrl_fan_tach_reg_cover;

// Class: platform_ctrl_fan_tach_reg
// Register platform_ctrl.fan_tach: 
class platform_ctrl_fan_tach_reg extends uvm_reg;

    // Variable: fan_tach_1
    // RPM value
    rand uvm_reg_field fan_tach_1;
    // Variable: fan_tach_2
    // RPM value
    rand uvm_reg_field fan_tach_2;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static platform_ctrl_fan_tach_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    platform_ctrl_fan_tach_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(platform_ctrl_reg_pkg::platform_ctrl_fan_tach_reg)

    // Constructor: new
    function new(string name = "platform_ctrl_fan_tach");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        fan_tach_1 = uvm_reg_field::type_id::create("fan_tach_1", , get_full_name());
        fan_tach_2 = uvm_reg_field::type_id::create("fan_tach_2", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        fan_tach_1.configure(this, 15, 0, "RO", 0, 'h0, 1, 1, 0);
        fan_tach_2.configure(this, 15, 16, "RO", 0, 'h0, 1, 1, 0);
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
                cg = platform_ctrl_fan_tach_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = platform_ctrl_fan_tach_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, fan_tach_1.get_name, fan_tach_1.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, fan_tach_2.get_name, fan_tach_2.value);
        return s;
    endfunction

endclass


// Class: platform_ctrl_fan_tach_reg_cover
// Register coverage object.
class platform_ctrl_fan_tach_reg_cover extends uvm_object;

    static local platform_ctrl_fan_tach_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    platform_ctrl_fan_tach_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        fan_tach_1_wr: coverpoint r.fan_tach_1.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        fan_tach_1_rd: coverpoint r.fan_tach_1.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        fan_tach_2_wr: coverpoint r.fan_tach_2.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        fan_tach_2_rd: coverpoint r.fan_tach_2.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(platform_ctrl_reg_pkg::platform_ctrl_fan_tach_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="platform_ctrl_fan_tach_reg_cover");
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
    static function platform_ctrl_fan_tach_reg_cover get();
        if (m_inst == null) begin
            m_inst = platform_ctrl_fan_tach_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(platform_ctrl_fan_tach_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class platform_ctrl_spi_9553_reg_cover;

// Class: platform_ctrl_spi_9553_reg
// Register platform_ctrl.spi_9553: 
class platform_ctrl_spi_9553_reg extends uvm_reg;

    // Variable: wdata
    // SPI wr Data
    rand uvm_reg_field wdata;
    // Variable: rdata
    // SPI rd Data
    rand uvm_reg_field rdata;
    // Variable: address
    // SPI Address
    rand uvm_reg_field address;
    // Variable: command
    // SPI command (1: RD; 0: WR)
    rand uvm_reg_field command;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static platform_ctrl_spi_9553_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    platform_ctrl_spi_9553_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(platform_ctrl_reg_pkg::platform_ctrl_spi_9553_reg)

    // Constructor: new
    function new(string name = "platform_ctrl_spi_9553");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        wdata = uvm_reg_field::type_id::create("wdata", , get_full_name());
        rdata = uvm_reg_field::type_id::create("rdata", , get_full_name());
        address = uvm_reg_field::type_id::create("address", , get_full_name());
        command = uvm_reg_field::type_id::create("command", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        wdata.configure(this, 8, 0, "RW", 0, 'h0, 1, 1, 0);
        rdata.configure(this, 8, 8, "ro", 0, 'h0, 1, 1, 0);
        address.configure(this, 14, 16, "RW", 0, 'h0, 1, 1, 0);
        command.configure(this, 1, 30, "RW", 0, 'h0, 1, 1, 0);
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
                cg = platform_ctrl_spi_9553_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = platform_ctrl_spi_9553_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, wdata.get_name, wdata.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, rdata.get_name, rdata.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, address.get_name, address.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, command.get_name, command.value);
        return s;
    endfunction

endclass


// Class: platform_ctrl_spi_9553_reg_cover
// Register coverage object.
class platform_ctrl_spi_9553_reg_cover extends uvm_object;

    static local platform_ctrl_spi_9553_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    platform_ctrl_spi_9553_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        wdata_wr: coverpoint r.wdata.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        wdata_rd: coverpoint r.wdata.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        rdata_wr: coverpoint r.rdata.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        rdata_rd: coverpoint r.rdata.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        address_wr: coverpoint r.address.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        address_rd: coverpoint r.address.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        command_wr: coverpoint r.command.value iff (!is_read);
        command_rd: coverpoint r.command.value iff  (is_read);
    endgroup

    `uvm_object_utils(platform_ctrl_reg_pkg::platform_ctrl_spi_9553_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="platform_ctrl_spi_9553_reg_cover");
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
    static function platform_ctrl_spi_9553_reg_cover get();
        if (m_inst == null) begin
            m_inst = platform_ctrl_spi_9553_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(platform_ctrl_spi_9553_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class platform_ctrl_dry_contacts_reg_cover;

// Class: platform_ctrl_dry_contacts_reg
// Register platform_ctrl.dry_contacts: 
class platform_ctrl_dry_contacts_reg extends uvm_reg;

    // Variable: drycontact1
    // 
    rand uvm_reg_field drycontact1;
    // Variable: drycontact2
    // 
    rand uvm_reg_field drycontact2;
    // Variable: drycontact3
    // 
    rand uvm_reg_field drycontact3;
    // Variable: drycontact4
    // 
    rand uvm_reg_field drycontact4;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static platform_ctrl_dry_contacts_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    platform_ctrl_dry_contacts_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(platform_ctrl_reg_pkg::platform_ctrl_dry_contacts_reg)

    // Constructor: new
    function new(string name = "platform_ctrl_dry_contacts");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        drycontact1 = uvm_reg_field::type_id::create("drycontact1", , get_full_name());
        drycontact2 = uvm_reg_field::type_id::create("drycontact2", , get_full_name());
        drycontact3 = uvm_reg_field::type_id::create("drycontact3", , get_full_name());
        drycontact4 = uvm_reg_field::type_id::create("drycontact4", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        drycontact1.configure(this, 8, 0, "RO", 0, 'h0, 1, 1, 0);
        drycontact2.configure(this, 8, 8, "RO", 0, 'h0, 1, 1, 0);
        drycontact3.configure(this, 8, 16, "RO", 0, 'h0, 1, 1, 0);
        drycontact4.configure(this, 8, 24, "RO", 0, 'h0, 1, 1, 0);
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
                cg = platform_ctrl_dry_contacts_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = platform_ctrl_dry_contacts_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, drycontact1.get_name, drycontact1.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, drycontact2.get_name, drycontact2.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, drycontact3.get_name, drycontact3.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, drycontact4.get_name, drycontact4.value);
        return s;
    endfunction

endclass


// Class: platform_ctrl_dry_contacts_reg_cover
// Register coverage object.
class platform_ctrl_dry_contacts_reg_cover extends uvm_object;

    static local platform_ctrl_dry_contacts_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    platform_ctrl_dry_contacts_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        drycontact1_wr: coverpoint r.drycontact1.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        drycontact1_rd: coverpoint r.drycontact1.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        drycontact2_wr: coverpoint r.drycontact2.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        drycontact2_rd: coverpoint r.drycontact2.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        drycontact3_wr: coverpoint r.drycontact3.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        drycontact3_rd: coverpoint r.drycontact3.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        drycontact4_wr: coverpoint r.drycontact4.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        drycontact4_rd: coverpoint r.drycontact4.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(platform_ctrl_reg_pkg::platform_ctrl_dry_contacts_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="platform_ctrl_dry_contacts_reg_cover");
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
    static function platform_ctrl_dry_contacts_reg_cover get();
        if (m_inst == null) begin
            m_inst = platform_ctrl_dry_contacts_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(platform_ctrl_dry_contacts_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class platform_ctrl_board_revision_reg_cover;

// Class: platform_ctrl_board_revision_reg
// Register platform_ctrl.board_revision: Board revision
class platform_ctrl_board_revision_reg extends uvm_reg;

    // Variable: board_rev
    // board rev
    rand uvm_reg_field board_rev;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static platform_ctrl_board_revision_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    platform_ctrl_board_revision_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(platform_ctrl_reg_pkg::platform_ctrl_board_revision_reg)

    // Constructor: new
    function new(string name = "platform_ctrl_board_revision");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        board_rev = uvm_reg_field::type_id::create("board_rev", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        board_rev.configure(this, 4, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = platform_ctrl_board_revision_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = platform_ctrl_board_revision_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, board_rev.get_name, board_rev.value);
        return s;
    endfunction

endclass


// Class: platform_ctrl_board_revision_reg_cover
// Register coverage object.
class platform_ctrl_board_revision_reg_cover extends uvm_object;

    static local platform_ctrl_board_revision_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    platform_ctrl_board_revision_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        board_rev_wr: coverpoint r.board_rev.value iff (!is_read);
        board_rev_rd: coverpoint r.board_rev.value iff  (is_read);
    endgroup

    `uvm_object_utils(platform_ctrl_reg_pkg::platform_ctrl_board_revision_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="platform_ctrl_board_revision_reg_cover");
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
    static function platform_ctrl_board_revision_reg_cover get();
        if (m_inst == null) begin
            m_inst = platform_ctrl_board_revision_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(platform_ctrl_board_revision_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class platform_ctrl_mezzanine_ctrl_reg_cover;

// Class: platform_ctrl_mezzanine_ctrl_reg
// Register platform_ctrl.mezzanine_ctrl: Mezzanine controls
class platform_ctrl_mezzanine_ctrl_reg extends uvm_reg;

    // Variable: mezz_ctrl
    // Reserved for futur use
    rand uvm_reg_field mezz_ctrl;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static platform_ctrl_mezzanine_ctrl_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    platform_ctrl_mezzanine_ctrl_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(platform_ctrl_reg_pkg::platform_ctrl_mezzanine_ctrl_reg)

    // Constructor: new
    function new(string name = "platform_ctrl_mezzanine_ctrl");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        mezz_ctrl = uvm_reg_field::type_id::create("mezz_ctrl", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        mezz_ctrl.configure(this, 3, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = platform_ctrl_mezzanine_ctrl_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = platform_ctrl_mezzanine_ctrl_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, mezz_ctrl.get_name, mezz_ctrl.value);
        return s;
    endfunction

endclass


// Class: platform_ctrl_mezzanine_ctrl_reg_cover
// Register coverage object.
class platform_ctrl_mezzanine_ctrl_reg_cover extends uvm_object;

    static local platform_ctrl_mezzanine_ctrl_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    platform_ctrl_mezzanine_ctrl_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        mezz_ctrl_wr: coverpoint r.mezz_ctrl.value iff (!is_read);
        mezz_ctrl_rd: coverpoint r.mezz_ctrl.value iff  (is_read);
    endgroup

    `uvm_object_utils(platform_ctrl_reg_pkg::platform_ctrl_mezzanine_ctrl_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="platform_ctrl_mezzanine_ctrl_reg_cover");
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
    static function platform_ctrl_mezzanine_ctrl_reg_cover get();
        if (m_inst == null) begin
            m_inst = platform_ctrl_mezzanine_ctrl_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(platform_ctrl_mezzanine_ctrl_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class platform_ctrl_test_conn_reg_cover;

// Class: platform_ctrl_test_conn_reg
// Register platform_ctrl.test_conn: Test connector debug signals
class platform_ctrl_test_conn_reg extends uvm_reg;

    // Variable: test_conn
    // control and debug pins
    rand uvm_reg_field test_conn;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static platform_ctrl_test_conn_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    platform_ctrl_test_conn_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(platform_ctrl_reg_pkg::platform_ctrl_test_conn_reg)

    // Constructor: new
    function new(string name = "platform_ctrl_test_conn");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        test_conn = uvm_reg_field::type_id::create("test_conn", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        test_conn.configure(this, 4, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = platform_ctrl_test_conn_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = platform_ctrl_test_conn_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, test_conn.get_name, test_conn.value);
        return s;
    endfunction

endclass


// Class: platform_ctrl_test_conn_reg_cover
// Register coverage object.
class platform_ctrl_test_conn_reg_cover extends uvm_object;

    static local platform_ctrl_test_conn_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    platform_ctrl_test_conn_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        test_conn_wr: coverpoint r.test_conn.value iff (!is_read);
        test_conn_rd: coverpoint r.test_conn.value iff  (is_read);
    endgroup

    `uvm_object_utils(platform_ctrl_reg_pkg::platform_ctrl_test_conn_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="platform_ctrl_test_conn_reg_cover");
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
    static function platform_ctrl_test_conn_reg_cover get();
        if (m_inst == null) begin
            m_inst = platform_ctrl_test_conn_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(platform_ctrl_test_conn_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class platform_ctrl_misc_status_reg_cover;

// Class: platform_ctrl_misc_status_reg
// Register platform_ctrl.misc_status: Spare connections between CPU and FPGA
class platform_ctrl_misc_status_reg extends uvm_reg;

    // Variable: cpu_fpga_spare
    // Spare inputs from cpu (For test purposes only for now)
    rand uvm_reg_field cpu_fpga_spare;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static platform_ctrl_misc_status_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    platform_ctrl_misc_status_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(platform_ctrl_reg_pkg::platform_ctrl_misc_status_reg)

    // Constructor: new
    function new(string name = "platform_ctrl_misc_status");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        cpu_fpga_spare = uvm_reg_field::type_id::create("cpu_fpga_spare", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        cpu_fpga_spare.configure(this, 5, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = platform_ctrl_misc_status_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = platform_ctrl_misc_status_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, cpu_fpga_spare.get_name, cpu_fpga_spare.value);
        return s;
    endfunction

endclass


// Class: platform_ctrl_misc_status_reg_cover
// Register coverage object.
class platform_ctrl_misc_status_reg_cover extends uvm_object;

    static local platform_ctrl_misc_status_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    platform_ctrl_misc_status_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        cpu_fpga_spare_wr: coverpoint r.cpu_fpga_spare.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        cpu_fpga_spare_rd: coverpoint r.cpu_fpga_spare.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(platform_ctrl_reg_pkg::platform_ctrl_misc_status_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="platform_ctrl_misc_status_reg_cover");
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
    static function platform_ctrl_misc_status_reg_cover get();
        if (m_inst == null) begin
            m_inst = platform_ctrl_misc_status_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(platform_ctrl_misc_status_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class platform_ctrl_mdio_data_reg_cover;

// Class: platform_ctrl_mdio_data_reg
// Register platform_ctrl.mdio_data: MDIO write and read back data
class platform_ctrl_mdio_data_reg extends uvm_reg;

    // Variable: mdio_wdata
    // The mdio data
    rand uvm_reg_field mdio_wdata;
    // Variable: mdio_rdata
    // The mdio data
    rand uvm_reg_field mdio_rdata;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static platform_ctrl_mdio_data_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    platform_ctrl_mdio_data_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(platform_ctrl_reg_pkg::platform_ctrl_mdio_data_reg)

    // Constructor: new
    function new(string name = "platform_ctrl_mdio_data");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        mdio_wdata = uvm_reg_field::type_id::create("mdio_wdata", , get_full_name());
        mdio_rdata = uvm_reg_field::type_id::create("mdio_rdata", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        mdio_wdata.configure(this, 16, 0, "RW", 0, 'h0, 1, 1, 0);
        mdio_rdata.configure(this, 16, 16, "ro", 0, 'h0, 1, 1, 0);
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
                cg = platform_ctrl_mdio_data_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = platform_ctrl_mdio_data_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, mdio_wdata.get_name, mdio_wdata.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, mdio_rdata.get_name, mdio_rdata.value);
        return s;
    endfunction

endclass


// Class: platform_ctrl_mdio_data_reg_cover
// Register coverage object.
class platform_ctrl_mdio_data_reg_cover extends uvm_object;

    static local platform_ctrl_mdio_data_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    platform_ctrl_mdio_data_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        mdio_wdata_wr: coverpoint r.mdio_wdata.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        mdio_wdata_rd: coverpoint r.mdio_wdata.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        mdio_rdata_wr: coverpoint r.mdio_rdata.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        mdio_rdata_rd: coverpoint r.mdio_rdata.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(platform_ctrl_reg_pkg::platform_ctrl_mdio_data_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="platform_ctrl_mdio_data_reg_cover");
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
    static function platform_ctrl_mdio_data_reg_cover get();
        if (m_inst == null) begin
            m_inst = platform_ctrl_mdio_data_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(platform_ctrl_mdio_data_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class platform_ctrl_mdio_ctrl_reg_cover;

// Class: platform_ctrl_mdio_ctrl_reg
// Register platform_ctrl.mdio_ctrl: Mdio access. temp patch operation on write (post trig on write)
class platform_ctrl_mdio_ctrl_reg extends uvm_reg;

    // Variable: register_addr
    // The register address
    rand uvm_reg_field register_addr;
    // Variable: mdio_dev_add
    // 0x01=PMA/PMD. 0x02=WIS. 0x03=PCS 0x04=XGXS
    rand uvm_reg_field mdio_dev_add;
    // Variable: mdio_port_addr
    // Port address: 0x00= MGMT, 0x00 to 0x03 = QPHY1...QPHY4
    rand uvm_reg_field mdio_port_addr;
    // Variable: opcode
    // Operation code 0=write, 1= read
    rand uvm_reg_field opcode;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static platform_ctrl_mdio_ctrl_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    platform_ctrl_mdio_ctrl_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(platform_ctrl_reg_pkg::platform_ctrl_mdio_ctrl_reg)

    // Constructor: new
    function new(string name = "platform_ctrl_mdio_ctrl");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        register_addr = uvm_reg_field::type_id::create("register_addr", , get_full_name());
        mdio_dev_add = uvm_reg_field::type_id::create("mdio_dev_add", , get_full_name());
        mdio_port_addr = uvm_reg_field::type_id::create("mdio_port_addr", , get_full_name());
        opcode = uvm_reg_field::type_id::create("opcode", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        register_addr.configure(this, 16, 0, "RW", 0, 'h0, 1, 1, 0);
        mdio_dev_add.configure(this, 5, 16, "RW", 0, 'h0, 1, 1, 0);
        mdio_port_addr.configure(this, 5, 21, "RW", 0, 'h0, 1, 1, 0);
        opcode.configure(this, 1, 26, "RW", 0, 'h0, 1, 1, 0);
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
                cg = platform_ctrl_mdio_ctrl_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = platform_ctrl_mdio_ctrl_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, register_addr.get_name, register_addr.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, mdio_dev_add.get_name, mdio_dev_add.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, mdio_port_addr.get_name, mdio_port_addr.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, opcode.get_name, opcode.value);
        return s;
    endfunction

endclass


// Class: platform_ctrl_mdio_ctrl_reg_cover
// Register coverage object.
class platform_ctrl_mdio_ctrl_reg_cover extends uvm_object;

    static local platform_ctrl_mdio_ctrl_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    platform_ctrl_mdio_ctrl_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        register_addr_wr: coverpoint r.register_addr.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        register_addr_rd: coverpoint r.register_addr.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        mdio_dev_add_wr: coverpoint r.mdio_dev_add.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        mdio_dev_add_rd: coverpoint r.mdio_dev_add.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        mdio_port_addr_wr: coverpoint r.mdio_port_addr.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        mdio_port_addr_rd: coverpoint r.mdio_port_addr.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        opcode_wr: coverpoint r.opcode.value iff (!is_read);
        opcode_rd: coverpoint r.opcode.value iff  (is_read);
    endgroup

    `uvm_object_utils(platform_ctrl_reg_pkg::platform_ctrl_mdio_ctrl_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="platform_ctrl_mdio_ctrl_reg_cover");
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
    static function platform_ctrl_mdio_ctrl_reg_cover get();
        if (m_inst == null) begin
            m_inst = platform_ctrl_mdio_ctrl_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(platform_ctrl_mdio_ctrl_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class platform_ctrl_dual_media_reg_cover;

// Class: platform_ctrl_dual_media_reg
// Register platform_ctrl.dual_media: 
class platform_ctrl_dual_media_reg extends uvm_reg;

    // Variable: led_sel
    // LED selection for dual media COPPER = 1 or SFP = 0
    rand uvm_reg_field led_sel;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static platform_ctrl_dual_media_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    platform_ctrl_dual_media_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(platform_ctrl_reg_pkg::platform_ctrl_dual_media_reg)

    // Constructor: new
    function new(string name = "platform_ctrl_dual_media");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        led_sel = uvm_reg_field::type_id::create("led_sel", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        led_sel.configure(this, 4, 0, "rw", 0, 'h0, 1, 1, 0);
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
                cg = platform_ctrl_dual_media_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = platform_ctrl_dual_media_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, led_sel.get_name, led_sel.value);
        return s;
    endfunction

endclass


// Class: platform_ctrl_dual_media_reg_cover
// Register coverage object.
class platform_ctrl_dual_media_reg_cover extends uvm_object;

    static local platform_ctrl_dual_media_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    platform_ctrl_dual_media_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        led_sel_wr: coverpoint r.led_sel.value iff (!is_read);
        led_sel_rd: coverpoint r.led_sel.value iff  (is_read);
    endgroup

    `uvm_object_utils(platform_ctrl_reg_pkg::platform_ctrl_dual_media_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="platform_ctrl_dual_media_reg_cover");
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
    static function platform_ctrl_dual_media_reg_cover get();
        if (m_inst == null) begin
            m_inst = platform_ctrl_dual_media_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(platform_ctrl_dual_media_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass





// Class: platform_ctrl_reg_block
// Register Block .platform_ctrl: 
class platform_ctrl_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand platform_ctrl_sfp_ctrl_1_reg sfp_ctrl_1;
    rand platform_ctrl_sfp_ctrl_2_reg sfp_ctrl_2;
    rand platform_ctrl_sfp_status_1_reg sfp_status_1;
    rand platform_ctrl_sfp_status_2_reg sfp_status_2;
    rand platform_ctrl_fan_control_reg fan_control;
    rand platform_ctrl_fan_tach_reg fan_tach;
    rand platform_ctrl_spi_9553_reg spi_9553;
    rand platform_ctrl_dry_contacts_reg dry_contacts;
    rand platform_ctrl_board_revision_reg board_revision;
    rand platform_ctrl_mezzanine_ctrl_reg mezzanine_ctrl;
    rand platform_ctrl_test_conn_reg test_conn;
    rand platform_ctrl_misc_status_reg misc_status;
    rand platform_ctrl_mdio_data_reg mdio_data;
    rand platform_ctrl_mdio_ctrl_reg mdio_ctrl;
    rand platform_ctrl_dual_media_reg dual_media;

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(platform_ctrl_reg_pkg::platform_ctrl_reg_block)

    // Constructor: new
    function new(string name = "platform_ctrl_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})


        sfp_ctrl_1 = platform_ctrl_sfp_ctrl_1_reg::type_id::create("sfp_ctrl_1", , get_full_name());
        sfp_ctrl_2 = platform_ctrl_sfp_ctrl_2_reg::type_id::create("sfp_ctrl_2", , get_full_name());
        sfp_status_1 = platform_ctrl_sfp_status_1_reg::type_id::create("sfp_status_1", , get_full_name());
        sfp_status_2 = platform_ctrl_sfp_status_2_reg::type_id::create("sfp_status_2", , get_full_name());
        fan_control = platform_ctrl_fan_control_reg::type_id::create("fan_control", , get_full_name());
        fan_tach = platform_ctrl_fan_tach_reg::type_id::create("fan_tach", , get_full_name());
        spi_9553 = platform_ctrl_spi_9553_reg::type_id::create("spi_9553", , get_full_name());
        dry_contacts = platform_ctrl_dry_contacts_reg::type_id::create("dry_contacts", , get_full_name());
        board_revision = platform_ctrl_board_revision_reg::type_id::create("board_revision", , get_full_name());
        mezzanine_ctrl = platform_ctrl_mezzanine_ctrl_reg::type_id::create("mezzanine_ctrl", , get_full_name());
        test_conn = platform_ctrl_test_conn_reg::type_id::create("test_conn", , get_full_name());
        misc_status = platform_ctrl_misc_status_reg::type_id::create("misc_status", , get_full_name());
        mdio_data = platform_ctrl_mdio_data_reg::type_id::create("mdio_data", , get_full_name());
        mdio_ctrl = platform_ctrl_mdio_ctrl_reg::type_id::create("mdio_ctrl", , get_full_name());
        dual_media = platform_ctrl_dual_media_reg::type_id::create("dual_media", , get_full_name());

        sfp_ctrl_1.configure(this);
        sfp_ctrl_2.configure(this);
        sfp_status_1.configure(this);
        sfp_status_2.configure(this);
        fan_control.configure(this);
        fan_tach.configure(this);
        spi_9553.configure(this);
        dry_contacts.configure(this);
        board_revision.configure(this);
        mezzanine_ctrl.configure(this);
        test_conn.configure(this);
        misc_status.configure(this);
        mdio_data.configure(this);
        mdio_ctrl.configure(this);
        dual_media.configure(this);

        sfp_ctrl_1.build();
        sfp_ctrl_2.build();
        sfp_status_1.build();
        sfp_status_2.build();
        fan_control.build();
        fan_tach.build();
        spi_9553.build();
        dry_contacts.build();
        board_revision.build();
        mezzanine_ctrl.build();
        test_conn.build();
        misc_status.build();
        mdio_data.build();
        mdio_ctrl.build();
        dual_media.build();

        // define default map
        default_map = create_map("platform_ctrl_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        this.default_map.add_reg(sfp_ctrl_1, 'h0, "RW");
        this.default_map.add_reg(sfp_ctrl_2, 'h1, "RW");
        this.default_map.add_reg(sfp_status_1, 'h2, "RO");
        this.default_map.add_reg(sfp_status_2, 'h3, "RO");
        this.default_map.add_reg(fan_control, 'h4, "RW");
        this.default_map.add_reg(fan_tach, 'h5, "RO");
        this.default_map.add_reg(spi_9553, 'h6, "RW");
        this.default_map.add_reg(dry_contacts, 'h7, "RO");
        this.default_map.add_reg(board_revision, 'h8, "RO");
        this.default_map.add_reg(mezzanine_ctrl, 'h9, "RW");
        this.default_map.add_reg(test_conn, 'hA, "RW");
        this.default_map.add_reg(misc_status, 'hB, "RO");
        this.default_map.add_reg(mdio_data, 'hC, "RW");
        this.default_map.add_reg(mdio_ctrl, 'hD, "RW");
        this.default_map.add_reg(dual_media, 'hE, "RW");

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
        sfp_ctrl_1.enable_coverage(is_on, this.cg_per_instance);
        sfp_ctrl_2.enable_coverage(is_on, this.cg_per_instance);
        sfp_status_1.enable_coverage(is_on, this.cg_per_instance);
        sfp_status_2.enable_coverage(is_on, this.cg_per_instance);
        fan_control.enable_coverage(is_on, this.cg_per_instance);
        fan_tach.enable_coverage(is_on, this.cg_per_instance);
        spi_9553.enable_coverage(is_on, this.cg_per_instance);
        dry_contacts.enable_coverage(is_on, this.cg_per_instance);
        board_revision.enable_coverage(is_on, this.cg_per_instance);
        mezzanine_ctrl.enable_coverage(is_on, this.cg_per_instance);
        test_conn.enable_coverage(is_on, this.cg_per_instance);
        misc_status.enable_coverage(is_on, this.cg_per_instance);
        mdio_data.enable_coverage(is_on, this.cg_per_instance);
        mdio_ctrl.enable_coverage(is_on, this.cg_per_instance);
        dual_media.enable_coverage(is_on, this.cg_per_instance);
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