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
// Register definitions for timebase2_core_globals register block.
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
// Group: timebase2_core_globals
//---------------------------------------------------------

package timebase2_core_globals_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;

typedef class globals_increment_quanta_reg_cover;

// Class: globals_increment_quanta_reg
// Register globals.increment_quanta: Increment quanta to be added to local time at every clock period and RFC-4656 Error Estimate status data.
class globals_increment_quanta_reg extends uvm_reg;

    // Variable: fract
    // Increment quanta to be added to local time on each clock period in 1/2^63 fractions of seconds.
    rand uvm_reg_field fract;
    // Variable: error_estim_mult
    // RFC-4656 Error Estimate Multiplier.
    rand uvm_reg_field error_estim_mult;
    // Variable: error_estim_scale
    // RFC-4656 Error Estimate Scale.
    rand uvm_reg_field error_estim_scale;
    // Variable: synchronized
    // RFC-4656 Error Estimate Synchronized status.
    rand uvm_reg_field synchronized;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_increment_quanta_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_increment_quanta_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(timebase2_core_globals_reg_pkg::globals_increment_quanta_reg)

    // Constructor: new
    function new(string name = "globals_increment_quanta");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        fract = uvm_reg_field::type_id::create("fract", , get_full_name());
        error_estim_mult = uvm_reg_field::type_id::create("error_estim_mult", , get_full_name());
        error_estim_scale = uvm_reg_field::type_id::create("error_estim_scale", , get_full_name());
        synchronized = uvm_reg_field::type_id::create("synchronized", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        fract.configure(this, 39, 0, "RW", 0, 'hCE288EE1D, 1, 1, 0);
        error_estim_mult.configure(this, 8, 48, "RW", 0, 'h0, 1, 1, 0);
        error_estim_scale.configure(this, 6, 56, "RW", 0, 'h0, 1, 1, 0);
        synchronized.configure(this, 1, 63, "RW", 0, 'h0, 1, 1, 0);
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
                cg = globals_increment_quanta_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_increment_quanta_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, fract.get_name, fract.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, error_estim_mult.get_name, error_estim_mult.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, error_estim_scale.get_name, error_estim_scale.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, synchronized.get_name, synchronized.value);
        return s;
    endfunction

endclass


// Class: globals_increment_quanta_reg_cover
// Register coverage object.
class globals_increment_quanta_reg_cover extends uvm_object;

    static local globals_increment_quanta_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_increment_quanta_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        fract_wr: coverpoint r.fract.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        fract_rd: coverpoint r.fract.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        error_estim_mult_wr: coverpoint r.error_estim_mult.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        error_estim_mult_rd: coverpoint r.error_estim_mult.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        error_estim_scale_wr: coverpoint r.error_estim_scale.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        error_estim_scale_rd: coverpoint r.error_estim_scale.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        synchronized_wr: coverpoint r.synchronized.value iff (!is_read);
        synchronized_rd: coverpoint r.synchronized.value iff  (is_read);
    endgroup

    `uvm_object_utils(timebase2_core_globals_reg_pkg::globals_increment_quanta_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_increment_quanta_reg_cover");
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
    static function globals_increment_quanta_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_increment_quanta_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_increment_quanta_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_local_time_reg_cover;

// Class: globals_local_time_reg
// Register globals.local_time: Current value of the free running local time.
class globals_local_time_reg extends uvm_reg;

    // Variable: fract
    // Number of 1/2^55 fractions of second elapsed in the current second.
    rand uvm_reg_field fract;
    // Variable: sec
    // Number of second elapsed since timebase startup
    rand uvm_reg_field sec;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_local_time_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_local_time_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(timebase2_core_globals_reg_pkg::globals_local_time_reg)

    // Constructor: new
    function new(string name = "globals_local_time");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        fract = uvm_reg_field::type_id::create("fract", , get_full_name());
        sec = uvm_reg_field::type_id::create("sec", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        fract.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
        sec.configure(this, 32, 32, "RO", 0, 'h0, 1, 1, 0);
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
                cg = globals_local_time_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_local_time_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, fract.get_name, fract.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sec.get_name, sec.value);
        return s;
    endfunction

endclass


// Class: globals_local_time_reg_cover
// Register coverage object.
class globals_local_time_reg_cover extends uvm_object;

    static local globals_local_time_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_local_time_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        fract_wr: coverpoint r.fract.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        fract_rd: coverpoint r.fract.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        sec_wr: coverpoint r.sec.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        sec_rd: coverpoint r.sec.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(timebase2_core_globals_reg_pkg::globals_local_time_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_local_time_reg_cover");
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
    static function globals_local_time_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_local_time_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_local_time_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_ntp_time_offset_adjust_reg_cover;

// Class: globals_ntp_time_offset_adjust_reg
// Register globals.ntp_time_offset_adjust: Adjustment to be applied to ntp_time_offset. The value of fields utc_sec, utc_min, utc_hour and sec must be compatible otherwise the UTC time and the NTP time will not be at the same time. If you have screwed it and the register ntp_offset shows an unalignment then you can fix it with this register by setting some fields to 0 and adjust the others to get the UTC time offset and NTP time offset of the register ntp_offset aligned. Depending of the value of utc_sec, utc_min utc_hour fields of ntp_offset register, an offset to the field utc_sec of this register ntp_offset_adjust may increase the utc_min and the utc_hour of the register ntp_offset. Same thing with the utc_min field of this register ntp_offset_adjust may increase the utc_hour of the register ntp_offset.
class globals_ntp_time_offset_adjust_reg extends uvm_reg;

    // Variable: sec
    // Number of second to add to the ntp_time_offset register.
    rand uvm_reg_field sec;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_ntp_time_offset_adjust_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_ntp_time_offset_adjust_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(timebase2_core_globals_reg_pkg::globals_ntp_time_offset_adjust_reg)

    // Constructor: new
    function new(string name = "globals_ntp_time_offset_adjust");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        sec = uvm_reg_field::type_id::create("sec", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        sec.configure(this, 32, 32, "RW", 0, 'h0, 1, 1, 0);
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
                cg = globals_ntp_time_offset_adjust_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_ntp_time_offset_adjust_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, sec.get_name, sec.value);
        return s;
    endfunction

endclass


// Class: globals_ntp_time_offset_adjust_reg_cover
// Register coverage object.
class globals_ntp_time_offset_adjust_reg_cover extends uvm_object;

    static local globals_ntp_time_offset_adjust_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_ntp_time_offset_adjust_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        sec_wr: coverpoint r.sec.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        sec_rd: coverpoint r.sec.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(timebase2_core_globals_reg_pkg::globals_ntp_time_offset_adjust_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_ntp_time_offset_adjust_reg_cover");
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
    static function globals_ntp_time_offset_adjust_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_ntp_time_offset_adjust_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_ntp_time_offset_adjust_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_ntp_time_offset_reg_cover;

// Class: globals_ntp_time_offset_reg
// Register globals.ntp_time_offset: Offset to be applied to local time to get into the NTP time domain. The value of fields utc_sec, utc_min, utc_hour and sec must be compatible otherwise the UTC time and the NTP time will not be at the same time.
class globals_ntp_time_offset_reg extends uvm_reg;

    // Variable: sec
    // Number of seconds to add to the local time to get into the NTP time domain.
    rand uvm_reg_field sec;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_ntp_time_offset_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_ntp_time_offset_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(timebase2_core_globals_reg_pkg::globals_ntp_time_offset_reg)

    // Constructor: new
    function new(string name = "globals_ntp_time_offset");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        sec = uvm_reg_field::type_id::create("sec", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        sec.configure(this, 32, 32, "RO", 0, 'h83AA7E80, 1, 1, 0);
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
                cg = globals_ntp_time_offset_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_ntp_time_offset_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, sec.get_name, sec.value);
        return s;
    endfunction

endclass


// Class: globals_ntp_time_offset_reg_cover
// Register coverage object.
class globals_ntp_time_offset_reg_cover extends uvm_object;

    static local globals_ntp_time_offset_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_ntp_time_offset_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        sec_wr: coverpoint r.sec.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        sec_rd: coverpoint r.sec.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(timebase2_core_globals_reg_pkg::globals_ntp_time_offset_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_ntp_time_offset_reg_cover");
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
    static function globals_ntp_time_offset_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_ntp_time_offset_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_ntp_time_offset_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_ntp_to_ptp_time_offset_reg_cover;

// Class: globals_ntp_to_ptp_time_offset_reg
// Register globals.ntp_to_ptp_time_offset: Offset to be applied to NTP time to get into the PTP time domain.
class globals_ntp_to_ptp_time_offset_reg extends uvm_reg;

    // Variable: sec
    // Number of seconds to add to the NTP time to get into the PTP time domain.
    rand uvm_reg_field sec;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_ntp_to_ptp_time_offset_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_ntp_to_ptp_time_offset_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(timebase2_core_globals_reg_pkg::globals_ntp_to_ptp_time_offset_reg)

    // Constructor: new
    function new(string name = "globals_ntp_to_ptp_time_offset");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        sec = uvm_reg_field::type_id::create("sec", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        sec.configure(this, 32, 32, "RW", 0, 'h7C558180, 1, 1, 0);
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
                cg = globals_ntp_to_ptp_time_offset_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_ntp_to_ptp_time_offset_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, sec.get_name, sec.value);
        return s;
    endfunction

endclass


// Class: globals_ntp_to_ptp_time_offset_reg_cover
// Register coverage object.
class globals_ntp_to_ptp_time_offset_reg_cover extends uvm_object;

    static local globals_ntp_to_ptp_time_offset_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_ntp_to_ptp_time_offset_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        sec_wr: coverpoint r.sec.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        sec_rd: coverpoint r.sec.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(timebase2_core_globals_reg_pkg::globals_ntp_to_ptp_time_offset_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_ntp_to_ptp_time_offset_reg_cover");
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
    static function globals_ntp_to_ptp_time_offset_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_ntp_to_ptp_time_offset_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_ntp_to_ptp_time_offset_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_pps_ctrl_reg_cover;

// Class: globals_pps_ctrl_reg
// Register globals.pps_ctrl: Control for the PPS logic.
class globals_pps_ctrl_reg extends uvm_reg;

    // Variable: input_sel
    // Design specific external PPS input pin selector.
    rand uvm_reg_field input_sel;
    // Variable: input_internal
    // Select between the external PPS input or the internal PPS.
    rand uvm_reg_field input_internal;
    // Variable: input_delay_compensation
    // PPS input delay compensation in 1/2^32 fractions of second to be applied to localtime before loading the pps_local_timestamp register. This design has 32 bits of fractions and 20 bits of compensations. The compensation is expressed in twos complement.
    rand uvm_reg_field input_delay_compensation;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_pps_ctrl_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_pps_ctrl_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(timebase2_core_globals_reg_pkg::globals_pps_ctrl_reg)

    // Constructor: new
    function new(string name = "globals_pps_ctrl");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        input_sel = uvm_reg_field::type_id::create("input_sel", , get_full_name());
        input_internal = uvm_reg_field::type_id::create("input_internal", , get_full_name());
        input_delay_compensation = uvm_reg_field::type_id::create("input_delay_compensation", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        input_sel.configure(this, 1, 0, "RW", 0, 'h0, 1, 1, 0);
        input_internal.configure(this, 1, 1, "RW", 0, 'h0, 1, 1, 0);
        input_delay_compensation.configure(this, 20, 2, "RW", 0, 'h0, 1, 1, 0);
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
                cg = globals_pps_ctrl_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_pps_ctrl_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, input_sel.get_name, input_sel.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, input_internal.get_name, input_internal.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, input_delay_compensation.get_name, input_delay_compensation.value);
        return s;
    endfunction

endclass


// Class: globals_pps_ctrl_reg_cover
// Register coverage object.
class globals_pps_ctrl_reg_cover extends uvm_object;

    static local globals_pps_ctrl_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_pps_ctrl_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        input_sel_wr: coverpoint r.input_sel.value iff (!is_read);
        input_sel_rd: coverpoint r.input_sel.value iff  (is_read);
        input_internal_wr: coverpoint r.input_internal.value iff (!is_read);
        input_internal_rd: coverpoint r.input_internal.value iff  (is_read);
        input_delay_compensation_wr: coverpoint r.input_delay_compensation.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        input_delay_compensation_rd: coverpoint r.input_delay_compensation.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(timebase2_core_globals_reg_pkg::globals_pps_ctrl_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_pps_ctrl_reg_cover");
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
    static function globals_pps_ctrl_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_pps_ctrl_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_pps_ctrl_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_pps_local_timestamp_reg_cover;

// Class: globals_pps_local_timestamp_reg
// Register globals.pps_local_timestamp: Local time sampled when a rising edge is detected on the selected PPS input.
class globals_pps_local_timestamp_reg extends uvm_reg;

    // Variable: fract
    // Most significant fractions bits of the compensated local Time base.
    rand uvm_reg_field fract;
    // Variable: sec
    // Seconds bits of the compensated local Time base.
    rand uvm_reg_field sec;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_pps_local_timestamp_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_pps_local_timestamp_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(timebase2_core_globals_reg_pkg::globals_pps_local_timestamp_reg)

    // Constructor: new
    function new(string name = "globals_pps_local_timestamp");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        fract = uvm_reg_field::type_id::create("fract", , get_full_name());
        sec = uvm_reg_field::type_id::create("sec", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        fract.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
        sec.configure(this, 32, 32, "RO", 0, 'h0, 1, 1, 0);
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
                cg = globals_pps_local_timestamp_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_pps_local_timestamp_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, fract.get_name, fract.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sec.get_name, sec.value);
        return s;
    endfunction

endclass


// Class: globals_pps_local_timestamp_reg_cover
// Register coverage object.
class globals_pps_local_timestamp_reg_cover extends uvm_object;

    static local globals_pps_local_timestamp_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_pps_local_timestamp_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        fract_wr: coverpoint r.fract.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        fract_rd: coverpoint r.fract.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        sec_wr: coverpoint r.sec.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        sec_rd: coverpoint r.sec.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(timebase2_core_globals_reg_pkg::globals_pps_local_timestamp_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_pps_local_timestamp_reg_cover");
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
    static function globals_pps_local_timestamp_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_pps_local_timestamp_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_pps_local_timestamp_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class globals_tod_ptp_timestamp_reg_cover;

// Class: globals_tod_ptp_timestamp_reg
// Register globals.tod_ptp_timestamp: Time-of-Departure (TOD) PTP timestamp sampled as requested by the CPU for a CPU2IF frame.
class globals_tod_ptp_timestamp_reg extends uvm_reg;

    // Variable: fract
    // Nanoseconds of the TOD PTP timestamp.
    rand uvm_reg_field fract;
    // Variable: sec
    // Seconds of the TOD PTP timestamp.
    rand uvm_reg_field sec;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static globals_tod_ptp_timestamp_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    globals_tod_ptp_timestamp_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(timebase2_core_globals_reg_pkg::globals_tod_ptp_timestamp_reg)

    // Constructor: new
    function new(string name = "globals_tod_ptp_timestamp");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        fract = uvm_reg_field::type_id::create("fract", , get_full_name());
        sec = uvm_reg_field::type_id::create("sec", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        fract.configure(this, 32, 0, "RO", 0, 'h0, 1, 1, 0);
        sec.configure(this, 32, 32, "RO", 0, 'h0, 1, 1, 0);
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
                cg = globals_tod_ptp_timestamp_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = globals_tod_ptp_timestamp_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, fract.get_name, fract.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, sec.get_name, sec.value);
        return s;
    endfunction

endclass


// Class: globals_tod_ptp_timestamp_reg_cover
// Register coverage object.
class globals_tod_ptp_timestamp_reg_cover extends uvm_object;

    static local globals_tod_ptp_timestamp_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    globals_tod_ptp_timestamp_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        fract_wr: coverpoint r.fract.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        fract_rd: coverpoint r.fract.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        sec_wr: coverpoint r.sec.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        sec_rd: coverpoint r.sec.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(timebase2_core_globals_reg_pkg::globals_tod_ptp_timestamp_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="globals_tod_ptp_timestamp_reg_cover");
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
    static function globals_tod_ptp_timestamp_reg_cover get();
        if (m_inst == null) begin
            m_inst = globals_tod_ptp_timestamp_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(globals_tod_ptp_timestamp_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass





// Class: timebase2_core_globals_reg_block
// Register Block .timebase2_core_globals: 
class timebase2_core_globals_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand globals_increment_quanta_reg increment_quanta;
    rand globals_local_time_reg local_time;
    rand globals_ntp_time_offset_adjust_reg ntp_time_offset_adjust;
    rand globals_ntp_time_offset_reg ntp_time_offset;
    rand globals_ntp_to_ptp_time_offset_reg ntp_to_ptp_time_offset;
    rand globals_pps_ctrl_reg pps_ctrl;
    rand globals_pps_local_timestamp_reg pps_local_timestamp;
    rand globals_tod_ptp_timestamp_reg tod_ptp_timestamp;

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(timebase2_core_globals_reg_pkg::timebase2_core_globals_reg_block)

    // Constructor: new
    function new(string name = "timebase2_core_globals_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})


        increment_quanta = globals_increment_quanta_reg::type_id::create("increment_quanta", , get_full_name());
        local_time = globals_local_time_reg::type_id::create("local_time", , get_full_name());
        ntp_time_offset_adjust = globals_ntp_time_offset_adjust_reg::type_id::create("ntp_time_offset_adjust", , get_full_name());
        ntp_time_offset = globals_ntp_time_offset_reg::type_id::create("ntp_time_offset", , get_full_name());
        ntp_to_ptp_time_offset = globals_ntp_to_ptp_time_offset_reg::type_id::create("ntp_to_ptp_time_offset", , get_full_name());
        pps_ctrl = globals_pps_ctrl_reg::type_id::create("pps_ctrl", , get_full_name());
        pps_local_timestamp = globals_pps_local_timestamp_reg::type_id::create("pps_local_timestamp", , get_full_name());
        tod_ptp_timestamp = globals_tod_ptp_timestamp_reg::type_id::create("tod_ptp_timestamp", , get_full_name());

        increment_quanta.configure(this);
        local_time.configure(this);
        ntp_time_offset_adjust.configure(this);
        ntp_time_offset.configure(this);
        ntp_to_ptp_time_offset.configure(this);
        pps_ctrl.configure(this);
        pps_local_timestamp.configure(this);
        tod_ptp_timestamp.configure(this);

        increment_quanta.build();
        local_time.build();
        ntp_time_offset_adjust.build();
        ntp_time_offset.build();
        ntp_to_ptp_time_offset.build();
        pps_ctrl.build();
        pps_local_timestamp.build();
        tod_ptp_timestamp.build();

        // define default map
        default_map = create_map("timebase2_core_globals_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        this.default_map.add_reg(increment_quanta, 'h0, "RW");
        this.default_map.add_reg(local_time, 'h1, "RO");
        this.default_map.add_reg(ntp_time_offset_adjust, 'h2, "RW");
        this.default_map.add_reg(ntp_time_offset, 'h3, "RO");
        this.default_map.add_reg(ntp_to_ptp_time_offset, 'h4, "RW");
        this.default_map.add_reg(pps_ctrl, 'h5, "RW");
        this.default_map.add_reg(pps_local_timestamp, 'h6, "RO");
        this.default_map.add_reg(tod_ptp_timestamp, 'h7, "RO");

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
        increment_quanta.enable_coverage(is_on, this.cg_per_instance);
        local_time.enable_coverage(is_on, this.cg_per_instance);
        ntp_time_offset_adjust.enable_coverage(is_on, this.cg_per_instance);
        ntp_time_offset.enable_coverage(is_on, this.cg_per_instance);
        ntp_to_ptp_time_offset.enable_coverage(is_on, this.cg_per_instance);
        pps_ctrl.enable_coverage(is_on, this.cg_per_instance);
        pps_local_timestamp.enable_coverage(is_on, this.cg_per_instance);
        tod_ptp_timestamp.enable_coverage(is_on, this.cg_per_instance);
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