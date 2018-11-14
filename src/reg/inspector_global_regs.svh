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
// Register definitions for inspector_global register block.
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
// Group: inspector_global
//---------------------------------------------------------

package inspector_global_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;

typedef class inspector_global_cfg_auto_mode_reg_cover;

// Class: inspector_global_cfg_auto_mode_reg
// Register inspector_global.cfg_auto_mode: Global configuration used in automatic inspection mode
class inspector_global_cfg_auto_mode_reg extends uvm_reg;

    // Variable: extra_offset_auto_mode_l2
    // THIS VALUE WILL APPLY TO ALL L2 (NON-IP) FLOWS AS A GLOBAL CONFIGURATION. ONLY L2 FRAMES WILL USE THIS OFFSET. Offset (in number of 16-bit words) that needs to be added to the l3_offset input of the inspector to properly identify the position of the Accedian proprietary OAM payload fields in the incoming L2 frame.
    rand uvm_reg_field extra_offset_auto_mode_l2;
    // Variable: extra_offset_auto_mode_ipv4
    // THIS VALUE WILL APPLY TO ALL IPv4 FLOWS AS A GLOBAL CONFIGURATION. ONLY IPv4 FRAMES WILL USE THIS OFFSET. Offset (in number of 16-bit words) that needs to be added to the (l3_offset+l4_offset) inputs of the inspector to properly identify the position of the Accedian proprietary OAM payload fields in the incoming IPv4 frame.
    rand uvm_reg_field extra_offset_auto_mode_ipv4;
    // Variable: extra_offset_auto_mode_ipv6
    // THIS VALUE WILL APPLY TO ALL IPv6 FLOWS AS A GLOBAL CONFIGURATION. ONLY IPv6 FRAMES WILL USE THIS OFFSET. Offset (in number of 16-bit words) that needs to be added to the (l3_offset+l4_offset) inputs of the inspector to properly identify the position of the Accedian proprietary OAM payload fields in the incoming IPv6 frame.
    rand uvm_reg_field extra_offset_auto_mode_ipv6;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static inspector_global_cfg_auto_mode_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    inspector_global_cfg_auto_mode_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(inspector_global_reg_pkg::inspector_global_cfg_auto_mode_reg)

    // Constructor: new
    function new(string name = "inspector_global_cfg_auto_mode");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        extra_offset_auto_mode_l2 = uvm_reg_field::type_id::create("extra_offset_auto_mode_l2", , get_full_name());
        extra_offset_auto_mode_ipv4 = uvm_reg_field::type_id::create("extra_offset_auto_mode_ipv4", , get_full_name());
        extra_offset_auto_mode_ipv6 = uvm_reg_field::type_id::create("extra_offset_auto_mode_ipv6", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        extra_offset_auto_mode_l2.configure(this, 7, 0, "RW", 0, 'h0, 1, 1, 0);
        extra_offset_auto_mode_ipv4.configure(this, 7, 7, "RW", 0, 'h0, 1, 1, 0);
        extra_offset_auto_mode_ipv6.configure(this, 7, 14, "RW", 0, 'h0, 1, 1, 0);
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
                cg = inspector_global_cfg_auto_mode_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = inspector_global_cfg_auto_mode_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, extra_offset_auto_mode_l2.get_name, extra_offset_auto_mode_l2.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, extra_offset_auto_mode_ipv4.get_name, extra_offset_auto_mode_ipv4.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, extra_offset_auto_mode_ipv6.get_name, extra_offset_auto_mode_ipv6.value);
        return s;
    endfunction

endclass


// Class: inspector_global_cfg_auto_mode_reg_cover
// Register coverage object.
class inspector_global_cfg_auto_mode_reg_cover extends uvm_object;

    static local inspector_global_cfg_auto_mode_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    inspector_global_cfg_auto_mode_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        extra_offset_auto_mode_l2_wr: coverpoint r.extra_offset_auto_mode_l2.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        extra_offset_auto_mode_l2_rd: coverpoint r.extra_offset_auto_mode_l2.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        extra_offset_auto_mode_ipv4_wr: coverpoint r.extra_offset_auto_mode_ipv4.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        extra_offset_auto_mode_ipv4_rd: coverpoint r.extra_offset_auto_mode_ipv4.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        extra_offset_auto_mode_ipv6_wr: coverpoint r.extra_offset_auto_mode_ipv6.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        extra_offset_auto_mode_ipv6_rd: coverpoint r.extra_offset_auto_mode_ipv6.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(inspector_global_reg_pkg::inspector_global_cfg_auto_mode_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="inspector_global_cfg_auto_mode_reg_cover");
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
    static function inspector_global_cfg_auto_mode_reg_cover get();
        if (m_inst == null) begin
            m_inst = inspector_global_cfg_auto_mode_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(inspector_global_cfg_auto_mode_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass





// Class: inspector_global_reg_block
// Register Block .inspector_global: 
class inspector_global_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand inspector_global_cfg_auto_mode_reg cfg_auto_mode;

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(inspector_global_reg_pkg::inspector_global_reg_block)

    // Constructor: new
    function new(string name = "inspector_global_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})


        cfg_auto_mode = inspector_global_cfg_auto_mode_reg::type_id::create("cfg_auto_mode", , get_full_name());

        cfg_auto_mode.configure(this);

        cfg_auto_mode.build();

        // define default map
        default_map = create_map("inspector_global_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        this.default_map.add_reg(cfg_auto_mode, 'h0, "RW");

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
        cfg_auto_mode.enable_coverage(is_on, this.cg_per_instance);
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