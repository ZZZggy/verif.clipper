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
// Register definitions for action_index_nni10g register block.
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
// Group: action_index_nni10g
//---------------------------------------------------------

package action_index_nni10g_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;

typedef class action_index_cfg0_reg_cover;

// Class: action_index_cfg0_reg
// Register action_index.cfg0: 
class action_index_cfg0_reg extends uvm_reg;

    // Variable: bwp_profile_base_index
    // Le BWP profile base index est l un des elements qui remplace le mecanisme du CoS Mapping de 5.2.Il correspond directement a un profil reel du BWP. L allocation des profils devrait etre fait de maniere a ce que le cote Client et Destination commence aux deux extremites. (debut et fin) afin de pouvoir avoir une frontiere departageant clairement les profils de chacun. Le parents doivent etre sur le meme cote de la frontiere que leurs enfants. n-bit wide for 2^n BWP profiles
    rand uvm_reg_field bwp_profile_base_index;
    // Variable: default_cos_pattern_address
    // Used when CoS mapping table mode is set but CoS mode first and second choice are not applicabled
    rand uvm_reg_field default_cos_pattern_address;
    // Variable: push_vlan1_value
    // First vlan to be push or replace in packet (if multiple push accure this on became the outer)
    rand uvm_reg_field push_vlan1_value;
    // Variable: push_vlan1_type
    // Vlan Type
    rand uvm_reg_field push_vlan1_type;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static action_index_cfg0_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    action_index_cfg0_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(action_index_nni10g_reg_pkg::action_index_cfg0_reg)

    // Constructor: new
    function new(string name = "action_index_cfg0");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        bwp_profile_base_index = uvm_reg_field::type_id::create("bwp_profile_base_index", , get_full_name());
        default_cos_pattern_address = uvm_reg_field::type_id::create("default_cos_pattern_address", , get_full_name());
        push_vlan1_value = uvm_reg_field::type_id::create("push_vlan1_value", , get_full_name());
        push_vlan1_type = uvm_reg_field::type_id::create("push_vlan1_type", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        bwp_profile_base_index.configure(this, 11, 25, "RW", 0, 'h0, 1, 1, 0);
        default_cos_pattern_address.configure(this, 11, 14, "RW", 0, 'h0, 1, 1, 0);
        push_vlan1_value.configure(this, 12, 2, "RW", 0, 'h0, 1, 1, 0);
        push_vlan1_type.configure(this, 2, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = action_index_cfg0_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = action_index_cfg0_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, bwp_profile_base_index.get_name, bwp_profile_base_index.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, default_cos_pattern_address.get_name, default_cos_pattern_address.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, push_vlan1_value.get_name, push_vlan1_value.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, push_vlan1_type.get_name, push_vlan1_type.value);
        return s;
    endfunction

endclass


// Class: action_index_cfg0_reg_cover
// Register coverage object.
class action_index_cfg0_reg_cover extends uvm_object;

    static local action_index_cfg0_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    action_index_cfg0_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        bwp_profile_base_index_wr: coverpoint r.bwp_profile_base_index.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        bwp_profile_base_index_rd: coverpoint r.bwp_profile_base_index.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        default_cos_pattern_address_wr: coverpoint r.default_cos_pattern_address.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        default_cos_pattern_address_rd: coverpoint r.default_cos_pattern_address.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        push_vlan1_value_wr: coverpoint r.push_vlan1_value.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        push_vlan1_value_rd: coverpoint r.push_vlan1_value.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        push_vlan1_type_wr: coverpoint r.push_vlan1_type.value iff (!is_read);
        push_vlan1_type_rd: coverpoint r.push_vlan1_type.value iff  (is_read);
    endgroup

    `uvm_object_utils(action_index_nni10g_reg_pkg::action_index_cfg0_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="action_index_cfg0_reg_cover");
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
    static function action_index_cfg0_reg_cover get();
        if (m_inst == null) begin
            m_inst = action_index_cfg0_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(action_index_cfg0_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class action_index_cfg1_reg_cover;

// Class: action_index_cfg1_reg
// Register action_index.cfg1: 
class action_index_cfg1_reg extends uvm_reg;

    // Variable: outgoing_interface
    // The outgoing interface from which the traffic will be forwarding. The MSB is used to enable the Forwarding Database query that is required to resolve outgoing physical port from specified logical port
    rand uvm_reg_field outgoing_interface;
    // Variable: cos_pattern_base_address_2nd
    // CoS Pattern Address (selon le CoS mode)
    rand uvm_reg_field cos_pattern_base_address_2nd;
    // Variable: cos_pattern_base_address_1st
    // CoS Pattern Address (selon le CoS mode)
    rand uvm_reg_field cos_pattern_base_address_1st;
    // Variable: interface_rule
    // Interface Rule
    rand uvm_reg_field interface_rule;
    // Variable: incomming_vlan2_is_de
    // Vlan2 CFI is use as drop elegibility
    rand uvm_reg_field incomming_vlan2_is_de;
    // Variable: incomming_vlan1_is_de
    // Vlan1 CFI is use as drop elegibility
    rand uvm_reg_field incomming_vlan1_is_de;
    // Variable: oam_action_mode
    // Enable specific protocol action opcode
    rand uvm_reg_field oam_action_mode;
    // Variable: oam_action
    // Swap action / protocol specific action
    rand uvm_reg_field oam_action;
    // Variable: cos_mode_2nd
    // Table mode Field Selection (2nd choice);Pour de le direct_mode en deuxieme choix, il faut simplement mettre la valeur du premier choix
    rand uvm_reg_field cos_mode_2nd;
    // Variable: cos_mode_1st
    // Table mode Field Selection (1st choice)
    rand uvm_reg_field cos_mode_1st;
    // Variable: cos_mapping_enable
    // 0: disable  ( CoS Pattern Address used is default) ; 1: enable
    rand uvm_reg_field cos_mapping_enable;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static action_index_cfg1_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    action_index_cfg1_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(action_index_nni10g_reg_pkg::action_index_cfg1_reg)

    // Constructor: new
    function new(string name = "action_index_cfg1");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        outgoing_interface = uvm_reg_field::type_id::create("outgoing_interface", , get_full_name());
        cos_pattern_base_address_2nd = uvm_reg_field::type_id::create("cos_pattern_base_address_2nd", , get_full_name());
        cos_pattern_base_address_1st = uvm_reg_field::type_id::create("cos_pattern_base_address_1st", , get_full_name());
        interface_rule = uvm_reg_field::type_id::create("interface_rule", , get_full_name());
        incomming_vlan2_is_de = uvm_reg_field::type_id::create("incomming_vlan2_is_de", , get_full_name());
        incomming_vlan1_is_de = uvm_reg_field::type_id::create("incomming_vlan1_is_de", , get_full_name());
        oam_action_mode = uvm_reg_field::type_id::create("oam_action_mode", , get_full_name());
        oam_action = uvm_reg_field::type_id::create("oam_action", , get_full_name());
        cos_mode_2nd = uvm_reg_field::type_id::create("cos_mode_2nd", , get_full_name());
        cos_mode_1st = uvm_reg_field::type_id::create("cos_mode_1st", , get_full_name());
        cos_mapping_enable = uvm_reg_field::type_id::create("cos_mapping_enable", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        outgoing_interface.configure(this, 5, 29, "RW", 0, 'h0, 1, 1, 0);
        cos_pattern_base_address_2nd.configure(this, 8, 21, "RW", 0, 'h0, 1, 1, 0);
        cos_pattern_base_address_1st.configure(this, 8, 13, "RW", 0, 'h0, 1, 1, 0);
        interface_rule.configure(this, 2, 11, "RW", 0, 'h0, 1, 1, 0);
        incomming_vlan2_is_de.configure(this, 1, 10, "RW", 0, 'h0, 1, 1, 0);
        incomming_vlan1_is_de.configure(this, 1, 9, "RW", 0, 'h0, 1, 1, 0);
        oam_action_mode.configure(this, 1, 8, "RW", 0, 'h0, 1, 1, 0);
        oam_action.configure(this, 3, 5, "RW", 0, 'h0, 1, 1, 0);
        cos_mode_2nd.configure(this, 2, 3, "RW", 0, 'h0, 1, 1, 0);
        cos_mode_1st.configure(this, 2, 1, "RW", 0, 'h0, 1, 1, 0);
        cos_mapping_enable.configure(this, 1, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = action_index_cfg1_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = action_index_cfg1_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, outgoing_interface.get_name, outgoing_interface.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, cos_pattern_base_address_2nd.get_name, cos_pattern_base_address_2nd.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, cos_pattern_base_address_1st.get_name, cos_pattern_base_address_1st.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, interface_rule.get_name, interface_rule.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, incomming_vlan2_is_de.get_name, incomming_vlan2_is_de.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, incomming_vlan1_is_de.get_name, incomming_vlan1_is_de.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, oam_action_mode.get_name, oam_action_mode.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, oam_action.get_name, oam_action.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, cos_mode_2nd.get_name, cos_mode_2nd.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, cos_mode_1st.get_name, cos_mode_1st.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, cos_mapping_enable.get_name, cos_mapping_enable.value);
        return s;
    endfunction

endclass


// Class: action_index_cfg1_reg_cover
// Register coverage object.
class action_index_cfg1_reg_cover extends uvm_object;

    static local action_index_cfg1_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    action_index_cfg1_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        outgoing_interface_wr: coverpoint r.outgoing_interface.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        outgoing_interface_rd: coverpoint r.outgoing_interface.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        cos_pattern_base_address_2nd_wr: coverpoint r.cos_pattern_base_address_2nd.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        cos_pattern_base_address_2nd_rd: coverpoint r.cos_pattern_base_address_2nd.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        cos_pattern_base_address_1st_wr: coverpoint r.cos_pattern_base_address_1st.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        cos_pattern_base_address_1st_rd: coverpoint r.cos_pattern_base_address_1st.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        interface_rule_wr: coverpoint r.interface_rule.value iff (!is_read);
        interface_rule_rd: coverpoint r.interface_rule.value iff  (is_read);
        incomming_vlan2_is_de_wr: coverpoint r.incomming_vlan2_is_de.value iff (!is_read);
        incomming_vlan2_is_de_rd: coverpoint r.incomming_vlan2_is_de.value iff  (is_read);
        incomming_vlan1_is_de_wr: coverpoint r.incomming_vlan1_is_de.value iff (!is_read);
        incomming_vlan1_is_de_rd: coverpoint r.incomming_vlan1_is_de.value iff  (is_read);
        oam_action_mode_wr: coverpoint r.oam_action_mode.value iff (!is_read);
        oam_action_mode_rd: coverpoint r.oam_action_mode.value iff  (is_read);
        oam_action_wr: coverpoint r.oam_action.value iff (!is_read);
        oam_action_rd: coverpoint r.oam_action.value iff  (is_read);
        cos_mode_2nd_wr: coverpoint r.cos_mode_2nd.value iff (!is_read);
        cos_mode_2nd_rd: coverpoint r.cos_mode_2nd.value iff  (is_read);
        cos_mode_1st_wr: coverpoint r.cos_mode_1st.value iff (!is_read);
        cos_mode_1st_rd: coverpoint r.cos_mode_1st.value iff  (is_read);
        cos_mapping_enable_wr: coverpoint r.cos_mapping_enable.value iff (!is_read);
        cos_mapping_enable_rd: coverpoint r.cos_mapping_enable.value iff  (is_read);
    endgroup

    `uvm_object_utils(action_index_nni10g_reg_pkg::action_index_cfg1_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="action_index_cfg1_reg_cover");
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
    static function action_index_cfg1_reg_cover get();
        if (m_inst == null) begin
            m_inst = action_index_cfg1_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(action_index_cfg1_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass
typedef class action_index_cfg2_reg_cover;

// Class: action_index_cfg2_reg
// Register action_index.cfg2: 
class action_index_cfg2_reg extends uvm_reg;

    // Variable: vlan2_action
    // Second action to be perform on the vlan stack in the packet
    rand uvm_reg_field vlan2_action;
    // Variable: vlan1_action
    // First action to be perform on the vlan stack in the packet
    rand uvm_reg_field vlan1_action;
    // Variable: push_vlan2_type
    // Vlan Type
    rand uvm_reg_field push_vlan2_type;
    // Variable: push_vlan2_value
    // Second vlan to push or replace (if push one only this field is ignore) (if push 2 this vlan became the inner or the middle vlan if there is already one in packet)
    rand uvm_reg_field push_vlan2_value;
    // Variable: unuse_field
    // Unuse_field
    rand uvm_reg_field unuse_field;
    // Variable: outgoing_qset
    // Identifies an Outgoing Queues set. See Qmap Table tab for usage.
    rand uvm_reg_field outgoing_qset;

    // Variable: m_params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg
    // Coverage object. Static to reduce memory usage.
    static action_index_cfg2_reg_cover cg_all;

    // Variable: cg
    // Coverage object.
    action_index_cfg2_reg_cover cg;

    // Variable: is_read
    // Last access type.
    protected bit is_read;

    `uvm_object_utils(action_index_nni10g_reg_pkg::action_index_cfg2_reg)

    // Constructor: new
    function new(string name = "action_index_cfg2");
        super.new(name, `UVM_REG_DATA_WIDTH, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && has_params())
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        vlan2_action = uvm_reg_field::type_id::create("vlan2_action", , get_full_name());
        vlan1_action = uvm_reg_field::type_id::create("vlan1_action", , get_full_name());
        push_vlan2_type = uvm_reg_field::type_id::create("push_vlan2_type", , get_full_name());
        push_vlan2_value = uvm_reg_field::type_id::create("push_vlan2_value", , get_full_name());
        unuse_field = uvm_reg_field::type_id::create("unuse_field", , get_full_name());
        outgoing_qset = uvm_reg_field::type_id::create("outgoing_qset", , get_full_name());

        // uvm_reg_field::configure(uvm_reg parent, int unsigned size, int unsigned lsb_pos, string access, bit volatile, uvm_reg_data_t reset, bit has_reset, bit is_rand, bit individually_accessible)
        vlan2_action.configure(this, 5, 31, "RW", 0, 'h0, 1, 1, 0);
        vlan1_action.configure(this, 5, 26, "RW", 0, 'h0, 1, 1, 0);
        push_vlan2_type.configure(this, 2, 24, "RW", 0, 'h0, 1, 1, 0);
        push_vlan2_value.configure(this, 12, 12, "RW", 0, 'h0, 1, 1, 0);
        unuse_field.configure(this, 3, 9, "RW", 0, 'h0, 1, 1, 0);
        outgoing_qset.configure(this, 8, 0, "RW", 0, 'h0, 1, 1, 0);
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
                cg = action_index_cfg2_reg_cover::type_id::create({this.get_full_name(), ".cg"});
            end
        end else begin
            //$info("Creating singleton coverage object: %0s", {this.get_full_name(), ".cg"});
            cg_all = action_index_cfg2_reg_cover::get();
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
        $swrite(s, "%0s\n%24s=0x%0h", s, vlan2_action.get_name, vlan2_action.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, vlan1_action.get_name, vlan1_action.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, push_vlan2_type.get_name, push_vlan2_type.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, push_vlan2_value.get_name, push_vlan2_value.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, unuse_field.get_name, unuse_field.value);
        $swrite(s, "%0s\n%24s=0x%0h", s, outgoing_qset.get_name, outgoing_qset.value);
        return s;
    endfunction

endclass


// Class: action_index_cfg2_reg_cover
// Register coverage object.
class action_index_cfg2_reg_cover extends uvm_object;

    static local action_index_cfg2_reg_cover m_inst;

    // Variable: r
    // Handle to register to sample
    action_index_cfg2_reg r;

    covergroup cg with function sample(bit is_read);
        option.per_instance = 1;
        type_option.merge_instances = 1;
        vlan2_action_wr: coverpoint r.vlan2_action.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        vlan2_action_rd: coverpoint r.vlan2_action.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        vlan1_action_wr: coverpoint r.vlan1_action.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        vlan1_action_rd: coverpoint r.vlan1_action.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        push_vlan2_type_wr: coverpoint r.push_vlan2_type.value iff (!is_read);
        push_vlan2_type_rd: coverpoint r.push_vlan2_type.value iff  (is_read);
        push_vlan2_value_wr: coverpoint r.push_vlan2_value.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        push_vlan2_value_rd: coverpoint r.push_vlan2_value.value iff  (is_read) { bins bin[16] = {[0:$]}; }
        unuse_field_wr: coverpoint r.unuse_field.value iff (!is_read);
        unuse_field_rd: coverpoint r.unuse_field.value iff  (is_read);
        outgoing_qset_wr: coverpoint r.outgoing_qset.value iff (!is_read) { bins bin[16] = {[0:$]}; }
        outgoing_qset_rd: coverpoint r.outgoing_qset.value iff  (is_read) { bins bin[16] = {[0:$]}; }
    endgroup

    `uvm_object_utils(action_index_nni10g_reg_pkg::action_index_cfg2_reg_cover)

    // Constructor: new
    // Note that to be truly singleton, the constructor should be protected.
    /*protected*/ function new(string name="action_index_cfg2_reg_cover");
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
    static function action_index_cfg2_reg_cover get();
        if (m_inst == null) begin
            m_inst = action_index_cfg2_reg_cover::type_id::create("cg");
        end
        return m_inst;
    endfunction


    // Function: sample
    // Sample the register for coverage.
    virtual function void sample(action_index_cfg2_reg _r, bit is_read);
        r = _r;
        cg.sample(is_read);
    endfunction

endclass





// Class: action_index_nni10g_reg_block
// Register Block .action_index_nni10g: 
class action_index_nni10g_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand action_index_cfg0_reg cfg0;
    rand action_index_cfg1_reg cfg1;
    rand action_index_cfg2_reg cfg2;

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(action_index_nni10g_reg_pkg::action_index_nni10g_reg_block)

    // Constructor: new
    function new(string name = "action_index_nni10g_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})


        cfg0 = action_index_cfg0_reg::type_id::create("cfg0", , get_full_name());
        cfg1 = action_index_cfg1_reg::type_id::create("cfg1", , get_full_name());
        cfg2 = action_index_cfg2_reg::type_id::create("cfg2", , get_full_name());

        cfg0.configure(this);
        cfg1.configure(this);
        cfg2.configure(this);

        cfg0.build();
        cfg1.build();
        cfg2.build();

        // define default map
        default_map = create_map("action_index_nni10g_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        this.default_map.add_reg(cfg0, 'h0, "RW");
        this.default_map.add_reg(cfg1, 'h1, "RW");
        this.default_map.add_reg(cfg2, 'h2, "RW");

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
        cfg0.enable_coverage(is_on, this.cg_per_instance);
        cfg1.enable_coverage(is_on, this.cg_per_instance);
        cfg2.enable_coverage(is_on, this.cg_per_instance);
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