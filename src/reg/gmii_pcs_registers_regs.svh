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
// Register definitions for gmii_pcs_registers register block.
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
// Group: gmii_pcs_registers
//---------------------------------------------------------

package gmii_pcs_registers_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;

typedef class gmii_pcs_registers_an_ctrl_reg_cover;

// Class: gmii_pcs_registers_an_ctrl_reg
// Register gmii_pcs_registers.an_ctrl: 
class gmii_pcs_registers_an_ctrl_reg extends uvm_reg;

    // Variable: restart_auto_negotiation
    // set this bit to 1 to restart the clause 37 auto-negotiation sequence. for normal operation, set this bit to 0 which is the default value. this bit is self-clearing.
    rand uvm_reg_field restart_auto_negotiation;
    // Variable: auto_negotiation_enable
    // set this bit to 1 to enable clause 37 auto-negotiation. the default value is 1.
    rand uvm_reg_field auto_negotiation_enable;
    // Variable: reset
    // set this bit to 1 to generate a synchronous reset pulse which resets all the pcs state machines, comma detection function, and the 8b/10b encoder and decoder. for normal operation, set this bit to 0. this bit self clears.
    rand uvm_reg_field reset;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static gmii_pcs_registers_an_ctrl_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    gmii_pcs_registers_an_ctrl_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(gmii_pcs_registers_reg_pkg::gmii_pcs_registers_an_ctrl_reg)

    // Constructor: new
    function new(string name = "gmii_pcs_registers_an_ctrl");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        restart_auto_negotiation = uvm_reg_field::type_id::create("restart_auto_negotiation", , get_full_name());
        auto_negotiation_enable = uvm_reg_field::type_id::create("auto_negotiation_enable", , get_full_name());
        reset = uvm_reg_field::type_id::create("reset", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        restart_auto_negotiation.configure(this, 1, 9, "RW", 0, 'h0, 1, 1, 0);
        auto_negotiation_enable.configure(this, 1, 12, "RW", 0, 'h0, 1, 1, 0);
        reset.configure(this, 1, 15, "RW", 0, 'h0, 1, 1, 0);
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
                cg = gmii_pcs_registers_an_ctrl_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = gmii_pcs_registers_an_ctrl_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, restart_auto_negotiation.get_name, restart_auto_negotiation.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, auto_negotiation_enable.get_name, auto_negotiation_enable.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, reset.get_name, reset.value);
        return s;
    endfunction

endclass


// Class: gmii_pcs_registers_an_ctrl_reg_cover
// Register coverage object.
class gmii_pcs_registers_an_ctrl_reg_cover extends uvm_object;

    static local gmii_pcs_registers_an_ctrl_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    gmii_pcs_registers_an_ctrl_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        restart_auto_negotiation_wr: coverpoint r.restart_auto_negotiation.value iff (!is_read);
        restart_auto_negotiation_rd: coverpoint r.restart_auto_negotiation.value iff  (is_read);
        auto_negotiation_enable_wr: coverpoint r.auto_negotiation_enable.value iff (!is_read);
        auto_negotiation_enable_rd: coverpoint r.auto_negotiation_enable.value iff  (is_read);
        reset_wr: coverpoint r.reset.value iff (!is_read);
        reset_rd: coverpoint r.reset.value iff  (is_read);
    endgroup

    `uvm_object_utils(gmii_pcs_registers_reg_pkg::gmii_pcs_registers_an_ctrl_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="gmii_pcs_registers_an_ctrl_reg_cover");
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
    static function gmii_pcs_registers_an_ctrl_reg_cover get();
        if (m_inst == null) begin
            m_inst = gmii_pcs_registers_an_ctrl_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(gmii_pcs_registers_an_ctrl_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class gmii_pcs_registers_an_status_reg_cover;

// Class: gmii_pcs_registers_an_status_reg
// Register gmii_pcs_registers.an_status: 
class gmii_pcs_registers_an_status_reg extends uvm_reg;

    // Variable: link_status
    // a value of 1 indicates that a valid link is operating. a value of 0 indicates an invalid link. if link synchronization is lost, this bit is 0.
    rand uvm_reg_field link_status;
    // Variable: auto_negociation_ability
    // a value of 1 indicates that the pcs function supports clause 37 auto-negotiation.
    rand uvm_reg_field auto_negociation_ability;
    // Variable: auto_negotiation_complete
    // a value of 1 indicates the following status: the auto-negotiation process is complete. and the auto-negotiation control registers are valid.
    rand uvm_reg_field auto_negotiation_complete;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static gmii_pcs_registers_an_status_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    gmii_pcs_registers_an_status_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(gmii_pcs_registers_reg_pkg::gmii_pcs_registers_an_status_reg)

    // Constructor: new
    function new(string name = "gmii_pcs_registers_an_status");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        link_status = uvm_reg_field::type_id::create("link_status", , get_full_name());
        auto_negociation_ability = uvm_reg_field::type_id::create("auto_negociation_ability", , get_full_name());
        auto_negotiation_complete = uvm_reg_field::type_id::create("auto_negotiation_complete", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        link_status.configure(this, 1, 2, "RO", 0, 'h0, 1, 1, 0);
        auto_negociation_ability.configure(this, 1, 3, "RO", 0, 'h0, 1, 1, 0);
        auto_negotiation_complete.configure(this, 1, 5, "RO", 0, 'h0, 1, 1, 0);
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
                cg = gmii_pcs_registers_an_status_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = gmii_pcs_registers_an_status_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, link_status.get_name, link_status.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, auto_negociation_ability.get_name, auto_negociation_ability.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, auto_negotiation_complete.get_name, auto_negotiation_complete.value);
        return s;
    endfunction

endclass


// Class: gmii_pcs_registers_an_status_reg_cover
// Register coverage object.
class gmii_pcs_registers_an_status_reg_cover extends uvm_object;

    static local gmii_pcs_registers_an_status_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    gmii_pcs_registers_an_status_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        link_status_wr: coverpoint r.link_status.value iff (!is_read);
        link_status_rd: coverpoint r.link_status.value iff  (is_read);
        auto_negociation_ability_wr: coverpoint r.auto_negociation_ability.value iff (!is_read);
        auto_negociation_ability_rd: coverpoint r.auto_negociation_ability.value iff  (is_read);
        auto_negotiation_complete_wr: coverpoint r.auto_negotiation_complete.value iff (!is_read);
        auto_negotiation_complete_rd: coverpoint r.auto_negotiation_complete.value iff  (is_read);
    endgroup

    `uvm_object_utils(gmii_pcs_registers_reg_pkg::gmii_pcs_registers_an_status_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="gmii_pcs_registers_an_status_reg_cover");
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
    static function gmii_pcs_registers_an_status_reg_cover get();
        if (m_inst == null) begin
            m_inst = gmii_pcs_registers_an_status_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(gmii_pcs_registers_an_status_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class gmii_pcs_registers_gmii_ctrl_reg_cover;

// Class: gmii_pcs_registers_gmii_ctrl_reg
// Register gmii_pcs_registers.gmii_ctrl: 
class gmii_pcs_registers_gmii_ctrl_reg extends uvm_reg;

    // Variable: fd
    // Full-duplex mode enable for the local device. Set to 1 for full-duplex support.
    rand uvm_reg_field fd;
    // Variable: hd
    // Half-duplex mode enable for the local device. Set to 1 for half-duplex support. This bit should always be set to 0.
    rand uvm_reg_field hd;
    // Variable: ps2_ps1
    // Pause support for local device. The following encodings are defined for PS1/PS2:
    rand uvm_reg_field ps2_ps1;
    // Variable: rf2_rf1
    // Remote fault condition for local device. The following encodings are defined for RF1/RF2:
    rand uvm_reg_field rf2_rf1;
    // Variable: ack
    // Acknowledge for local device. A value of 1 indicates that the device has received three consecutive matching ability values from its link partner.
    rand uvm_reg_field ack;
    // Variable: np
    // Next page. In the device ability register, this bit is always set to 0.
    rand uvm_reg_field np;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static gmii_pcs_registers_gmii_ctrl_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    gmii_pcs_registers_gmii_ctrl_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(gmii_pcs_registers_reg_pkg::gmii_pcs_registers_gmii_ctrl_reg)

    // Constructor: new
    function new(string name = "gmii_pcs_registers_gmii_ctrl");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        fd = uvm_reg_field::type_id::create("fd", , get_full_name());
        hd = uvm_reg_field::type_id::create("hd", , get_full_name());
        ps2_ps1 = uvm_reg_field::type_id::create("ps2_ps1", , get_full_name());
        rf2_rf1 = uvm_reg_field::type_id::create("rf2_rf1", , get_full_name());
        ack = uvm_reg_field::type_id::create("ack", , get_full_name());
        np = uvm_reg_field::type_id::create("np", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        fd.configure(this, 1, 5, "rw", 0, 'h0, 1, 1, 0);
        hd.configure(this, 1, 6, "rw", 0, 'h0, 1, 1, 0);
        ps2_ps1.configure(this, 2, 7, "rw", 0, 'h0, 1, 1, 0);
        rf2_rf1.configure(this, 2, 12, "rw", 0, 'h0, 1, 1, 0);
        ack.configure(this, 1, 14, "ro", 0, 'h0, 1, 1, 0);
        np.configure(this, 1, 15, "rw", 0, 'h0, 1, 1, 0);
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
                cg = gmii_pcs_registers_gmii_ctrl_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = gmii_pcs_registers_gmii_ctrl_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, fd.get_name, fd.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, hd.get_name, hd.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, ps2_ps1.get_name, ps2_ps1.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, rf2_rf1.get_name, rf2_rf1.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, ack.get_name, ack.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, np.get_name, np.value);
        return s;
    endfunction

endclass


// Class: gmii_pcs_registers_gmii_ctrl_reg_cover
// Register coverage object.
class gmii_pcs_registers_gmii_ctrl_reg_cover extends uvm_object;

    static local gmii_pcs_registers_gmii_ctrl_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    gmii_pcs_registers_gmii_ctrl_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        fd_wr: coverpoint r.fd.value iff (!is_read);
        fd_rd: coverpoint r.fd.value iff  (is_read);
        hd_wr: coverpoint r.hd.value iff (!is_read);
        hd_rd: coverpoint r.hd.value iff  (is_read);
        ps2_ps1_wr: coverpoint r.ps2_ps1.value iff (!is_read);
        ps2_ps1_rd: coverpoint r.ps2_ps1.value iff  (is_read);
        rf2_rf1_wr: coverpoint r.rf2_rf1.value iff (!is_read);
        rf2_rf1_rd: coverpoint r.rf2_rf1.value iff  (is_read);
        ack_wr: coverpoint r.ack.value iff (!is_read);
        ack_rd: coverpoint r.ack.value iff  (is_read);
        np_wr: coverpoint r.np.value iff (!is_read);
        np_rd: coverpoint r.np.value iff  (is_read);
    endgroup

    `uvm_object_utils(gmii_pcs_registers_reg_pkg::gmii_pcs_registers_gmii_ctrl_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="gmii_pcs_registers_gmii_ctrl_reg_cover");
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
    static function gmii_pcs_registers_gmii_ctrl_reg_cover get();
        if (m_inst == null) begin
            m_inst = gmii_pcs_registers_gmii_ctrl_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(gmii_pcs_registers_gmii_ctrl_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class gmii_pcs_registers_gmii_status1_reg_cover;

// Class: gmii_pcs_registers_gmii_status1_reg
// Register gmii_pcs_registers.gmii_status1: 
class gmii_pcs_registers_gmii_status1_reg extends uvm_reg;

    // Variable: fd
    // Full-duplex mode enable for the link partner. This bit should always be 1 because only full duplex is supported.
    rand uvm_reg_field fd;
    // Variable: hd
    // Half-duplex mode enable for the link partner. A value of 1 indicates support for half duplex. This bit should always be 0 because half-duplex mode is not supported.
    rand uvm_reg_field hd;
    // Variable: ps2_ps1
    // Specifies pause support for link partner. The following encodings are defined for PS1/PS2:
    rand uvm_reg_field ps2_ps1;
    // Variable: rf2_rf1
    // Remote fault condition for link partner. The following encodings are defined for RF1/RF2:
    rand uvm_reg_field rf2_rf1;
    // Variable: ack
    // Acknowledge for link partner. A value of 1 indicates that the device has received three consecutive matching ability values from its link partner.
    rand uvm_reg_field ack;
    // Variable: np
    // Next page. In link partner register. When set to 0, the link partner has a Next Page to send. When set to 1, the link partner does not a Next Page. Next Page is not supported in Auto Negotiation.
    rand uvm_reg_field np;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static gmii_pcs_registers_gmii_status1_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    gmii_pcs_registers_gmii_status1_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(gmii_pcs_registers_reg_pkg::gmii_pcs_registers_gmii_status1_reg)

    // Constructor: new
    function new(string name = "gmii_pcs_registers_gmii_status1");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        fd = uvm_reg_field::type_id::create("fd", , get_full_name());
        hd = uvm_reg_field::type_id::create("hd", , get_full_name());
        ps2_ps1 = uvm_reg_field::type_id::create("ps2_ps1", , get_full_name());
        rf2_rf1 = uvm_reg_field::type_id::create("rf2_rf1", , get_full_name());
        ack = uvm_reg_field::type_id::create("ack", , get_full_name());
        np = uvm_reg_field::type_id::create("np", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        fd.configure(this, 1, 5, "ro", 0, 'h0, 1, 1, 0);
        hd.configure(this, 1, 6, "ro", 0, 'h0, 1, 1, 0);
        ps2_ps1.configure(this, 2, 7, "ro", 0, 'h0, 1, 1, 0);
        rf2_rf1.configure(this, 2, 12, "ro", 0, 'h0, 1, 1, 0);
        ack.configure(this, 1, 14, "ro", 0, 'h0, 1, 1, 0);
        np.configure(this, 1, 15, "ro", 0, 'h0, 1, 1, 0);
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
                cg = gmii_pcs_registers_gmii_status1_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = gmii_pcs_registers_gmii_status1_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, fd.get_name, fd.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, hd.get_name, hd.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, ps2_ps1.get_name, ps2_ps1.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, rf2_rf1.get_name, rf2_rf1.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, ack.get_name, ack.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, np.get_name, np.value);
        return s;
    endfunction

endclass


// Class: gmii_pcs_registers_gmii_status1_reg_cover
// Register coverage object.
class gmii_pcs_registers_gmii_status1_reg_cover extends uvm_object;

    static local gmii_pcs_registers_gmii_status1_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    gmii_pcs_registers_gmii_status1_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        fd_wr: coverpoint r.fd.value iff (!is_read);
        fd_rd: coverpoint r.fd.value iff  (is_read);
        hd_wr: coverpoint r.hd.value iff (!is_read);
        hd_rd: coverpoint r.hd.value iff  (is_read);
        ps2_ps1_wr: coverpoint r.ps2_ps1.value iff (!is_read);
        ps2_ps1_rd: coverpoint r.ps2_ps1.value iff  (is_read);
        rf2_rf1_wr: coverpoint r.rf2_rf1.value iff (!is_read);
        rf2_rf1_rd: coverpoint r.rf2_rf1.value iff  (is_read);
        ack_wr: coverpoint r.ack.value iff (!is_read);
        ack_rd: coverpoint r.ack.value iff  (is_read);
        np_wr: coverpoint r.np.value iff (!is_read);
        np_rd: coverpoint r.np.value iff  (is_read);
    endgroup

    `uvm_object_utils(gmii_pcs_registers_reg_pkg::gmii_pcs_registers_gmii_status1_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="gmii_pcs_registers_gmii_status1_reg_cover");
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
    static function gmii_pcs_registers_gmii_status1_reg_cover get();
        if (m_inst == null) begin
            m_inst = gmii_pcs_registers_gmii_status1_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(gmii_pcs_registers_gmii_status1_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class gmii_pcs_registers_gmii_status2_reg_cover;

// Class: gmii_pcs_registers_gmii_status2_reg
// Register gmii_pcs_registers.gmii_status2: 
class gmii_pcs_registers_gmii_status2_reg extends uvm_reg;

    // Variable: link_partner_auto_negotiation_able
    // Set set to 1, indicates that the link partner supports auto negotiation. The default value is 0.
    rand uvm_reg_field link_partner_auto_negotiation_able;
    // Variable: page_receive
    // A value of 1 indicates that a new page has been received with new partner ability available in the register partner ability. The default value is 0 when the system management agent performs a read access.
    rand uvm_reg_field page_receive;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static gmii_pcs_registers_gmii_status2_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    gmii_pcs_registers_gmii_status2_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(gmii_pcs_registers_reg_pkg::gmii_pcs_registers_gmii_status2_reg)

    // Constructor: new
    function new(string name = "gmii_pcs_registers_gmii_status2");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        link_partner_auto_negotiation_able = uvm_reg_field::type_id::create("link_partner_auto_negotiation_able", , get_full_name());
        page_receive = uvm_reg_field::type_id::create("page_receive", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        link_partner_auto_negotiation_able.configure(this, 1, 0, "RO", 0, 'h0, 1, 1, 0);
        page_receive.configure(this, 1, 1, "RO", 0, 'h0, 1, 1, 0);
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
                cg = gmii_pcs_registers_gmii_status2_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = gmii_pcs_registers_gmii_status2_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, link_partner_auto_negotiation_able.get_name, link_partner_auto_negotiation_able.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, page_receive.get_name, page_receive.value);
        return s;
    endfunction

endclass


// Class: gmii_pcs_registers_gmii_status2_reg_cover
// Register coverage object.
class gmii_pcs_registers_gmii_status2_reg_cover extends uvm_object;

    static local gmii_pcs_registers_gmii_status2_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    gmii_pcs_registers_gmii_status2_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        link_partner_auto_negotiation_able_wr: coverpoint r.link_partner_auto_negotiation_able.value iff (!is_read);
        link_partner_auto_negotiation_able_rd: coverpoint r.link_partner_auto_negotiation_able.value iff  (is_read);
        page_receive_wr: coverpoint r.page_receive.value iff (!is_read);
        page_receive_rd: coverpoint r.page_receive.value iff  (is_read);
    endgroup

    `uvm_object_utils(gmii_pcs_registers_reg_pkg::gmii_pcs_registers_gmii_status2_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="gmii_pcs_registers_gmii_status2_reg_cover");
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
    static function gmii_pcs_registers_gmii_status2_reg_cover get();
        if (m_inst == null) begin
            m_inst = gmii_pcs_registers_gmii_status2_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(gmii_pcs_registers_gmii_status2_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass





// Class: gmii_pcs_registers_reg_block
// Register Block .gmii_pcs_registers: 
class gmii_pcs_registers_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand gmii_pcs_registers_an_ctrl_reg an_ctrl;
    rand gmii_pcs_registers_an_status_reg an_status;
    rand gmii_pcs_registers_gmii_ctrl_reg gmii_ctrl;
    rand gmii_pcs_registers_gmii_status1_reg gmii_status1;
    rand gmii_pcs_registers_gmii_status2_reg gmii_status2;

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(gmii_pcs_registers_reg_pkg::gmii_pcs_registers_reg_block)

    // Constructor: new
    function new(string name = "gmii_pcs_registers_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})


        an_ctrl = gmii_pcs_registers_an_ctrl_reg::type_id::create("an_ctrl", , get_full_name());
        an_status = gmii_pcs_registers_an_status_reg::type_id::create("an_status", , get_full_name());
        gmii_ctrl = gmii_pcs_registers_gmii_ctrl_reg::type_id::create("gmii_ctrl", , get_full_name());
        gmii_status1 = gmii_pcs_registers_gmii_status1_reg::type_id::create("gmii_status1", , get_full_name());
        gmii_status2 = gmii_pcs_registers_gmii_status2_reg::type_id::create("gmii_status2", , get_full_name());

        an_ctrl.configure(this);
        an_status.configure(this);
        gmii_ctrl.configure(this);
        gmii_status1.configure(this);
        gmii_status2.configure(this);

        an_ctrl.build();
        an_status.build();
        gmii_ctrl.build();
        gmii_status1.build();
        gmii_status2.build();

        // define default map
        default_map = create_map("gmii_pcs_registers_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        this.default_map.add_reg(an_ctrl, 'h90, "RW");
        this.default_map.add_reg(an_status, 'h91, "RO");
        this.default_map.add_reg(gmii_ctrl, 'h94, "RW");
        this.default_map.add_reg(gmii_status1, 'h95, "RO");
        this.default_map.add_reg(gmii_status2, 'h96, "RO");

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
        an_ctrl.enable_coverage(is_on, this.cg_per_instance);
        an_status.enable_coverage(is_on, this.cg_per_instance);
        gmii_ctrl.enable_coverage(is_on, this.cg_per_instance);
        gmii_status1.enable_coverage(is_on, this.cg_per_instance);
        gmii_status2.enable_coverage(is_on, this.cg_per_instance);
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