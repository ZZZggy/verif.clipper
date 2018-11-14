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
// Register definitions for vid_table_uni1g register block.
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
// Group: vid_table_uni1g
//---------------------------------------------------------

package vid_table_uni1g_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;

typedef class p1_idx_reg_cover;

// Class: p1_idx_reg
// Register p1.idx: The purpose of the VID table is twofold: The VID table is accessed using the outer VID (VLAN1) so to retrieve the CPU membership flags associated with this VID, this lookup is type agnostic. The VID table is also accessed using either the outer (VLAN1) or the inner VID (VLAN2), based on the port global input configuration VID_table_mode setting so to retrieve the rule priority index for the IF domain to compete against other results from the Complex and Hardcoded Classifiers and from the Forwarding Database for the lowest index toward the Action Map Tables. The Action Map Tables have a size that is twice the vid_table.priority_index size. The vid_table.priority_index maps to the higher range of the Action Map Tables (action_map_tables.nni.priority_index := (1 &amp;&amp; vid_table.priority_index)). For this lookup, the extracted VLAN type is compared against the VID table entry vlan_type. In case of mismatch, the priority index is defaulted to highest index (2**priority_index-1). 
class p1_idx_reg extends uvm_reg;

    // Variable: tunnel_blocking_ena
    // Tunnel blocking enable flag. Allows to block forwarding from this tunnel (VLAN1).
    rand uvm_reg_field tunnel_blocking_ena;
    // Variable: cpu_l2pt_tunneling_flag
    // This flag specify if the vlan is use as l2pt tunneling
    rand uvm_reg_field cpu_l2pt_tunneling_flag;
    // Variable: priority_index
    // Port rule Priority Index for IF domain toward Action Map Tables (2**priority_index higher-range priorities)
    rand uvm_reg_field priority_index;
    // Variable: vlan_type
    // Vlan Type
    rand uvm_reg_field vlan_type;
    // Variable: cpu_membership
    // CPU membership - Broadcast flag for the simple classifier
    rand uvm_reg_field cpu_membership;
    // Variable: cpu_cfm_membership
    // CFM specific CPU membership - CFM flag for the simple classifier
    rand uvm_reg_field cpu_cfm_membership;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static p1_idx_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    p1_idx_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(vid_table_uni1g_reg_pkg::p1_idx_reg)

    // Constructor: new
    function new(string name = "p1_idx");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        tunnel_blocking_ena = uvm_reg_field::type_id::create("tunnel_blocking_ena", , get_full_name());
        cpu_l2pt_tunneling_flag = uvm_reg_field::type_id::create("cpu_l2pt_tunneling_flag", , get_full_name());
        priority_index = uvm_reg_field::type_id::create("priority_index", , get_full_name());
        vlan_type = uvm_reg_field::type_id::create("vlan_type", , get_full_name());
        cpu_membership = uvm_reg_field::type_id::create("cpu_membership", , get_full_name());
        cpu_cfm_membership = uvm_reg_field::type_id::create("cpu_cfm_membership", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        tunnel_blocking_ena.configure(this, 1, 17, "RW", 0, 'h0, 1, 1, 0);
        cpu_l2pt_tunneling_flag.configure(this, 1, 16, "RW", 0, 'h0, 1, 1, 0);
        priority_index.configure(this, 8, 4, "RW", 0, 'h0, 1, 1, 0);
        vlan_type.configure(this, 2, 2, "RW", 0, 'h0, 1, 1, 0);
        cpu_membership.configure(this, 1, 1, "RW", 0, 'h0, 1, 1, 0);
        cpu_cfm_membership.configure(this, 1, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = p1_idx_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = p1_idx_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, tunnel_blocking_ena.get_name, tunnel_blocking_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, cpu_l2pt_tunneling_flag.get_name, cpu_l2pt_tunneling_flag.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, priority_index.get_name, priority_index.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, vlan_type.get_name, vlan_type.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, cpu_membership.get_name, cpu_membership.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, cpu_cfm_membership.get_name, cpu_cfm_membership.value);
        return s;
    endfunction

endclass


// Class: p1_idx_reg_cover
// Register coverage object.
class p1_idx_reg_cover extends uvm_object;

    static local p1_idx_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    p1_idx_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        tunnel_blocking_ena_wr: coverpoint r.tunnel_blocking_ena.value iff (!is_read);
        tunnel_blocking_ena_rd: coverpoint r.tunnel_blocking_ena.value iff  (is_read);
        cpu_l2pt_tunneling_flag_wr: coverpoint r.cpu_l2pt_tunneling_flag.value iff (!is_read);
        cpu_l2pt_tunneling_flag_rd: coverpoint r.cpu_l2pt_tunneling_flag.value iff  (is_read);
        priority_index_wr: coverpoint r.priority_index.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        priority_index_rd: coverpoint r.priority_index.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        vlan_type_wr: coverpoint r.vlan_type.value iff (!is_read);
        vlan_type_rd: coverpoint r.vlan_type.value iff  (is_read);
        cpu_membership_wr: coverpoint r.cpu_membership.value iff (!is_read);
        cpu_membership_rd: coverpoint r.cpu_membership.value iff  (is_read);
        cpu_cfm_membership_wr: coverpoint r.cpu_cfm_membership.value iff (!is_read);
        cpu_cfm_membership_rd: coverpoint r.cpu_cfm_membership.value iff  (is_read);
    endgroup

    `uvm_object_utils(vid_table_uni1g_reg_pkg::p1_idx_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="p1_idx_reg_cover");
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
    static function p1_idx_reg_cover get();
        if (m_inst == null) begin
            m_inst = p1_idx_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(p1_idx_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass





// Class: vid_table_uni1g_reg_block
// Register Block .vid_table_uni1g: 
class vid_table_uni1g_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand p1_idx_reg idx[];

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(vid_table_uni1g_reg_pkg::vid_table_uni1g_reg_block)

    // Constructor: new
    function new(string name = "vid_table_uni1g_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        idx = new[4096];

        foreach(idx[m]) begin
            idx[m] = p1_idx_reg::type_id::create($sformatf("idx[%0d]",m), , get_full_name());
        end

        foreach(idx[m]) begin
            idx[m].configure(this);
        end

        foreach(idx[m]) begin
            idx[m].build();
        end

        // define default map
        default_map = create_map("vid_table_uni1g_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        foreach(idx[m]) begin
            this.default_map.add_reg(this.idx[m], 'h0 + m, "RW");
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
        foreach(idx[m]) begin
            idx[m].enable_coverage(is_on, this.cg_per_instance);
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