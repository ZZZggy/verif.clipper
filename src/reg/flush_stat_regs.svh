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
// Register definitions for flush_stat register block.
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
// Group: flush_stat
//---------------------------------------------------------

package flush_stat_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;

typedef class flush_stat_flush_stat_cpu_reg_cover;

// Class: flush_stat_flush_stat_cpu_reg
// Register flush_stat.flush_stat_cpu: Packet flushed by TBB from IFx+MGMT (1 to 13) to CPU
class flush_stat_flush_stat_cpu_reg extends uvm_reg;

    // Variable: pkt_counter
    // Number of packet flushed
    rand uvm_reg_field pkt_counter;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static flush_stat_flush_stat_cpu_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    flush_stat_flush_stat_cpu_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(flush_stat_reg_pkg::flush_stat_flush_stat_cpu_reg)

    // Constructor: new
    function new(string name = "flush_stat_flush_stat_cpu");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        pkt_counter = uvm_reg_field::type_id::create("pkt_counter", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        pkt_counter.configure(this, 29, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = flush_stat_flush_stat_cpu_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = flush_stat_flush_stat_cpu_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, pkt_counter.get_name, pkt_counter.value);
        return s;
    endfunction

endclass


// Class: flush_stat_flush_stat_cpu_reg_cover
// Register coverage object.
class flush_stat_flush_stat_cpu_reg_cover extends uvm_object;

    static local flush_stat_flush_stat_cpu_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    flush_stat_flush_stat_cpu_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        pkt_counter_wr: coverpoint r.pkt_counter.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        pkt_counter_rd: coverpoint r.pkt_counter.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(flush_stat_reg_pkg::flush_stat_flush_stat_cpu_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="flush_stat_flush_stat_cpu_reg_cover");
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
    static function flush_stat_flush_stat_cpu_reg_cover get();
        if (m_inst == null) begin
            m_inst = flush_stat_flush_stat_cpu_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(flush_stat_flush_stat_cpu_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class flush_stat_flush_stat_ifx_reg_cover;

// Class: flush_stat_flush_stat_ifx_reg
// Register flush_stat.flush_stat_ifx: Packet flushed by TBB from CPU and IFx to IFx (1 to 12). Counter order: CPU_IF0,IF0,CPU_IF1,IF1,CPU_IF2, and so on
class flush_stat_flush_stat_ifx_reg extends uvm_reg;

    // Variable: pkt_counter
    // Number of packet flushed
    rand uvm_reg_field pkt_counter;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static flush_stat_flush_stat_ifx_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    flush_stat_flush_stat_ifx_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(flush_stat_reg_pkg::flush_stat_flush_stat_ifx_reg)

    // Constructor: new
    function new(string name = "flush_stat_flush_stat_ifx");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        pkt_counter = uvm_reg_field::type_id::create("pkt_counter", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        pkt_counter.configure(this, 29, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = flush_stat_flush_stat_ifx_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = flush_stat_flush_stat_ifx_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, pkt_counter.get_name, pkt_counter.value);
        return s;
    endfunction

endclass


// Class: flush_stat_flush_stat_ifx_reg_cover
// Register coverage object.
class flush_stat_flush_stat_ifx_reg_cover extends uvm_object;

    static local flush_stat_flush_stat_ifx_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    flush_stat_flush_stat_ifx_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        pkt_counter_wr: coverpoint r.pkt_counter.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        pkt_counter_rd: coverpoint r.pkt_counter.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(flush_stat_reg_pkg::flush_stat_flush_stat_ifx_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="flush_stat_flush_stat_ifx_reg_cover");
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
    static function flush_stat_flush_stat_ifx_reg_cover get();
        if (m_inst == null) begin
            m_inst = flush_stat_flush_stat_ifx_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(flush_stat_flush_stat_ifx_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class flush_stat_flush_stat_mgmt_reg_cover;

// Class: flush_stat_flush_stat_mgmt_reg
// Register flush_stat.flush_stat_mgmt: Packet flushed by TBB from CPU to MGMT
class flush_stat_flush_stat_mgmt_reg extends uvm_reg;

    // Variable: pkt_counter
    // Number of packet flushed
    rand uvm_reg_field pkt_counter;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static flush_stat_flush_stat_mgmt_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    flush_stat_flush_stat_mgmt_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(flush_stat_reg_pkg::flush_stat_flush_stat_mgmt_reg)

    // Constructor: new
    function new(string name = "flush_stat_flush_stat_mgmt");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        pkt_counter = uvm_reg_field::type_id::create("pkt_counter", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        pkt_counter.configure(this, 29, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = flush_stat_flush_stat_mgmt_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = flush_stat_flush_stat_mgmt_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, pkt_counter.get_name, pkt_counter.value);
        return s;
    endfunction

endclass


// Class: flush_stat_flush_stat_mgmt_reg_cover
// Register coverage object.
class flush_stat_flush_stat_mgmt_reg_cover extends uvm_object;

    static local flush_stat_flush_stat_mgmt_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    flush_stat_flush_stat_mgmt_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        pkt_counter_wr: coverpoint r.pkt_counter.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        pkt_counter_rd: coverpoint r.pkt_counter.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(flush_stat_reg_pkg::flush_stat_flush_stat_mgmt_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="flush_stat_flush_stat_mgmt_reg_cover");
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
    static function flush_stat_flush_stat_mgmt_reg_cover get();
        if (m_inst == null) begin
            m_inst = flush_stat_flush_stat_mgmt_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(flush_stat_flush_stat_mgmt_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class flush_stat_flush_stat_mon_reg_cover;

// Class: flush_stat_flush_stat_mon_reg
// Register flush_stat.flush_stat_mon: Packet flushed by TBB from IF (1 to 12) to MON
class flush_stat_flush_stat_mon_reg extends uvm_reg;

    // Variable: pkt_counter
    // Number of packet flushed
    rand uvm_reg_field pkt_counter;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static flush_stat_flush_stat_mon_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    flush_stat_flush_stat_mon_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(flush_stat_reg_pkg::flush_stat_flush_stat_mon_reg)

    // Constructor: new
    function new(string name = "flush_stat_flush_stat_mon");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        pkt_counter = uvm_reg_field::type_id::create("pkt_counter", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        pkt_counter.configure(this, 29, 0, "RO", 0, 'h0, 1, 1, 0);
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
                cg = flush_stat_flush_stat_mon_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = flush_stat_flush_stat_mon_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, pkt_counter.get_name, pkt_counter.value);
        return s;
    endfunction

endclass


// Class: flush_stat_flush_stat_mon_reg_cover
// Register coverage object.
class flush_stat_flush_stat_mon_reg_cover extends uvm_object;

    static local flush_stat_flush_stat_mon_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    flush_stat_flush_stat_mon_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        pkt_counter_wr: coverpoint r.pkt_counter.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        pkt_counter_rd: coverpoint r.pkt_counter.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(flush_stat_reg_pkg::flush_stat_flush_stat_mon_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="flush_stat_flush_stat_mon_reg_cover");
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
    static function flush_stat_flush_stat_mon_reg_cover get();
        if (m_inst == null) begin
            m_inst = flush_stat_flush_stat_mon_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(flush_stat_flush_stat_mon_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass





// Class: flush_stat_reg_block
// Register Block .flush_stat: 
class flush_stat_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand flush_stat_flush_stat_mgmt_reg flush_stat_mgmt;
    rand flush_stat_flush_stat_cpu_reg flush_stat_cpu[];
    rand flush_stat_flush_stat_ifx_reg flush_stat_ifx[];
    rand flush_stat_flush_stat_mon_reg flush_stat_mon[];

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(flush_stat_reg_pkg::flush_stat_reg_block)

    // Constructor: new
    function new(string name = "flush_stat_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        flush_stat_cpu = new[13];
        flush_stat_ifx = new[24];
        flush_stat_mon = new[12];

        flush_stat_mgmt = flush_stat_flush_stat_mgmt_reg::type_id::create("flush_stat_mgmt", , get_full_name());
        foreach(flush_stat_cpu[m]) begin
            flush_stat_cpu[m] = flush_stat_flush_stat_cpu_reg::type_id::create($sformatf("flush_stat_cpu[%0d]",m), , get_full_name());
        end
        foreach(flush_stat_ifx[m]) begin
            flush_stat_ifx[m] = flush_stat_flush_stat_ifx_reg::type_id::create($sformatf("flush_stat_ifx[%0d]",m), , get_full_name());
        end
        foreach(flush_stat_mon[m]) begin
            flush_stat_mon[m] = flush_stat_flush_stat_mon_reg::type_id::create($sformatf("flush_stat_mon[%0d]",m), , get_full_name());
        end

        flush_stat_mgmt.configure(this);
        foreach(flush_stat_cpu[m]) begin
            flush_stat_cpu[m].configure(this);
        end
        foreach(flush_stat_ifx[m]) begin
            flush_stat_ifx[m].configure(this);
        end
        foreach(flush_stat_mon[m]) begin
            flush_stat_mon[m].configure(this);
        end

        flush_stat_mgmt.build();
        foreach(flush_stat_cpu[m]) begin
            flush_stat_cpu[m].build();
        end
        foreach(flush_stat_ifx[m]) begin
            flush_stat_ifx[m].build();
        end
        foreach(flush_stat_mon[m]) begin
            flush_stat_mon[m].build();
        end

        // define default map
        default_map = create_map("flush_stat_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        this.default_map.add_reg(flush_stat_mgmt, 'h25, "RO");
        foreach(flush_stat_cpu[m]) begin
            this.default_map.add_reg(this.flush_stat_cpu[m], 'h0 + m, "RO");
        end
        foreach(flush_stat_ifx[m]) begin
            this.default_map.add_reg(this.flush_stat_ifx[m], 'hD + m, "RO");
        end
        foreach(flush_stat_mon[m]) begin
            this.default_map.add_reg(this.flush_stat_mon[m], 'h26 + m, "RO");
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
        flush_stat_mgmt.enable_coverage(is_on, this.cg_per_instance);
        foreach(flush_stat_cpu[m]) begin
            flush_stat_cpu[m].enable_coverage(is_on, this.cg_per_instance);
        end
        foreach(flush_stat_ifx[m]) begin
            flush_stat_ifx[m].enable_coverage(is_on, this.cg_per_instance);
        end
        foreach(flush_stat_mon[m]) begin
            flush_stat_mon[m].enable_coverage(is_on, this.cg_per_instance);
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