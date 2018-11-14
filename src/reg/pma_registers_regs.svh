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
// Register definitions for pma_registers register block.
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
// Group: pma_registers
//---------------------------------------------------------

package pma_registers_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;

typedef class pma_registers_pma_tx_pll_locked_reg_cover;

// Class: pma_registers_pma_tx_pll_locked_reg
// Register pma_registers.pma_tx_pll_locked: 
class pma_registers_pma_tx_pll_locked_reg extends uvm_reg;

    // Variable: pma_tx_pll_is_locked
    // Indicates that the TX PLL is locked to the input reference clock
    rand uvm_reg_field pma_tx_pll_is_locked;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static pma_registers_pma_tx_pll_locked_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    pma_registers_pma_tx_pll_locked_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pma_registers_reg_pkg::pma_registers_pma_tx_pll_locked_reg)

    // Constructor: new
    function new(string name = "pma_registers_pma_tx_pll_locked");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        pma_tx_pll_is_locked = uvm_reg_field::type_id::create("pma_tx_pll_is_locked", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        pma_tx_pll_is_locked.configure(this, 1, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = pma_registers_pma_tx_pll_locked_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = pma_registers_pma_tx_pll_locked_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, pma_tx_pll_is_locked.get_name, pma_tx_pll_is_locked.value);
        return s;
    endfunction

endclass


// Class: pma_registers_pma_tx_pll_locked_reg_cover
// Register coverage object.
class pma_registers_pma_tx_pll_locked_reg_cover extends uvm_object;

    static local pma_registers_pma_tx_pll_locked_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    pma_registers_pma_tx_pll_locked_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        pma_tx_pll_is_locked_wr: coverpoint r.pma_tx_pll_is_locked.value iff (!is_read);
        pma_tx_pll_is_locked_rd: coverpoint r.pma_tx_pll_is_locked.value iff  (is_read);
    endgroup

    `uvm_object_utils(pma_registers_reg_pkg::pma_registers_pma_tx_pll_locked_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="pma_registers_pma_tx_pll_locked_reg_cover");
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
    static function pma_registers_pma_tx_pll_locked_reg_cover get();
        if (m_inst == null) begin
            m_inst = pma_registers_pma_tx_pll_locked_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(pma_registers_pma_tx_pll_locked_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class pma_registers_pma_reset_reg_cover;

// Class: pma_registers_pma_reset_reg
// Register pma_registers.pma_reset: 
class pma_registers_pma_reset_reg extends uvm_reg;

    // Variable: reset_tx_digital
    // Writing a 1 causes the internal TX digital reset signal to be asserted. You must write a 0 to clear the reset condition
    rand uvm_reg_field reset_tx_digital;
    // Variable: reset_rx_analog
    // Writing a 1 causes the internal RX analog reset signal to be asserted. You must write a 0 to clear the reset condition.
    rand uvm_reg_field reset_rx_analog;
    // Variable: reset_rx_digital
    // Writing a 1 causes the internal RX digital reset signal to be asserted. You must write a 0 to clear the reset condition.
    rand uvm_reg_field reset_rx_digital;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static pma_registers_pma_reset_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    pma_registers_pma_reset_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pma_registers_reg_pkg::pma_registers_pma_reset_reg)

    // Constructor: new
    function new(string name = "pma_registers_pma_reset");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        reset_tx_digital = uvm_reg_field::type_id::create("reset_tx_digital", , get_full_name());
        reset_rx_analog = uvm_reg_field::type_id::create("reset_rx_analog", , get_full_name());
        reset_rx_digital = uvm_reg_field::type_id::create("reset_rx_digital", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        reset_tx_digital.configure(this, 1, 1, "RW", 0, 'h0, 1, 1, 0);
        reset_rx_analog.configure(this, 1, 2, "RW", 0, 'h0, 1, 1, 0);
        reset_rx_digital.configure(this, 1, 3, "RW", 0, 'h0, 1, 1, 0);
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
                cg = pma_registers_pma_reset_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = pma_registers_pma_reset_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, reset_tx_digital.get_name, reset_tx_digital.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, reset_rx_analog.get_name, reset_rx_analog.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, reset_rx_digital.get_name, reset_rx_digital.value);
        return s;
    endfunction

endclass


// Class: pma_registers_pma_reset_reg_cover
// Register coverage object.
class pma_registers_pma_reset_reg_cover extends uvm_object;

    static local pma_registers_pma_reset_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    pma_registers_pma_reset_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        reset_tx_digital_wr: coverpoint r.reset_tx_digital.value iff (!is_read);
        reset_tx_digital_rd: coverpoint r.reset_tx_digital.value iff  (is_read);
        reset_rx_analog_wr: coverpoint r.reset_rx_analog.value iff (!is_read);
        reset_rx_analog_rd: coverpoint r.reset_rx_analog.value iff  (is_read);
        reset_rx_digital_wr: coverpoint r.reset_rx_digital.value iff (!is_read);
        reset_rx_digital_rd: coverpoint r.reset_rx_digital.value iff  (is_read);
    endgroup

    `uvm_object_utils(pma_registers_reg_pkg::pma_registers_pma_reset_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="pma_registers_pma_reset_reg_cover");
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
    static function pma_registers_pma_reset_reg_cover get();
        if (m_inst == null) begin
            m_inst = pma_registers_pma_reset_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(pma_registers_pma_reset_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class pma_registers_phy_serial_loopback_reg_cover;

// Class: pma_registers_phy_serial_loopback_reg
// Register pma_registers.phy_serial_loopback: 
class pma_registers_phy_serial_loopback_reg extends uvm_reg;

    // Variable: phy_serial_loopback
    // Writing a 1 puts the channel in serial loopback mode.
    rand uvm_reg_field phy_serial_loopback;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static pma_registers_phy_serial_loopback_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    pma_registers_phy_serial_loopback_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pma_registers_reg_pkg::pma_registers_phy_serial_loopback_reg)

    // Constructor: new
    function new(string name = "pma_registers_phy_serial_loopback");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        phy_serial_loopback = uvm_reg_field::type_id::create("phy_serial_loopback", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        phy_serial_loopback.configure(this, 1, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = pma_registers_phy_serial_loopback_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = pma_registers_phy_serial_loopback_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, phy_serial_loopback.get_name, phy_serial_loopback.value);
        return s;
    endfunction

endclass


// Class: pma_registers_phy_serial_loopback_reg_cover
// Register coverage object.
class pma_registers_phy_serial_loopback_reg_cover extends uvm_object;

    static local pma_registers_phy_serial_loopback_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    pma_registers_phy_serial_loopback_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        phy_serial_loopback_wr: coverpoint r.phy_serial_loopback.value iff (!is_read);
        phy_serial_loopback_rd: coverpoint r.phy_serial_loopback.value iff  (is_read);
    endgroup

    `uvm_object_utils(pma_registers_reg_pkg::pma_registers_phy_serial_loopback_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="pma_registers_phy_serial_loopback_reg_cover");
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
    static function pma_registers_phy_serial_loopback_reg_cover get();
        if (m_inst == null) begin
            m_inst = pma_registers_phy_serial_loopback_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(pma_registers_phy_serial_loopback_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class pma_registers_pma_rx_set_locktodata_reg_cover;

// Class: pma_registers_pma_rx_set_locktodata_reg
// Register pma_registers.pma_rx_set_locktodata: 
class pma_registers_pma_rx_set_locktodata_reg extends uvm_reg;

    // Variable: pma_rx_set_locktodata
    // When set, programs the RX CDR PLL to lock to the incoming data.
    rand uvm_reg_field pma_rx_set_locktodata;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static pma_registers_pma_rx_set_locktodata_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    pma_registers_pma_rx_set_locktodata_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pma_registers_reg_pkg::pma_registers_pma_rx_set_locktodata_reg)

    // Constructor: new
    function new(string name = "pma_registers_pma_rx_set_locktodata");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        pma_rx_set_locktodata = uvm_reg_field::type_id::create("pma_rx_set_locktodata", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        pma_rx_set_locktodata.configure(this, 1, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = pma_registers_pma_rx_set_locktodata_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = pma_registers_pma_rx_set_locktodata_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, pma_rx_set_locktodata.get_name, pma_rx_set_locktodata.value);
        return s;
    endfunction

endclass


// Class: pma_registers_pma_rx_set_locktodata_reg_cover
// Register coverage object.
class pma_registers_pma_rx_set_locktodata_reg_cover extends uvm_object;

    static local pma_registers_pma_rx_set_locktodata_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    pma_registers_pma_rx_set_locktodata_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        pma_rx_set_locktodata_wr: coverpoint r.pma_rx_set_locktodata.value iff (!is_read);
        pma_rx_set_locktodata_rd: coverpoint r.pma_rx_set_locktodata.value iff  (is_read);
    endgroup

    `uvm_object_utils(pma_registers_reg_pkg::pma_registers_pma_rx_set_locktodata_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="pma_registers_pma_rx_set_locktodata_reg_cover");
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
    static function pma_registers_pma_rx_set_locktodata_reg_cover get();
        if (m_inst == null) begin
            m_inst = pma_registers_pma_rx_set_locktodata_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(pma_registers_pma_rx_set_locktodata_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class pma_registers_pma_rx_set_locktoref_reg_cover;

// Class: pma_registers_pma_rx_set_locktoref_reg
// Register pma_registers.pma_rx_set_locktoref: 
class pma_registers_pma_rx_set_locktoref_reg extends uvm_reg;

    // Variable: pma_rx_set_locktoref
    // When set, programs the RX clock data recovery (CDR) PLL to lock to the reference clock.
    rand uvm_reg_field pma_rx_set_locktoref;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static pma_registers_pma_rx_set_locktoref_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    pma_registers_pma_rx_set_locktoref_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pma_registers_reg_pkg::pma_registers_pma_rx_set_locktoref_reg)

    // Constructor: new
    function new(string name = "pma_registers_pma_rx_set_locktoref");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        pma_rx_set_locktoref = uvm_reg_field::type_id::create("pma_rx_set_locktoref", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        pma_rx_set_locktoref.configure(this, 1, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = pma_registers_pma_rx_set_locktoref_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = pma_registers_pma_rx_set_locktoref_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, pma_rx_set_locktoref.get_name, pma_rx_set_locktoref.value);
        return s;
    endfunction

endclass


// Class: pma_registers_pma_rx_set_locktoref_reg_cover
// Register coverage object.
class pma_registers_pma_rx_set_locktoref_reg_cover extends uvm_object;

    static local pma_registers_pma_rx_set_locktoref_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    pma_registers_pma_rx_set_locktoref_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        pma_rx_set_locktoref_wr: coverpoint r.pma_rx_set_locktoref.value iff (!is_read);
        pma_rx_set_locktoref_rd: coverpoint r.pma_rx_set_locktoref.value iff  (is_read);
    endgroup

    `uvm_object_utils(pma_registers_reg_pkg::pma_registers_pma_rx_set_locktoref_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="pma_registers_pma_rx_set_locktoref_reg_cover");
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
    static function pma_registers_pma_rx_set_locktoref_reg_cover get();
        if (m_inst == null) begin
            m_inst = pma_registers_pma_rx_set_locktoref_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(pma_registers_pma_rx_set_locktoref_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class pma_registers_pma_rx_is_lockedtodata_reg_cover;

// Class: pma_registers_pma_rx_is_lockedtodata_reg
// Register pma_registers.pma_rx_is_lockedtodata: 
class pma_registers_pma_rx_is_lockedtodata_reg extends uvm_reg;

    // Variable: pma_rx_is_lockedtodata
    // When asserted, indicates that the RX CDR PLL is locked to the RX data, and that the RX CDR has changed from LTR to LTD mode.
    rand uvm_reg_field pma_rx_is_lockedtodata;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static pma_registers_pma_rx_is_lockedtodata_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    pma_registers_pma_rx_is_lockedtodata_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pma_registers_reg_pkg::pma_registers_pma_rx_is_lockedtodata_reg)

    // Constructor: new
    function new(string name = "pma_registers_pma_rx_is_lockedtodata");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        pma_rx_is_lockedtodata = uvm_reg_field::type_id::create("pma_rx_is_lockedtodata", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        pma_rx_is_lockedtodata.configure(this, 1, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = pma_registers_pma_rx_is_lockedtodata_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = pma_registers_pma_rx_is_lockedtodata_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, pma_rx_is_lockedtodata.get_name, pma_rx_is_lockedtodata.value);
        return s;
    endfunction

endclass


// Class: pma_registers_pma_rx_is_lockedtodata_reg_cover
// Register coverage object.
class pma_registers_pma_rx_is_lockedtodata_reg_cover extends uvm_object;

    static local pma_registers_pma_rx_is_lockedtodata_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    pma_registers_pma_rx_is_lockedtodata_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        pma_rx_is_lockedtodata_wr: coverpoint r.pma_rx_is_lockedtodata.value iff (!is_read);
        pma_rx_is_lockedtodata_rd: coverpoint r.pma_rx_is_lockedtodata.value iff  (is_read);
    endgroup

    `uvm_object_utils(pma_registers_reg_pkg::pma_registers_pma_rx_is_lockedtodata_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="pma_registers_pma_rx_is_lockedtodata_reg_cover");
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
    static function pma_registers_pma_rx_is_lockedtodata_reg_cover get();
        if (m_inst == null) begin
            m_inst = pma_registers_pma_rx_is_lockedtodata_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(pma_registers_pma_rx_is_lockedtodata_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class pma_registers_pma_is_lockedtoref_reg_cover;

// Class: pma_registers_pma_is_lockedtoref_reg
// Register pma_registers.pma_is_lockedtoref: 
class pma_registers_pma_is_lockedtoref_reg extends uvm_reg;

    // Variable: pma_is_lockedtoref
    // When asserted, indicates that the RX CDR PLL is locked to the reference clock.
    rand uvm_reg_field pma_is_lockedtoref;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static pma_registers_pma_is_lockedtoref_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    pma_registers_pma_is_lockedtoref_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pma_registers_reg_pkg::pma_registers_pma_is_lockedtoref_reg)

    // Constructor: new
    function new(string name = "pma_registers_pma_is_lockedtoref");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        pma_is_lockedtoref = uvm_reg_field::type_id::create("pma_is_lockedtoref", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        pma_is_lockedtoref.configure(this, 1, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = pma_registers_pma_is_lockedtoref_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = pma_registers_pma_is_lockedtoref_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, pma_is_lockedtoref.get_name, pma_is_lockedtoref.value);
        return s;
    endfunction

endclass


// Class: pma_registers_pma_is_lockedtoref_reg_cover
// Register coverage object.
class pma_registers_pma_is_lockedtoref_reg_cover extends uvm_object;

    static local pma_registers_pma_is_lockedtoref_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    pma_registers_pma_is_lockedtoref_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        pma_is_lockedtoref_wr: coverpoint r.pma_is_lockedtoref.value iff (!is_read);
        pma_is_lockedtoref_rd: coverpoint r.pma_is_lockedtoref.value iff  (is_read);
    endgroup

    `uvm_object_utils(pma_registers_reg_pkg::pma_registers_pma_is_lockedtoref_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="pma_registers_pma_is_lockedtoref_reg_cover");
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
    static function pma_registers_pma_is_lockedtoref_reg_cover get();
        if (m_inst == null) begin
            m_inst = pma_registers_pma_is_lockedtoref_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(pma_registers_pma_is_lockedtoref_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class pma_registers_serial_if_ctrl_reg_cover;

// Class: pma_registers_serial_if_ctrl_reg
// Register pma_registers.serial_if_ctrl: 
class pma_registers_serial_if_ctrl_reg extends uvm_reg;

    // Variable: tx_invpolarity
    // When set to 1, the TX interface inverts the polarity of the TX data. Inverted TX data is output from the 8B/10B encoder.
    rand uvm_reg_field tx_invpolarity;
    // Variable: rx_invpolarity
    // When set to 1, the RX channels inverts the polarity of the received data. Inverted RX data is input to the 8B/10B decoder.
    rand uvm_reg_field rx_invpolarity;
    // Variable: rx_bitreversal_enable
    // When set to 1, enables bit reversal on the RX interface. The RX data is input to the word aligner.
    rand uvm_reg_field rx_bitreversal_enable;
    // Variable: rx_bytereversal_enable
    // When set, enables byte reversal on the RX interface. The RX data is input to the byte deserializer.
    rand uvm_reg_field rx_bytereversal_enable;
    // Variable: force_electrical_idle
    // When set to 1, forces the TX outputs to electrical idle.
    rand uvm_reg_field force_electrical_idle;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static pma_registers_serial_if_ctrl_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    pma_registers_serial_if_ctrl_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pma_registers_reg_pkg::pma_registers_serial_if_ctrl_reg)

    // Constructor: new
    function new(string name = "pma_registers_serial_if_ctrl");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        tx_invpolarity = uvm_reg_field::type_id::create("tx_invpolarity", , get_full_name());
        rx_invpolarity = uvm_reg_field::type_id::create("rx_invpolarity", , get_full_name());
        rx_bitreversal_enable = uvm_reg_field::type_id::create("rx_bitreversal_enable", , get_full_name());
        rx_bytereversal_enable = uvm_reg_field::type_id::create("rx_bytereversal_enable", , get_full_name());
        force_electrical_idle = uvm_reg_field::type_id::create("force_electrical_idle", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        tx_invpolarity.configure(this, 1, 0, "RW", 0, 'h0, 1, 1, 0);
        rx_invpolarity.configure(this, 1, 1, "RW", 0, 'h0, 1, 1, 0);
        rx_bitreversal_enable.configure(this, 1, 2, "RW", 0, 'h0, 1, 1, 0);
        rx_bytereversal_enable.configure(this, 1, 3, "RW", 0, 'h0, 1, 1, 0);
        force_electrical_idle.configure(this, 1, 4, "RW", 0, 'h0, 1, 1, 0);
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
                cg = pma_registers_serial_if_ctrl_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = pma_registers_serial_if_ctrl_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, tx_invpolarity.get_name, tx_invpolarity.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_invpolarity.get_name, rx_invpolarity.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_bitreversal_enable.get_name, rx_bitreversal_enable.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_bytereversal_enable.get_name, rx_bytereversal_enable.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, force_electrical_idle.get_name, force_electrical_idle.value);
        return s;
    endfunction

endclass


// Class: pma_registers_serial_if_ctrl_reg_cover
// Register coverage object.
class pma_registers_serial_if_ctrl_reg_cover extends uvm_object;

    static local pma_registers_serial_if_ctrl_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    pma_registers_serial_if_ctrl_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        tx_invpolarity_wr: coverpoint r.tx_invpolarity.value iff (!is_read);
        tx_invpolarity_rd: coverpoint r.tx_invpolarity.value iff  (is_read);
        rx_invpolarity_wr: coverpoint r.rx_invpolarity.value iff (!is_read);
        rx_invpolarity_rd: coverpoint r.rx_invpolarity.value iff  (is_read);
        rx_bitreversal_enable_wr: coverpoint r.rx_bitreversal_enable.value iff (!is_read);
        rx_bitreversal_enable_rd: coverpoint r.rx_bitreversal_enable.value iff  (is_read);
        rx_bytereversal_enable_wr: coverpoint r.rx_bytereversal_enable.value iff (!is_read);
        rx_bytereversal_enable_rd: coverpoint r.rx_bytereversal_enable.value iff  (is_read);
        force_electrical_idle_wr: coverpoint r.force_electrical_idle.value iff (!is_read);
        force_electrical_idle_rd: coverpoint r.force_electrical_idle.value iff  (is_read);
    endgroup

    `uvm_object_utils(pma_registers_reg_pkg::pma_registers_serial_if_ctrl_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="pma_registers_serial_if_ctrl_reg_cover");
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
    static function pma_registers_serial_if_ctrl_reg_cover get();
        if (m_inst == null) begin
            m_inst = pma_registers_serial_if_ctrl_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(pma_registers_serial_if_ctrl_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class pma_registers_serial_if_status_reg_cover;

// Class: pma_registers_serial_if_status_reg
// Register pma_registers.serial_if_status: 
class pma_registers_serial_if_status_reg extends uvm_reg;

    // Variable: rx_syncstatus
    // When set to 1, indicates that the word aligner is synchronized to incoming data.
    rand uvm_reg_field rx_syncstatus;
    // Variable: rx_patterndetect
    // When set to 1, indicates the 1G word aligner has detected a comma.
    rand uvm_reg_field rx_patterndetect;
    // Variable: rx_rlv
    // When set to 1, indicates a run length violation.
    rand uvm_reg_field rx_rlv;
    // Variable: rx_rmfifodatainserted
    // When set to 1, indicates the rate match FIFO inserted code group.
    rand uvm_reg_field rx_rmfifodatainserted;
    // Variable: rx_rmfifodatadeleted
    // When set to 1, indicates that rate match FIFO deleted code group.
    rand uvm_reg_field rx_rmfifodatadeleted;
    // Variable: rx_disperr
    // When set to 1, indicates an RX 8B/10B disparity error.
    rand uvm_reg_field rx_disperr;
    // Variable: rx_errdetect
    // When set to 1, indicates an RX 8B/10B error detected.
    rand uvm_reg_field rx_errdetect;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static pma_registers_serial_if_status_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    pma_registers_serial_if_status_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pma_registers_reg_pkg::pma_registers_serial_if_status_reg)

    // Constructor: new
    function new(string name = "pma_registers_serial_if_status");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        rx_syncstatus = uvm_reg_field::type_id::create("rx_syncstatus", , get_full_name());
        rx_patterndetect = uvm_reg_field::type_id::create("rx_patterndetect", , get_full_name());
        rx_rlv = uvm_reg_field::type_id::create("rx_rlv", , get_full_name());
        rx_rmfifodatainserted = uvm_reg_field::type_id::create("rx_rmfifodatainserted", , get_full_name());
        rx_rmfifodatadeleted = uvm_reg_field::type_id::create("rx_rmfifodatadeleted", , get_full_name());
        rx_disperr = uvm_reg_field::type_id::create("rx_disperr", , get_full_name());
        rx_errdetect = uvm_reg_field::type_id::create("rx_errdetect", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        rx_syncstatus.configure(this, 1, 0, "RO", 0, 'h0, 1, 1, 0);
        rx_patterndetect.configure(this, 1, 1, "RO", 0, 'h0, 1, 1, 0);
        rx_rlv.configure(this, 1, 2, "RO", 0, 'h0, 1, 1, 0);
        rx_rmfifodatainserted.configure(this, 1, 3, "RO", 0, 'h0, 1, 1, 0);
        rx_rmfifodatadeleted.configure(this, 1, 4, "RO", 0, 'h0, 1, 1, 0);
        rx_disperr.configure(this, 1, 5, "RO", 0, 'h0, 1, 1, 0);
        rx_errdetect.configure(this, 1, 6, "RO", 0, 'h0, 1, 1, 0);
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
                cg = pma_registers_serial_if_status_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = pma_registers_serial_if_status_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_syncstatus.get_name, rx_syncstatus.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_patterndetect.get_name, rx_patterndetect.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_rlv.get_name, rx_rlv.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_rmfifodatainserted.get_name, rx_rmfifodatainserted.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_rmfifodatadeleted.get_name, rx_rmfifodatadeleted.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_disperr.get_name, rx_disperr.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, rx_errdetect.get_name, rx_errdetect.value);
        return s;
    endfunction

endclass


// Class: pma_registers_serial_if_status_reg_cover
// Register coverage object.
class pma_registers_serial_if_status_reg_cover extends uvm_object;

    static local pma_registers_serial_if_status_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    pma_registers_serial_if_status_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        rx_syncstatus_wr: coverpoint r.rx_syncstatus.value iff (!is_read);
        rx_syncstatus_rd: coverpoint r.rx_syncstatus.value iff  (is_read);
        rx_patterndetect_wr: coverpoint r.rx_patterndetect.value iff (!is_read);
        rx_patterndetect_rd: coverpoint r.rx_patterndetect.value iff  (is_read);
        rx_rlv_wr: coverpoint r.rx_rlv.value iff (!is_read);
        rx_rlv_rd: coverpoint r.rx_rlv.value iff  (is_read);
        rx_rmfifodatainserted_wr: coverpoint r.rx_rmfifodatainserted.value iff (!is_read);
        rx_rmfifodatainserted_rd: coverpoint r.rx_rmfifodatainserted.value iff  (is_read);
        rx_rmfifodatadeleted_wr: coverpoint r.rx_rmfifodatadeleted.value iff (!is_read);
        rx_rmfifodatadeleted_rd: coverpoint r.rx_rmfifodatadeleted.value iff  (is_read);
        rx_disperr_wr: coverpoint r.rx_disperr.value iff (!is_read);
        rx_disperr_rd: coverpoint r.rx_disperr.value iff  (is_read);
        rx_errdetect_wr: coverpoint r.rx_errdetect.value iff (!is_read);
        rx_errdetect_rd: coverpoint r.rx_errdetect.value iff  (is_read);
    endgroup

    `uvm_object_utils(pma_registers_reg_pkg::pma_registers_serial_if_status_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="pma_registers_serial_if_status_reg_cover");
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
    static function pma_registers_serial_if_status_reg_cover get();
        if (m_inst == null) begin
            m_inst = pma_registers_serial_if_status_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(pma_registers_serial_if_status_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass





// Class: pma_registers_reg_block
// Register Block .pma_registers: 
class pma_registers_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand pma_registers_pma_tx_pll_locked_reg pma_tx_pll_locked;
    rand pma_registers_pma_reset_reg pma_reset;
    rand pma_registers_phy_serial_loopback_reg phy_serial_loopback;
    rand pma_registers_pma_rx_set_locktodata_reg pma_rx_set_locktodata;
    rand pma_registers_pma_rx_set_locktoref_reg pma_rx_set_locktoref;
    rand pma_registers_pma_rx_is_lockedtodata_reg pma_rx_is_lockedtodata;
    rand pma_registers_pma_is_lockedtoref_reg pma_is_lockedtoref;
    rand pma_registers_serial_if_ctrl_reg serial_if_ctrl;
    rand pma_registers_serial_if_status_reg serial_if_status;

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(pma_registers_reg_pkg::pma_registers_reg_block)

    // Constructor: new
    function new(string name = "pma_registers_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})


        pma_tx_pll_locked = pma_registers_pma_tx_pll_locked_reg::type_id::create("pma_tx_pll_locked", , get_full_name());
        pma_reset = pma_registers_pma_reset_reg::type_id::create("pma_reset", , get_full_name());
        phy_serial_loopback = pma_registers_phy_serial_loopback_reg::type_id::create("phy_serial_loopback", , get_full_name());
        pma_rx_set_locktodata = pma_registers_pma_rx_set_locktodata_reg::type_id::create("pma_rx_set_locktodata", , get_full_name());
        pma_rx_set_locktoref = pma_registers_pma_rx_set_locktoref_reg::type_id::create("pma_rx_set_locktoref", , get_full_name());
        pma_rx_is_lockedtodata = pma_registers_pma_rx_is_lockedtodata_reg::type_id::create("pma_rx_is_lockedtodata", , get_full_name());
        pma_is_lockedtoref = pma_registers_pma_is_lockedtoref_reg::type_id::create("pma_is_lockedtoref", , get_full_name());
        serial_if_ctrl = pma_registers_serial_if_ctrl_reg::type_id::create("serial_if_ctrl", , get_full_name());
        serial_if_status = pma_registers_serial_if_status_reg::type_id::create("serial_if_status", , get_full_name());

        pma_tx_pll_locked.configure(this);
        pma_reset.configure(this);
        phy_serial_loopback.configure(this);
        pma_rx_set_locktodata.configure(this);
        pma_rx_set_locktoref.configure(this);
        pma_rx_is_lockedtodata.configure(this);
        pma_is_lockedtoref.configure(this);
        serial_if_ctrl.configure(this);
        serial_if_status.configure(this);

        pma_tx_pll_locked.build();
        pma_reset.build();
        phy_serial_loopback.build();
        pma_rx_set_locktodata.build();
        pma_rx_set_locktoref.build();
        pma_rx_is_lockedtodata.build();
        pma_is_lockedtoref.build();
        serial_if_ctrl.build();
        serial_if_status.build();

        // define default map
        default_map = create_map("pma_registers_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        this.default_map.add_reg(pma_tx_pll_locked, 'h22, "RO");
        this.default_map.add_reg(pma_reset, 'h44, "RW");
        this.default_map.add_reg(phy_serial_loopback, 'h61, "RW");
        this.default_map.add_reg(pma_rx_set_locktodata, 'h64, "RW");
        this.default_map.add_reg(pma_rx_set_locktoref, 'h65, "RW");
        this.default_map.add_reg(pma_rx_is_lockedtodata, 'h66, "RO");
        this.default_map.add_reg(pma_is_lockedtoref, 'h67, "RO");
        this.default_map.add_reg(serial_if_ctrl, 'hA8, "RW");
        this.default_map.add_reg(serial_if_status, 'hA9, "RO");

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
        pma_tx_pll_locked.enable_coverage(is_on, this.cg_per_instance);
        pma_reset.enable_coverage(is_on, this.cg_per_instance);
        phy_serial_loopback.enable_coverage(is_on, this.cg_per_instance);
        pma_rx_set_locktodata.enable_coverage(is_on, this.cg_per_instance);
        pma_rx_set_locktoref.enable_coverage(is_on, this.cg_per_instance);
        pma_rx_is_lockedtodata.enable_coverage(is_on, this.cg_per_instance);
        pma_is_lockedtoref.enable_coverage(is_on, this.cg_per_instance);
        serial_if_ctrl.enable_coverage(is_on, this.cg_per_instance);
        serial_if_status.enable_coverage(is_on, this.cg_per_instance);
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