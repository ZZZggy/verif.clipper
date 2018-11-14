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

`ifndef XGMAC_CFG__SVH
`define XGMAC_CFG__SVH

class clipper_xgmac_cfg extends mac_base_predictor_cfg;

    // XGMAC instance register block
    mac10g_if_reg_block reg_block;

    // UVM Factory Registration Macro
    `uvm_object_utils_begin(clipper_xgmac_cfg)
    `uvm_object_utils_end

    function new (string name=type_name);
        super.new(name);
    endfunction

    //----------------------------------------
    // Group: Pure virtual functions override
    //----------------------------------------
    virtual function bit get_tx_enable();
        return reg_block.xgmac_tx_cfg.tx_config.tx_mac_enable.get();
    endfunction

    virtual function bit get_rx_enable();
        return reg_block.xgmac_rx_cfg.rx_config.rx_mac_enable.get();
    endfunction

    virtual function bit get_rx_keep_fcs();
        return reg_block.xgmac_rx_cfg.rx_config.rx_keep_fcs.get();
    endfunction

    virtual function bit get_pause_fwd_ena();
        return reg_block.xgmac_rx_cfg.rx_config.rx_pause_forwarding_enable.get();
    endfunction

    virtual function int get_mru();
        return reg_block.xgmac_rx_cfg.rx_config.mru.get();
    endfunction

    virtual function bit is_vlan(bit[15:0] tpid);
        if (tpid == 'h8100) return 1;
        if ((tpid == 'h88a8) && (reg_block.xgmac_rx_cfg.vlan_2nd_cfg.vlan_88a8_en.get() != 0))
            return 1;
        if ((tpid == 'h9100) && (reg_block.xgmac_rx_cfg.vlan_2nd_cfg.vlan_9100_en.get() != 0))
            return 1;

        // TBD : I suppose with latest XGMAC?
//        if ((reg_block.xgmac_rx_cfg.vlan_2nd_cfg.vlan_user_en.get() != 0) && (reg_block.xgmac_rx_cfg.vlan_2nd_cfg.user_vlan_type.get() == tpid))
//            return 1;
//        return 0;
    endfunction

endclass

`endif
