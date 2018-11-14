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

// Class: mac_init_seq
// Enable MACs on all ports and set MRUs.
class mac_init_seq extends clipper_base_vseq;
    `uvm_object_utils(mac_init_seq)
    function new(string name="mac_init_seq");
        super.new(name);
    endfunction

    rand int unsigned if_mru = 10240;
    rand int unsigned cpu_mru = 2500;
    bit skip_cpu = 0;
    bit skip_mgmt = 0;

    constraint constrain_tse_mru {
        soft if_mru == 10240;
        soft cpu_mru == 2500;
    }

    /**
     * @Override
     */
    virtual task body();
        uvm_status_e status;

        // enable MACs and set MRUs to something reasonable
        // NOTE: leave CPU/MGMT with default values if using skip_*
        foreach(regmodel.mac_if.tse_mac[i]) begin
            if ((i == 0) && (skip_cpu)) continue;
            if ((i == $size(regmodel.mac_if.tse_mac)-1) && (skip_mgmt)) continue;
            regmodel.mac_if.tse_mac[i].rx.cfg.mac_en.set(1);
            case(i)
                // CPU, MGMNT
                0, $size(regmodel.mac_if.tse_mac)-1: regmodel.mac_if.tse_mac[i].rx.cfg.mru.set(cpu_mru);
                // USER
                default: regmodel.mac_if.tse_mac[i].rx.cfg.mru.set(if_mru);
            endcase
            regmodel.mac_if.tse_mac[i].rx.cfg.update(status);

            regmodel.mac_if.tse_mac[i].tx.cfg.mac_en.set(1);
            regmodel.mac_if.tse_mac[i].tx.cfg.update(status);
        end

        foreach(regmodel.mac10g_if[i]) begin
            regmodel.mac10g_if[i].xgmac_rx_cfg.rx_config.mru.set(if_mru);
            regmodel.mac10g_if[i].xgmac_rx_cfg.rx_config.rx_mac_enable.set(1);
            regmodel.mac10g_if[i].xgmac_rx_cfg.rx_config.update(status);
            regmodel.mac10g_if[i].xgmac_tx_cfg.tx_config.tx_mac_enable.set(1);
            regmodel.mac10g_if[i].xgmac_tx_cfg.tx_config.update(status);
        end
    endtask
endclass

