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
// Register definitions for fwd_domain_memory register block.
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
// Group: fwd_domain_memory
//---------------------------------------------------------

package fwd_domain_memory_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;

typedef class fwd_domain_domain_reg_cover;

// Class: fwd_domain_domain_reg
// Register fwd_domain.domain: 
class fwd_domain_domain_reg extends uvm_reg;

    // Variable: erp_instance_number
    // 
    rand uvm_reg_field erp_instance_number;
    // Variable: fwd_domain_mode
    // 
    rand uvm_reg_field fwd_domain_mode;
    // Variable: learning_dest
    // Forwarding destination from learning process.
    rand uvm_reg_field learning_dest;
    // Variable: learning_state
    // Counter set to fwd_inst.learning_state in the learning process. Use learning_dest if both learning_state match or is 1 late, flood if aged out.
    rand uvm_reg_field learning_state;
    // Variable: learning_flapping_error
    // G.8032 Ring to Local DROP or Ring x to Ring -&gt; Learning Flapping error status
    rand uvm_reg_field learning_flapping_error;
    // Variable: rx_blocking_error
    // G.8032 Ring to ALL (including APS, DROP) -&gt; Received Packet(s) on a blocking RING port status
    rand uvm_reg_field rx_blocking_error;
    // Variable: data_15_to_0
    // Write enable for data 15 downto 0
    rand uvm_reg_field data_15_to_0;
    // Variable: data_31_to_16
    // Write enable for data 31 downto 16
    rand uvm_reg_field data_31_to_16;
    // Variable: data_60_to_32
    // Write enable for data 60 downto 32
    rand uvm_reg_field data_60_to_32;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static fwd_domain_domain_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    fwd_domain_domain_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(fwd_domain_memory_reg_pkg::fwd_domain_domain_reg)

    // Constructor: new
    function new(string name = "fwd_domain_domain");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        erp_instance_number = uvm_reg_field::type_id::create("erp_instance_number", , get_full_name());
        fwd_domain_mode = uvm_reg_field::type_id::create("fwd_domain_mode", , get_full_name());
        learning_dest = uvm_reg_field::type_id::create("learning_dest", , get_full_name());
        learning_state = uvm_reg_field::type_id::create("learning_state", , get_full_name());
        learning_flapping_error = uvm_reg_field::type_id::create("learning_flapping_error", , get_full_name());
        rx_blocking_error = uvm_reg_field::type_id::create("rx_blocking_error", , get_full_name());
        data_15_to_0 = uvm_reg_field::type_id::create("data_15_to_0", , get_full_name());
        data_31_to_16 = uvm_reg_field::type_id::create("data_31_to_16", , get_full_name());
        data_60_to_32 = uvm_reg_field::type_id::create("data_60_to_32", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        erp_instance_number.configure(this, 7, 0, "RW", 0, 'h0, 1, 1, 0);
        fwd_domain_mode.configure(this, 4, 12, "RW", 0, 'h0, 1, 1, 0);
        learning_dest.configure(this, 2, 16, "RW", 0, 'h0, 1, 1, 0);
        learning_state.configure(this, 3, 20, "RW", 0, 'h0, 1, 1, 0);
        learning_flapping_error.configure(this, 1, 32, "RW", 0, 'h0, 1, 1, 0);
        rx_blocking_error.configure(this, 1, 33, "RW", 0, 'h0, 1, 1, 0);
        data_15_to_0.configure(this, 1, 61, "RW", 0, 'h0, 1, 1, 0);
        data_31_to_16.configure(this, 1, 62, "RW", 0, 'h0, 1, 1, 0);
        data_60_to_32.configure(this, 1, 63, "RW", 0, 'h0, 1, 1, 0);
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
                cg = fwd_domain_domain_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = fwd_domain_domain_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, erp_instance_number.get_name, erp_instance_number.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, fwd_domain_mode.get_name, fwd_domain_mode.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, learning_dest.get_name, learning_dest.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, learning_state.get_name, learning_state.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, learning_flapping_error.get_name, learning_flapping_error.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_blocking_error.get_name, rx_blocking_error.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, data_15_to_0.get_name, data_15_to_0.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, data_31_to_16.get_name, data_31_to_16.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, data_60_to_32.get_name, data_60_to_32.value);
        return s;
    endfunction

endclass


// Class: fwd_domain_domain_reg_cover
// Register coverage object.
class fwd_domain_domain_reg_cover extends uvm_object;

    static local fwd_domain_domain_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    fwd_domain_domain_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        erp_instance_number_wr: coverpoint r.erp_instance_number.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        erp_instance_number_rd: coverpoint r.erp_instance_number.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        fwd_domain_mode_wr: coverpoint r.fwd_domain_mode.value iff (!is_read);
        fwd_domain_mode_rd: coverpoint r.fwd_domain_mode.value iff  (is_read);
        learning_dest_wr: coverpoint r.learning_dest.value iff (!is_read);
        learning_dest_rd: coverpoint r.learning_dest.value iff  (is_read);
        learning_state_wr: coverpoint r.learning_state.value iff (!is_read);
        learning_state_rd: coverpoint r.learning_state.value iff  (is_read);
        learning_flapping_error_wr: coverpoint r.learning_flapping_error.value iff (!is_read);
        learning_flapping_error_rd: coverpoint r.learning_flapping_error.value iff  (is_read);
        rx_blocking_error_wr: coverpoint r.rx_blocking_error.value iff (!is_read);
        rx_blocking_error_rd: coverpoint r.rx_blocking_error.value iff  (is_read);
        data_15_to_0_wr: coverpoint r.data_15_to_0.value iff (!is_read);
        data_15_to_0_rd: coverpoint r.data_15_to_0.value iff  (is_read);
        data_31_to_16_wr: coverpoint r.data_31_to_16.value iff (!is_read);
        data_31_to_16_rd: coverpoint r.data_31_to_16.value iff  (is_read);
        data_60_to_32_wr: coverpoint r.data_60_to_32.value iff (!is_read);
        data_60_to_32_rd: coverpoint r.data_60_to_32.value iff  (is_read);
    endgroup

    `uvm_object_utils(fwd_domain_memory_reg_pkg::fwd_domain_domain_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="fwd_domain_domain_reg_cover");
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
    static function fwd_domain_domain_reg_cover get();
        if (m_inst == null) begin
            m_inst = fwd_domain_domain_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(fwd_domain_domain_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass





// Class: fwd_domain_memory_reg_block
// Register Block .fwd_domain_memory: 
class fwd_domain_memory_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand fwd_domain_domain_reg domain[];

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(fwd_domain_memory_reg_pkg::fwd_domain_memory_reg_block)

    // Constructor: new
    function new(string name = "fwd_domain_memory_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        domain = new[2048];

        foreach(domain[m]) begin
            domain[m] = fwd_domain_domain_reg::type_id::create($sformatf("domain[%0d]",m), , get_full_name());
        end

        foreach(domain[m]) begin
            domain[m].configure(this);
        end

        foreach(domain[m]) begin
            domain[m].build();
        end

        // define default map
        default_map = create_map("fwd_domain_memory_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        foreach(domain[m]) begin
            this.default_map.add_reg(this.domain[m], 'h0 + m, "RW");
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
        foreach(domain[m]) begin
            domain[m].enable_coverage(is_on, this.cg_per_instance);
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