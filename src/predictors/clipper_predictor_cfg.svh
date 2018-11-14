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
//------------------------------------------------------------------------------

class clipper_predictor_cfg extends uvm_object;

    // Set whether predictor is active or passive for internal connections.
    // This will have an impact as to which sub-environments and/or predictors are instantiated
    // and how they are connected together.
    // Note that only certain sub-environments may have prediction issues when
    // UVM_PASSIVE:
    // - DUT is black-box, no internal DUT monitoring.
    // - Prediction is end-to-end.
    // - Will cover internal connection issues better than active mode.
    // - May have prediction issues when packets are discarded due to shaping or congestion.
    // - Less debug visibility as to where issues may have occurred in the datapath.
    // UVM_ACTIVE:
    // - DUT is white-box, internal DUT monitoring.
    // - Prediction is per block in the datapath.
    // - Better debug as to where issues may have occurred first.
    // - May have issues covering inter-block connections when there is glue logic between them.
    uvm_active_passive_enum active = UVM_PASSIVE;

    // Variable: ena
    // Enables prediction
    bit ena = 1;

    // Register model
    c1lt_reg_block regmodel;

    // Group: sub-environment configurations
    thi_cpu2x_predictor_cfg cpu2x_cfg;
    thi_x2cpu_predictor_cfg x2cpu_cfg;

    // TSE predictor configurations array
    clipper_tse_cfg tse_cfg [NB_ALL_PORTS];

    // XGMAC predictor configurations array
    clipper_xgmac_cfg xgmac_cfg [5:8];

    `uvm_object_utils_begin(clipper_predictor_cfg)
        `uvm_field_int(ena, UVM_ALL_ON)
        `uvm_field_object(cpu2x_cfg, UVM_ALL_ON)
        `uvm_field_object(x2cpu_cfg, UVM_ALL_ON)
        `uvm_field_sarray_object(tse_cfg, UVM_ALL_ON)
        `uvm_field_sarray_object(xgmac_cfg, UVM_ALL_ON)
    `uvm_object_utils_end

    function new(string name="clipper_predictor_cfg");
        super.new(name);
    endfunction
endclass
