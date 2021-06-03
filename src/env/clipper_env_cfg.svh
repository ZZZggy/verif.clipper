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

`ifndef CLIPPER_ENV_CFG__SVH
`define CLIPPER_ENV_CFG__SVH

class clipper_env_cfg extends platform_env_cfg;

    clipper_sfp_ctrl_vif_t sfp_vif;
    clipper_misc_io_vif_t  misc_vif;
    clipper_predictor_cfg  predictor_cfg;
    eth_sb_connect_e       eth_sb_connect = DEFAULT_ETH_SB;
    thi_filter_cfg         cpu_filter_cfg;
    acd_scoreboard_config  eth_sb_cfg[PORT_CPU:PORT_MGMT];
    clipper_ts_cpy_cfg     ts_cpy_cfg;

    //--------------------------------------------------------------------------------
    // Group: sub-environment
    //--------------------------------------------------------------------------------
    // UVM Factory Registration Macro
    `uvm_object_utils_begin(clipper_env_cfg)
        `uvm_field_object(predictor_cfg, UVM_ALL_ON)
        `uvm_field_enum(eth_sb_connect_e, eth_sb_connect, UVM_ALL_ON)
        `uvm_field_object(cpu_filter_cfg, UVM_ALL_ON)
        `uvm_field_sarray_object(eth_sb_cfg, UVM_ALL_ON)
        `uvm_field_object(ts_cpy_cfg, UVM_ALL_ON)
    `uvm_object_utils_end

    // Constructor: new
    function new (string name = type_name);
        super.new(name);
    endfunction

endclass

`endif
