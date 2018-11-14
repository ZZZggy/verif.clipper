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
// Register definitions for clock_ctrl register block.
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
// Group: clock_ctrl
//---------------------------------------------------------

package clock_ctrl_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;

typedef class clock_ctrl_pll_lock_status_reg_cover;

// Class: clock_ctrl_pll_lock_status_reg
// Register clock_ctrl.pll_lock_status: Lock Status of internal PLLs
class clock_ctrl_pll_lock_status_reg extends uvm_reg;

    // Variable: pll_sys_locked
    // Lock status for sys PLL (200M, 166.66M and 125M generation)
    rand uvm_reg_field pll_sys_locked;
    // Variable: pll_class2_locked
    // Lock status for class2 PLL (225M generation)
    rand uvm_reg_field pll_class2_locked;
    // Variable: pll_xgmii_locked
    // Lock status for rgmii PLL (156.25M generation
    rand uvm_reg_field pll_xgmii_locked;
    // Variable: pll_rld3_locked
    // Lock status for rld3 PLL
    rand uvm_reg_field pll_rld3_locked;
    // Variable: pll_10g_synce_locked
    // Lock status for Internal 10G syncE PLL
    rand uvm_reg_field pll_10g_synce_locked;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static clock_ctrl_pll_lock_status_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    clock_ctrl_pll_lock_status_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(clock_ctrl_reg_pkg::clock_ctrl_pll_lock_status_reg)

    // Constructor: new
    function new(string name = "clock_ctrl_pll_lock_status");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        pll_sys_locked = uvm_reg_field::type_id::create("pll_sys_locked", , get_full_name());
        pll_class2_locked = uvm_reg_field::type_id::create("pll_class2_locked", , get_full_name());
        pll_xgmii_locked = uvm_reg_field::type_id::create("pll_xgmii_locked", , get_full_name());
        pll_rld3_locked = uvm_reg_field::type_id::create("pll_rld3_locked", , get_full_name());
        pll_10g_synce_locked = uvm_reg_field::type_id::create("pll_10g_synce_locked", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        pll_sys_locked.configure(this, 1, 0, "RO", 0, 'h0, 1, 1, 0);
        pll_class2_locked.configure(this, 1, 1, "RO", 0, 'h0, 1, 1, 0);
        pll_xgmii_locked.configure(this, 1, 2, "RO", 0, 'h0, 1, 1, 0);
        pll_rld3_locked.configure(this, 1, 3, "RO", 0, 'h0, 1, 1, 0);
        pll_10g_synce_locked.configure(this, 1, 4, "RO", 0, 'h0, 1, 1, 0);
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
                cg = clock_ctrl_pll_lock_status_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = clock_ctrl_pll_lock_status_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, pll_sys_locked.get_name, pll_sys_locked.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, pll_class2_locked.get_name, pll_class2_locked.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, pll_xgmii_locked.get_name, pll_xgmii_locked.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, pll_rld3_locked.get_name, pll_rld3_locked.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, pll_10g_synce_locked.get_name, pll_10g_synce_locked.value);
        return s;
    endfunction

endclass


// Class: clock_ctrl_pll_lock_status_reg_cover
// Register coverage object.
class clock_ctrl_pll_lock_status_reg_cover extends uvm_object;

    static local clock_ctrl_pll_lock_status_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    clock_ctrl_pll_lock_status_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        pll_sys_locked_wr: coverpoint r.pll_sys_locked.value iff (!is_read);
        pll_sys_locked_rd: coverpoint r.pll_sys_locked.value iff  (is_read);
        pll_class2_locked_wr: coverpoint r.pll_class2_locked.value iff (!is_read);
        pll_class2_locked_rd: coverpoint r.pll_class2_locked.value iff  (is_read);
        pll_xgmii_locked_wr: coverpoint r.pll_xgmii_locked.value iff (!is_read);
        pll_xgmii_locked_rd: coverpoint r.pll_xgmii_locked.value iff  (is_read);
        pll_rld3_locked_wr: coverpoint r.pll_rld3_locked.value iff (!is_read);
        pll_rld3_locked_rd: coverpoint r.pll_rld3_locked.value iff  (is_read);
        pll_10g_synce_locked_wr: coverpoint r.pll_10g_synce_locked.value iff (!is_read);
        pll_10g_synce_locked_rd: coverpoint r.pll_10g_synce_locked.value iff  (is_read);
    endgroup

    `uvm_object_utils(clock_ctrl_reg_pkg::clock_ctrl_pll_lock_status_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="clock_ctrl_pll_lock_status_reg_cover");
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
    static function clock_ctrl_pll_lock_status_reg_cover get();
        if (m_inst == null) begin
            m_inst = clock_ctrl_pll_lock_status_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(clock_ctrl_pll_lock_status_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class clock_ctrl_pll_loss_of_lock_status_reg_cover;

// Class: clock_ctrl_pll_loss_of_lock_status_reg
// Register clock_ctrl.pll_loss_of_lock_status: Loss of Lock Status of internal PLLs
class clock_ctrl_pll_loss_of_lock_status_reg extends uvm_reg;

    // Variable: pll_sys_loss_of_lock
    // Loss Of Lock status for sys PLL (200M, 166.66M and 125M generation)
    rand uvm_reg_field pll_sys_loss_of_lock;
    // Variable: pll_class2_loss_of_lock
    // Loss Of Lock status for class2 PLL (225M generation)
    rand uvm_reg_field pll_class2_loss_of_lock;
    // Variable: pll_xgmii_loss_of_lock
    // Loss Of Lock status for rgmii PLL (156.25M generation
    rand uvm_reg_field pll_xgmii_loss_of_lock;
    // Variable: pll_rld3_loss_of_lock
    // Loss Of Lock status for rld3 PLL
    rand uvm_reg_field pll_rld3_loss_of_lock;
    // Variable: pll_10g_synce_loss_of_lock
    // Loss Of Lock status for internal 10G syncE PLL
    rand uvm_reg_field pll_10g_synce_loss_of_lock;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static clock_ctrl_pll_loss_of_lock_status_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    clock_ctrl_pll_loss_of_lock_status_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(clock_ctrl_reg_pkg::clock_ctrl_pll_loss_of_lock_status_reg)

    // Constructor: new
    function new(string name = "clock_ctrl_pll_loss_of_lock_status");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        pll_sys_loss_of_lock = uvm_reg_field::type_id::create("pll_sys_loss_of_lock", , get_full_name());
        pll_class2_loss_of_lock = uvm_reg_field::type_id::create("pll_class2_loss_of_lock", , get_full_name());
        pll_xgmii_loss_of_lock = uvm_reg_field::type_id::create("pll_xgmii_loss_of_lock", , get_full_name());
        pll_rld3_loss_of_lock = uvm_reg_field::type_id::create("pll_rld3_loss_of_lock", , get_full_name());
        pll_10g_synce_loss_of_lock = uvm_reg_field::type_id::create("pll_10g_synce_loss_of_lock", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        pll_sys_loss_of_lock.configure(this, 1, 0, "RO", 0, 'h0, 1, 1, 0);
        pll_class2_loss_of_lock.configure(this, 1, 1, "RO", 0, 'h0, 1, 1, 0);
        pll_xgmii_loss_of_lock.configure(this, 1, 2, "RO", 0, 'h0, 1, 1, 0);
        pll_rld3_loss_of_lock.configure(this, 1, 3, "RO", 0, 'h0, 1, 1, 0);
        pll_10g_synce_loss_of_lock.configure(this, 1, 4, "RO", 0, 'h0, 1, 1, 0);
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
                cg = clock_ctrl_pll_loss_of_lock_status_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = clock_ctrl_pll_loss_of_lock_status_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, pll_sys_loss_of_lock.get_name, pll_sys_loss_of_lock.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, pll_class2_loss_of_lock.get_name, pll_class2_loss_of_lock.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, pll_xgmii_loss_of_lock.get_name, pll_xgmii_loss_of_lock.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, pll_rld3_loss_of_lock.get_name, pll_rld3_loss_of_lock.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, pll_10g_synce_loss_of_lock.get_name, pll_10g_synce_loss_of_lock.value);
        return s;
    endfunction

endclass


// Class: clock_ctrl_pll_loss_of_lock_status_reg_cover
// Register coverage object.
class clock_ctrl_pll_loss_of_lock_status_reg_cover extends uvm_object;

    static local clock_ctrl_pll_loss_of_lock_status_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    clock_ctrl_pll_loss_of_lock_status_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        pll_sys_loss_of_lock_wr: coverpoint r.pll_sys_loss_of_lock.value iff (!is_read);
        pll_sys_loss_of_lock_rd: coverpoint r.pll_sys_loss_of_lock.value iff  (is_read);
        pll_class2_loss_of_lock_wr: coverpoint r.pll_class2_loss_of_lock.value iff (!is_read);
        pll_class2_loss_of_lock_rd: coverpoint r.pll_class2_loss_of_lock.value iff  (is_read);
        pll_xgmii_loss_of_lock_wr: coverpoint r.pll_xgmii_loss_of_lock.value iff (!is_read);
        pll_xgmii_loss_of_lock_rd: coverpoint r.pll_xgmii_loss_of_lock.value iff  (is_read);
        pll_rld3_loss_of_lock_wr: coverpoint r.pll_rld3_loss_of_lock.value iff (!is_read);
        pll_rld3_loss_of_lock_rd: coverpoint r.pll_rld3_loss_of_lock.value iff  (is_read);
        pll_10g_synce_loss_of_lock_wr: coverpoint r.pll_10g_synce_loss_of_lock.value iff (!is_read);
        pll_10g_synce_loss_of_lock_rd: coverpoint r.pll_10g_synce_loss_of_lock.value iff  (is_read);
    endgroup

    `uvm_object_utils(clock_ctrl_reg_pkg::clock_ctrl_pll_loss_of_lock_status_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="clock_ctrl_pll_loss_of_lock_status_reg_cover");
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
    static function clock_ctrl_pll_loss_of_lock_status_reg_cover get();
        if (m_inst == null) begin
            m_inst = clock_ctrl_pll_loss_of_lock_status_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(clock_ctrl_pll_loss_of_lock_status_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class clock_ctrl_synce_ctrl_reg_cover;

// Class: clock_ctrl_synce_ctrl_reg
// Register clock_ctrl.synce_ctrl: SyncE Control Register
class clock_ctrl_synce_ctrl_reg extends uvm_reg;

    // Variable: clk_sel_fsm_master
    // Master SyncE clock (PRC) selection
    rand uvm_reg_field clk_sel_fsm_master;
    // Variable: clk_sel_fsm_redundant
    // Redundant SyncE clock (PRC) selection
    rand uvm_reg_field clk_sel_fsm_redundant;
    // Variable: clk_sel_fsm_reset
    // Resets the SyncE clock selection Finite State Machine (FSM)
    rand uvm_reg_field clk_sel_fsm_reset;
    // Variable: clk_sel_fsm_disable_revertive
    // The SyncE clock selection Finite State Machine (FSM) may switch (based on readiness) clock source up and down in priority: MASTER &lt;-&gt; REDUNDANT &lt;-&gt; HOLDOVER
    rand uvm_reg_field clk_sel_fsm_disable_revertive;
    // Variable: clk_sel_fsm_revertive_mode
    // Redundant-to-Master revertive mode
    rand uvm_reg_field clk_sel_fsm_revertive_mode;
    // Variable: force_holdover
    // Forces the onboard SI5317C jitter cleaning PLL to freeze VCO
    rand uvm_reg_field force_holdover;
    // Variable: local_osc_mask
    // Masks the readiness of the 125MHz local oscillator
    rand uvm_reg_field local_osc_mask;
    // Variable: port1_recovered_clk_mask
    // Masks the readiness of the Port1 recovered clock
    rand uvm_reg_field port1_recovered_clk_mask;
    // Variable: port2_recovered_clk_mask
    // Masks the readiness of the Port2 recovered clock
    rand uvm_reg_field port2_recovered_clk_mask;
    // Variable: port3_recovered_clk_mask
    // Masks the readiness of the Port3 recovered clock
    rand uvm_reg_field port3_recovered_clk_mask;
    // Variable: port4_recovered_clk_mask
    // Masks the readiness of the Port4 recovered clock
    rand uvm_reg_field port4_recovered_clk_mask;
    // Variable: port5_recovered_clk_mask
    // Masks the readiness of the Port5 recovered clock
    rand uvm_reg_field port5_recovered_clk_mask;
    // Variable: port6_recovered_clk_mask
    // Masks the readiness of the Port6 recovered clock
    rand uvm_reg_field port6_recovered_clk_mask;
    // Variable: port7_recovered_clk_mask
    // Masks the readiness of the Port7 recovered clock
    rand uvm_reg_field port7_recovered_clk_mask;
    // Variable: port8_recovered_clk_mask
    // Masks the readiness of the Port8 recovered clock
    rand uvm_reg_field port8_recovered_clk_mask;
    // Variable: quad_phy_0_recovered_clk_mask
    // Masks the readiness of the Quad Phy recovered clock 0
    rand uvm_reg_field quad_phy_0_recovered_clk_mask;
    // Variable: quad_phy_1_recovered_clk_mask
    // Masks the readiness of the Quad Phy recovered clock 1
    rand uvm_reg_field quad_phy_1_recovered_clk_mask;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static clock_ctrl_synce_ctrl_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    clock_ctrl_synce_ctrl_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(clock_ctrl_reg_pkg::clock_ctrl_synce_ctrl_reg)

    // Constructor: new
    function new(string name = "clock_ctrl_synce_ctrl");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        clk_sel_fsm_master = uvm_reg_field::type_id::create("clk_sel_fsm_master", , get_full_name());
        clk_sel_fsm_redundant = uvm_reg_field::type_id::create("clk_sel_fsm_redundant", , get_full_name());
        clk_sel_fsm_reset = uvm_reg_field::type_id::create("clk_sel_fsm_reset", , get_full_name());
        clk_sel_fsm_disable_revertive = uvm_reg_field::type_id::create("clk_sel_fsm_disable_revertive", , get_full_name());
        clk_sel_fsm_revertive_mode = uvm_reg_field::type_id::create("clk_sel_fsm_revertive_mode", , get_full_name());
        force_holdover = uvm_reg_field::type_id::create("force_holdover", , get_full_name());
        local_osc_mask = uvm_reg_field::type_id::create("local_osc_mask", , get_full_name());
        port1_recovered_clk_mask = uvm_reg_field::type_id::create("port1_recovered_clk_mask", , get_full_name());
        port2_recovered_clk_mask = uvm_reg_field::type_id::create("port2_recovered_clk_mask", , get_full_name());
        port3_recovered_clk_mask = uvm_reg_field::type_id::create("port3_recovered_clk_mask", , get_full_name());
        port4_recovered_clk_mask = uvm_reg_field::type_id::create("port4_recovered_clk_mask", , get_full_name());
        port5_recovered_clk_mask = uvm_reg_field::type_id::create("port5_recovered_clk_mask", , get_full_name());
        port6_recovered_clk_mask = uvm_reg_field::type_id::create("port6_recovered_clk_mask", , get_full_name());
        port7_recovered_clk_mask = uvm_reg_field::type_id::create("port7_recovered_clk_mask", , get_full_name());
        port8_recovered_clk_mask = uvm_reg_field::type_id::create("port8_recovered_clk_mask", , get_full_name());
        quad_phy_0_recovered_clk_mask = uvm_reg_field::type_id::create("quad_phy_0_recovered_clk_mask", , get_full_name());
        quad_phy_1_recovered_clk_mask = uvm_reg_field::type_id::create("quad_phy_1_recovered_clk_mask", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        clk_sel_fsm_master.configure(this, 4, 0, "RW", 0, 'h0, 1, 1, 0);
        clk_sel_fsm_redundant.configure(this, 4, 4, "RW", 0, 'h0, 1, 1, 0);
        clk_sel_fsm_reset.configure(this, 1, 8, "RW", 0, 'h0, 1, 1, 0);
        clk_sel_fsm_disable_revertive.configure(this, 1, 9, "RW", 0, 'h0, 1, 1, 0);
        clk_sel_fsm_revertive_mode.configure(this, 1, 10, "RW", 0, 'h0, 1, 1, 0);
        force_holdover.configure(this, 1, 11, "RW", 0, 'h0, 1, 1, 0);
        local_osc_mask.configure(this, 1, 16, "RW", 0, 'h0, 1, 1, 0);
        port1_recovered_clk_mask.configure(this, 1, 17, "RW", 0, 'h0, 1, 1, 0);
        port2_recovered_clk_mask.configure(this, 1, 18, "RW", 0, 'h0, 1, 1, 0);
        port3_recovered_clk_mask.configure(this, 1, 19, "RW", 0, 'h0, 1, 1, 0);
        port4_recovered_clk_mask.configure(this, 1, 20, "RW", 0, 'h0, 1, 1, 0);
        port5_recovered_clk_mask.configure(this, 1, 21, "RW", 0, 'h0, 1, 1, 0);
        port6_recovered_clk_mask.configure(this, 1, 22, "RW", 0, 'h0, 1, 1, 0);
        port7_recovered_clk_mask.configure(this, 1, 23, "RW", 0, 'h0, 1, 1, 0);
        port8_recovered_clk_mask.configure(this, 1, 24, "RW", 0, 'h0, 1, 1, 0);
        quad_phy_0_recovered_clk_mask.configure(this, 1, 25, "RW", 0, 'h0, 1, 1, 0);
        quad_phy_1_recovered_clk_mask.configure(this, 1, 26, "RW", 0, 'h0, 1, 1, 0);
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
                cg = clock_ctrl_synce_ctrl_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = clock_ctrl_synce_ctrl_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, clk_sel_fsm_master.get_name, clk_sel_fsm_master.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, clk_sel_fsm_redundant.get_name, clk_sel_fsm_redundant.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, clk_sel_fsm_reset.get_name, clk_sel_fsm_reset.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, clk_sel_fsm_disable_revertive.get_name, clk_sel_fsm_disable_revertive.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, clk_sel_fsm_revertive_mode.get_name, clk_sel_fsm_revertive_mode.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, force_holdover.get_name, force_holdover.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, local_osc_mask.get_name, local_osc_mask.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port1_recovered_clk_mask.get_name, port1_recovered_clk_mask.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port2_recovered_clk_mask.get_name, port2_recovered_clk_mask.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port3_recovered_clk_mask.get_name, port3_recovered_clk_mask.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port4_recovered_clk_mask.get_name, port4_recovered_clk_mask.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port5_recovered_clk_mask.get_name, port5_recovered_clk_mask.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port6_recovered_clk_mask.get_name, port6_recovered_clk_mask.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port7_recovered_clk_mask.get_name, port7_recovered_clk_mask.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port8_recovered_clk_mask.get_name, port8_recovered_clk_mask.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, quad_phy_0_recovered_clk_mask.get_name, quad_phy_0_recovered_clk_mask.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, quad_phy_1_recovered_clk_mask.get_name, quad_phy_1_recovered_clk_mask.value);
        return s;
    endfunction

endclass


// Class: clock_ctrl_synce_ctrl_reg_cover
// Register coverage object.
class clock_ctrl_synce_ctrl_reg_cover extends uvm_object;

    static local clock_ctrl_synce_ctrl_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    clock_ctrl_synce_ctrl_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        clk_sel_fsm_master_wr: coverpoint r.clk_sel_fsm_master.value iff (!is_read);
        clk_sel_fsm_master_rd: coverpoint r.clk_sel_fsm_master.value iff  (is_read);
        clk_sel_fsm_redundant_wr: coverpoint r.clk_sel_fsm_redundant.value iff (!is_read);
        clk_sel_fsm_redundant_rd: coverpoint r.clk_sel_fsm_redundant.value iff  (is_read);
        clk_sel_fsm_reset_wr: coverpoint r.clk_sel_fsm_reset.value iff (!is_read);
        clk_sel_fsm_reset_rd: coverpoint r.clk_sel_fsm_reset.value iff  (is_read);
        clk_sel_fsm_disable_revertive_wr: coverpoint r.clk_sel_fsm_disable_revertive.value iff (!is_read);
        clk_sel_fsm_disable_revertive_rd: coverpoint r.clk_sel_fsm_disable_revertive.value iff  (is_read);
        clk_sel_fsm_revertive_mode_wr: coverpoint r.clk_sel_fsm_revertive_mode.value iff (!is_read);
        clk_sel_fsm_revertive_mode_rd: coverpoint r.clk_sel_fsm_revertive_mode.value iff  (is_read);
        force_holdover_wr: coverpoint r.force_holdover.value iff (!is_read);
        force_holdover_rd: coverpoint r.force_holdover.value iff  (is_read);
        local_osc_mask_wr: coverpoint r.local_osc_mask.value iff (!is_read);
        local_osc_mask_rd: coverpoint r.local_osc_mask.value iff  (is_read);
        port1_recovered_clk_mask_wr: coverpoint r.port1_recovered_clk_mask.value iff (!is_read);
        port1_recovered_clk_mask_rd: coverpoint r.port1_recovered_clk_mask.value iff  (is_read);
        port2_recovered_clk_mask_wr: coverpoint r.port2_recovered_clk_mask.value iff (!is_read);
        port2_recovered_clk_mask_rd: coverpoint r.port2_recovered_clk_mask.value iff  (is_read);
        port3_recovered_clk_mask_wr: coverpoint r.port3_recovered_clk_mask.value iff (!is_read);
        port3_recovered_clk_mask_rd: coverpoint r.port3_recovered_clk_mask.value iff  (is_read);
        port4_recovered_clk_mask_wr: coverpoint r.port4_recovered_clk_mask.value iff (!is_read);
        port4_recovered_clk_mask_rd: coverpoint r.port4_recovered_clk_mask.value iff  (is_read);
        port5_recovered_clk_mask_wr: coverpoint r.port5_recovered_clk_mask.value iff (!is_read);
        port5_recovered_clk_mask_rd: coverpoint r.port5_recovered_clk_mask.value iff  (is_read);
        port6_recovered_clk_mask_wr: coverpoint r.port6_recovered_clk_mask.value iff (!is_read);
        port6_recovered_clk_mask_rd: coverpoint r.port6_recovered_clk_mask.value iff  (is_read);
        port7_recovered_clk_mask_wr: coverpoint r.port7_recovered_clk_mask.value iff (!is_read);
        port7_recovered_clk_mask_rd: coverpoint r.port7_recovered_clk_mask.value iff  (is_read);
        port8_recovered_clk_mask_wr: coverpoint r.port8_recovered_clk_mask.value iff (!is_read);
        port8_recovered_clk_mask_rd: coverpoint r.port8_recovered_clk_mask.value iff  (is_read);
        quad_phy_0_recovered_clk_mask_wr: coverpoint r.quad_phy_0_recovered_clk_mask.value iff (!is_read);
        quad_phy_0_recovered_clk_mask_rd: coverpoint r.quad_phy_0_recovered_clk_mask.value iff  (is_read);
        quad_phy_1_recovered_clk_mask_wr: coverpoint r.quad_phy_1_recovered_clk_mask.value iff (!is_read);
        quad_phy_1_recovered_clk_mask_rd: coverpoint r.quad_phy_1_recovered_clk_mask.value iff  (is_read);
    endgroup

    `uvm_object_utils(clock_ctrl_reg_pkg::clock_ctrl_synce_ctrl_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="clock_ctrl_synce_ctrl_reg_cover");
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
    static function clock_ctrl_synce_ctrl_reg_cover get();
        if (m_inst == null) begin
            m_inst = clock_ctrl_synce_ctrl_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(clock_ctrl_synce_ctrl_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class clock_ctrl_synce_status_0_reg_cover;

// Class: clock_ctrl_synce_status_0_reg
// Register clock_ctrl.synce_status_0: SyncE Clock Status
class clock_ctrl_synce_status_0_reg extends uvm_reg;

    // Variable: local_osc_is_ready
    // 125MHz local oscillator is ready
    rand uvm_reg_field local_osc_is_ready;
    // Variable: port1_recovered_clock_is_ready
    // Port1 recovered clock is ready (qualified by link UP at 100Mbps (100BASE-TX) or 1Gbps (1000BASE-X or 1000BASE-T slave) status received from PHY)
    rand uvm_reg_field port1_recovered_clock_is_ready;
    // Variable: port2_recovered_clock_is_ready
    // Port2 recovered clock is ready (qualified by link UP at 100Mbps (100BASE-TX) or 1Gbps (1000BASE-X or 1000BASE-T slave)status received from PHY)
    rand uvm_reg_field port2_recovered_clock_is_ready;
    // Variable: port3_recovered_clock_is_ready
    // Port3 recovered clock is ready (qualified by link UP at 100Mbps (100BASE-TX) or 1Gbps (1000BASE-X or 1000BASE-T slave)status received from PHY)
    rand uvm_reg_field port3_recovered_clock_is_ready;
    // Variable: port4_recovered_clock_is_ready
    // Port4 recovered clock is ready (qualified by link UP at 100Mbps (100BASE-TX) or 1Gbps (1000BASE-X or 1000BASE-T slave)tatus received from PHY)
    rand uvm_reg_field port4_recovered_clock_is_ready;
    // Variable: port5_recovered_clock_is_ready
    // Port5 recovered clock is ready (qualified by link UP at 1Gbps or 10Gbps status received from PHY)
    rand uvm_reg_field port5_recovered_clock_is_ready;
    // Variable: port6_recovered_clock_is_ready
    // Port6 recovered clock is ready (qualified by link UP at 1Gbps or 10Gbps status received from PHY)
    rand uvm_reg_field port6_recovered_clock_is_ready;
    // Variable: port7_recovered_clock_is_ready
    // Port7 recovered clock is ready (qualified by link UP at 1Gbps or 10Gbps status received from PHY)
    rand uvm_reg_field port7_recovered_clock_is_ready;
    // Variable: port8_recovered_clock_is_ready
    // Port8 recovered clock is ready (qualified by link UP at 1Gbps or 10Gbps status received from PHY)
    rand uvm_reg_field port8_recovered_clock_is_ready;
    // Variable: quad_phy_0_recovered_clock_is_ready
    // recovered clock 0 received from Quad PHY detected. Quad PHY squelch mode implies link is up at 100Mbps (100BASE-FX or 100BASE-TX) or 1Gbps (1000BASE-X or 1000BASE-T slave)
    rand uvm_reg_field quad_phy_0_recovered_clock_is_ready;
    // Variable: quad_phy_1_recovered_clock_is_ready
    // recovered clock 1 received from Quad PHY detected. Quad PHY squelch mode implies link is up at 100Mbps (100BASE-FX or 100BASE-TX) or 1Gbps (1000BASE-X or 1000BASE-T slave)
    rand uvm_reg_field quad_phy_1_recovered_clock_is_ready;
    // Variable: local_osc_loss_of_ready
    // 125MHz local oscillator loss of ready event has been detected
    rand uvm_reg_field local_osc_loss_of_ready;
    // Variable: port1_recovered_clock_loss_of_ready
    // Port1 recovered clock loss of ready event has been detected
    rand uvm_reg_field port1_recovered_clock_loss_of_ready;
    // Variable: port2_recovered_clock_loss_of_ready
    // Port2 recovered clock loss of ready event has been detected
    rand uvm_reg_field port2_recovered_clock_loss_of_ready;
    // Variable: port3_recovered_clock_loss_of_ready
    // Port3 recovered clock loss of ready event has been detected
    rand uvm_reg_field port3_recovered_clock_loss_of_ready;
    // Variable: port4_recovered_clock_loss_of_ready
    // Port4 recovered clock loss of ready event has been detected
    rand uvm_reg_field port4_recovered_clock_loss_of_ready;
    // Variable: port5_recovered_clock_loss_of_ready
    // Port5 recovered clock loss of ready event has been detected
    rand uvm_reg_field port5_recovered_clock_loss_of_ready;
    // Variable: port6_recovered_clock_loss_of_ready
    // Port6 recovered clock loss of ready event has been detected
    rand uvm_reg_field port6_recovered_clock_loss_of_ready;
    // Variable: port7_recovered_clock_loss_of_ready
    // Port7 recovered clock loss of ready event has been detected
    rand uvm_reg_field port7_recovered_clock_loss_of_ready;
    // Variable: port8_recovered_clock_loss_of_ready
    // Port8 recovered clock loss of ready event has been detected
    rand uvm_reg_field port8_recovered_clock_loss_of_ready;
    // Variable: quad_phy_0_recovered_clock_loss_of_ready
    // Quad PHY recovered clock 0 loss of ready event has been detected
    rand uvm_reg_field quad_phy_0_recovered_clock_loss_of_ready;
    // Variable: quad_phy_1_recovered_clock_loss_of_ready
    // Quad PHY recovered clock 1 loss of ready event has been detected
    rand uvm_reg_field quad_phy_1_recovered_clock_loss_of_ready;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static clock_ctrl_synce_status_0_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    clock_ctrl_synce_status_0_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(clock_ctrl_reg_pkg::clock_ctrl_synce_status_0_reg)

    // Constructor: new
    function new(string name = "clock_ctrl_synce_status_0");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        local_osc_is_ready = uvm_reg_field::type_id::create("local_osc_is_ready", , get_full_name());
        port1_recovered_clock_is_ready = uvm_reg_field::type_id::create("port1_recovered_clock_is_ready", , get_full_name());
        port2_recovered_clock_is_ready = uvm_reg_field::type_id::create("port2_recovered_clock_is_ready", , get_full_name());
        port3_recovered_clock_is_ready = uvm_reg_field::type_id::create("port3_recovered_clock_is_ready", , get_full_name());
        port4_recovered_clock_is_ready = uvm_reg_field::type_id::create("port4_recovered_clock_is_ready", , get_full_name());
        port5_recovered_clock_is_ready = uvm_reg_field::type_id::create("port5_recovered_clock_is_ready", , get_full_name());
        port6_recovered_clock_is_ready = uvm_reg_field::type_id::create("port6_recovered_clock_is_ready", , get_full_name());
        port7_recovered_clock_is_ready = uvm_reg_field::type_id::create("port7_recovered_clock_is_ready", , get_full_name());
        port8_recovered_clock_is_ready = uvm_reg_field::type_id::create("port8_recovered_clock_is_ready", , get_full_name());
        quad_phy_0_recovered_clock_is_ready = uvm_reg_field::type_id::create("quad_phy_0_recovered_clock_is_ready", , get_full_name());
        quad_phy_1_recovered_clock_is_ready = uvm_reg_field::type_id::create("quad_phy_1_recovered_clock_is_ready", , get_full_name());
        local_osc_loss_of_ready = uvm_reg_field::type_id::create("local_osc_loss_of_ready", , get_full_name());
        port1_recovered_clock_loss_of_ready = uvm_reg_field::type_id::create("port1_recovered_clock_loss_of_ready", , get_full_name());
        port2_recovered_clock_loss_of_ready = uvm_reg_field::type_id::create("port2_recovered_clock_loss_of_ready", , get_full_name());
        port3_recovered_clock_loss_of_ready = uvm_reg_field::type_id::create("port3_recovered_clock_loss_of_ready", , get_full_name());
        port4_recovered_clock_loss_of_ready = uvm_reg_field::type_id::create("port4_recovered_clock_loss_of_ready", , get_full_name());
        port5_recovered_clock_loss_of_ready = uvm_reg_field::type_id::create("port5_recovered_clock_loss_of_ready", , get_full_name());
        port6_recovered_clock_loss_of_ready = uvm_reg_field::type_id::create("port6_recovered_clock_loss_of_ready", , get_full_name());
        port7_recovered_clock_loss_of_ready = uvm_reg_field::type_id::create("port7_recovered_clock_loss_of_ready", , get_full_name());
        port8_recovered_clock_loss_of_ready = uvm_reg_field::type_id::create("port8_recovered_clock_loss_of_ready", , get_full_name());
        quad_phy_0_recovered_clock_loss_of_ready = uvm_reg_field::type_id::create("quad_phy_0_recovered_clock_loss_of_ready", , get_full_name());
        quad_phy_1_recovered_clock_loss_of_ready = uvm_reg_field::type_id::create("quad_phy_1_recovered_clock_loss_of_ready", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        local_osc_is_ready.configure(this, 1, 0, "RO", 0, 'h0, 1, 1, 0);
        port1_recovered_clock_is_ready.configure(this, 1, 1, "RO", 0, 'h0, 1, 1, 0);
        port2_recovered_clock_is_ready.configure(this, 1, 2, "RO", 0, 'h0, 1, 1, 0);
        port3_recovered_clock_is_ready.configure(this, 1, 3, "RO", 0, 'h0, 1, 1, 0);
        port4_recovered_clock_is_ready.configure(this, 1, 4, "RO", 0, 'h0, 1, 1, 0);
        port5_recovered_clock_is_ready.configure(this, 1, 5, "RO", 0, 'h0, 1, 1, 0);
        port6_recovered_clock_is_ready.configure(this, 1, 6, "RO", 0, 'h0, 1, 1, 0);
        port7_recovered_clock_is_ready.configure(this, 1, 7, "RO", 0, 'h0, 1, 1, 0);
        port8_recovered_clock_is_ready.configure(this, 1, 8, "RO", 0, 'h0, 1, 1, 0);
        quad_phy_0_recovered_clock_is_ready.configure(this, 1, 9, "RO", 0, 'h0, 1, 1, 0);
        quad_phy_1_recovered_clock_is_ready.configure(this, 1, 10, "RO", 0, 'h0, 1, 1, 0);
        local_osc_loss_of_ready.configure(this, 1, 16, "RO", 0, 'h0, 1, 1, 0);
        port1_recovered_clock_loss_of_ready.configure(this, 1, 17, "RO", 0, 'h0, 1, 1, 0);
        port2_recovered_clock_loss_of_ready.configure(this, 1, 18, "RO", 0, 'h0, 1, 1, 0);
        port3_recovered_clock_loss_of_ready.configure(this, 1, 19, "RO", 0, 'h0, 1, 1, 0);
        port4_recovered_clock_loss_of_ready.configure(this, 1, 20, "RO", 0, 'h0, 1, 1, 0);
        port5_recovered_clock_loss_of_ready.configure(this, 1, 21, "RO", 0, 'h0, 1, 1, 0);
        port6_recovered_clock_loss_of_ready.configure(this, 1, 22, "RO", 0, 'h0, 1, 1, 0);
        port7_recovered_clock_loss_of_ready.configure(this, 1, 23, "RO", 0, 'h0, 1, 1, 0);
        port8_recovered_clock_loss_of_ready.configure(this, 1, 24, "RO", 0, 'h0, 1, 1, 0);
        quad_phy_0_recovered_clock_loss_of_ready.configure(this, 1, 25, "RO", 0, 'h0, 1, 1, 0);
        quad_phy_1_recovered_clock_loss_of_ready.configure(this, 1, 26, "RO", 0, 'h0, 1, 1, 0);
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
                cg = clock_ctrl_synce_status_0_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = clock_ctrl_synce_status_0_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, local_osc_is_ready.get_name, local_osc_is_ready.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port1_recovered_clock_is_ready.get_name, port1_recovered_clock_is_ready.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port2_recovered_clock_is_ready.get_name, port2_recovered_clock_is_ready.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port3_recovered_clock_is_ready.get_name, port3_recovered_clock_is_ready.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port4_recovered_clock_is_ready.get_name, port4_recovered_clock_is_ready.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port5_recovered_clock_is_ready.get_name, port5_recovered_clock_is_ready.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port6_recovered_clock_is_ready.get_name, port6_recovered_clock_is_ready.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port7_recovered_clock_is_ready.get_name, port7_recovered_clock_is_ready.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port8_recovered_clock_is_ready.get_name, port8_recovered_clock_is_ready.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, quad_phy_0_recovered_clock_is_ready.get_name, quad_phy_0_recovered_clock_is_ready.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, quad_phy_1_recovered_clock_is_ready.get_name, quad_phy_1_recovered_clock_is_ready.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, local_osc_loss_of_ready.get_name, local_osc_loss_of_ready.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port1_recovered_clock_loss_of_ready.get_name, port1_recovered_clock_loss_of_ready.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port2_recovered_clock_loss_of_ready.get_name, port2_recovered_clock_loss_of_ready.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port3_recovered_clock_loss_of_ready.get_name, port3_recovered_clock_loss_of_ready.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port4_recovered_clock_loss_of_ready.get_name, port4_recovered_clock_loss_of_ready.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port5_recovered_clock_loss_of_ready.get_name, port5_recovered_clock_loss_of_ready.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port6_recovered_clock_loss_of_ready.get_name, port6_recovered_clock_loss_of_ready.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port7_recovered_clock_loss_of_ready.get_name, port7_recovered_clock_loss_of_ready.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, port8_recovered_clock_loss_of_ready.get_name, port8_recovered_clock_loss_of_ready.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, quad_phy_0_recovered_clock_loss_of_ready.get_name, quad_phy_0_recovered_clock_loss_of_ready.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, quad_phy_1_recovered_clock_loss_of_ready.get_name, quad_phy_1_recovered_clock_loss_of_ready.value);
        return s;
    endfunction

endclass


// Class: clock_ctrl_synce_status_0_reg_cover
// Register coverage object.
class clock_ctrl_synce_status_0_reg_cover extends uvm_object;

    static local clock_ctrl_synce_status_0_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    clock_ctrl_synce_status_0_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        local_osc_is_ready_wr: coverpoint r.local_osc_is_ready.value iff (!is_read);
        local_osc_is_ready_rd: coverpoint r.local_osc_is_ready.value iff  (is_read);
        port1_recovered_clock_is_ready_wr: coverpoint r.port1_recovered_clock_is_ready.value iff (!is_read);
        port1_recovered_clock_is_ready_rd: coverpoint r.port1_recovered_clock_is_ready.value iff  (is_read);
        port2_recovered_clock_is_ready_wr: coverpoint r.port2_recovered_clock_is_ready.value iff (!is_read);
        port2_recovered_clock_is_ready_rd: coverpoint r.port2_recovered_clock_is_ready.value iff  (is_read);
        port3_recovered_clock_is_ready_wr: coverpoint r.port3_recovered_clock_is_ready.value iff (!is_read);
        port3_recovered_clock_is_ready_rd: coverpoint r.port3_recovered_clock_is_ready.value iff  (is_read);
        port4_recovered_clock_is_ready_wr: coverpoint r.port4_recovered_clock_is_ready.value iff (!is_read);
        port4_recovered_clock_is_ready_rd: coverpoint r.port4_recovered_clock_is_ready.value iff  (is_read);
        port5_recovered_clock_is_ready_wr: coverpoint r.port5_recovered_clock_is_ready.value iff (!is_read);
        port5_recovered_clock_is_ready_rd: coverpoint r.port5_recovered_clock_is_ready.value iff  (is_read);
        port6_recovered_clock_is_ready_wr: coverpoint r.port6_recovered_clock_is_ready.value iff (!is_read);
        port6_recovered_clock_is_ready_rd: coverpoint r.port6_recovered_clock_is_ready.value iff  (is_read);
        port7_recovered_clock_is_ready_wr: coverpoint r.port7_recovered_clock_is_ready.value iff (!is_read);
        port7_recovered_clock_is_ready_rd: coverpoint r.port7_recovered_clock_is_ready.value iff  (is_read);
        port8_recovered_clock_is_ready_wr: coverpoint r.port8_recovered_clock_is_ready.value iff (!is_read);
        port8_recovered_clock_is_ready_rd: coverpoint r.port8_recovered_clock_is_ready.value iff  (is_read);
        quad_phy_0_recovered_clock_is_ready_wr: coverpoint r.quad_phy_0_recovered_clock_is_ready.value iff (!is_read);
        quad_phy_0_recovered_clock_is_ready_rd: coverpoint r.quad_phy_0_recovered_clock_is_ready.value iff  (is_read);
        quad_phy_1_recovered_clock_is_ready_wr: coverpoint r.quad_phy_1_recovered_clock_is_ready.value iff (!is_read);
        quad_phy_1_recovered_clock_is_ready_rd: coverpoint r.quad_phy_1_recovered_clock_is_ready.value iff  (is_read);
        local_osc_loss_of_ready_wr: coverpoint r.local_osc_loss_of_ready.value iff (!is_read);
        local_osc_loss_of_ready_rd: coverpoint r.local_osc_loss_of_ready.value iff  (is_read);
        port1_recovered_clock_loss_of_ready_wr: coverpoint r.port1_recovered_clock_loss_of_ready.value iff (!is_read);
        port1_recovered_clock_loss_of_ready_rd: coverpoint r.port1_recovered_clock_loss_of_ready.value iff  (is_read);
        port2_recovered_clock_loss_of_ready_wr: coverpoint r.port2_recovered_clock_loss_of_ready.value iff (!is_read);
        port2_recovered_clock_loss_of_ready_rd: coverpoint r.port2_recovered_clock_loss_of_ready.value iff  (is_read);
        port3_recovered_clock_loss_of_ready_wr: coverpoint r.port3_recovered_clock_loss_of_ready.value iff (!is_read);
        port3_recovered_clock_loss_of_ready_rd: coverpoint r.port3_recovered_clock_loss_of_ready.value iff  (is_read);
        port4_recovered_clock_loss_of_ready_wr: coverpoint r.port4_recovered_clock_loss_of_ready.value iff (!is_read);
        port4_recovered_clock_loss_of_ready_rd: coverpoint r.port4_recovered_clock_loss_of_ready.value iff  (is_read);
        port5_recovered_clock_loss_of_ready_wr: coverpoint r.port5_recovered_clock_loss_of_ready.value iff (!is_read);
        port5_recovered_clock_loss_of_ready_rd: coverpoint r.port5_recovered_clock_loss_of_ready.value iff  (is_read);
        port6_recovered_clock_loss_of_ready_wr: coverpoint r.port6_recovered_clock_loss_of_ready.value iff (!is_read);
        port6_recovered_clock_loss_of_ready_rd: coverpoint r.port6_recovered_clock_loss_of_ready.value iff  (is_read);
        port7_recovered_clock_loss_of_ready_wr: coverpoint r.port7_recovered_clock_loss_of_ready.value iff (!is_read);
        port7_recovered_clock_loss_of_ready_rd: coverpoint r.port7_recovered_clock_loss_of_ready.value iff  (is_read);
        port8_recovered_clock_loss_of_ready_wr: coverpoint r.port8_recovered_clock_loss_of_ready.value iff (!is_read);
        port8_recovered_clock_loss_of_ready_rd: coverpoint r.port8_recovered_clock_loss_of_ready.value iff  (is_read);
        quad_phy_0_recovered_clock_loss_of_ready_wr: coverpoint r.quad_phy_0_recovered_clock_loss_of_ready.value iff (!is_read);
        quad_phy_0_recovered_clock_loss_of_ready_rd: coverpoint r.quad_phy_0_recovered_clock_loss_of_ready.value iff  (is_read);
        quad_phy_1_recovered_clock_loss_of_ready_wr: coverpoint r.quad_phy_1_recovered_clock_loss_of_ready.value iff (!is_read);
        quad_phy_1_recovered_clock_loss_of_ready_rd: coverpoint r.quad_phy_1_recovered_clock_loss_of_ready.value iff  (is_read);
    endgroup

    `uvm_object_utils(clock_ctrl_reg_pkg::clock_ctrl_synce_status_0_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="clock_ctrl_synce_status_0_reg_cover");
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
    static function clock_ctrl_synce_status_0_reg_cover get();
        if (m_inst == null) begin
            m_inst = clock_ctrl_synce_status_0_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(clock_ctrl_synce_status_0_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class clock_ctrl_synce_status_1_reg_cover;

// Class: clock_ctrl_synce_status_1_reg
// Register clock_ctrl.synce_status_1: SyncE Finite State Machine (FSM) Status
class clock_ctrl_synce_status_1_reg extends uvm_reg;

    // Variable: clk_sel_current
    // Currently selected SyncE clock
    rand uvm_reg_field clk_sel_current;
    // Variable: clk_sel_fsm_state_current
    // SyncE Finite State Machine (FSM) current state
    rand uvm_reg_field clk_sel_fsm_state_current;
    // Variable: clk_sel_activity
    // Activity on the SyncE clock selector (selection change)
    rand uvm_reg_field clk_sel_activity;
    // Variable: clk_sel_fsm_state_activity
    // Activity on the SyncE Finite State Machine (FSM) (state change)
    rand uvm_reg_field clk_sel_fsm_state_activity;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static clock_ctrl_synce_status_1_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    clock_ctrl_synce_status_1_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(clock_ctrl_reg_pkg::clock_ctrl_synce_status_1_reg)

    // Constructor: new
    function new(string name = "clock_ctrl_synce_status_1");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        clk_sel_current = uvm_reg_field::type_id::create("clk_sel_current", , get_full_name());
        clk_sel_fsm_state_current = uvm_reg_field::type_id::create("clk_sel_fsm_state_current", , get_full_name());
        clk_sel_activity = uvm_reg_field::type_id::create("clk_sel_activity", , get_full_name());
        clk_sel_fsm_state_activity = uvm_reg_field::type_id::create("clk_sel_fsm_state_activity", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        clk_sel_current.configure(this, 4, 0, "RO", 0, 'h0, 1, 1, 0);
        clk_sel_fsm_state_current.configure(this, 2, 4, "RO", 0, 'h0, 1, 1, 0);
        clk_sel_activity.configure(this, 1, 8, "RO", 0, 'h0, 1, 1, 0);
        clk_sel_fsm_state_activity.configure(this, 1, 9, "RO", 0, 'h0, 1, 1, 0);
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
                cg = clock_ctrl_synce_status_1_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = clock_ctrl_synce_status_1_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, clk_sel_current.get_name, clk_sel_current.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, clk_sel_fsm_state_current.get_name, clk_sel_fsm_state_current.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, clk_sel_activity.get_name, clk_sel_activity.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, clk_sel_fsm_state_activity.get_name, clk_sel_fsm_state_activity.value);
        return s;
    endfunction

endclass


// Class: clock_ctrl_synce_status_1_reg_cover
// Register coverage object.
class clock_ctrl_synce_status_1_reg_cover extends uvm_object;

    static local clock_ctrl_synce_status_1_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    clock_ctrl_synce_status_1_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        clk_sel_current_wr: coverpoint r.clk_sel_current.value iff (!is_read);
        clk_sel_current_rd: coverpoint r.clk_sel_current.value iff  (is_read);
        clk_sel_fsm_state_current_wr: coverpoint r.clk_sel_fsm_state_current.value iff (!is_read);
        clk_sel_fsm_state_current_rd: coverpoint r.clk_sel_fsm_state_current.value iff  (is_read);
        clk_sel_activity_wr: coverpoint r.clk_sel_activity.value iff (!is_read);
        clk_sel_activity_rd: coverpoint r.clk_sel_activity.value iff  (is_read);
        clk_sel_fsm_state_activity_wr: coverpoint r.clk_sel_fsm_state_activity.value iff (!is_read);
        clk_sel_fsm_state_activity_rd: coverpoint r.clk_sel_fsm_state_activity.value iff  (is_read);
    endgroup

    `uvm_object_utils(clock_ctrl_reg_pkg::clock_ctrl_synce_status_1_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="clock_ctrl_synce_status_1_reg_cover");
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
    static function clock_ctrl_synce_status_1_reg_cover get();
        if (m_inst == null) begin
            m_inst = clock_ctrl_synce_status_1_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(clock_ctrl_synce_status_1_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class clock_ctrl_clk_pp10m_ctrl_reg_cover;

// Class: clock_ctrl_clk_pp10m_ctrl_reg
// Register clock_ctrl.clk_pp10m_ctrl: Configure the PP10M detector source
class clock_ctrl_clk_pp10m_ctrl_reg extends uvm_reg;

    // Variable: pp10m_src_select
    // PPM detector selection
    rand uvm_reg_field pp10m_src_select;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static clock_ctrl_clk_pp10m_ctrl_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    clock_ctrl_clk_pp10m_ctrl_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(clock_ctrl_reg_pkg::clock_ctrl_clk_pp10m_ctrl_reg)

    // Constructor: new
    function new(string name = "clock_ctrl_clk_pp10m_ctrl");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        pp10m_src_select = uvm_reg_field::type_id::create("pp10m_src_select", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        pp10m_src_select.configure(this, 4, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = clock_ctrl_clk_pp10m_ctrl_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = clock_ctrl_clk_pp10m_ctrl_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, pp10m_src_select.get_name, pp10m_src_select.value);
        return s;
    endfunction

endclass


// Class: clock_ctrl_clk_pp10m_ctrl_reg_cover
// Register coverage object.
class clock_ctrl_clk_pp10m_ctrl_reg_cover extends uvm_object;

    static local clock_ctrl_clk_pp10m_ctrl_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    clock_ctrl_clk_pp10m_ctrl_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        pp10m_src_select_wr: coverpoint r.pp10m_src_select.value iff (!is_read);
        pp10m_src_select_rd: coverpoint r.pp10m_src_select.value iff  (is_read);
    endgroup

    `uvm_object_utils(clock_ctrl_reg_pkg::clock_ctrl_clk_pp10m_ctrl_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="clock_ctrl_clk_pp10m_ctrl_reg_cover");
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
    static function clock_ctrl_clk_pp10m_ctrl_reg_cover get();
        if (m_inst == null) begin
            m_inst = clock_ctrl_clk_pp10m_ctrl_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(clock_ctrl_clk_pp10m_ctrl_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class clock_ctrl_clk_pp10m_status_reg_cover;

// Class: clock_ctrl_clk_pp10m_status_reg
// Register clock_ctrl.clk_pp10m_status: Reports the PP10M (Parts Per 10 Millions) value from PPM detector
class clock_ctrl_clk_pp10m_status_reg extends uvm_reg;

    // Variable: pp10m_value
    // PP10M detector between SyncE Clock and selected clock
    rand uvm_reg_field pp10m_value;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static clock_ctrl_clk_pp10m_status_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    clock_ctrl_clk_pp10m_status_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(clock_ctrl_reg_pkg::clock_ctrl_clk_pp10m_status_reg)

    // Constructor: new
    function new(string name = "clock_ctrl_clk_pp10m_status");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        pp10m_value = uvm_reg_field::type_id::create("pp10m_value", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        pp10m_value.configure(this, 16, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = clock_ctrl_clk_pp10m_status_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = clock_ctrl_clk_pp10m_status_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, pp10m_value.get_name, pp10m_value.value);
        return s;
    endfunction

endclass


// Class: clock_ctrl_clk_pp10m_status_reg_cover
// Register coverage object.
class clock_ctrl_clk_pp10m_status_reg_cover extends uvm_object;

    static local clock_ctrl_clk_pp10m_status_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    clock_ctrl_clk_pp10m_status_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        pp10m_value_wr: coverpoint r.pp10m_value.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        pp10m_value_rd: coverpoint r.pp10m_value.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(clock_ctrl_reg_pkg::clock_ctrl_clk_pp10m_status_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="clock_ctrl_clk_pp10m_status_reg_cover");
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
    static function clock_ctrl_clk_pp10m_status_reg_cover get();
        if (m_inst == null) begin
            m_inst = clock_ctrl_clk_pp10m_status_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(clock_ctrl_clk_pp10m_status_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass





// Class: clock_ctrl_reg_block
// Register Block .clock_ctrl: 
class clock_ctrl_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand clock_ctrl_pll_lock_status_reg pll_lock_status;
    rand clock_ctrl_pll_loss_of_lock_status_reg pll_loss_of_lock_status;
    rand clock_ctrl_synce_ctrl_reg synce_ctrl;
    rand clock_ctrl_synce_status_0_reg synce_status_0;
    rand clock_ctrl_synce_status_1_reg synce_status_1;
    rand clock_ctrl_clk_pp10m_ctrl_reg clk_pp10m_ctrl;
    rand clock_ctrl_clk_pp10m_status_reg clk_pp10m_status;

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(clock_ctrl_reg_pkg::clock_ctrl_reg_block)

    // Constructor: new
    function new(string name = "clock_ctrl_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})


        pll_lock_status = clock_ctrl_pll_lock_status_reg::type_id::create("pll_lock_status", , get_full_name());
        pll_loss_of_lock_status = clock_ctrl_pll_loss_of_lock_status_reg::type_id::create("pll_loss_of_lock_status", , get_full_name());
        synce_ctrl = clock_ctrl_synce_ctrl_reg::type_id::create("synce_ctrl", , get_full_name());
        synce_status_0 = clock_ctrl_synce_status_0_reg::type_id::create("synce_status_0", , get_full_name());
        synce_status_1 = clock_ctrl_synce_status_1_reg::type_id::create("synce_status_1", , get_full_name());
        clk_pp10m_ctrl = clock_ctrl_clk_pp10m_ctrl_reg::type_id::create("clk_pp10m_ctrl", , get_full_name());
        clk_pp10m_status = clock_ctrl_clk_pp10m_status_reg::type_id::create("clk_pp10m_status", , get_full_name());

        pll_lock_status.configure(this);
        pll_loss_of_lock_status.configure(this);
        synce_ctrl.configure(this);
        synce_status_0.configure(this);
        synce_status_1.configure(this);
        clk_pp10m_ctrl.configure(this);
        clk_pp10m_status.configure(this);

        pll_lock_status.build();
        pll_loss_of_lock_status.build();
        synce_ctrl.build();
        synce_status_0.build();
        synce_status_1.build();
        clk_pp10m_ctrl.build();
        clk_pp10m_status.build();

        // define default map
        default_map = create_map("clock_ctrl_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        this.default_map.add_reg(pll_lock_status, 'h0, "RO");
        this.default_map.add_reg(pll_loss_of_lock_status, 'h1, "RO");
        this.default_map.add_reg(synce_ctrl, 'h2, "RW");
        this.default_map.add_reg(synce_status_0, 'h3, "RO");
        this.default_map.add_reg(synce_status_1, 'h4, "RO");
        this.default_map.add_reg(clk_pp10m_ctrl, 'h10, "RW");
        this.default_map.add_reg(clk_pp10m_status, 'h11, "RO");

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
        pll_lock_status.enable_coverage(is_on, this.cg_per_instance);
        pll_loss_of_lock_status.enable_coverage(is_on, this.cg_per_instance);
        synce_ctrl.enable_coverage(is_on, this.cg_per_instance);
        synce_status_0.enable_coverage(is_on, this.cg_per_instance);
        synce_status_1.enable_coverage(is_on, this.cg_per_instance);
        clk_pp10m_ctrl.enable_coverage(is_on, this.cg_per_instance);
        clk_pp10m_status.enable_coverage(is_on, this.cg_per_instance);
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