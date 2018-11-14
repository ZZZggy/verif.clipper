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
// Register definitions for phy_if register block.
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
// Group: phy_if
//---------------------------------------------------------

package phy_if_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;
    import altera_phy_1g_reg_pkg::*;
    import altera_phy_1g10g_reg_pkg::*;
    import altera_xcvr_reconfig_reg_pkg::*;
    import phy_if_globals_reg_pkg::*;






// Class: phy_if_reg_block
// Register Block .phy_if: 
class phy_if_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand altera_xcvr_reconfig_reg_block altera_xcvr_reconfig;
    rand phy_if_globals_reg_block phy_if_global_registers;
    rand altera_phy_1g_reg_block altera_phy_1g[];
    rand altera_phy_1g10g_reg_block altera_phy_10g_1g10g[];

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(phy_if_reg_pkg::phy_if_reg_block)

    // Constructor: new
    function new(string name = "phy_if_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        altera_phy_1g = new[12];
        altera_phy_10g_1g10g = new[12];

        altera_xcvr_reconfig = altera_xcvr_reconfig_reg_block::type_id::create("altera_xcvr_reconfig", , get_full_name());
        phy_if_global_registers = phy_if_globals_reg_block::type_id::create("phy_if_global_registers", , get_full_name());
        foreach(altera_phy_1g[m]) begin
            altera_phy_1g[m] = altera_phy_1g_reg_block::type_id::create($sformatf("altera_phy_1g[%0d]",m), , get_full_name());
        end
        foreach(altera_phy_10g_1g10g[m]) begin
            altera_phy_10g_1g10g[m] = altera_phy_1g10g_reg_block::type_id::create($sformatf("altera_phy_10g_1g10g[%0d]",m), , get_full_name());
        end

        altera_xcvr_reconfig.configure(this);
        phy_if_global_registers.configure(this);
        foreach(altera_phy_1g[m]) begin
            altera_phy_1g[m].configure(this);
        end
        foreach(altera_phy_10g_1g10g[m]) begin
            altera_phy_10g_1g10g[m].configure(this);
        end

        altera_xcvr_reconfig.build();
        phy_if_global_registers.build();
        foreach(altera_phy_1g[m]) begin
            altera_phy_1g[m].build();
        end
        foreach(altera_phy_10g_1g10g[m]) begin
            altera_phy_10g_1g10g[m].build();
        end

        // define default map
        default_map = create_map("phy_if_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        this.default_map.add_submap(this.altera_xcvr_reconfig.default_map, 'h2000);
        this.default_map.add_submap(this.phy_if_global_registers.default_map, 'h2100);
        foreach(altera_phy_1g[m]) begin
            this.default_map.add_submap(this.altera_phy_1g[m].default_map, 'h0 + m*('h20));
        end
        foreach(altera_phy_10g_1g10g[m]) begin
            this.default_map.add_submap(this.altera_phy_10g_1g10g[m].default_map, 'h1000 + m*('h100));
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
            altera_xcvr_reconfig.set_per_instance_coverage(per_inst, hier);
            phy_if_global_registers.set_per_instance_coverage(per_inst, hier);
            foreach(altera_phy_1g[m]) begin
                altera_phy_1g[m].set_per_instance_coverage(per_inst, hier);
            end
            foreach(altera_phy_10g_1g10g[m]) begin
                altera_phy_10g_1g10g[m].set_per_instance_coverage(per_inst, hier);
            end
        end
     endfunction


    // Function: set_coverage
    // Override base function to create covergroups for all registers in this block.
    //
    // In order to enable hierarchical creation, use UVM_CVR_ALL.
    virtual function uvm_reg_cvr_t set_coverage(uvm_reg_cvr_t is_on);
        //void'(uvm_config_db#(bit)::get(null, get_full_name(), "cg_per_instance", cg_per_instance));
        set_coverage = super.set_coverage(is_on);
        // Use UVM_CVR_ALL for hierarchical enabling.
        if(is_on == UVM_CVR_ALL) begin
            //void'(uvm_config_db#(bit)::set(null, altera_xcvr_reconfig.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(altera_xcvr_reconfig.set_coverage(is_on));
            //void'(uvm_config_db#(bit)::set(null, phy_if_global_registers.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(phy_if_global_registers.set_coverage(is_on));
            foreach(altera_phy_1g[m]) begin
                //void'(uvm_config_db#(bit)::set(null, altera_phy_1g[m].get_full_name(), "cg_per_instance", cg_per_instance));
                void'(altera_phy_1g[m].set_coverage(is_on));
            end
            foreach(altera_phy_10g_1g10g[m]) begin
                //void'(uvm_config_db#(bit)::set(null, altera_phy_10g_1g10g[m].get_full_name(), "cg_per_instance", cg_per_instance));
                void'(altera_phy_10g_1g10g[m].set_coverage(is_on));
            end
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