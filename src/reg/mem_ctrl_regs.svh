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
// Register definitions for mem_ctrl register block.
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
// Group: mem_ctrl
//---------------------------------------------------------

package mem_ctrl_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;

typedef class mem_ctrl_mem_test_ctrl_reg_cover;

// Class: mem_ctrl_mem_test_ctrl_reg
// Register mem_ctrl.mem_test_ctrl: Memory testers control
class mem_ctrl_mem_test_ctrl_reg extends uvm_reg;

    // Variable: table_ram_1_test_en
    // Enable continuous looping table ram 1 memory test
    rand uvm_reg_field table_ram_1_test_en;
    // Variable: table_ram_2_test_en
    // Enable continuous looping table ram 2 memory test
    rand uvm_reg_field table_ram_2_test_en;
    // Variable: data_ram_test_en
    // Enable continuous looping data ram memory test
    rand uvm_reg_field data_ram_test_en;
    // Variable: table_ram_1_test_single
    // Enable single pass table ram 1 memory test
    rand uvm_reg_field table_ram_1_test_single;
    // Variable: table_ram_2_test_single
    // Enable single pass table ram 2 memory test
    rand uvm_reg_field table_ram_2_test_single;
    // Variable: data_ram_test_single
    // Enable single pass data ram memory test
    rand uvm_reg_field data_ram_test_single;
    // Variable: test_mode
    // 00: Rd and Wr; 01: Rd only; 10: Wr only; 11: Illegal
    rand uvm_reg_field test_mode;
    // Variable: stop_on_error
    // When set, test stops when an error occurs
    rand uvm_reg_field stop_on_error;
    // Variable: data_invert
    // Invert data pattern
    rand uvm_reg_field data_invert;
    // Variable: mask_off_data_ram_low
    // Mask off errors in lower half of data RAM
    rand uvm_reg_field mask_off_data_ram_low;
    // Variable: mask_off_data_ram_high
    // Mask off errors in higher half of data RAM
    rand uvm_reg_field mask_off_data_ram_high;
    // Variable: data_pattern
    // Data test pattern
    rand uvm_reg_field data_pattern;
    // Variable: addr_pattern
    // Address test pattern
    rand uvm_reg_field addr_pattern;
    // Variable: addr_bits
    // Number of bits in address (test runs from start_addr to 2^addr_bits-1)
    rand uvm_reg_field addr_bits;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static mem_ctrl_mem_test_ctrl_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    mem_ctrl_mem_test_ctrl_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(mem_ctrl_reg_pkg::mem_ctrl_mem_test_ctrl_reg)

    // Constructor: new
    function new(string name = "mem_ctrl_mem_test_ctrl");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        table_ram_1_test_en = uvm_reg_field::type_id::create("table_ram_1_test_en", , get_full_name());
        table_ram_2_test_en = uvm_reg_field::type_id::create("table_ram_2_test_en", , get_full_name());
        data_ram_test_en = uvm_reg_field::type_id::create("data_ram_test_en", , get_full_name());
        table_ram_1_test_single = uvm_reg_field::type_id::create("table_ram_1_test_single", , get_full_name());
        table_ram_2_test_single = uvm_reg_field::type_id::create("table_ram_2_test_single", , get_full_name());
        data_ram_test_single = uvm_reg_field::type_id::create("data_ram_test_single", , get_full_name());
        test_mode = uvm_reg_field::type_id::create("test_mode", , get_full_name());
        stop_on_error = uvm_reg_field::type_id::create("stop_on_error", , get_full_name());
        data_invert = uvm_reg_field::type_id::create("data_invert", , get_full_name());
        mask_off_data_ram_low = uvm_reg_field::type_id::create("mask_off_data_ram_low", , get_full_name());
        mask_off_data_ram_high = uvm_reg_field::type_id::create("mask_off_data_ram_high", , get_full_name());
        data_pattern = uvm_reg_field::type_id::create("data_pattern", , get_full_name());
        addr_pattern = uvm_reg_field::type_id::create("addr_pattern", , get_full_name());
        addr_bits = uvm_reg_field::type_id::create("addr_bits", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        table_ram_1_test_en.configure(this, 1, 0, "RW", 0, 'h0, 1, 1, 0);
        table_ram_2_test_en.configure(this, 1, 1, "RW", 0, 'h0, 1, 1, 0);
        data_ram_test_en.configure(this, 1, 2, "RW", 0, 'h0, 1, 1, 0);
        table_ram_1_test_single.configure(this, 1, 4, "RW", 0, 'h0, 1, 1, 0);
        table_ram_2_test_single.configure(this, 1, 5, "RW", 0, 'h0, 1, 1, 0);
        data_ram_test_single.configure(this, 1, 6, "RW", 0, 'h0, 1, 1, 0);
        test_mode.configure(this, 2, 8, "RW", 0, 'h0, 1, 1, 0);
        stop_on_error.configure(this, 1, 10, "RW", 0, 'h0, 1, 1, 0);
        data_invert.configure(this, 1, 11, "RW", 0, 'h0, 1, 1, 0);
        mask_off_data_ram_low.configure(this, 1, 12, "RW", 0, 'h0, 1, 1, 0);
        mask_off_data_ram_high.configure(this, 1, 13, "RW", 0, 'h0, 1, 1, 0);
        data_pattern.configure(this, 3, 16, "RW", 0, 'h0, 1, 1, 0);
        addr_pattern.configure(this, 3, 20, "RW", 0, 'h0, 1, 1, 0);
        addr_bits.configure(this, 6, 24, "RW", 0, 'h15, 1, 1, 0);
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
                cg = mem_ctrl_mem_test_ctrl_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = mem_ctrl_mem_test_ctrl_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, table_ram_1_test_en.get_name, table_ram_1_test_en.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, table_ram_2_test_en.get_name, table_ram_2_test_en.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, data_ram_test_en.get_name, data_ram_test_en.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, table_ram_1_test_single.get_name, table_ram_1_test_single.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, table_ram_2_test_single.get_name, table_ram_2_test_single.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, data_ram_test_single.get_name, data_ram_test_single.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, test_mode.get_name, test_mode.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, stop_on_error.get_name, stop_on_error.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, data_invert.get_name, data_invert.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, mask_off_data_ram_low.get_name, mask_off_data_ram_low.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, mask_off_data_ram_high.get_name, mask_off_data_ram_high.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, data_pattern.get_name, data_pattern.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, addr_pattern.get_name, addr_pattern.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, addr_bits.get_name, addr_bits.value);
        return s;
    endfunction

endclass


// Class: mem_ctrl_mem_test_ctrl_reg_cover
// Register coverage object.
class mem_ctrl_mem_test_ctrl_reg_cover extends uvm_object;

    static local mem_ctrl_mem_test_ctrl_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    mem_ctrl_mem_test_ctrl_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        table_ram_1_test_en_wr: coverpoint r.table_ram_1_test_en.value iff (!is_read);
        table_ram_1_test_en_rd: coverpoint r.table_ram_1_test_en.value iff  (is_read);
        table_ram_2_test_en_wr: coverpoint r.table_ram_2_test_en.value iff (!is_read);
        table_ram_2_test_en_rd: coverpoint r.table_ram_2_test_en.value iff  (is_read);
        data_ram_test_en_wr: coverpoint r.data_ram_test_en.value iff (!is_read);
        data_ram_test_en_rd: coverpoint r.data_ram_test_en.value iff  (is_read);
        table_ram_1_test_single_wr: coverpoint r.table_ram_1_test_single.value iff (!is_read);
        table_ram_1_test_single_rd: coverpoint r.table_ram_1_test_single.value iff  (is_read);
        table_ram_2_test_single_wr: coverpoint r.table_ram_2_test_single.value iff (!is_read);
        table_ram_2_test_single_rd: coverpoint r.table_ram_2_test_single.value iff  (is_read);
        data_ram_test_single_wr: coverpoint r.data_ram_test_single.value iff (!is_read);
        data_ram_test_single_rd: coverpoint r.data_ram_test_single.value iff  (is_read);
        test_mode_wr: coverpoint r.test_mode.value iff (!is_read);
        test_mode_rd: coverpoint r.test_mode.value iff  (is_read);
        stop_on_error_wr: coverpoint r.stop_on_error.value iff (!is_read);
        stop_on_error_rd: coverpoint r.stop_on_error.value iff  (is_read);
        data_invert_wr: coverpoint r.data_invert.value iff (!is_read);
        data_invert_rd: coverpoint r.data_invert.value iff  (is_read);
        mask_off_data_ram_low_wr: coverpoint r.mask_off_data_ram_low.value iff (!is_read);
        mask_off_data_ram_low_rd: coverpoint r.mask_off_data_ram_low.value iff  (is_read);
        mask_off_data_ram_high_wr: coverpoint r.mask_off_data_ram_high.value iff (!is_read);
        mask_off_data_ram_high_rd: coverpoint r.mask_off_data_ram_high.value iff  (is_read);
        data_pattern_wr: coverpoint r.data_pattern.value iff (!is_read);
        data_pattern_rd: coverpoint r.data_pattern.value iff  (is_read);
        addr_pattern_wr: coverpoint r.addr_pattern.value iff (!is_read);
        addr_pattern_rd: coverpoint r.addr_pattern.value iff  (is_read);
        addr_bits_wr: coverpoint r.addr_bits.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        addr_bits_rd: coverpoint r.addr_bits.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(mem_ctrl_reg_pkg::mem_ctrl_mem_test_ctrl_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="mem_ctrl_mem_test_ctrl_reg_cover");
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
    static function mem_ctrl_mem_test_ctrl_reg_cover get();
        if (m_inst == null) begin
            m_inst = mem_ctrl_mem_test_ctrl_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(mem_ctrl_mem_test_ctrl_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class mem_ctrl_mem_test_ctrl_2_reg_cover;

// Class: mem_ctrl_mem_test_ctrl_2_reg
// Register mem_ctrl.mem_test_ctrl_2: Memory tester control 2
class mem_ctrl_mem_test_ctrl_2_reg extends uvm_reg;

    // Variable: start_addr
    // Address to start memory test at.
    rand uvm_reg_field start_addr;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static mem_ctrl_mem_test_ctrl_2_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    mem_ctrl_mem_test_ctrl_2_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(mem_ctrl_reg_pkg::mem_ctrl_mem_test_ctrl_2_reg)

    // Constructor: new
    function new(string name = "mem_ctrl_mem_test_ctrl_2");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        start_addr = uvm_reg_field::type_id::create("start_addr", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        start_addr.configure(this, 23, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = mem_ctrl_mem_test_ctrl_2_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = mem_ctrl_mem_test_ctrl_2_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, start_addr.get_name, start_addr.value);
        return s;
    endfunction

endclass


// Class: mem_ctrl_mem_test_ctrl_2_reg_cover
// Register coverage object.
class mem_ctrl_mem_test_ctrl_2_reg_cover extends uvm_object;

    static local mem_ctrl_mem_test_ctrl_2_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    mem_ctrl_mem_test_ctrl_2_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        start_addr_wr: coverpoint r.start_addr.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        start_addr_rd: coverpoint r.start_addr.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(mem_ctrl_reg_pkg::mem_ctrl_mem_test_ctrl_2_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="mem_ctrl_mem_test_ctrl_2_reg_cover");
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
    static function mem_ctrl_mem_test_ctrl_2_reg_cover get();
        if (m_inst == null) begin
            m_inst = mem_ctrl_mem_test_ctrl_2_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(mem_ctrl_mem_test_ctrl_2_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class mem_ctrl_mem_test_status_reg_cover;

// Class: mem_ctrl_mem_test_status_reg
// Register mem_ctrl.mem_test_status: Memory testers status
class mem_ctrl_mem_test_status_reg extends uvm_reg;

    // Variable: table_ram_1_test_done
    // table ram 1 memory test done
    rand uvm_reg_field table_ram_1_test_done;
    // Variable: table_ram_2_test_done
    // table ram 2 memory test done
    rand uvm_reg_field table_ram_2_test_done;
    // Variable: data_ram_test_done
    // data ram memory test done
    rand uvm_reg_field data_ram_test_done;
    // Variable: table_ram_1_error_hold
    // table ram 1 memory error was detected
    rand uvm_reg_field table_ram_1_error_hold;
    // Variable: table_ram_2_error_hold
    // table ram 2 memory error was detected
    rand uvm_reg_field table_ram_2_error_hold;
    // Variable: data_ram_error_hold
    // data ram memory error was detected
    rand uvm_reg_field data_ram_error_hold;
    // Variable: table_ram_1_tester_idle
    // table ram 1 memory tester is idle
    rand uvm_reg_field table_ram_1_tester_idle;
    // Variable: table_ram_1_tester_rw_data_done
    // table ram 1 memory tester rw_data_done
    rand uvm_reg_field table_ram_1_tester_rw_data_done;
    // Variable: table_ram_1_tester_rw_cmd_done
    // table ram 1 memory tester rw_cmd_done
    rand uvm_reg_field table_ram_1_tester_rw_cmd_done;
    // Variable: table_ram_1_error
    // table ram 1 memory error is present now
    rand uvm_reg_field table_ram_1_error;
    // Variable: table_ram_1_tester_state
    // table ram 1 ram tester internal state
    rand uvm_reg_field table_ram_1_tester_state;
    // Variable: table_ram_2_tester_idle
    // table ram 2 memory tester is idle
    rand uvm_reg_field table_ram_2_tester_idle;
    // Variable: table_ram_2_tester_rw_data_done
    // table ram 2 memory tester rw_data_done
    rand uvm_reg_field table_ram_2_tester_rw_data_done;
    // Variable: table_ram_2_tester_rw_cmd_done
    // table ram 2 memory tester rw_cmd_done
    rand uvm_reg_field table_ram_2_tester_rw_cmd_done;
    // Variable: table_ram_2_error
    // table ram 2 memory error is present now
    rand uvm_reg_field table_ram_2_error;
    // Variable: table_ram_2_tester_state
    // table ram 2 ram tester internal state
    rand uvm_reg_field table_ram_2_tester_state;
    // Variable: data_ram_tester_idle
    // data ram memory tester is idle
    rand uvm_reg_field data_ram_tester_idle;
    // Variable: data_ram_tester_rw_data_done
    // data ram memory tester rw_data_done
    rand uvm_reg_field data_ram_tester_rw_data_done;
    // Variable: data_ram_tester_rw_cmd_done
    // data ram memory tester rw_cmd_done
    rand uvm_reg_field data_ram_tester_rw_cmd_done;
    // Variable: data_ram_error
    // data ram memory error is present now
    rand uvm_reg_field data_ram_error;
    // Variable: data_ram_tester_state
    // data ram tester internal state
    rand uvm_reg_field data_ram_tester_state;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static mem_ctrl_mem_test_status_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    mem_ctrl_mem_test_status_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(mem_ctrl_reg_pkg::mem_ctrl_mem_test_status_reg)

    // Constructor: new
    function new(string name = "mem_ctrl_mem_test_status");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        table_ram_1_test_done = uvm_reg_field::type_id::create("table_ram_1_test_done", , get_full_name());
        table_ram_2_test_done = uvm_reg_field::type_id::create("table_ram_2_test_done", , get_full_name());
        data_ram_test_done = uvm_reg_field::type_id::create("data_ram_test_done", , get_full_name());
        table_ram_1_error_hold = uvm_reg_field::type_id::create("table_ram_1_error_hold", , get_full_name());
        table_ram_2_error_hold = uvm_reg_field::type_id::create("table_ram_2_error_hold", , get_full_name());
        data_ram_error_hold = uvm_reg_field::type_id::create("data_ram_error_hold", , get_full_name());
        table_ram_1_tester_idle = uvm_reg_field::type_id::create("table_ram_1_tester_idle", , get_full_name());
        table_ram_1_tester_rw_data_done = uvm_reg_field::type_id::create("table_ram_1_tester_rw_data_done", , get_full_name());
        table_ram_1_tester_rw_cmd_done = uvm_reg_field::type_id::create("table_ram_1_tester_rw_cmd_done", , get_full_name());
        table_ram_1_error = uvm_reg_field::type_id::create("table_ram_1_error", , get_full_name());
        table_ram_1_tester_state = uvm_reg_field::type_id::create("table_ram_1_tester_state", , get_full_name());
        table_ram_2_tester_idle = uvm_reg_field::type_id::create("table_ram_2_tester_idle", , get_full_name());
        table_ram_2_tester_rw_data_done = uvm_reg_field::type_id::create("table_ram_2_tester_rw_data_done", , get_full_name());
        table_ram_2_tester_rw_cmd_done = uvm_reg_field::type_id::create("table_ram_2_tester_rw_cmd_done", , get_full_name());
        table_ram_2_error = uvm_reg_field::type_id::create("table_ram_2_error", , get_full_name());
        table_ram_2_tester_state = uvm_reg_field::type_id::create("table_ram_2_tester_state", , get_full_name());
        data_ram_tester_idle = uvm_reg_field::type_id::create("data_ram_tester_idle", , get_full_name());
        data_ram_tester_rw_data_done = uvm_reg_field::type_id::create("data_ram_tester_rw_data_done", , get_full_name());
        data_ram_tester_rw_cmd_done = uvm_reg_field::type_id::create("data_ram_tester_rw_cmd_done", , get_full_name());
        data_ram_error = uvm_reg_field::type_id::create("data_ram_error", , get_full_name());
        data_ram_tester_state = uvm_reg_field::type_id::create("data_ram_tester_state", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        table_ram_1_test_done.configure(this, 1, 0, "RO", 0, 'h0, 1, 1, 0);
        table_ram_2_test_done.configure(this, 1, 1, "RO", 0, 'h0, 1, 1, 0);
        data_ram_test_done.configure(this, 1, 2, "RO", 0, 'h0, 1, 1, 0);
        table_ram_1_error_hold.configure(this, 1, 4, "RO", 0, 'h0, 1, 1, 0);
        table_ram_2_error_hold.configure(this, 1, 5, "RO", 0, 'h0, 1, 1, 0);
        data_ram_error_hold.configure(this, 1, 6, "RO", 0, 'h0, 1, 1, 0);
        table_ram_1_tester_idle.configure(this, 1, 8, "RO", 0, 'h0, 1, 1, 0);
        table_ram_1_tester_rw_data_done.configure(this, 1, 9, "RO", 0, 'h0, 1, 1, 0);
        table_ram_1_tester_rw_cmd_done.configure(this, 1, 10, "RO", 0, 'h0, 1, 1, 0);
        table_ram_1_error.configure(this, 1, 11, "RO", 0, 'h0, 1, 1, 0);
        table_ram_1_tester_state.configure(this, 4, 12, "RO", 0, 'h0, 1, 1, 0);
        table_ram_2_tester_idle.configure(this, 1, 16, "RO", 0, 'h0, 1, 1, 0);
        table_ram_2_tester_rw_data_done.configure(this, 1, 17, "RO", 0, 'h0, 1, 1, 0);
        table_ram_2_tester_rw_cmd_done.configure(this, 1, 18, "RO", 0, 'h0, 1, 1, 0);
        table_ram_2_error.configure(this, 1, 19, "RO", 0, 'h0, 1, 1, 0);
        table_ram_2_tester_state.configure(this, 4, 20, "RO", 0, 'h0, 1, 1, 0);
        data_ram_tester_idle.configure(this, 1, 24, "RO", 0, 'h0, 1, 1, 0);
        data_ram_tester_rw_data_done.configure(this, 1, 25, "RO", 0, 'h0, 1, 1, 0);
        data_ram_tester_rw_cmd_done.configure(this, 1, 26, "RO", 0, 'h0, 1, 1, 0);
        data_ram_error.configure(this, 1, 27, "RO", 0, 'h0, 1, 1, 0);
        data_ram_tester_state.configure(this, 4, 28, "RO", 0, 'h0, 1, 1, 0);
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
                cg = mem_ctrl_mem_test_status_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = mem_ctrl_mem_test_status_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, table_ram_1_test_done.get_name, table_ram_1_test_done.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, table_ram_2_test_done.get_name, table_ram_2_test_done.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, data_ram_test_done.get_name, data_ram_test_done.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, table_ram_1_error_hold.get_name, table_ram_1_error_hold.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, table_ram_2_error_hold.get_name, table_ram_2_error_hold.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, data_ram_error_hold.get_name, data_ram_error_hold.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, table_ram_1_tester_idle.get_name, table_ram_1_tester_idle.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, table_ram_1_tester_rw_data_done.get_name, table_ram_1_tester_rw_data_done.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, table_ram_1_tester_rw_cmd_done.get_name, table_ram_1_tester_rw_cmd_done.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, table_ram_1_error.get_name, table_ram_1_error.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, table_ram_1_tester_state.get_name, table_ram_1_tester_state.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, table_ram_2_tester_idle.get_name, table_ram_2_tester_idle.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, table_ram_2_tester_rw_data_done.get_name, table_ram_2_tester_rw_data_done.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, table_ram_2_tester_rw_cmd_done.get_name, table_ram_2_tester_rw_cmd_done.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, table_ram_2_error.get_name, table_ram_2_error.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, table_ram_2_tester_state.get_name, table_ram_2_tester_state.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, data_ram_tester_idle.get_name, data_ram_tester_idle.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, data_ram_tester_rw_data_done.get_name, data_ram_tester_rw_data_done.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, data_ram_tester_rw_cmd_done.get_name, data_ram_tester_rw_cmd_done.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, data_ram_error.get_name, data_ram_error.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, data_ram_tester_state.get_name, data_ram_tester_state.value);
        return s;
    endfunction

endclass


// Class: mem_ctrl_mem_test_status_reg_cover
// Register coverage object.
class mem_ctrl_mem_test_status_reg_cover extends uvm_object;

    static local mem_ctrl_mem_test_status_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    mem_ctrl_mem_test_status_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        table_ram_1_test_done_wr: coverpoint r.table_ram_1_test_done.value iff (!is_read);
        table_ram_1_test_done_rd: coverpoint r.table_ram_1_test_done.value iff  (is_read);
        table_ram_2_test_done_wr: coverpoint r.table_ram_2_test_done.value iff (!is_read);
        table_ram_2_test_done_rd: coverpoint r.table_ram_2_test_done.value iff  (is_read);
        data_ram_test_done_wr: coverpoint r.data_ram_test_done.value iff (!is_read);
        data_ram_test_done_rd: coverpoint r.data_ram_test_done.value iff  (is_read);
        table_ram_1_error_hold_wr: coverpoint r.table_ram_1_error_hold.value iff (!is_read);
        table_ram_1_error_hold_rd: coverpoint r.table_ram_1_error_hold.value iff  (is_read);
        table_ram_2_error_hold_wr: coverpoint r.table_ram_2_error_hold.value iff (!is_read);
        table_ram_2_error_hold_rd: coverpoint r.table_ram_2_error_hold.value iff  (is_read);
        data_ram_error_hold_wr: coverpoint r.data_ram_error_hold.value iff (!is_read);
        data_ram_error_hold_rd: coverpoint r.data_ram_error_hold.value iff  (is_read);
        table_ram_1_tester_idle_wr: coverpoint r.table_ram_1_tester_idle.value iff (!is_read);
        table_ram_1_tester_idle_rd: coverpoint r.table_ram_1_tester_idle.value iff  (is_read);
        table_ram_1_tester_rw_data_done_wr: coverpoint r.table_ram_1_tester_rw_data_done.value iff (!is_read);
        table_ram_1_tester_rw_data_done_rd: coverpoint r.table_ram_1_tester_rw_data_done.value iff  (is_read);
        table_ram_1_tester_rw_cmd_done_wr: coverpoint r.table_ram_1_tester_rw_cmd_done.value iff (!is_read);
        table_ram_1_tester_rw_cmd_done_rd: coverpoint r.table_ram_1_tester_rw_cmd_done.value iff  (is_read);
        table_ram_1_error_wr: coverpoint r.table_ram_1_error.value iff (!is_read);
        table_ram_1_error_rd: coverpoint r.table_ram_1_error.value iff  (is_read);
        table_ram_1_tester_state_wr: coverpoint r.table_ram_1_tester_state.value iff (!is_read);
        table_ram_1_tester_state_rd: coverpoint r.table_ram_1_tester_state.value iff  (is_read);
        table_ram_2_tester_idle_wr: coverpoint r.table_ram_2_tester_idle.value iff (!is_read);
        table_ram_2_tester_idle_rd: coverpoint r.table_ram_2_tester_idle.value iff  (is_read);
        table_ram_2_tester_rw_data_done_wr: coverpoint r.table_ram_2_tester_rw_data_done.value iff (!is_read);
        table_ram_2_tester_rw_data_done_rd: coverpoint r.table_ram_2_tester_rw_data_done.value iff  (is_read);
        table_ram_2_tester_rw_cmd_done_wr: coverpoint r.table_ram_2_tester_rw_cmd_done.value iff (!is_read);
        table_ram_2_tester_rw_cmd_done_rd: coverpoint r.table_ram_2_tester_rw_cmd_done.value iff  (is_read);
        table_ram_2_error_wr: coverpoint r.table_ram_2_error.value iff (!is_read);
        table_ram_2_error_rd: coverpoint r.table_ram_2_error.value iff  (is_read);
        table_ram_2_tester_state_wr: coverpoint r.table_ram_2_tester_state.value iff (!is_read);
        table_ram_2_tester_state_rd: coverpoint r.table_ram_2_tester_state.value iff  (is_read);
        data_ram_tester_idle_wr: coverpoint r.data_ram_tester_idle.value iff (!is_read);
        data_ram_tester_idle_rd: coverpoint r.data_ram_tester_idle.value iff  (is_read);
        data_ram_tester_rw_data_done_wr: coverpoint r.data_ram_tester_rw_data_done.value iff (!is_read);
        data_ram_tester_rw_data_done_rd: coverpoint r.data_ram_tester_rw_data_done.value iff  (is_read);
        data_ram_tester_rw_cmd_done_wr: coverpoint r.data_ram_tester_rw_cmd_done.value iff (!is_read);
        data_ram_tester_rw_cmd_done_rd: coverpoint r.data_ram_tester_rw_cmd_done.value iff  (is_read);
        data_ram_error_wr: coverpoint r.data_ram_error.value iff (!is_read);
        data_ram_error_rd: coverpoint r.data_ram_error.value iff  (is_read);
        data_ram_tester_state_wr: coverpoint r.data_ram_tester_state.value iff (!is_read);
        data_ram_tester_state_rd: coverpoint r.data_ram_tester_state.value iff  (is_read);
    endgroup

    `uvm_object_utils(mem_ctrl_reg_pkg::mem_ctrl_mem_test_status_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="mem_ctrl_mem_test_status_reg_cover");
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
    static function mem_ctrl_mem_test_status_reg_cover get();
        if (m_inst == null) begin
            m_inst = mem_ctrl_mem_test_status_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(mem_ctrl_mem_test_status_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class mem_ctrl_phy_status_reg_cover;

// Class: mem_ctrl_phy_status_reg
// Register mem_ctrl.phy_status: Memory controllers status
class mem_ctrl_phy_status_reg extends uvm_reg;

    // Variable: table_ram_master_phy_cal_success
    // Calibration sucess status of table_ram master phy
    rand uvm_reg_field table_ram_master_phy_cal_success;
    // Variable: table_ram_slave_phy_cal_success
    // Calibration sucess status of table_ram slave phy
    rand uvm_reg_field table_ram_slave_phy_cal_success;
    // Variable: data_ram_master_phy_cal_success
    // Calibration sucess status of data_ram master phy
    rand uvm_reg_field data_ram_master_phy_cal_success;
    // Variable: data_ram_slave_phy_cal_success
    // Calibration sucess status of data_ram slave phy
    rand uvm_reg_field data_ram_slave_phy_cal_success;
    // Variable: table_ram_master_phy_cal_fail
    // Calibration fail status of table_ram master phy
    rand uvm_reg_field table_ram_master_phy_cal_fail;
    // Variable: table_ram_slave_phy_cal_fail
    // Calibration fail status of table_ram slave phy
    rand uvm_reg_field table_ram_slave_phy_cal_fail;
    // Variable: data_ram_master_phy_cal_fail
    // Calibration fail status of data_ram master phy
    rand uvm_reg_field data_ram_master_phy_cal_fail;
    // Variable: data_ram_slave_phy_cal_fail
    // Calibration fail status of data_ram slave phy
    rand uvm_reg_field data_ram_slave_phy_cal_fail;
    // Variable: table_ram_1_controller_busy
    // Table RAM 1 controller is busy
    rand uvm_reg_field table_ram_1_controller_busy;
    // Variable: table_ram_1_controller_req_buf_af
    // Table RAM 1 controller request buffer is almost full
    rand uvm_reg_field table_ram_1_controller_req_buf_af;
    // Variable: table_ram_2_controller_busy
    // Table RAM 2 controller is busy
    rand uvm_reg_field table_ram_2_controller_busy;
    // Variable: table_ram_2_controller_req_buf_af
    // Table RAM 2 controller request buffer is almost full
    rand uvm_reg_field table_ram_2_controller_req_buf_af;
    // Variable: data_ram_controller_busy
    // Data RAM controller is busy
    rand uvm_reg_field data_ram_controller_busy;
    // Variable: data_ram_controller_req_buf_af
    // Data RAM controller request buffer is almost full
    rand uvm_reg_field data_ram_controller_req_buf_af;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static mem_ctrl_phy_status_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    mem_ctrl_phy_status_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(mem_ctrl_reg_pkg::mem_ctrl_phy_status_reg)

    // Constructor: new
    function new(string name = "mem_ctrl_phy_status");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        table_ram_master_phy_cal_success = uvm_reg_field::type_id::create("table_ram_master_phy_cal_success", , get_full_name());
        table_ram_slave_phy_cal_success = uvm_reg_field::type_id::create("table_ram_slave_phy_cal_success", , get_full_name());
        data_ram_master_phy_cal_success = uvm_reg_field::type_id::create("data_ram_master_phy_cal_success", , get_full_name());
        data_ram_slave_phy_cal_success = uvm_reg_field::type_id::create("data_ram_slave_phy_cal_success", , get_full_name());
        table_ram_master_phy_cal_fail = uvm_reg_field::type_id::create("table_ram_master_phy_cal_fail", , get_full_name());
        table_ram_slave_phy_cal_fail = uvm_reg_field::type_id::create("table_ram_slave_phy_cal_fail", , get_full_name());
        data_ram_master_phy_cal_fail = uvm_reg_field::type_id::create("data_ram_master_phy_cal_fail", , get_full_name());
        data_ram_slave_phy_cal_fail = uvm_reg_field::type_id::create("data_ram_slave_phy_cal_fail", , get_full_name());
        table_ram_1_controller_busy = uvm_reg_field::type_id::create("table_ram_1_controller_busy", , get_full_name());
        table_ram_1_controller_req_buf_af = uvm_reg_field::type_id::create("table_ram_1_controller_req_buf_af", , get_full_name());
        table_ram_2_controller_busy = uvm_reg_field::type_id::create("table_ram_2_controller_busy", , get_full_name());
        table_ram_2_controller_req_buf_af = uvm_reg_field::type_id::create("table_ram_2_controller_req_buf_af", , get_full_name());
        data_ram_controller_busy = uvm_reg_field::type_id::create("data_ram_controller_busy", , get_full_name());
        data_ram_controller_req_buf_af = uvm_reg_field::type_id::create("data_ram_controller_req_buf_af", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        table_ram_master_phy_cal_success.configure(this, 1, 0, "RO", 0, 'h0, 1, 1, 0);
        table_ram_slave_phy_cal_success.configure(this, 1, 1, "RO", 0, 'h0, 1, 1, 0);
        data_ram_master_phy_cal_success.configure(this, 1, 2, "RO", 0, 'h0, 1, 1, 0);
        data_ram_slave_phy_cal_success.configure(this, 1, 3, "RO", 0, 'h0, 1, 1, 0);
        table_ram_master_phy_cal_fail.configure(this, 1, 4, "RO", 0, 'h0, 1, 1, 0);
        table_ram_slave_phy_cal_fail.configure(this, 1, 5, "RO", 0, 'h0, 1, 1, 0);
        data_ram_master_phy_cal_fail.configure(this, 1, 6, "RO", 0, 'h0, 1, 1, 0);
        data_ram_slave_phy_cal_fail.configure(this, 1, 7, "RO", 0, 'h0, 1, 1, 0);
        table_ram_1_controller_busy.configure(this, 1, 16, "RO", 0, 'h0, 1, 1, 0);
        table_ram_1_controller_req_buf_af.configure(this, 1, 17, "RO", 0, 'h0, 1, 1, 0);
        table_ram_2_controller_busy.configure(this, 1, 20, "RO", 0, 'h0, 1, 1, 0);
        table_ram_2_controller_req_buf_af.configure(this, 1, 21, "RO", 0, 'h0, 1, 1, 0);
        data_ram_controller_busy.configure(this, 1, 24, "RO", 0, 'h0, 1, 1, 0);
        data_ram_controller_req_buf_af.configure(this, 1, 25, "RO", 0, 'h0, 1, 1, 0);
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
                cg = mem_ctrl_phy_status_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = mem_ctrl_phy_status_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, table_ram_master_phy_cal_success.get_name, table_ram_master_phy_cal_success.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, table_ram_slave_phy_cal_success.get_name, table_ram_slave_phy_cal_success.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, data_ram_master_phy_cal_success.get_name, data_ram_master_phy_cal_success.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, data_ram_slave_phy_cal_success.get_name, data_ram_slave_phy_cal_success.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, table_ram_master_phy_cal_fail.get_name, table_ram_master_phy_cal_fail.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, table_ram_slave_phy_cal_fail.get_name, table_ram_slave_phy_cal_fail.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, data_ram_master_phy_cal_fail.get_name, data_ram_master_phy_cal_fail.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, data_ram_slave_phy_cal_fail.get_name, data_ram_slave_phy_cal_fail.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, table_ram_1_controller_busy.get_name, table_ram_1_controller_busy.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, table_ram_1_controller_req_buf_af.get_name, table_ram_1_controller_req_buf_af.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, table_ram_2_controller_busy.get_name, table_ram_2_controller_busy.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, table_ram_2_controller_req_buf_af.get_name, table_ram_2_controller_req_buf_af.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, data_ram_controller_busy.get_name, data_ram_controller_busy.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, data_ram_controller_req_buf_af.get_name, data_ram_controller_req_buf_af.value);
        return s;
    endfunction

endclass


// Class: mem_ctrl_phy_status_reg_cover
// Register coverage object.
class mem_ctrl_phy_status_reg_cover extends uvm_object;

    static local mem_ctrl_phy_status_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    mem_ctrl_phy_status_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        table_ram_master_phy_cal_success_wr: coverpoint r.table_ram_master_phy_cal_success.value iff (!is_read);
        table_ram_master_phy_cal_success_rd: coverpoint r.table_ram_master_phy_cal_success.value iff  (is_read);
        table_ram_slave_phy_cal_success_wr: coverpoint r.table_ram_slave_phy_cal_success.value iff (!is_read);
        table_ram_slave_phy_cal_success_rd: coverpoint r.table_ram_slave_phy_cal_success.value iff  (is_read);
        data_ram_master_phy_cal_success_wr: coverpoint r.data_ram_master_phy_cal_success.value iff (!is_read);
        data_ram_master_phy_cal_success_rd: coverpoint r.data_ram_master_phy_cal_success.value iff  (is_read);
        data_ram_slave_phy_cal_success_wr: coverpoint r.data_ram_slave_phy_cal_success.value iff (!is_read);
        data_ram_slave_phy_cal_success_rd: coverpoint r.data_ram_slave_phy_cal_success.value iff  (is_read);
        table_ram_master_phy_cal_fail_wr: coverpoint r.table_ram_master_phy_cal_fail.value iff (!is_read);
        table_ram_master_phy_cal_fail_rd: coverpoint r.table_ram_master_phy_cal_fail.value iff  (is_read);
        table_ram_slave_phy_cal_fail_wr: coverpoint r.table_ram_slave_phy_cal_fail.value iff (!is_read);
        table_ram_slave_phy_cal_fail_rd: coverpoint r.table_ram_slave_phy_cal_fail.value iff  (is_read);
        data_ram_master_phy_cal_fail_wr: coverpoint r.data_ram_master_phy_cal_fail.value iff (!is_read);
        data_ram_master_phy_cal_fail_rd: coverpoint r.data_ram_master_phy_cal_fail.value iff  (is_read);
        data_ram_slave_phy_cal_fail_wr: coverpoint r.data_ram_slave_phy_cal_fail.value iff (!is_read);
        data_ram_slave_phy_cal_fail_rd: coverpoint r.data_ram_slave_phy_cal_fail.value iff  (is_read);
        table_ram_1_controller_busy_wr: coverpoint r.table_ram_1_controller_busy.value iff (!is_read);
        table_ram_1_controller_busy_rd: coverpoint r.table_ram_1_controller_busy.value iff  (is_read);
        table_ram_1_controller_req_buf_af_wr: coverpoint r.table_ram_1_controller_req_buf_af.value iff (!is_read);
        table_ram_1_controller_req_buf_af_rd: coverpoint r.table_ram_1_controller_req_buf_af.value iff  (is_read);
        table_ram_2_controller_busy_wr: coverpoint r.table_ram_2_controller_busy.value iff (!is_read);
        table_ram_2_controller_busy_rd: coverpoint r.table_ram_2_controller_busy.value iff  (is_read);
        table_ram_2_controller_req_buf_af_wr: coverpoint r.table_ram_2_controller_req_buf_af.value iff (!is_read);
        table_ram_2_controller_req_buf_af_rd: coverpoint r.table_ram_2_controller_req_buf_af.value iff  (is_read);
        data_ram_controller_busy_wr: coverpoint r.data_ram_controller_busy.value iff (!is_read);
        data_ram_controller_busy_rd: coverpoint r.data_ram_controller_busy.value iff  (is_read);
        data_ram_controller_req_buf_af_wr: coverpoint r.data_ram_controller_req_buf_af.value iff (!is_read);
        data_ram_controller_req_buf_af_rd: coverpoint r.data_ram_controller_req_buf_af.value iff  (is_read);
    endgroup

    `uvm_object_utils(mem_ctrl_reg_pkg::mem_ctrl_phy_status_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="mem_ctrl_phy_status_reg_cover");
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
    static function mem_ctrl_phy_status_reg_cover get();
        if (m_inst == null) begin
            m_inst = mem_ctrl_phy_status_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(mem_ctrl_phy_status_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class mem_ctrl_phy_ctrl_reg_cover;

// Class: mem_ctrl_phy_ctrl_reg
// Register mem_ctrl.phy_ctrl: Memory controler controls
class mem_ctrl_phy_ctrl_reg extends uvm_reg;

    // Variable: table_ram_phy_rst_n
    // reset table rams uniphys and mem ctrls
    rand uvm_reg_field table_ram_phy_rst_n;
    // Variable: data_ram_phy_rst_n
    // reset data ram uniphy and mem ctrl
    rand uvm_reg_field data_ram_phy_rst_n;
    // Variable: table_ram_1_test_rst_n
    // reset table ram 1 tester
    rand uvm_reg_field table_ram_1_test_rst_n;
    // Variable: table_ram_2_test_rst_n
    // reset table ram 2 tester
    rand uvm_reg_field table_ram_2_test_rst_n;
    // Variable: data_ram_test_rst_n
    // reset data ram tester
    rand uvm_reg_field data_ram_test_rst_n;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static mem_ctrl_phy_ctrl_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    mem_ctrl_phy_ctrl_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(mem_ctrl_reg_pkg::mem_ctrl_phy_ctrl_reg)

    // Constructor: new
    function new(string name = "mem_ctrl_phy_ctrl");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        table_ram_phy_rst_n = uvm_reg_field::type_id::create("table_ram_phy_rst_n", , get_full_name());
        data_ram_phy_rst_n = uvm_reg_field::type_id::create("data_ram_phy_rst_n", , get_full_name());
        table_ram_1_test_rst_n = uvm_reg_field::type_id::create("table_ram_1_test_rst_n", , get_full_name());
        table_ram_2_test_rst_n = uvm_reg_field::type_id::create("table_ram_2_test_rst_n", , get_full_name());
        data_ram_test_rst_n = uvm_reg_field::type_id::create("data_ram_test_rst_n", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        table_ram_phy_rst_n.configure(this, 1, 0, "RW", 0, 'h1, 1, 1, 0);
        data_ram_phy_rst_n.configure(this, 1, 1, "RW", 0, 'h1, 1, 1, 0);
        table_ram_1_test_rst_n.configure(this, 1, 8, "RW", 0, 'h0, 1, 1, 0);
        table_ram_2_test_rst_n.configure(this, 1, 9, "RW", 0, 'h0, 1, 1, 0);
        data_ram_test_rst_n.configure(this, 1, 10, "RW", 0, 'h0, 1, 1, 0);
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
                cg = mem_ctrl_phy_ctrl_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = mem_ctrl_phy_ctrl_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, table_ram_phy_rst_n.get_name, table_ram_phy_rst_n.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, data_ram_phy_rst_n.get_name, data_ram_phy_rst_n.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, table_ram_1_test_rst_n.get_name, table_ram_1_test_rst_n.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, table_ram_2_test_rst_n.get_name, table_ram_2_test_rst_n.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, data_ram_test_rst_n.get_name, data_ram_test_rst_n.value);
        return s;
    endfunction

endclass


// Class: mem_ctrl_phy_ctrl_reg_cover
// Register coverage object.
class mem_ctrl_phy_ctrl_reg_cover extends uvm_object;

    static local mem_ctrl_phy_ctrl_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    mem_ctrl_phy_ctrl_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        table_ram_phy_rst_n_wr: coverpoint r.table_ram_phy_rst_n.value iff (!is_read);
        table_ram_phy_rst_n_rd: coverpoint r.table_ram_phy_rst_n.value iff  (is_read);
        data_ram_phy_rst_n_wr: coverpoint r.data_ram_phy_rst_n.value iff (!is_read);
        data_ram_phy_rst_n_rd: coverpoint r.data_ram_phy_rst_n.value iff  (is_read);
        table_ram_1_test_rst_n_wr: coverpoint r.table_ram_1_test_rst_n.value iff (!is_read);
        table_ram_1_test_rst_n_rd: coverpoint r.table_ram_1_test_rst_n.value iff  (is_read);
        table_ram_2_test_rst_n_wr: coverpoint r.table_ram_2_test_rst_n.value iff (!is_read);
        table_ram_2_test_rst_n_rd: coverpoint r.table_ram_2_test_rst_n.value iff  (is_read);
        data_ram_test_rst_n_wr: coverpoint r.data_ram_test_rst_n.value iff (!is_read);
        data_ram_test_rst_n_rd: coverpoint r.data_ram_test_rst_n.value iff  (is_read);
    endgroup

    `uvm_object_utils(mem_ctrl_reg_pkg::mem_ctrl_phy_ctrl_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="mem_ctrl_phy_ctrl_reg_cover");
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
    static function mem_ctrl_phy_ctrl_reg_cover get();
        if (m_inst == null) begin
            m_inst = mem_ctrl_phy_ctrl_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(mem_ctrl_phy_ctrl_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class mem_ctrl_err_gen_reg_cover;

// Class: mem_ctrl_err_gen_reg
// Register mem_ctrl.err_gen: Error generator
class mem_ctrl_err_gen_reg extends uvm_reg;

    // Variable: table_ram_1_err_pulse_en
    // Table ram 1 error pulse enable
    rand uvm_reg_field table_ram_1_err_pulse_en;
    // Variable: table_ram_2_err_pulse_en
    // Table ram 2 error pulse enable
    rand uvm_reg_field table_ram_2_err_pulse_en;
    // Variable: data_ram_err_pulse_en
    // Data ram error pulse enable
    rand uvm_reg_field data_ram_err_pulse_en;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static mem_ctrl_err_gen_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    mem_ctrl_err_gen_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(mem_ctrl_reg_pkg::mem_ctrl_err_gen_reg)

    // Constructor: new
    function new(string name = "mem_ctrl_err_gen");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        table_ram_1_err_pulse_en = uvm_reg_field::type_id::create("table_ram_1_err_pulse_en", , get_full_name());
        table_ram_2_err_pulse_en = uvm_reg_field::type_id::create("table_ram_2_err_pulse_en", , get_full_name());
        data_ram_err_pulse_en = uvm_reg_field::type_id::create("data_ram_err_pulse_en", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        table_ram_1_err_pulse_en.configure(this, 1, 0, "RW", 0, 'h0, 1, 1, 0);
        table_ram_2_err_pulse_en.configure(this, 1, 1, "RW", 0, 'h0, 1, 1, 0);
        data_ram_err_pulse_en.configure(this, 1, 2, "RW", 0, 'h0, 1, 1, 0);
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
                cg = mem_ctrl_err_gen_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = mem_ctrl_err_gen_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, table_ram_1_err_pulse_en.get_name, table_ram_1_err_pulse_en.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, table_ram_2_err_pulse_en.get_name, table_ram_2_err_pulse_en.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, data_ram_err_pulse_en.get_name, data_ram_err_pulse_en.value);
        return s;
    endfunction

endclass


// Class: mem_ctrl_err_gen_reg_cover
// Register coverage object.
class mem_ctrl_err_gen_reg_cover extends uvm_object;

    static local mem_ctrl_err_gen_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    mem_ctrl_err_gen_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        table_ram_1_err_pulse_en_wr: coverpoint r.table_ram_1_err_pulse_en.value iff (!is_read);
        table_ram_1_err_pulse_en_rd: coverpoint r.table_ram_1_err_pulse_en.value iff  (is_read);
        table_ram_2_err_pulse_en_wr: coverpoint r.table_ram_2_err_pulse_en.value iff (!is_read);
        table_ram_2_err_pulse_en_rd: coverpoint r.table_ram_2_err_pulse_en.value iff  (is_read);
        data_ram_err_pulse_en_wr: coverpoint r.data_ram_err_pulse_en.value iff (!is_read);
        data_ram_err_pulse_en_rd: coverpoint r.data_ram_err_pulse_en.value iff  (is_read);
    endgroup

    `uvm_object_utils(mem_ctrl_reg_pkg::mem_ctrl_err_gen_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="mem_ctrl_err_gen_reg_cover");
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
    static function mem_ctrl_err_gen_reg_cover get();
        if (m_inst == null) begin
            m_inst = mem_ctrl_err_gen_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(mem_ctrl_err_gen_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class mem_ctrl_tab_mem_1_bist_stat_reg_cover;

// Class: mem_ctrl_tab_mem_1_bist_stat_reg
// Register mem_ctrl.tab_mem_1_bist_stat: Table memory 1 (U61) BIST statistics
class mem_ctrl_tab_mem_1_bist_stat_reg extends uvm_reg;

    // Variable: err_count
    // Error count
    rand uvm_reg_field err_count;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static mem_ctrl_tab_mem_1_bist_stat_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    mem_ctrl_tab_mem_1_bist_stat_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(mem_ctrl_reg_pkg::mem_ctrl_tab_mem_1_bist_stat_reg)

    // Constructor: new
    function new(string name = "mem_ctrl_tab_mem_1_bist_stat");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        err_count = uvm_reg_field::type_id::create("err_count", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        err_count.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = mem_ctrl_tab_mem_1_bist_stat_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = mem_ctrl_tab_mem_1_bist_stat_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, err_count.get_name, err_count.value);
        return s;
    endfunction

endclass


// Class: mem_ctrl_tab_mem_1_bist_stat_reg_cover
// Register coverage object.
class mem_ctrl_tab_mem_1_bist_stat_reg_cover extends uvm_object;

    static local mem_ctrl_tab_mem_1_bist_stat_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    mem_ctrl_tab_mem_1_bist_stat_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        err_count_wr: coverpoint r.err_count.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        err_count_rd: coverpoint r.err_count.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(mem_ctrl_reg_pkg::mem_ctrl_tab_mem_1_bist_stat_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="mem_ctrl_tab_mem_1_bist_stat_reg_cover");
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
    static function mem_ctrl_tab_mem_1_bist_stat_reg_cover get();
        if (m_inst == null) begin
            m_inst = mem_ctrl_tab_mem_1_bist_stat_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(mem_ctrl_tab_mem_1_bist_stat_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class mem_ctrl_tab_mem_2_bist_stat_reg_cover;

// Class: mem_ctrl_tab_mem_2_bist_stat_reg
// Register mem_ctrl.tab_mem_2_bist_stat: Table memory 2 (U45) BIST statistics
class mem_ctrl_tab_mem_2_bist_stat_reg extends uvm_reg;

    // Variable: err_count
    // Error count
    rand uvm_reg_field err_count;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static mem_ctrl_tab_mem_2_bist_stat_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    mem_ctrl_tab_mem_2_bist_stat_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(mem_ctrl_reg_pkg::mem_ctrl_tab_mem_2_bist_stat_reg)

    // Constructor: new
    function new(string name = "mem_ctrl_tab_mem_2_bist_stat");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        err_count = uvm_reg_field::type_id::create("err_count", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        err_count.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = mem_ctrl_tab_mem_2_bist_stat_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = mem_ctrl_tab_mem_2_bist_stat_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, err_count.get_name, err_count.value);
        return s;
    endfunction

endclass


// Class: mem_ctrl_tab_mem_2_bist_stat_reg_cover
// Register coverage object.
class mem_ctrl_tab_mem_2_bist_stat_reg_cover extends uvm_object;

    static local mem_ctrl_tab_mem_2_bist_stat_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    mem_ctrl_tab_mem_2_bist_stat_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        err_count_wr: coverpoint r.err_count.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        err_count_rd: coverpoint r.err_count.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(mem_ctrl_reg_pkg::mem_ctrl_tab_mem_2_bist_stat_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="mem_ctrl_tab_mem_2_bist_stat_reg_cover");
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
    static function mem_ctrl_tab_mem_2_bist_stat_reg_cover get();
        if (m_inst == null) begin
            m_inst = mem_ctrl_tab_mem_2_bist_stat_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(mem_ctrl_tab_mem_2_bist_stat_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class mem_ctrl_dat_mem_l_bist_stat_reg_cover;

// Class: mem_ctrl_dat_mem_l_bist_stat_reg
// Register mem_ctrl.dat_mem_l_bist_stat: Data memory Low (U49) BIST statistics
class mem_ctrl_dat_mem_l_bist_stat_reg extends uvm_reg;

    // Variable: err_count
    // Error count
    rand uvm_reg_field err_count;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static mem_ctrl_dat_mem_l_bist_stat_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    mem_ctrl_dat_mem_l_bist_stat_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(mem_ctrl_reg_pkg::mem_ctrl_dat_mem_l_bist_stat_reg)

    // Constructor: new
    function new(string name = "mem_ctrl_dat_mem_l_bist_stat");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        err_count = uvm_reg_field::type_id::create("err_count", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        err_count.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = mem_ctrl_dat_mem_l_bist_stat_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = mem_ctrl_dat_mem_l_bist_stat_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, err_count.get_name, err_count.value);
        return s;
    endfunction

endclass


// Class: mem_ctrl_dat_mem_l_bist_stat_reg_cover
// Register coverage object.
class mem_ctrl_dat_mem_l_bist_stat_reg_cover extends uvm_object;

    static local mem_ctrl_dat_mem_l_bist_stat_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    mem_ctrl_dat_mem_l_bist_stat_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        err_count_wr: coverpoint r.err_count.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        err_count_rd: coverpoint r.err_count.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(mem_ctrl_reg_pkg::mem_ctrl_dat_mem_l_bist_stat_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="mem_ctrl_dat_mem_l_bist_stat_reg_cover");
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
    static function mem_ctrl_dat_mem_l_bist_stat_reg_cover get();
        if (m_inst == null) begin
            m_inst = mem_ctrl_dat_mem_l_bist_stat_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(mem_ctrl_dat_mem_l_bist_stat_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class mem_ctrl_dat_mem_h_bist_stat_reg_cover;

// Class: mem_ctrl_dat_mem_h_bist_stat_reg
// Register mem_ctrl.dat_mem_h_bist_stat: Data memory High (U65) BIST statistics
class mem_ctrl_dat_mem_h_bist_stat_reg extends uvm_reg;

    // Variable: err_count
    // Error count
    rand uvm_reg_field err_count;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static mem_ctrl_dat_mem_h_bist_stat_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    mem_ctrl_dat_mem_h_bist_stat_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(mem_ctrl_reg_pkg::mem_ctrl_dat_mem_h_bist_stat_reg)

    // Constructor: new
    function new(string name = "mem_ctrl_dat_mem_h_bist_stat");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        err_count = uvm_reg_field::type_id::create("err_count", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        err_count.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = mem_ctrl_dat_mem_h_bist_stat_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = mem_ctrl_dat_mem_h_bist_stat_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, err_count.get_name, err_count.value);
        return s;
    endfunction

endclass


// Class: mem_ctrl_dat_mem_h_bist_stat_reg_cover
// Register coverage object.
class mem_ctrl_dat_mem_h_bist_stat_reg_cover extends uvm_object;

    static local mem_ctrl_dat_mem_h_bist_stat_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    mem_ctrl_dat_mem_h_bist_stat_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        err_count_wr: coverpoint r.err_count.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        err_count_rd: coverpoint r.err_count.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(mem_ctrl_reg_pkg::mem_ctrl_dat_mem_h_bist_stat_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="mem_ctrl_dat_mem_h_bist_stat_reg_cover");
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
    static function mem_ctrl_dat_mem_h_bist_stat_reg_cover get();
        if (m_inst == null) begin
            m_inst = mem_ctrl_dat_mem_h_bist_stat_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(mem_ctrl_dat_mem_h_bist_stat_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass





// Class: mem_ctrl_reg_block
// Register Block .mem_ctrl: 
class mem_ctrl_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand mem_ctrl_mem_test_ctrl_reg mem_test_ctrl;
    rand mem_ctrl_mem_test_ctrl_2_reg mem_test_ctrl_2;
    rand mem_ctrl_mem_test_status_reg mem_test_status;
    rand mem_ctrl_phy_status_reg phy_status;
    rand mem_ctrl_phy_ctrl_reg phy_ctrl;
    rand mem_ctrl_err_gen_reg err_gen;
    rand mem_ctrl_tab_mem_1_bist_stat_reg tab_mem_1_bist_stat;
    rand mem_ctrl_tab_mem_2_bist_stat_reg tab_mem_2_bist_stat;
    rand mem_ctrl_dat_mem_l_bist_stat_reg dat_mem_l_bist_stat;
    rand mem_ctrl_dat_mem_h_bist_stat_reg dat_mem_h_bist_stat;

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(mem_ctrl_reg_pkg::mem_ctrl_reg_block)

    // Constructor: new
    function new(string name = "mem_ctrl_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})


        mem_test_ctrl = mem_ctrl_mem_test_ctrl_reg::type_id::create("mem_test_ctrl", , get_full_name());
        mem_test_ctrl_2 = mem_ctrl_mem_test_ctrl_2_reg::type_id::create("mem_test_ctrl_2", , get_full_name());
        mem_test_status = mem_ctrl_mem_test_status_reg::type_id::create("mem_test_status", , get_full_name());
        phy_status = mem_ctrl_phy_status_reg::type_id::create("phy_status", , get_full_name());
        phy_ctrl = mem_ctrl_phy_ctrl_reg::type_id::create("phy_ctrl", , get_full_name());
        err_gen = mem_ctrl_err_gen_reg::type_id::create("err_gen", , get_full_name());
        tab_mem_1_bist_stat = mem_ctrl_tab_mem_1_bist_stat_reg::type_id::create("tab_mem_1_bist_stat", , get_full_name());
        tab_mem_2_bist_stat = mem_ctrl_tab_mem_2_bist_stat_reg::type_id::create("tab_mem_2_bist_stat", , get_full_name());
        dat_mem_l_bist_stat = mem_ctrl_dat_mem_l_bist_stat_reg::type_id::create("dat_mem_l_bist_stat", , get_full_name());
        dat_mem_h_bist_stat = mem_ctrl_dat_mem_h_bist_stat_reg::type_id::create("dat_mem_h_bist_stat", , get_full_name());

        mem_test_ctrl.configure(this);
        mem_test_ctrl_2.configure(this);
        mem_test_status.configure(this);
        phy_status.configure(this);
        phy_ctrl.configure(this);
        err_gen.configure(this);
        tab_mem_1_bist_stat.configure(this);
        tab_mem_2_bist_stat.configure(this);
        dat_mem_l_bist_stat.configure(this);
        dat_mem_h_bist_stat.configure(this);

        mem_test_ctrl.build();
        mem_test_ctrl_2.build();
        mem_test_status.build();
        phy_status.build();
        phy_ctrl.build();
        err_gen.build();
        tab_mem_1_bist_stat.build();
        tab_mem_2_bist_stat.build();
        dat_mem_l_bist_stat.build();
        dat_mem_h_bist_stat.build();

        // define default map
        default_map = create_map("mem_ctrl_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        this.default_map.add_reg(mem_test_ctrl, 'h0, "RW");
        this.default_map.add_reg(mem_test_ctrl_2, 'h1, "RW");
        this.default_map.add_reg(mem_test_status, 'h2, "RO");
        this.default_map.add_reg(phy_status, 'h3, "RO");
        this.default_map.add_reg(phy_ctrl, 'h4, "RW");
        this.default_map.add_reg(err_gen, 'h5, "RW");
        this.default_map.add_reg(tab_mem_1_bist_stat, 'h6, "RO");
        this.default_map.add_reg(tab_mem_2_bist_stat, 'h7, "RO");
        this.default_map.add_reg(dat_mem_l_bist_stat, 'h8, "RO");
        this.default_map.add_reg(dat_mem_h_bist_stat, 'h9, "RO");

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
        mem_test_ctrl.enable_coverage(is_on, this.cg_per_instance);
        mem_test_ctrl_2.enable_coverage(is_on, this.cg_per_instance);
        mem_test_status.enable_coverage(is_on, this.cg_per_instance);
        phy_status.enable_coverage(is_on, this.cg_per_instance);
        phy_ctrl.enable_coverage(is_on, this.cg_per_instance);
        err_gen.enable_coverage(is_on, this.cg_per_instance);
        tab_mem_1_bist_stat.enable_coverage(is_on, this.cg_per_instance);
        tab_mem_2_bist_stat.enable_coverage(is_on, this.cg_per_instance);
        dat_mem_l_bist_stat.enable_coverage(is_on, this.cg_per_instance);
        dat_mem_h_bist_stat.enable_coverage(is_on, this.cg_per_instance);
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