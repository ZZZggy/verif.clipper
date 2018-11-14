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
class clipper_insect_xfer_fun extends class_action_xfer_fun_base#(c1lt_reg_block);
    `uvm_component_utils(clipper_insect_xfer_fun)
    function new(string name="clipper_insect_xfer_fun", uvm_component parent=null);
        super.new(name, parent);
    endfunction

    /**
     * @Override
     */
    virtual function void build_phase(uvm_phase phase);
        `uvm_info("CLIPPER_INSECT_XFER_FUN", "Entering build_phase", UVM_LOW)
        // get regmodel
        if (!uvm_config_db#(c1lt_reg_block)::get(this, "", "regmodel", regmodel))
            `uvm_fatal(get_name(), "Failed to get config.")

        uvm_pkg::factory.set_inst_override_by_type(classifier_base#(c1lt_reg_block)::get_type(), clipper_classifier::get_type(), {this.get_full_name, ".classifier"});

        super.build_phase(phase);
        `uvm_info("CLIPPER_INSECT_XFER_FUN", "Exiting build_phase", UVM_LOW)
    endfunction // build_phase

    function int get_mon_q_mapping(int mon_num);
        // FIXME Clipper2 doesn't have a monitor Q mapping...
        return 0;//mon_num == 0 ? regmodel.globals.mon_cfg.mon1_q.get() : regmodel.globals.mon_cfg.mon2_q.get();
    endfunction

endclass

