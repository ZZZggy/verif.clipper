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
// Register definitions for tse_mac_rx register block.
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
// Group: tse_mac_rx
//---------------------------------------------------------

package tse_mac_rx_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;

typedef class rx_cfg_reg_cover;

// Class: rx_cfg_reg
// Register rx.cfg: RX Configuration register
class rx_cfg_reg extends uvm_reg;

    // Variable: mac_en
    // RX MAC Enable. This field is read only for the CPU tse_mac (read value is 1).
    rand uvm_reg_field mac_en;
    // Variable: flow_ctrl_en
    // RX processes pause frames
    rand uvm_reg_field flow_ctrl_en;
    // Variable: pause_fwd_en
    // RX Forward pause frames to the client application
    rand uvm_reg_field pause_fwd_en;
    // Variable: keep_fcs
    // Keep the FCS appended at the end of the frame. This field is read only for the CPU tse_mac (read value is 0).
    rand uvm_reg_field keep_fcs;
    // Variable: mru
    // RX Maximum Receive Unit (bytes) including Ethernet header and FCS. Default to 1518 bytes. Minimum writable value for the CPU tse_mac is 1518 (any value less than 1518 is automaticaly changed to 1518).
    rand uvm_reg_field mru;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static rx_cfg_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    rx_cfg_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tse_mac_rx_reg_pkg::rx_cfg_reg)

    // Constructor: new
    function new(string name = "rx_cfg");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        mac_en = uvm_reg_field::type_id::create("mac_en", , get_full_name());
        flow_ctrl_en = uvm_reg_field::type_id::create("flow_ctrl_en", , get_full_name());
        pause_fwd_en = uvm_reg_field::type_id::create("pause_fwd_en", , get_full_name());
        keep_fcs = uvm_reg_field::type_id::create("keep_fcs", , get_full_name());
        mru = uvm_reg_field::type_id::create("mru", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        mac_en.configure(this, 1, 0, "RW", 0, 'h0, 1, 1, 0);
        flow_ctrl_en.configure(this, 1, 1, "RW", 0, 'h1, 1, 1, 0);
        pause_fwd_en.configure(this, 1, 2, "RW", 0, 'h0, 1, 1, 0);
        keep_fcs.configure(this, 1, 7, "RW", 0, 'h0, 1, 1, 0);
        mru.configure(this, 14, 16, "RW", 0, 'h5EE, 1, 1, 0);
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
                cg = rx_cfg_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = rx_cfg_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, mac_en.get_name, mac_en.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, flow_ctrl_en.get_name, flow_ctrl_en.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, pause_fwd_en.get_name, pause_fwd_en.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, keep_fcs.get_name, keep_fcs.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, mru.get_name, mru.value);
        return s;
    endfunction

endclass


// Class: rx_cfg_reg_cover
// Register coverage object.
class rx_cfg_reg_cover extends uvm_object;

    static local rx_cfg_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    rx_cfg_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        mac_en_wr: coverpoint r.mac_en.value iff (!is_read);
        mac_en_rd: coverpoint r.mac_en.value iff  (is_read);
        flow_ctrl_en_wr: coverpoint r.flow_ctrl_en.value iff (!is_read);
        flow_ctrl_en_rd: coverpoint r.flow_ctrl_en.value iff  (is_read);
        pause_fwd_en_wr: coverpoint r.pause_fwd_en.value iff (!is_read);
        pause_fwd_en_rd: coverpoint r.pause_fwd_en.value iff  (is_read);
        keep_fcs_wr: coverpoint r.keep_fcs.value iff (!is_read);
        keep_fcs_rd: coverpoint r.keep_fcs.value iff  (is_read);
        mru_wr: coverpoint r.mru.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        mru_rd: coverpoint r.mru.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(tse_mac_rx_reg_pkg::rx_cfg_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="rx_cfg_reg_cover");
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
    static function rx_cfg_reg_cover get();
        if (m_inst == null) begin
            m_inst = rx_cfg_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(rx_cfg_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class rx_vlan_2nd_cfg_reg_cover;

// Class: rx_vlan_2nd_cfg_reg
// Register rx.vlan_2nd_cfg: RX Second VLAN Ethertype
class rx_vlan_2nd_cfg_reg extends uvm_reg;

    // Variable: vlan_9100_en
    // RX value of the second VLAN 0x9100 enable.
    rand uvm_reg_field vlan_9100_en;
    // Variable: vlan_88a8_en
    // RX value of the second VLAN 0x88A8 enable.
    rand uvm_reg_field vlan_88a8_en;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static rx_vlan_2nd_cfg_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    rx_vlan_2nd_cfg_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tse_mac_rx_reg_pkg::rx_vlan_2nd_cfg_reg)

    // Constructor: new
    function new(string name = "rx_vlan_2nd_cfg");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        vlan_9100_en = uvm_reg_field::type_id::create("vlan_9100_en", , get_full_name());
        vlan_88a8_en = uvm_reg_field::type_id::create("vlan_88a8_en", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        vlan_9100_en.configure(this, 1, 17, "RW", 0, 'h0, 1, 1, 0);
        vlan_88a8_en.configure(this, 1, 18, "RW", 0, 'h0, 1, 1, 0);
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
                cg = rx_vlan_2nd_cfg_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = rx_vlan_2nd_cfg_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, vlan_9100_en.get_name, vlan_9100_en.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, vlan_88a8_en.get_name, vlan_88a8_en.value);
        return s;
    endfunction

endclass


// Class: rx_vlan_2nd_cfg_reg_cover
// Register coverage object.
class rx_vlan_2nd_cfg_reg_cover extends uvm_object;

    static local rx_vlan_2nd_cfg_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    rx_vlan_2nd_cfg_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        vlan_9100_en_wr: coverpoint r.vlan_9100_en.value iff (!is_read);
        vlan_9100_en_rd: coverpoint r.vlan_9100_en.value iff  (is_read);
        vlan_88a8_en_wr: coverpoint r.vlan_88a8_en.value iff (!is_read);
        vlan_88a8_en_rd: coverpoint r.vlan_88a8_en.value iff  (is_read);
    endgroup

    `uvm_object_utils(tse_mac_rx_reg_pkg::rx_vlan_2nd_cfg_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="rx_vlan_2nd_cfg_reg_cover");
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
    static function rx_vlan_2nd_cfg_reg_cover get();
        if (m_inst == null) begin
            m_inst = rx_vlan_2nd_cfg_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(rx_vlan_2nd_cfg_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class rx_large_thresh_reg_cover;

// Class: rx_large_thresh_reg
// Register rx.large_thresh: RX Large frame size Threshold
class rx_large_thresh_reg extends uvm_reg;

    // Variable: large_thresh
    // RX Frame size to compare against (greater or equal) and increment dedicated statistics counter.
    rand uvm_reg_field large_thresh;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static rx_large_thresh_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    rx_large_thresh_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(tse_mac_rx_reg_pkg::rx_large_thresh_reg)

    // Constructor: new
    function new(string name = "rx_large_thresh");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        large_thresh = uvm_reg_field::type_id::create("large_thresh", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        large_thresh.configure(this, 14, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = rx_large_thresh_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = rx_large_thresh_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, large_thresh.get_name, large_thresh.value);
        return s;
    endfunction

endclass


// Class: rx_large_thresh_reg_cover
// Register coverage object.
class rx_large_thresh_reg_cover extends uvm_object;

    static local rx_large_thresh_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    rx_large_thresh_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        large_thresh_wr: coverpoint r.large_thresh.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        large_thresh_rd: coverpoint r.large_thresh.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(tse_mac_rx_reg_pkg::rx_large_thresh_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="rx_large_thresh_reg_cover");
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
    static function rx_large_thresh_reg_cover get();
        if (m_inst == null) begin
            m_inst = rx_large_thresh_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(rx_large_thresh_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass





// Class: tse_mac_rx_reg_block
// Register Block .tse_mac_rx: 
class tse_mac_rx_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand rx_cfg_reg cfg;
    rand rx_vlan_2nd_cfg_reg vlan_2nd_cfg;
    rand rx_large_thresh_reg large_thresh;

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(tse_mac_rx_reg_pkg::tse_mac_rx_reg_block)

    // Constructor: new
    function new(string name = "tse_mac_rx_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})


        cfg = rx_cfg_reg::type_id::create("cfg", , get_full_name());
        vlan_2nd_cfg = rx_vlan_2nd_cfg_reg::type_id::create("vlan_2nd_cfg", , get_full_name());
        large_thresh = rx_large_thresh_reg::type_id::create("large_thresh", , get_full_name());

        cfg.configure(this);
        vlan_2nd_cfg.configure(this);
        large_thresh.configure(this);

        cfg.build();
        vlan_2nd_cfg.build();
        large_thresh.build();

        // define default map
        default_map = create_map("tse_mac_rx_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        this.default_map.add_reg(cfg, 'h0, "RW");
        this.default_map.add_reg(vlan_2nd_cfg, 'h1, "RW");
        this.default_map.add_reg(large_thresh, 'h2, "RW");

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
        cfg.enable_coverage(is_on, this.cg_per_instance);
        vlan_2nd_cfg.enable_coverage(is_on, this.cg_per_instance);
        large_thresh.enable_coverage(is_on, this.cg_per_instance);
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