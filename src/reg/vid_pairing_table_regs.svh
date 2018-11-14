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
// Register definitions for vid_pairing_table register block.
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
// Group: vid_pairing_table
//---------------------------------------------------------

package vid_pairing_table_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;
    import vid_pairing_table_uni1g_reg_pkg::*;
    import vid_pairing_table_nni10g_reg_pkg::*;
    import vid_pairing_table_uni10g_reg_pkg::*;






// Class: vid_pairing_table_reg_block
// Register Block .vid_pairing_table: 
class vid_pairing_table_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand vid_pairing_table_uni1g_reg_block p1;
    rand vid_pairing_table_uni1g_reg_block p2;
    rand vid_pairing_table_uni1g_reg_block p3;
    rand vid_pairing_table_uni1g_reg_block p4;
    rand vid_pairing_table_nni10g_reg_block p5;
    rand vid_pairing_table_nni10g_reg_block p6;
    rand vid_pairing_table_uni10g_reg_block p7;
    rand vid_pairing_table_uni10g_reg_block p8;
    rand vid_pairing_table_uni1g_reg_block p9;
    rand vid_pairing_table_uni1g_reg_block p10;
    rand vid_pairing_table_uni1g_reg_block p11;
    rand vid_pairing_table_uni1g_reg_block p12;

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(vid_pairing_table_reg_pkg::vid_pairing_table_reg_block)

    // Constructor: new
    function new(string name = "vid_pairing_table_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})


        p1 = vid_pairing_table_uni1g_reg_block::type_id::create("p1", , get_full_name());
        p2 = vid_pairing_table_uni1g_reg_block::type_id::create("p2", , get_full_name());
        p3 = vid_pairing_table_uni1g_reg_block::type_id::create("p3", , get_full_name());
        p4 = vid_pairing_table_uni1g_reg_block::type_id::create("p4", , get_full_name());
        p5 = vid_pairing_table_nni10g_reg_block::type_id::create("p5", , get_full_name());
        p6 = vid_pairing_table_nni10g_reg_block::type_id::create("p6", , get_full_name());
        p7 = vid_pairing_table_uni10g_reg_block::type_id::create("p7", , get_full_name());
        p8 = vid_pairing_table_uni10g_reg_block::type_id::create("p8", , get_full_name());
        p9 = vid_pairing_table_uni1g_reg_block::type_id::create("p9", , get_full_name());
        p10 = vid_pairing_table_uni1g_reg_block::type_id::create("p10", , get_full_name());
        p11 = vid_pairing_table_uni1g_reg_block::type_id::create("p11", , get_full_name());
        p12 = vid_pairing_table_uni1g_reg_block::type_id::create("p12", , get_full_name());

        p1.configure(this);
        p2.configure(this);
        p3.configure(this);
        p4.configure(this);
        p5.configure(this);
        p6.configure(this);
        p7.configure(this);
        p8.configure(this);
        p9.configure(this);
        p10.configure(this);
        p11.configure(this);
        p12.configure(this);

        p1.build();
        p2.build();
        p3.build();
        p4.build();
        p5.build();
        p6.build();
        p7.build();
        p8.build();
        p9.build();
        p10.build();
        p11.build();
        p12.build();

        // define default map
        default_map = create_map("vid_pairing_table_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        this.default_map.add_submap(this.p1.default_map, 'h0);
        this.default_map.add_submap(this.p2.default_map, 'h800);
        this.default_map.add_submap(this.p3.default_map, 'h1000);
        this.default_map.add_submap(this.p4.default_map, 'h1800);
        this.default_map.add_submap(this.p5.default_map, 'h2000);
        this.default_map.add_submap(this.p6.default_map, 'h2800);
        this.default_map.add_submap(this.p7.default_map, 'h3000);
        this.default_map.add_submap(this.p8.default_map, 'h3800);
        this.default_map.add_submap(this.p9.default_map, 'h4000);
        this.default_map.add_submap(this.p10.default_map, 'h4800);
        this.default_map.add_submap(this.p11.default_map, 'h5000);
        this.default_map.add_submap(this.p12.default_map, 'h5800);

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
            p1.set_per_instance_coverage(per_inst, hier);
            p2.set_per_instance_coverage(per_inst, hier);
            p3.set_per_instance_coverage(per_inst, hier);
            p4.set_per_instance_coverage(per_inst, hier);
            p5.set_per_instance_coverage(per_inst, hier);
            p6.set_per_instance_coverage(per_inst, hier);
            p7.set_per_instance_coverage(per_inst, hier);
            p8.set_per_instance_coverage(per_inst, hier);
            p9.set_per_instance_coverage(per_inst, hier);
            p10.set_per_instance_coverage(per_inst, hier);
            p11.set_per_instance_coverage(per_inst, hier);
            p12.set_per_instance_coverage(per_inst, hier);
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
            //void'(uvm_config_db#(bit)::set(null, p1.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(p1.set_coverage(is_on));
            //void'(uvm_config_db#(bit)::set(null, p2.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(p2.set_coverage(is_on));
            //void'(uvm_config_db#(bit)::set(null, p3.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(p3.set_coverage(is_on));
            //void'(uvm_config_db#(bit)::set(null, p4.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(p4.set_coverage(is_on));
            //void'(uvm_config_db#(bit)::set(null, p5.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(p5.set_coverage(is_on));
            //void'(uvm_config_db#(bit)::set(null, p6.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(p6.set_coverage(is_on));
            //void'(uvm_config_db#(bit)::set(null, p7.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(p7.set_coverage(is_on));
            //void'(uvm_config_db#(bit)::set(null, p8.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(p8.set_coverage(is_on));
            //void'(uvm_config_db#(bit)::set(null, p9.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(p9.set_coverage(is_on));
            //void'(uvm_config_db#(bit)::set(null, p10.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(p10.set_coverage(is_on));
            //void'(uvm_config_db#(bit)::set(null, p11.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(p11.set_coverage(is_on));
            //void'(uvm_config_db#(bit)::set(null, p12.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(p12.set_coverage(is_on));
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