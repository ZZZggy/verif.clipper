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
//
//------------------------------------------------------------------------------

`ifndef CLIPPER_TSE_CFG__SVH
`define CLIPPER_TSE_CFG__SVH

class clipper_tse_cfg extends mac_base_predictor_cfg;

    // Variable: reg_block
    // TSE instance register block
    tse_mac_reg_block reg_block;

    // UVM Factory Registration Macro
    `uvm_object_utils(clipper_tse_cfg)

    // Constructor: new
    function new (string name=type_name);
        super.new(name);
    endfunction

    //----------------------------------------
    // Group: Pure virtual functions override
    //----------------------------------------

    virtual function bit get_tx_enable();
        return reg_block.tx.cfg.mac_en.get();
    endfunction

    virtual function bit get_rx_enable();
        return reg_block.rx.cfg.mac_en.get();
    endfunction

    virtual function bit get_rx_keep_fcs();
        return reg_block.rx.cfg.keep_fcs.get();
    endfunction

    virtual function bit get_pause_fwd_ena();
        return reg_block.rx.cfg.pause_fwd_en.get();
    endfunction

    virtual function bit get_tx_fcs_insertion_disable();
        return reg_block.tx.cfg.fcs_insertion_disable.get();
    endfunction

    virtual function int get_mru();
        return reg_block.rx.cfg.mru.get();
    endfunction

    virtual function bit is_vlan(bit[15:0] tpid);
        if (tpid == 'h8100) return 1;
        if ((tpid == 'h88a8) && (reg_block.rx.vlan_2nd_cfg.vlan_88a8_en.get() != 0))
            return 1;
        if ((tpid == 'h9100) && (reg_block.rx.vlan_2nd_cfg.vlan_9100_en.get() != 0))
            return 1;
        return 0;
    endfunction
endclass

`endif
