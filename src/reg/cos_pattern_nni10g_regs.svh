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
// Register definitions for cos_pattern_nni10g register block.
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
// Group: cos_pattern_nni10g
//---------------------------------------------------------

package cos_pattern_nni10g_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;

typedef class p5_pattern_reg_cover;

// Class: p5_pattern_reg
// Register p5.pattern: 
class p5_pattern_reg extends uvm_reg;

    // Variable: bwp_pre_color1
    // BWP pre-color(1) (00: green; 01: yellow; 10: red) (This field is not used when CFI is configured like a DE)
    rand uvm_reg_field bwp_pre_color1;
    // Variable: bwp_profile_ena
    // 0 : no BWP profil associated  ; 1: enable
    rand uvm_reg_field bwp_profile_ena;
    // Variable: bwp_pre_color0
    // BWP pre-color(0) (00: green; 01: yellow; 10: red) (This field is not used when CFI is configured like a DE)
    rand uvm_reg_field bwp_pre_color0;
    // Variable: bwp_profile_offset
    // BWP profil Index = BWP profile base index + BWP Profil offset 11-bit wide for 2048 BWP profiles
    rand uvm_reg_field bwp_profile_offset;
    // Variable: cos_internal
    // Mapping from incoming CoS to Internal CoS domain (8 CoS domain). Used to index the Q Mapping Table.
    rand uvm_reg_field cos_internal;
    // Variable: yellow_pcp_bits
    // Yellow CFI(11) and Yellow PCP bits (out) [10..8]
    rand uvm_reg_field yellow_pcp_bits;
    // Variable: green_pcp_bits
    // Green CFI (3) and Green PCP bits (out) [2..0]
    rand uvm_reg_field green_pcp_bits;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static p5_pattern_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    p5_pattern_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(cos_pattern_nni10g_reg_pkg::p5_pattern_reg)

    // Constructor: new
    function new(string name = "p5_pattern");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        bwp_pre_color1 = uvm_reg_field::type_id::create("bwp_pre_color1", , get_full_name());
        bwp_profile_ena = uvm_reg_field::type_id::create("bwp_profile_ena", , get_full_name());
        bwp_pre_color0 = uvm_reg_field::type_id::create("bwp_pre_color0", , get_full_name());
        bwp_profile_offset = uvm_reg_field::type_id::create("bwp_profile_offset", , get_full_name());
        cos_internal = uvm_reg_field::type_id::create("cos_internal", , get_full_name());
        yellow_pcp_bits = uvm_reg_field::type_id::create("yellow_pcp_bits", , get_full_name());
        green_pcp_bits = uvm_reg_field::type_id::create("green_pcp_bits", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        bwp_pre_color1.configure(this, 1, 30, "RW", 0, 'h0, 1, 1, 0);
        bwp_profile_ena.configure(this, 1, 29, "RW", 0, 'h0, 1, 1, 0);
        bwp_pre_color0.configure(this, 1, 28, "RW", 0, 'h0, 1, 1, 0);
        bwp_profile_offset.configure(this, 11, 16, "RW", 0, 'h0, 1, 1, 0);
        cos_internal.configure(this, 3, 12, "RW", 0, 'h0, 1, 1, 0);
        yellow_pcp_bits.configure(this, 4, 8, "RW", 0, 'h0, 1, 1, 0);
        green_pcp_bits.configure(this, 4, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = p5_pattern_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = p5_pattern_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, bwp_pre_color1.get_name, bwp_pre_color1.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, bwp_profile_ena.get_name, bwp_profile_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, bwp_pre_color0.get_name, bwp_pre_color0.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, bwp_profile_offset.get_name, bwp_profile_offset.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, cos_internal.get_name, cos_internal.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, yellow_pcp_bits.get_name, yellow_pcp_bits.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, green_pcp_bits.get_name, green_pcp_bits.value);
        return s;
    endfunction

endclass


// Class: p5_pattern_reg_cover
// Register coverage object.
class p5_pattern_reg_cover extends uvm_object;

    static local p5_pattern_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    p5_pattern_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        bwp_pre_color1_wr: coverpoint r.bwp_pre_color1.value iff (!is_read);
        bwp_pre_color1_rd: coverpoint r.bwp_pre_color1.value iff  (is_read);
        bwp_profile_ena_wr: coverpoint r.bwp_profile_ena.value iff (!is_read);
        bwp_profile_ena_rd: coverpoint r.bwp_profile_ena.value iff  (is_read);
        bwp_pre_color0_wr: coverpoint r.bwp_pre_color0.value iff (!is_read);
        bwp_pre_color0_rd: coverpoint r.bwp_pre_color0.value iff  (is_read);
        bwp_profile_offset_wr: coverpoint r.bwp_profile_offset.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        bwp_profile_offset_rd: coverpoint r.bwp_profile_offset.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        cos_internal_wr: coverpoint r.cos_internal.value iff (!is_read);
        cos_internal_rd: coverpoint r.cos_internal.value iff  (is_read);
        yellow_pcp_bits_wr: coverpoint r.yellow_pcp_bits.value iff (!is_read);
        yellow_pcp_bits_rd: coverpoint r.yellow_pcp_bits.value iff  (is_read);
        green_pcp_bits_wr: coverpoint r.green_pcp_bits.value iff (!is_read);
        green_pcp_bits_rd: coverpoint r.green_pcp_bits.value iff  (is_read);
    endgroup

    `uvm_object_utils(cos_pattern_nni10g_reg_pkg::p5_pattern_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="p5_pattern_reg_cover");
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
    static function p5_pattern_reg_cover get();
        if (m_inst == null) begin
            m_inst = p5_pattern_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(p5_pattern_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass





// Class: cos_pattern_nni10g_reg_block
// Register Block .cos_pattern_nni10g: 
class cos_pattern_nni10g_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand p5_pattern_reg pattern[];

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(cos_pattern_nni10g_reg_pkg::cos_pattern_nni10g_reg_block)

    // Constructor: new
    function new(string name = "cos_pattern_nni10g_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        pattern = new[2048];

        foreach(pattern[m]) begin
            pattern[m] = p5_pattern_reg::type_id::create($sformatf("pattern[%0d]",m), , get_full_name());
        end

        foreach(pattern[m]) begin
            pattern[m].configure(this);
        end

        foreach(pattern[m]) begin
            pattern[m].build();
        end

        // define default map
        default_map = create_map("cos_pattern_nni10g_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        foreach(pattern[m]) begin
            this.default_map.add_reg(this.pattern[m], 'h0 + m, "RW");
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
        foreach(pattern[m]) begin
            pattern[m].enable_coverage(is_on, this.cg_per_instance);
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