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
// Register definitions for pcs_registers register block.
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
// Group: pcs_registers
//---------------------------------------------------------

package pcs_registers_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;

typedef class pcs_registers_pcs_ctrl_reg_cover;

// Class: pcs_registers_pcs_ctrl_reg
// Register pcs_registers.pcs_ctrl: 
class pcs_registers_pcs_ctrl_reg extends uvm_reg;

    // Variable: rclr_errblk_cnt
    // Error Block Counter clear register. When set to 1, clears the RCLR_ERRBLK_CNT register. When set to 0, normal operation continues.
    rand uvm_reg_field rclr_errblk_cnt;
    // Variable: rclr_ber_count
    // BER Counter clear register. When set to 1, clears the RCLR_BER_COUNT register. When set to 0, normal operation continues.
    rand uvm_reg_field rclr_ber_count;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static pcs_registers_pcs_ctrl_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    pcs_registers_pcs_ctrl_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pcs_registers_reg_pkg::pcs_registers_pcs_ctrl_reg)

    // Constructor: new
    function new(string name = "pcs_registers_pcs_ctrl");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rclr_errblk_cnt = uvm_reg_field::type_id::create("rclr_errblk_cnt", , get_full_name());
        rclr_ber_count = uvm_reg_field::type_id::create("rclr_ber_count", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rclr_errblk_cnt.configure(this, 1, 2, "RW", 0, 'h0, 1, 1, 0);
        rclr_ber_count.configure(this, 1, 3, "RW", 0, 'h0, 1, 1, 0);
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
                cg = pcs_registers_pcs_ctrl_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = pcs_registers_pcs_ctrl_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rclr_errblk_cnt.get_name, rclr_errblk_cnt.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, rclr_ber_count.get_name, rclr_ber_count.value);
        return s;
    endfunction

endclass


// Class: pcs_registers_pcs_ctrl_reg_cover
// Register coverage object.
class pcs_registers_pcs_ctrl_reg_cover extends uvm_object;

    static local pcs_registers_pcs_ctrl_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    pcs_registers_pcs_ctrl_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rclr_errblk_cnt_wr: coverpoint r.rclr_errblk_cnt.value iff (!is_read);
        rclr_errblk_cnt_rd: coverpoint r.rclr_errblk_cnt.value iff  (is_read);
        rclr_ber_count_wr: coverpoint r.rclr_ber_count.value iff (!is_read);
        rclr_ber_count_rd: coverpoint r.rclr_ber_count.value iff  (is_read);
    endgroup

    `uvm_object_utils(pcs_registers_reg_pkg::pcs_registers_pcs_ctrl_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="pcs_registers_pcs_ctrl_reg_cover");
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
    static function pcs_registers_pcs_ctrl_reg_cover get();
        if (m_inst == null) begin
            m_inst = pcs_registers_pcs_ctrl_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(pcs_registers_pcs_ctrl_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class pcs_registers_pcs_status_reg_cover;

// Class: pcs_registers_pcs_status_reg
// Register pcs_registers.pcs_status: 
class pcs_registers_pcs_status_reg extends uvm_reg;

    // Variable: hi_ber
    // High BER status. When set to 1, the PCS is reporting a high BER. When set to 0, the PCS is not reporting a high BER.
    rand uvm_reg_field hi_ber;
    // Variable: block_lock
    // Block lock status. When set to 1, the PCS is locked to received blocks. When set to 0, the PCS is not locked to received blocks.
    rand uvm_reg_field block_lock;
    // Variable: tx_full
    // When set to 1, the TX_FIFO is full.
    rand uvm_reg_field tx_full;
    // Variable: rx_full
    // When set to 1, the RX_FIFO is full.
    rand uvm_reg_field rx_full;
    // Variable: rx_sync_head_error
    // When set to 1, indicates an RX synchronization error.
    rand uvm_reg_field rx_sync_head_error;
    // Variable: rx_scrambler_error
    // When set to 1, indicates an RX scrambler error.
    rand uvm_reg_field rx_scrambler_error;
    // Variable: rx_data_ready
    // When set to 1, indicates the PHY is ready to receive data.
    rand uvm_reg_field rx_data_ready;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static pcs_registers_pcs_status_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    pcs_registers_pcs_status_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pcs_registers_reg_pkg::pcs_registers_pcs_status_reg)

    // Constructor: new
    function new(string name = "pcs_registers_pcs_status");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        hi_ber = uvm_reg_field::type_id::create("hi_ber", , get_full_name());
        block_lock = uvm_reg_field::type_id::create("block_lock", , get_full_name());
        tx_full = uvm_reg_field::type_id::create("tx_full", , get_full_name());
        rx_full = uvm_reg_field::type_id::create("rx_full", , get_full_name());
        rx_sync_head_error = uvm_reg_field::type_id::create("rx_sync_head_error", , get_full_name());
        rx_scrambler_error = uvm_reg_field::type_id::create("rx_scrambler_error", , get_full_name());
        rx_data_ready = uvm_reg_field::type_id::create("rx_data_ready", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        hi_ber.configure(this, 1, 1, "RO", 0, 'h0, 1, 1, 0);
        block_lock.configure(this, 1, 2, "RO", 0, 'h0, 1, 1, 0);
        tx_full.configure(this, 1, 3, "RO", 0, 'h0, 1, 1, 0);
        rx_full.configure(this, 1, 4, "RO", 0, 'h0, 1, 1, 0);
        rx_sync_head_error.configure(this, 1, 5, "RO", 0, 'h0, 1, 1, 0);
        rx_scrambler_error.configure(this, 1, 6, "RO", 0, 'h0, 1, 1, 0);
        rx_data_ready.configure(this, 1, 7, "RO", 0, 'h0, 1, 1, 0);
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
                cg = pcs_registers_pcs_status_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = pcs_registers_pcs_status_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, hi_ber.get_name, hi_ber.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, block_lock.get_name, block_lock.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_full.get_name, tx_full.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_full.get_name, rx_full.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_sync_head_error.get_name, rx_sync_head_error.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_scrambler_error.get_name, rx_scrambler_error.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_data_ready.get_name, rx_data_ready.value);
        return s;
    endfunction

endclass


// Class: pcs_registers_pcs_status_reg_cover
// Register coverage object.
class pcs_registers_pcs_status_reg_cover extends uvm_object;

    static local pcs_registers_pcs_status_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    pcs_registers_pcs_status_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        hi_ber_wr: coverpoint r.hi_ber.value iff (!is_read);
        hi_ber_rd: coverpoint r.hi_ber.value iff  (is_read);
        block_lock_wr: coverpoint r.block_lock.value iff (!is_read);
        block_lock_rd: coverpoint r.block_lock.value iff  (is_read);
        tx_full_wr: coverpoint r.tx_full.value iff (!is_read);
        tx_full_rd: coverpoint r.tx_full.value iff  (is_read);
        rx_full_wr: coverpoint r.rx_full.value iff (!is_read);
        rx_full_rd: coverpoint r.rx_full.value iff  (is_read);
        rx_sync_head_error_wr: coverpoint r.rx_sync_head_error.value iff (!is_read);
        rx_sync_head_error_rd: coverpoint r.rx_sync_head_error.value iff  (is_read);
        rx_scrambler_error_wr: coverpoint r.rx_scrambler_error.value iff (!is_read);
        rx_scrambler_error_rd: coverpoint r.rx_scrambler_error.value iff  (is_read);
        rx_data_ready_wr: coverpoint r.rx_data_ready.value iff (!is_read);
        rx_data_ready_rd: coverpoint r.rx_data_ready.value iff  (is_read);
    endgroup

    `uvm_object_utils(pcs_registers_reg_pkg::pcs_registers_pcs_status_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="pcs_registers_pcs_status_reg_cover");
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
    static function pcs_registers_pcs_status_reg_cover get();
        if (m_inst == null) begin
            m_inst = pcs_registers_pcs_status_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(pcs_registers_pcs_status_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass





// Class: pcs_registers_reg_block
// Register Block .pcs_registers: 
class pcs_registers_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand pcs_registers_pcs_ctrl_reg pcs_ctrl;
    rand pcs_registers_pcs_status_reg pcs_status;

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(pcs_registers_reg_pkg::pcs_registers_reg_block)

    // Constructor: new
    function new(string name = "pcs_registers_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})


        pcs_ctrl = pcs_registers_pcs_ctrl_reg::type_id::create("pcs_ctrl", , get_full_name());
        pcs_status = pcs_registers_pcs_status_reg::type_id::create("pcs_status", , get_full_name());

        pcs_ctrl.configure(this);
        pcs_status.configure(this);

        pcs_ctrl.build();
        pcs_status.build();

        // define default map
        default_map = create_map("pcs_registers_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        this.default_map.add_reg(pcs_ctrl, 'h81, "RW");
        this.default_map.add_reg(pcs_status, 'h82, "RO");

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
        pcs_ctrl.enable_coverage(is_on, this.cg_per_instance);
        pcs_status.enable_coverage(is_on, this.cg_per_instance);
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