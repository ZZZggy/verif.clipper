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
class clipper_bwp_model extends bwp_model#(c1lt_reg_block);

    `uvm_object_utils(clipper_bwp_model)
    function new(string name="clipper_bwp_model");
        super.new(name);
    endfunction

    function int unsigned get_profile_remap(int unsigned profile_ndx);
        return regmodel.bwp.profile_remap.class2bwp_profile_ndx[profile_ndx].profile_remap.profile_ndx.get();
    endfunction

    function bit get_color_mode(int unsigned profile_remap);
        return regmodel.bwp.profile_cfgs.profile_ndx[profile_remap].profile_cfg.cm.get();
    endfunction

// FIXME Correct remapping?
`define BWP_GET_SHAPER_PARAM(C_E)\
    function int unsigned get_``C_E``bs(int unsigned profile_remap);\
        return regmodel.bwp.bwp_shaper[profile_remap/256].params_``C_E``ir[profile_remap % 256].``C_E``bs.get();\
    endfunction\
    function int unsigned get_``C_E``ir(int unsigned profile_remap);\
        return regmodel.bwp.bwp_shaper[profile_remap/256].params_``C_E``ir[profile_remap % 256].``C_E``ir.get();\
    endfunction\
    function bit get_``C_E``ir_ena(int unsigned profile_remap);\
        return regmodel.bwp.bwp_shaper[profile_remap/256].params_``C_E``ir[profile_remap % 256].``C_E``ir_ena.get();\
    endfunction

    `BWP_GET_SHAPER_PARAM(c)
    `BWP_GET_SHAPER_PARAM(e)

endclass

