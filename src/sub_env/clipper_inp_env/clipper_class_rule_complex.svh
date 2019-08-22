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

import class2_pkg::*;
import extract2_pkg::*;
import pkt_key_pkg::*;
import stream_verif_pkg::*;

// Note that these implementations only need to provide register-model specific
// details.
class clipper_class_rule_complex extends uvm_component implements class_rule_filter_ifc;

    c1lt_reg_block regmodel;

    classifier2_predictor_cfg complex_cfg[NB_IF_PORTS];
    extract2_predictor_cfg    extract_cfg[NB_IF_PORTS];

    extract2_predictor    extract[NB_IF_PORTS];
    classifier2_predictor classifier[NB_IF_PORTS];

    `uvm_component_utils(clipper_class_rule_complex)
    // Constructor: new
    function new(string name="clipper_class_rule_complex", uvm_component parent=null);
        super.new(name, parent);
    endfunction

    // Function: build_phase
    function void build_phase(uvm_phase phase);
        `uvm_info("CLIPPER_CLASS_RULE_COMPLEX", "Entering build_phase", UVM_LOW)
        // get regmodel
        if (!uvm_config_db#(c1lt_reg_block)::get(this, "", "regmodel", regmodel))
            `uvm_fatal(get_name(), "Failed to get config.")

        for (int i=0; i<NB_IF_PORTS; i++) begin
            // cfg
            extract_cfg[i] = extract2_predictor_cfg::type_id::create($sformatf("extract_cfg%0d",i), this);
            extract_cfg[i].vss_max = 3;
            uvm_config_db#(extract2_predictor_cfg)::set(this, $sformatf("extract%0d",i), "cfg", extract_cfg[i]);
            complex_cfg[i] = classifier2_predictor_cfg::type_id::create($sformatf("complex_cfg%0d",i), this);
        end

        foreach (complex_cfg[ii]) begin
            complex_cfg[ii].regmodel  = regmodel.classifiers.p[ii];
        end

        for (int i=0; i<NB_IF_PORTS; i++) begin
            uvm_config_db#(classifier2_predictor_cfg)::set(this, $sformatf("classifier%0d",i), "cfg", complex_cfg[i]);
            // components
            extract[i] = extract2_predictor::type_id::create($sformatf("extract%0d", i), this);
            classifier[i] = classifier2_predictor::type_id::create($sformatf("classifier%0d", i), this);
        end
        `uvm_info("CLIPPER_CLASS_RULE_COMPLEX", "Exiting build_phase", UVM_LOW)
    endfunction


    // Function: classify
    // Interface class implementation.
    // Pass the ethernet frame through the extract and classifier to get the domain priority set.
    virtual function domain_priority_item classify(ethernet_frame_t t);
        uvm_tlm_generic_payload raw;
        stream_trans_t stream;
        stream_trans_extensions ext;
        pkt_key_item key;
//        pkt_side_key_item side_key;
//        vcx_partial_cksm_item cksm;

        // create stream from ethernet frame
        raw = t.to_uvm_tlm_generic_payload("stream", 0);
        stream = new("stream");
        stream.m_data = { >> 8 {raw.m_data}};
        ext = stream_trans_extensions::type_id::create("ext", this);
        ext.error_flag = t.is_bad();
        void'(stream.set_extension(ext));

        // extract

//        key = extract[t.p_id-1].extract_key(stream, side_key, cksm);
//        `uvm_info("PREDICT::COMPLEX", key.convert2string(), UVM_DEBUG)

        // classify
        return classifier[t.p_id-1].classify(key);
    endfunction

endclass

