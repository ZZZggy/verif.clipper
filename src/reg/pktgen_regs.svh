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
    import pktgen_flowheader_reg_pkg::*;
    import pktgen_padding_reg_pkg::*;
    import pktgen_shapping_reg_pkg::*;

typedef class pktgen_ena_reg_cover;

// Class: pktgen_ena_reg
// Register pktgen.ena: general register applied all flows
class pktgen_ena_reg extends uvm_reg;

    // Variable: destination
    // Selects destination port number
    rand uvm_reg_field destination;
    // Variable: flow_7_ena
    // 
    rand uvm_reg_field flow_7_ena;
    // Variable: flow_6_ena
    // 
    rand uvm_reg_field flow_6_ena;
    // Variable: flow_5_ena
    // 
    rand uvm_reg_field flow_5_ena;
    // Variable: flow_4_ena
    // 
    rand uvm_reg_field flow_4_ena;
    // Variable: compensation
    // Compensation used for shaping, duration and statistics
    rand uvm_reg_field compensation;
    // Variable: flow_3_ena
    // 
    rand uvm_reg_field flow_3_ena;
    // Variable: flow_2_ena
    // 
    rand uvm_reg_field flow_2_ena;
    // Variable: flow_1_ena
    // 
    rand uvm_reg_field flow_1_ena;
    // Variable: flow_0_ena
    // 
    rand uvm_reg_field flow_0_ena;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static pktgen_ena_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    pktgen_ena_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pktgen_reg_pkg::pktgen_ena_reg)

    // Constructor: new
    function new(string name = "pktgen_ena");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        destination = uvm_reg_field::type_id::create("destination", , get_full_name());
        flow_7_ena = uvm_reg_field::type_id::create("flow_7_ena", , get_full_name());
        flow_6_ena = uvm_reg_field::type_id::create("flow_6_ena", , get_full_name());
        flow_5_ena = uvm_reg_field::type_id::create("flow_5_ena", , get_full_name());
        flow_4_ena = uvm_reg_field::type_id::create("flow_4_ena", , get_full_name());
        compensation = uvm_reg_field::type_id::create("compensation", , get_full_name());
        flow_3_ena = uvm_reg_field::type_id::create("flow_3_ena", , get_full_name());
        flow_2_ena = uvm_reg_field::type_id::create("flow_2_ena", , get_full_name());
        flow_1_ena = uvm_reg_field::type_id::create("flow_1_ena", , get_full_name());
        flow_0_ena = uvm_reg_field::type_id::create("flow_0_ena", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        destination.configure(this, 4, 25, "RW", 0, 'h0, 1, 1, 0);
        flow_7_ena.configure(this, 1, 12, "RW", 0, 'h0, 1, 1, 0);
        flow_6_ena.configure(this, 1, 11, "RW", 0, 'h0, 1, 1, 0);
        flow_5_ena.configure(this, 1, 10, "RW", 0, 'h0, 1, 1, 0);
        flow_4_ena.configure(this, 1, 9, "RW", 0, 'h0, 1, 1, 0);
        compensation.configure(this, 5, 4, "RW", 0, 'h0, 1, 1, 0);
        flow_3_ena.configure(this, 1, 3, "RW", 0, 'h0, 1, 1, 0);
        flow_2_ena.configure(this, 1, 2, "RW", 0, 'h0, 1, 1, 0);
        flow_1_ena.configure(this, 1, 1, "RW", 0, 'h0, 1, 1, 0);
        flow_0_ena.configure(this, 1, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = pktgen_ena_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = pktgen_ena_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, destination.get_name, destination.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, flow_7_ena.get_name, flow_7_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, flow_6_ena.get_name, flow_6_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, flow_5_ena.get_name, flow_5_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, flow_4_ena.get_name, flow_4_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, compensation.get_name, compensation.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, flow_3_ena.get_name, flow_3_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, flow_2_ena.get_name, flow_2_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, flow_1_ena.get_name, flow_1_ena.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, flow_0_ena.get_name, flow_0_ena.value);
        return s;
    endfunction

endclass


// Class: pktgen_ena_reg_cover
// Register coverage object.
class pktgen_ena_reg_cover extends uvm_object;

    static local pktgen_ena_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    pktgen_ena_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        destination_wr: coverpoint r.destination.value iff (!is_read);
        destination_rd: coverpoint r.destination.value iff  (is_read);
        flow_7_ena_wr: coverpoint r.flow_7_ena.value iff (!is_read);
        flow_7_ena_rd: coverpoint r.flow_7_ena.value iff  (is_read);
        flow_6_ena_wr: coverpoint r.flow_6_ena.value iff (!is_read);
        flow_6_ena_rd: coverpoint r.flow_6_ena.value iff  (is_read);
        flow_5_ena_wr: coverpoint r.flow_5_ena.value iff (!is_read);
        flow_5_ena_rd: coverpoint r.flow_5_ena.value iff  (is_read);
        flow_4_ena_wr: coverpoint r.flow_4_ena.value iff (!is_read);
        flow_4_ena_rd: coverpoint r.flow_4_ena.value iff  (is_read);
        compensation_wr: coverpoint r.compensation.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        compensation_rd: coverpoint r.compensation.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        flow_3_ena_wr: coverpoint r.flow_3_ena.value iff (!is_read);
        flow_3_ena_rd: coverpoint r.flow_3_ena.value iff  (is_read);
        flow_2_ena_wr: coverpoint r.flow_2_ena.value iff (!is_read);
        flow_2_ena_rd: coverpoint r.flow_2_ena.value iff  (is_read);
        flow_1_ena_wr: coverpoint r.flow_1_ena.value iff (!is_read);
        flow_1_ena_rd: coverpoint r.flow_1_ena.value iff  (is_read);
        flow_0_ena_wr: coverpoint r.flow_0_ena.value iff (!is_read);
        flow_0_ena_rd: coverpoint r.flow_0_ena.value iff  (is_read);
    endgroup

    `uvm_object_utils(pktgen_reg_pkg::pktgen_ena_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="pktgen_ena_reg_cover");
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
    static function pktgen_ena_reg_cover get();
        if (m_inst == null) begin
            m_inst = pktgen_ena_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(pktgen_ena_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass





// Class: pktgen_reg_block
// Register Block .pktgen: 
class pktgen_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand pktgen_ena_reg ena;
    rand pktgen_flowheader_reg_block flow_header[];
    rand pktgen_padding_reg_block padding[];
    rand pktgen_shapping_reg_block shapping[];

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

        flow_header = new[8];
        padding = new[8];
        shapping = new[8];

        ena = pktgen_ena_reg::type_id::create("ena", , get_full_name());
        foreach(flow_header[m]) begin
            flow_header[m] = pktgen_flowheader_reg_block::type_id::create($sformatf("flow_header[%0d]",m), , get_full_name());
        end
        foreach(padding[m]) begin
            padding[m] = pktgen_padding_reg_block::type_id::create($sformatf("padding[%0d]",m), , get_full_name());
        end
        foreach(shapping[m]) begin
            shapping[m] = pktgen_shapping_reg_block::type_id::create($sformatf("shapping[%0d]",m), , get_full_name());
        end

        ena.configure(this);
        foreach(flow_header[m]) begin
            flow_header[m].configure(this);
        end
        foreach(padding[m]) begin
            padding[m].configure(this);
        end
        foreach(shapping[m]) begin
            shapping[m].configure(this);
        end

        ena.build();
        foreach(flow_header[m]) begin
            flow_header[m].build();
        end
        foreach(padding[m]) begin
            padding[m].build();
        end
        foreach(shapping[m]) begin
            shapping[m].build();
        end

        // define default map
        default_map = create_map("pktgen_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        this.default_map.add_reg(ena, 'h8FF, "RW");
        foreach(flow_header[m]) begin
            this.default_map.add_submap(this.flow_header[m].default_map, 'h0 + m*('h40));
        end
        foreach(padding[m]) begin
            this.default_map.add_submap(this.padding[m].default_map, 'h400 + m*('h10));
        end
        foreach(shapping[m]) begin
            this.default_map.add_submap(this.shapping[m].default_map, 'h800 + m*('h10));
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
            foreach(flow_header[m]) begin
                flow_header[m].set_per_instance_coverage(per_inst, hier);
            end
            foreach(padding[m]) begin
                padding[m].set_per_instance_coverage(per_inst, hier);
            end
            foreach(shapping[m]) begin
                shapping[m].set_per_instance_coverage(per_inst, hier);
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
        ena.enable_coverage(is_on, this.cg_per_instance);
        // Use UVM_CVR_ALL for hierarchical enabling.
        if(is_on == UVM_CVR_ALL) begin
            foreach(flow_header[m]) begin
                //void'(uvm_config_db#(bit)::set(null, flow_header[m].get_full_name(), "cg_per_instance", cg_per_instance));
                void'(flow_header[m].set_coverage(is_on));
            end
            foreach(padding[m]) begin
                //void'(uvm_config_db#(bit)::set(null, padding[m].get_full_name(), "cg_per_instance", cg_per_instance));
                void'(padding[m].set_coverage(is_on));
            end
            foreach(shapping[m]) begin
                //void'(uvm_config_db#(bit)::set(null, shapping[m].get_full_name(), "cg_per_instance", cg_per_instance));
                void'(shapping[m].set_coverage(is_on));
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