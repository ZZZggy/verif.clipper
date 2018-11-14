//------------------------------------------------------------------------------
// ACCEDIAN NETWORKS
// High Performance Service Assurance (TM)
//
// Accedian Networks, Inc.
// 2351 Alfred-Nobel Blvd., Suite N-410
// Saint-Laurent (Montreal), Quebec
// H4S 2A9
// Canada
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
//-----------------------------------------------------------------------------

// Note that these implementations only need to provide register-model specific
// details.
class clipper_class_action_filter extends class_action_filter#(c1lt_reg_block);

    clipper_class_rule_filter_hidden hidden;
    clipper_class_rule_complex complex;
    clipper_class_rule_vid vid;

    `uvm_component_utils(clipper_class_action_filter)

    function new(string name = "clipper_class_action_filter", uvm_component parent=null);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        `uvm_info("CLIPPER_CLASS_ACTION_FILTER", "Entering build_phase", UVM_LOW)
        super.build_phase(phase);

        uvm_config_db#(c1lt_reg_block)::set(this, "complex", "regmodel", regmodel);
        uvm_config_db#(c1lt_reg_block)::set(this, "hidden", "regmodel", regmodel);

        hidden = clipper_class_rule_filter_hidden::type_id::create("hidden", this);
        complex = clipper_class_rule_complex::type_id::create("complex", this);
        vid = clipper_class_rule_vid::type_id::create("vid", this);

        vid.regmodel = this.regmodel;

        add_filter(hidden, 0);
        add_filter(complex, 0);
        add_filter(vid, 0); // VID priority offset done in class implementation
        `uvm_info("CLIPPER_CLASS_ACTION_FILTER", "Exiting build_phase", UVM_LOW)
    endfunction

endclass
