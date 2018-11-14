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
// Register definitions for pktgen register block.
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
// Group: pktgen
//---------------------------------------------------------

package pktgen_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;
    import header_flow_reg_pkg::*;
    import padding_flow_reg_pkg::*;
    import shaping_flow_reg_pkg::*;
    import pktgen_global_reg_pkg::*;






// Class: pktgen_reg_block
// Register Block .pktgen: 
class pktgen_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand pktgen_global_reg_block pktgen_global;
    rand header_flow_reg_block header_flow[];
    rand padding_flow_reg_block padding_flow[];
    rand shaping_flow_reg_block shaping_flow[];

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(pktgen_reg_pkg::pktgen_reg_block)

    // Constructor: new
    function new(string name = "pktgen_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        header_flow = new[16];
        padding_flow = new[16];
        shaping_flow = new[16];

        pktgen_global = pktgen_global_reg_block::type_id::create("pktgen_global", , get_full_name());
        foreach(header_flow[m]) begin
            header_flow[m] = header_flow_reg_block::type_id::create($sformatf("header_flow[%0d]",m), , get_full_name());
        end
        foreach(padding_flow[m]) begin
            padding_flow[m] = padding_flow_reg_block::type_id::create($sformatf("padding_flow[%0d]",m), , get_full_name());
        end
        foreach(shaping_flow[m]) begin
            shaping_flow[m] = shaping_flow_reg_block::type_id::create($sformatf("shaping_flow[%0d]",m), , get_full_name());
        end

        pktgen_global.configure(this);
        foreach(header_flow[m]) begin
            header_flow[m].configure(this);
        end
        foreach(padding_flow[m]) begin
            padding_flow[m].configure(this);
        end
        foreach(shaping_flow[m]) begin
            shaping_flow[m].configure(this);
        end

        pktgen_global.build();
        foreach(header_flow[m]) begin
            header_flow[m].build();
        end
        foreach(padding_flow[m]) begin
            padding_flow[m].build();
        end
        foreach(shaping_flow[m]) begin
            shaping_flow[m].build();
        end

        // define default map
        default_map = create_map("pktgen_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        this.default_map.add_submap(this.pktgen_global.default_map, 'hF00);
        foreach(header_flow[m]) begin
            this.default_map.add_submap(this.header_flow[m].default_map, 'h0 + m*('h80));
        end
        foreach(padding_flow[m]) begin
            this.default_map.add_submap(this.padding_flow[m].default_map, 'h800 + m*('h10));
        end
        foreach(shaping_flow[m]) begin
            this.default_map.add_submap(this.shaping_flow[m].default_map, 'hC00 + m*('h10));
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
            pktgen_global.set_per_instance_coverage(per_inst, hier);
            foreach(header_flow[m]) begin
                header_flow[m].set_per_instance_coverage(per_inst, hier);
            end
            foreach(padding_flow[m]) begin
                padding_flow[m].set_per_instance_coverage(per_inst, hier);
            end
            foreach(shaping_flow[m]) begin
                shaping_flow[m].set_per_instance_coverage(per_inst, hier);
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
            //void'(uvm_config_db#(bit)::set(null, pktgen_global.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(pktgen_global.set_coverage(is_on));
            foreach(header_flow[m]) begin
                //void'(uvm_config_db#(bit)::set(null, header_flow[m].get_full_name(), "cg_per_instance", cg_per_instance));
                void'(header_flow[m].set_coverage(is_on));
            end
            foreach(padding_flow[m]) begin
                //void'(uvm_config_db#(bit)::set(null, padding_flow[m].get_full_name(), "cg_per_instance", cg_per_instance));
                void'(padding_flow[m].set_coverage(is_on));
            end
            foreach(shaping_flow[m]) begin
                //void'(uvm_config_db#(bit)::set(null, shaping_flow[m].get_full_name(), "cg_per_instance", cg_per_instance));
                void'(shaping_flow[m].set_coverage(is_on));
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