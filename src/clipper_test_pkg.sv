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

`ifndef CLIPPER_TEST_PKG__SV
`define CLIPPER_TEST_PKG__SV

package clipper_test_pkg;

    // Packages include & import
`include "uvm_macros.svh"
    import uvm_pkg::*;

    // ACD includes and imports
`include "acd_macros.svh"
`include "clipper_macros.sv"
    import acd_uvm_pkg::*;
    import acd_mm_pkg::*;
    import ethernet_pkg::*;
    import thi_uvm_pkg::*;
    import mac_pkg::*;
    import platform_pkg::*;
    import stream_verif_pkg::*;
    import action_type_pkg::*;
    import class_action_type_pkg::*;
    import class_action_pkg::*;
    import protocols_verif_pkg::*;
    import clipper_pkg::*;
    // Register imports
    import c1lt_reg_pkg::*;
//    import clipper_regmodel_extend_pkg::*;
//    import vid_table_aux_reg_pkg::*;
//    import vid_table_traffic_reg_pkg::*;

    //-----------------------------------
    // Test files
    //-----------------------------------
`include "clipper_test_base_cfg.svh"
`include "clipper_test_base.svh"
`include "sanity_test.svh"
`include "reg_test.svh"
`include "sat_test.svh"

`include "cpu2if_test.svh"

/*
`include "reg_test_lib.svh"
`include "reg_invalid_addr_test.svh"

`include "management_test.svh"
`include "cpu2fpga_test.svh"
`include "cpu2if_test.svh"
`include "if2all_test.svh"
`include "if2fm_test.svh"

`include "pc_test_cfg_vseq.svh"
`include "if2pc_test.svh"
`include "if2pc_shaper_test.svh"
`include "all2cpu_test.svh"

`include "hidden_rule_test.svh"
`include "inp_provision_test.svh"

`include "sat_hsi_test.svh"

`include "pause_frame_test.svh"
`include "xgmac_pause_linerate_test.svh"
`include "flush_stats_test.svh"
`include "cmd_proc_time_test.svh"
*/

endpackage

`endif
