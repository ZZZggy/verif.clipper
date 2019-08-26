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
// Register definitions for pktgen_flowheader register block.
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
// Group: pktgen_flowheader
//---------------------------------------------------------

package pktgen_flowheader_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;

typedef class flow_header_flow_header_reg_cover;

// Class: flow_header_flow_header_reg
// Register flow_header.flow_header: 
class flow_header_flow_header_reg extends uvm_reg;

    // Variable: flow_flag
    // 
    rand uvm_reg_field flow_flag;
    // Variable: flow_data
    // 
    rand uvm_reg_field flow_data;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static flow_header_flow_header_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    flow_header_flow_header_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pktgen_flowheader_reg_pkg::flow_header_flow_header_reg)

    // Constructor: new
    function new(string name = "flow_header_flow_header");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        flow_flag = uvm_reg_field::type_id::create("flow_flag", , get_full_name());
        flow_data = uvm_reg_field::type_id::create("flow_data", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        flow_flag.configure(this, 2, 16, "RW", 0, 'h0, 1, 1, 0);
        flow_data.configure(this, 16, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = flow_header_flow_header_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = flow_header_flow_header_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, flow_flag.get_name, flow_flag.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, flow_data.get_name, flow_data.value);
        return s;
    endfunction

endclass


// Class: flow_header_flow_header_reg_cover
// Register coverage object.
class flow_header_flow_header_reg_cover extends uvm_object;

    static local flow_header_flow_header_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    flow_header_flow_header_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        flow_flag_wr: coverpoint r.flow_flag.value iff (!is_read);
        flow_flag_rd: coverpoint r.flow_flag.value iff  (is_read);
        flow_data_wr: coverpoint r.flow_data.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        flow_data_rd: coverpoint r.flow_data.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(pktgen_flowheader_reg_pkg::flow_header_flow_header_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="flow_header_flow_header_reg_cover");
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
    static function flow_header_flow_header_reg_cover get();
        if (m_inst == null) begin
            m_inst = flow_header_flow_header_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(flow_header_flow_header_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class flow_header_ipv4_options_and_vlans_reg_cover;

// Class: flow_header_ipv4_options_and_vlans_reg
// Register flow_header.ipv4_options_and_vlans: FOR 10Gbps module only, has no effect for 1Gbps
class flow_header_ipv4_options_and_vlans_reg extends uvm_reg;

    // Variable: vlan_stack_size
    // number of VLANs
    rand uvm_reg_field vlan_stack_size;
    // Variable: ip_packet
    //  logic 1 -&gt; layer 3 logic 0 -&gt; layer 2
    rand uvm_reg_field ip_packet;
    // Variable: ipv4_options
    // layer 3 ipv4_options : value 0x0 will set ipv4_options to 0x5 in packet value 0xA will set ipv4_options to 0xF in packet
    rand uvm_reg_field ipv4_options;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static flow_header_ipv4_options_and_vlans_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    flow_header_ipv4_options_and_vlans_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pktgen_flowheader_reg_pkg::flow_header_ipv4_options_and_vlans_reg)

    // Constructor: new
    function new(string name = "flow_header_ipv4_options_and_vlans");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        vlan_stack_size = uvm_reg_field::type_id::create("vlan_stack_size", , get_full_name());
        ip_packet = uvm_reg_field::type_id::create("ip_packet", , get_full_name());
        ipv4_options = uvm_reg_field::type_id::create("ipv4_options", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        vlan_stack_size.configure(this, 2, 0, "RW", 0, 'h0, 1, 1, 0);
        ip_packet.configure(this, 1, 4, "RW", 0, 'h0, 1, 1, 0);
        ipv4_options.configure(this, 4, 8, "RW", 0, 'h0, 1, 1, 0);
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
                cg = flow_header_ipv4_options_and_vlans_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = flow_header_ipv4_options_and_vlans_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, vlan_stack_size.get_name, vlan_stack_size.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, ip_packet.get_name, ip_packet.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, ipv4_options.get_name, ipv4_options.value);
        return s;
    endfunction

endclass


// Class: flow_header_ipv4_options_and_vlans_reg_cover
// Register coverage object.
class flow_header_ipv4_options_and_vlans_reg_cover extends uvm_object;

    static local flow_header_ipv4_options_and_vlans_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    flow_header_ipv4_options_and_vlans_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        vlan_stack_size_wr: coverpoint r.vlan_stack_size.value iff (!is_read);
        vlan_stack_size_rd: coverpoint r.vlan_stack_size.value iff  (is_read);
        ip_packet_wr: coverpoint r.ip_packet.value iff (!is_read);
        ip_packet_rd: coverpoint r.ip_packet.value iff  (is_read);
        ipv4_options_wr: coverpoint r.ipv4_options.value iff (!is_read);
        ipv4_options_rd: coverpoint r.ipv4_options.value iff  (is_read);
    endgroup

    `uvm_object_utils(pktgen_flowheader_reg_pkg::flow_header_ipv4_options_and_vlans_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="flow_header_ipv4_options_and_vlans_reg_cover");
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
    static function flow_header_ipv4_options_and_vlans_reg_cover get();
        if (m_inst == null) begin
            m_inst = flow_header_ipv4_options_and_vlans_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(flow_header_ipv4_options_and_vlans_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class flow_header_checksum_reg_cover;

// Class: flow_header_checksum_reg
// Register flow_header.checksum: FOR 10Gbps module only, has no effect for 1Gbps
class flow_header_checksum_reg extends uvm_reg;

    // Variable: partial_ip_chcksm
    // partial ip checksum with overflow already managed, but NOT TRANSFORMED TO COMPLEMENT ONE NOTATION FPGA will add IP_Total_length to value, transform to complement-1 notation and insert into packet (overflow impossible on FPGA s side because added value is 14 bits)
    rand uvm_reg_field partial_ip_chcksm;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static flow_header_checksum_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    flow_header_checksum_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pktgen_flowheader_reg_pkg::flow_header_checksum_reg)

    // Constructor: new
    function new(string name = "flow_header_checksum");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        partial_ip_chcksm = uvm_reg_field::type_id::create("partial_ip_chcksm", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        partial_ip_chcksm.configure(this, 16, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = flow_header_checksum_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = flow_header_checksum_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, partial_ip_chcksm.get_name, partial_ip_chcksm.value);
        return s;
    endfunction

endclass


// Class: flow_header_checksum_reg_cover
// Register coverage object.
class flow_header_checksum_reg_cover extends uvm_object;

    static local flow_header_checksum_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    flow_header_checksum_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        partial_ip_chcksm_wr: coverpoint r.partial_ip_chcksm.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        partial_ip_chcksm_rd: coverpoint r.partial_ip_chcksm.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(pktgen_flowheader_reg_pkg::flow_header_checksum_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="flow_header_checksum_reg_cover");
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
    static function flow_header_checksum_reg_cover get();
        if (m_inst == null) begin
            m_inst = flow_header_checksum_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(flow_header_checksum_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class flow_header_vid_range_reg_cover;

// Class: flow_header_vid_range_reg
// Register flow_header.vid_range: 
class flow_header_vid_range_reg extends uvm_reg;

    // Variable: vid_range_ena_outer
    // VID range enable for outer VLAN(mutually exclusive with bit 30)
    rand uvm_reg_field vid_range_ena_outer;
    // Variable: vid_range_ena_inner
    // VID range enable for inner VLAN(mutually exclusive with bit 31)
    rand uvm_reg_field vid_range_ena_inner;
    // Variable: vid_range
    // VID range from first value. vid_last = vid_first + vid_range
    rand uvm_reg_field vid_range;
    // Variable: vid_first
    // VID range first (lower) value.
    rand uvm_reg_field vid_first;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static flow_header_vid_range_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    flow_header_vid_range_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(pktgen_flowheader_reg_pkg::flow_header_vid_range_reg)

    // Constructor: new
    function new(string name = "flow_header_vid_range");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        vid_range_ena_outer = uvm_reg_field::type_id::create("vid_range_ena_outer", , get_full_name());
        vid_range_ena_inner = uvm_reg_field::type_id::create("vid_range_ena_inner", , get_full_name());
        vid_range = uvm_reg_field::type_id::create("vid_range", , get_full_name());
        vid_first = uvm_reg_field::type_id::create("vid_first", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        vid_range_ena_outer.configure(this, 1, 31, "RW", 0, 'h0, 1, 1, 0);
        vid_range_ena_inner.configure(this, 1, 30, "RW", 0, 'h0, 1, 1, 0);
        vid_range.configure(this, 12, 16, "RW", 0, 'h0, 1, 1, 0);
        vid_first.configure(this, 12, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = flow_header_vid_range_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = flow_header_vid_range_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, vid_range_ena_outer.get_name, vid_range_ena_outer.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, vid_range_ena_inner.get_name, vid_range_ena_inner.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, vid_range.get_name, vid_range.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, vid_first.get_name, vid_first.value);
        return s;
    endfunction

endclass


// Class: flow_header_vid_range_reg_cover
// Register coverage object.
class flow_header_vid_range_reg_cover extends uvm_object;

    static local flow_header_vid_range_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    flow_header_vid_range_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        vid_range_ena_outer_wr: coverpoint r.vid_range_ena_outer.value iff (!is_read);
        vid_range_ena_outer_rd: coverpoint r.vid_range_ena_outer.value iff  (is_read);
        vid_range_ena_inner_wr: coverpoint r.vid_range_ena_inner.value iff (!is_read);
        vid_range_ena_inner_rd: coverpoint r.vid_range_ena_inner.value iff  (is_read);
        vid_range_wr: coverpoint r.vid_range.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        vid_range_rd: coverpoint r.vid_range.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        vid_first_wr: coverpoint r.vid_first.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        vid_first_rd: coverpoint r.vid_first.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(pktgen_flowheader_reg_pkg::flow_header_vid_range_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="flow_header_vid_range_reg_cover");
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
    static function flow_header_vid_range_reg_cover get();
        if (m_inst == null) begin
            m_inst = flow_header_vid_range_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(flow_header_vid_range_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass





// Class: pktgen_flowheader_reg_block
// Register Block .pktgen_flowheader: 
class pktgen_flowheader_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand flow_header_ipv4_options_and_vlans_reg ipv4_options_and_vlans;
    rand flow_header_checksum_reg checksum;
    rand flow_header_vid_range_reg vid_range;
    rand flow_header_flow_header_reg flow_header[];

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(pktgen_flowheader_reg_pkg::pktgen_flowheader_reg_block)

    // Constructor: new
    function new(string name = "pktgen_flowheader_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        flow_header = new[61];

        ipv4_options_and_vlans = flow_header_ipv4_options_and_vlans_reg::type_id::create("ipv4_options_and_vlans", , get_full_name());
        checksum = flow_header_checksum_reg::type_id::create("checksum", , get_full_name());
        vid_range = flow_header_vid_range_reg::type_id::create("vid_range", , get_full_name());
        foreach(flow_header[m]) begin
            flow_header[m] = flow_header_flow_header_reg::type_id::create($sformatf("flow_header[%0d]",m), , get_full_name());
        end

        ipv4_options_and_vlans.configure(this);
        checksum.configure(this);
        vid_range.configure(this);
        foreach(flow_header[m]) begin
            flow_header[m].configure(this);
        end

        ipv4_options_and_vlans.build();
        checksum.build();
        vid_range.build();
        foreach(flow_header[m]) begin
            flow_header[m].build();
        end

        // define default map
        default_map = create_map("pktgen_flowheader_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        this.default_map.add_reg(ipv4_options_and_vlans, 'h3D, "RW");
        this.default_map.add_reg(checksum, 'h3E, "RW");
        this.default_map.add_reg(vid_range, 'h3F, "RW");
        foreach(flow_header[m]) begin
            this.default_map.add_reg(this.flow_header[m], 'h0 + m, "RW");
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
        ipv4_options_and_vlans.enable_coverage(is_on, this.cg_per_instance);
        checksum.enable_coverage(is_on, this.cg_per_instance);
        vid_range.enable_coverage(is_on, this.cg_per_instance);
        foreach(flow_header[m]) begin
            flow_header[m].enable_coverage(is_on, this.cg_per_instance);
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