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
// Register definitions for pktgen_global register block.
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
// Group: pktgen_global
//---------------------------------------------------------

package pktgen_global_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;

typedef class pktgen_global_pktgen_info_reg_cover;

// Class: pktgen_global_pktgen_info_reg
// Register pktgen_global.pktgen_info: Info describing the architecture of the PktGen
class pktgen_global_pktgen_info_reg extends uvm_reg;

    // Variable: period_value
    // Period used to update credit, in nanosec
    rand uvm_reg_field period_value;
    // Variable: design_type
    // Type of design
    rand uvm_reg_field design_type;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static pktgen_global_pktgen_info_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    pktgen_global_pktgen_info_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pktgen_global_reg_pkg::pktgen_global_pktgen_info_reg)

    // Constructor: new
    function new(string name = "pktgen_global_pktgen_info");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        period_value = uvm_reg_field::type_id::create("period_value", , get_full_name());
        design_type = uvm_reg_field::type_id::create("design_type", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        period_value.configure(this, 9, 0, "RO", 0, 'h0, 1, 1, 0);
        design_type.configure(this, 2, 9, "RO", 0, 'h0, 1, 1, 0);
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
                cg = pktgen_global_pktgen_info_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = pktgen_global_pktgen_info_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, period_value.get_name, period_value.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, design_type.get_name, design_type.value);
        return s;
    endfunction

endclass


// Class: pktgen_global_pktgen_info_reg_cover
// Register coverage object.
class pktgen_global_pktgen_info_reg_cover extends uvm_object;

    static local pktgen_global_pktgen_info_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    pktgen_global_pktgen_info_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        period_value_wr: coverpoint r.period_value.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        period_value_rd: coverpoint r.period_value.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        design_type_wr: coverpoint r.design_type.value iff (!is_read);
        design_type_rd: coverpoint r.design_type.value iff  (is_read);
    endgroup

    `uvm_object_utils(pktgen_global_reg_pkg::pktgen_global_pktgen_info_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="pktgen_global_pktgen_info_reg_cover");
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
    static function pktgen_global_pktgen_info_reg_cover get();
        if (m_inst == null) begin
            m_inst = pktgen_global_pktgen_info_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(pktgen_global_pktgen_info_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class pktgen_global_ena_reg_cover;

// Class: pktgen_global_ena_reg
// Register pktgen_global.ena: general register applied all flows
class pktgen_global_ena_reg extends uvm_reg;

    // Variable: flow_0
    // 
    rand uvm_reg_field flow_0;
    // Variable: flow_1
    // 
    rand uvm_reg_field flow_1;
    // Variable: flow_2
    // 
    rand uvm_reg_field flow_2;
    // Variable: flow_3
    // 
    rand uvm_reg_field flow_3;
    // Variable: compensation
    // Used for shaping, duration and statistics
    rand uvm_reg_field compensation;
    // Variable: flow_4
    // 
    rand uvm_reg_field flow_4;
    // Variable: flow_5
    // 
    rand uvm_reg_field flow_5;
    // Variable: flow_6
    // 
    rand uvm_reg_field flow_6;
    // Variable: flow_7
    // 
    rand uvm_reg_field flow_7;
    // Variable: flow_8
    // 
    rand uvm_reg_field flow_8;
    // Variable: flow_9
    // 
    rand uvm_reg_field flow_9;
    // Variable: flow_10
    // 
    rand uvm_reg_field flow_10;
    // Variable: flow_11
    // 
    rand uvm_reg_field flow_11;
    // Variable: flow_12
    // 
    rand uvm_reg_field flow_12;
    // Variable: flow_13
    // 
    rand uvm_reg_field flow_13;
    // Variable: flow_14
    // 
    rand uvm_reg_field flow_14;
    // Variable: flow_15
    // 
    rand uvm_reg_field flow_15;
    // Variable: upstream_downstream
    // RESERVED for plateforms where applicable (E5GX). Selects either upstream (from port) or downstream (to port).
    rand uvm_reg_field upstream_downstream;
    // Variable: destination
    // RESERVED for plateforms where applicable (not ATS). Selects destination port number
    rand uvm_reg_field destination;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static pktgen_global_ena_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    pktgen_global_ena_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pktgen_global_reg_pkg::pktgen_global_ena_reg)

    // Constructor: new
    function new(string name = "pktgen_global_ena");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        flow_0 = uvm_reg_field::type_id::create("flow_0", , get_full_name());
        flow_1 = uvm_reg_field::type_id::create("flow_1", , get_full_name());
        flow_2 = uvm_reg_field::type_id::create("flow_2", , get_full_name());
        flow_3 = uvm_reg_field::type_id::create("flow_3", , get_full_name());
        compensation = uvm_reg_field::type_id::create("compensation", , get_full_name());
        flow_4 = uvm_reg_field::type_id::create("flow_4", , get_full_name());
        flow_5 = uvm_reg_field::type_id::create("flow_5", , get_full_name());
        flow_6 = uvm_reg_field::type_id::create("flow_6", , get_full_name());
        flow_7 = uvm_reg_field::type_id::create("flow_7", , get_full_name());
        flow_8 = uvm_reg_field::type_id::create("flow_8", , get_full_name());
        flow_9 = uvm_reg_field::type_id::create("flow_9", , get_full_name());
        flow_10 = uvm_reg_field::type_id::create("flow_10", , get_full_name());
        flow_11 = uvm_reg_field::type_id::create("flow_11", , get_full_name());
        flow_12 = uvm_reg_field::type_id::create("flow_12", , get_full_name());
        flow_13 = uvm_reg_field::type_id::create("flow_13", , get_full_name());
        flow_14 = uvm_reg_field::type_id::create("flow_14", , get_full_name());
        flow_15 = uvm_reg_field::type_id::create("flow_15", , get_full_name());
        upstream_downstream = uvm_reg_field::type_id::create("upstream_downstream", , get_full_name());
        destination = uvm_reg_field::type_id::create("destination", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        flow_0.configure(this, 1, 0, "RW", 0, 'h0, 1, 1, 0);
        flow_1.configure(this, 1, 1, "RW", 0, 'h0, 1, 1, 0);
        flow_2.configure(this, 1, 2, "RW", 0, 'h0, 1, 1, 0);
        flow_3.configure(this, 1, 3, "RW", 0, 'h0, 1, 1, 0);
        compensation.configure(this, 5, 4, "RW", 0, 'h0, 1, 1, 0);
        flow_4.configure(this, 1, 9, "RW", 0, 'h0, 1, 1, 0);
        flow_5.configure(this, 1, 10, "RW", 0, 'h0, 1, 1, 0);
        flow_6.configure(this, 1, 11, "RW", 0, 'h0, 1, 1, 0);
        flow_7.configure(this, 1, 12, "RW", 0, 'h0, 1, 1, 0);
        flow_8.configure(this, 1, 13, "RW", 0, 'h0, 1, 1, 0);
        flow_9.configure(this, 1, 14, "RW", 0, 'h0, 1, 1, 0);
        flow_10.configure(this, 1, 15, "RW", 0, 'h0, 1, 1, 0);
        flow_11.configure(this, 1, 18, "RW", 0, 'h0, 1, 1, 0);
        flow_12.configure(this, 1, 19, "RW", 0, 'h0, 1, 1, 0);
        flow_13.configure(this, 1, 20, "RW", 0, 'h0, 1, 1, 0);
        flow_14.configure(this, 1, 21, "RW", 0, 'h0, 1, 1, 0);
        flow_15.configure(this, 1, 22, "RW", 0, 'h0, 1, 1, 0);
        upstream_downstream.configure(this, 1, 24, "RW", 0, 'h0, 1, 1, 0);
        destination.configure(this, 4, 25, "RW", 0, 'h0, 1, 1, 0);
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
                cg = pktgen_global_ena_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = pktgen_global_ena_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, flow_0.get_name, flow_0.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, flow_1.get_name, flow_1.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, flow_2.get_name, flow_2.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, flow_3.get_name, flow_3.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, compensation.get_name, compensation.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, flow_4.get_name, flow_4.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, flow_5.get_name, flow_5.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, flow_6.get_name, flow_6.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, flow_7.get_name, flow_7.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, flow_8.get_name, flow_8.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, flow_9.get_name, flow_9.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, flow_10.get_name, flow_10.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, flow_11.get_name, flow_11.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, flow_12.get_name, flow_12.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, flow_13.get_name, flow_13.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, flow_14.get_name, flow_14.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, flow_15.get_name, flow_15.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, upstream_downstream.get_name, upstream_downstream.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, destination.get_name, destination.value);
        return s;
    endfunction

endclass


// Class: pktgen_global_ena_reg_cover
// Register coverage object.
class pktgen_global_ena_reg_cover extends uvm_object;

    static local pktgen_global_ena_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    pktgen_global_ena_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        flow_0_wr: coverpoint r.flow_0.value iff (!is_read);
        flow_0_rd: coverpoint r.flow_0.value iff  (is_read);
        flow_1_wr: coverpoint r.flow_1.value iff (!is_read);
        flow_1_rd: coverpoint r.flow_1.value iff  (is_read);
        flow_2_wr: coverpoint r.flow_2.value iff (!is_read);
        flow_2_rd: coverpoint r.flow_2.value iff  (is_read);
        flow_3_wr: coverpoint r.flow_3.value iff (!is_read);
        flow_3_rd: coverpoint r.flow_3.value iff  (is_read);
        compensation_wr: coverpoint r.compensation.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        compensation_rd: coverpoint r.compensation.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        flow_4_wr: coverpoint r.flow_4.value iff (!is_read);
        flow_4_rd: coverpoint r.flow_4.value iff  (is_read);
        flow_5_wr: coverpoint r.flow_5.value iff (!is_read);
        flow_5_rd: coverpoint r.flow_5.value iff  (is_read);
        flow_6_wr: coverpoint r.flow_6.value iff (!is_read);
        flow_6_rd: coverpoint r.flow_6.value iff  (is_read);
        flow_7_wr: coverpoint r.flow_7.value iff (!is_read);
        flow_7_rd: coverpoint r.flow_7.value iff  (is_read);
        flow_8_wr: coverpoint r.flow_8.value iff (!is_read);
        flow_8_rd: coverpoint r.flow_8.value iff  (is_read);
        flow_9_wr: coverpoint r.flow_9.value iff (!is_read);
        flow_9_rd: coverpoint r.flow_9.value iff  (is_read);
        flow_10_wr: coverpoint r.flow_10.value iff (!is_read);
        flow_10_rd: coverpoint r.flow_10.value iff  (is_read);
        flow_11_wr: coverpoint r.flow_11.value iff (!is_read);
        flow_11_rd: coverpoint r.flow_11.value iff  (is_read);
        flow_12_wr: coverpoint r.flow_12.value iff (!is_read);
        flow_12_rd: coverpoint r.flow_12.value iff  (is_read);
        flow_13_wr: coverpoint r.flow_13.value iff (!is_read);
        flow_13_rd: coverpoint r.flow_13.value iff  (is_read);
        flow_14_wr: coverpoint r.flow_14.value iff (!is_read);
        flow_14_rd: coverpoint r.flow_14.value iff  (is_read);
        flow_15_wr: coverpoint r.flow_15.value iff (!is_read);
        flow_15_rd: coverpoint r.flow_15.value iff  (is_read);
        upstream_downstream_wr: coverpoint r.upstream_downstream.value iff (!is_read);
        upstream_downstream_rd: coverpoint r.upstream_downstream.value iff  (is_read);
        destination_wr: coverpoint r.destination.value iff (!is_read);
        destination_rd: coverpoint r.destination.value iff  (is_read);
    endgroup

    `uvm_object_utils(pktgen_global_reg_pkg::pktgen_global_ena_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="pktgen_global_ena_reg_cover");
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
    static function pktgen_global_ena_reg_cover get();
        if (m_inst == null) begin
            m_inst = pktgen_global_ena_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(pktgen_global_ena_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass





// Class: pktgen_global_reg_block
// Register Block .pktgen_global: 
class pktgen_global_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand pktgen_global_pktgen_info_reg pktgen_info;
    rand pktgen_global_ena_reg ena;

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(pktgen_global_reg_pkg::pktgen_global_reg_block)

    // Constructor: new
    function new(string name = "pktgen_global_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})


        pktgen_info = pktgen_global_pktgen_info_reg::type_id::create("pktgen_info", , get_full_name());
        ena = pktgen_global_ena_reg::type_id::create("ena", , get_full_name());

        pktgen_info.configure(this);
        ena.configure(this);

        pktgen_info.build();
        ena.build();

        // define default map
        default_map = create_map("pktgen_global_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        this.default_map.add_reg(pktgen_info, 'h0, "RO");
        this.default_map.add_reg(ena, 'hFF, "RW");

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
        pktgen_info.enable_coverage(is_on, this.cg_per_instance);
        ena.enable_coverage(is_on, this.cg_per_instance);
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