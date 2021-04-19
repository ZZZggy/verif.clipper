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

`ifndef CLIPPER_PREDICTOR__SVH
`define CLIPPER_PREDICTOR__SVH

// This predictor is end-to-end, no internal checking.
class clipper_predictor extends uvm_subscriber#(ethernet_frame);
    `uvm_component_utils(clipper_predictor)

    // Configuration
    clipper_predictor_cfg cfg;

    // Output notification ports
    uvm_analysis_port#(ethernet_frame) p_notify [NB_ALL_PORTS];

    // TSE and XGMAC analysis_imp forward ports
    uvm_analysis_export#(ethernet_frame) p_tse_export   [NB_ALL_PORTS];
    uvm_analysis_export#(ethernet_frame) p_xgmac_export [5:8];

    // TSE and XGMAC predictors
    mac_rx_base_predictor tse_rx   [NB_ALL_PORTS];
    mac_rx_base_predictor xgmac_rx [5:8];
    mac_tx_base_predictor mac_tx   [NB_ALL_PORTS];

    // CPU2X
    thi_cpu2x_predictor cpu2x;

    // Input section (passive mode)
    clipper_insect_xfer_fun insect;

    // TODO Input section (active mode)

    // Mgmt input section
    clipper_mgmt_predictor mgmt;

    // INP output conversion
    clipper_inp2cpu_conv inp2cpu_conv;

    // x2CPU
    thi_x2cpu_predictor x2cpu;

    // Traffic Manager IF output mesh
    clipper_tm_predictor tm;

    // Monitor
    clipper_mon_predictor mon;



    insect_tx_dom_prio_conv#(12) exp_dom_prio_conv;


    // TODO PKTGEN

    function new(string name = "clipper_predictor", uvm_component parent=null);
        super.new(name, parent);
        // create analysis ports
        foreach (p_notify[i]) p_notify[i] = new($sformatf("p_notify%0d",i), this);
        foreach (p_tse_export[i])   p_tse_export[i]   = new($sformatf("p_tse_export%0d",i), this);
        foreach (p_xgmac_export[i]) p_xgmac_export[i] = new($sformatf("p_xgmac_export%0d",i), this);
    endfunction

    // The uvm_subscriver 'analysis_port' is not used
    function void write(ethernet_frame_t t);
        `uvm_fatal("PREDICT", "The 'analysis_port' is not implemented. Use instead the ports: 'p_tse_export[i]' or 'p_xgmac_export[i]'")
    endfunction

    // Get configuration
    virtual function void build_phase(uvm_phase phase);
        `uvm_info("CLIPPER_PREDICTOR", "Entering build_phase", UVM_LOW)
        super.build_phase(phase);

        // get configuration
        if (!uvm_config_db#(clipper_predictor_cfg)::get(this, "", "cfg", cfg))
            `uvm_fatal("CFGERR", "Failed to get config.")

        // TSE predictors
        foreach (tse_rx[i]) begin
            string tse_name;

            cfg.tse_cfg[i].reg_block = cfg.regmodel.mac_if.tse_mac[i];
            cfg.tse_cfg[i].port_speed= PS_1G;

            tse_name = $sformatf("tse_rx%0d", i);
            uvm_config_db#(mac_base_predictor_cfg)::set(this, tse_name, "cfg", cfg.tse_cfg[i]);
            tse_rx[i] = mac_rx_base_predictor::type_id::create(tse_name, this);
        end

        // XGMAC predictors
        foreach (xgmac_rx[i]) begin
            string xgmac_name;

            cfg.xgmac_cfg[i].reg_block = cfg.regmodel.mac10g_if[i-5];
            cfg.xgmac_cfg[i].port_speed = PS_10G;

            xgmac_name = $sformatf("xgmac_rx%0d", i);
            uvm_config_db#(mac_base_predictor_cfg)::set(this, xgmac_name, "cfg", cfg.xgmac_cfg[i]);
            xgmac_rx[i] = mac_rx_base_predictor::type_id::create(xgmac_name, this);
        end

         foreach (mac_tx[i]) begin
             string mac_name;

            mac_name = $sformatf("mac_tx%0d", i);
            uvm_config_db#(mac_base_predictor_cfg)::set(this, mac_name, "cfg", cfg.tse_cfg[i]);
            mac_tx[i] = mac_tx_base_predictor::type_id::create(mac_name, this);
         end

        // configure and build THI sub-env
        uvm_config_db#(thi_cpu2x_predictor_cfg)::set(this, "cpu2x", "cfg", cfg.cpu2x_cfg);
        cpu2x  = thi_cpu2x_predictor::type_id::create("cpu2x", this);
        uvm_config_db#(thi_x2cpu_predictor_cfg)::set(this, "x2cpu", "cfg", cfg.x2cpu_cfg);
        x2cpu  = thi_x2cpu_predictor::type_id::create("x2cpu", this);

        if (cfg.active == UVM_ACTIVE) begin
            // TODO
            `uvm_warning("TODO", "Active INP sub-environment currently not supported.")
        end else begin
            uvm_config_db#(c1lt_reg_block)::set(this, "insect", "regmodel", cfg.regmodel);
            insect = clipper_insect_xfer_fun::type_id::create("insect", this);
        end

        uvm_config_db#(c1lt_reg_block)::set(this, "mgmt", "regmodel", cfg.regmodel);
        mgmt = clipper_mgmt_predictor::type_id::create("mgmt", this);

        tm = clipper_tm_predictor::type_id::create("tm", this);

        mon = clipper_mon_predictor::type_id::create("mon", this);

        // configure and build converters
        inp2cpu_conv = clipper_inp2cpu_conv::type_id::create("inp2cpu_conv", this);
        inp2cpu_conv.regmodel = cfg.regmodel;


        exp_dom_prio_conv = insect_tx_dom_prio_conv#(12)::type_id::create("exp_dom_prio_conv", this);


        `uvm_info("CLIPPER_PREDICTOR", "Exiting build_phase", UVM_LOW)
    endfunction

    // TLM connections
    virtual function void connect_phase(uvm_phase phase);
        `uvm_info("CLIPPER_PREDICTOR", "Entering connect_phase", UVM_LOW)
        super.connect_phase(phase);

        // CPU RX MAC IF to cpu2x/THI
        p_tse_export[PORT_CPU].connect(tse_rx[PORT_CPU].analysis_export);
        tse_rx[PORT_CPU].p_notify.connect(cpu2x.analysis_export);

        // CPU2IF and FPGA2CPU
        foreach(cpu2x.p_notify[i]) cpu2x.p_notify[i].connect(mac_tx[i].analysis_export);

        // Management
        p_tse_export[PORT_MGMT].connect(tse_rx[PORT_MGMT].analysis_export);
        tse_rx[PORT_MGMT].p_notify.connect(mgmt.analysis_export);
        mgmt.p_notify.connect(x2cpu.analysis_export);

        // User RX MAC IF to input section
        if (cfg.active == UVM_ACTIVE) begin
            // TODO
            `uvm_warning("TODO", "Active INP sub-environment currently not supported.")
        end else begin
            // INP RX
            foreach (p_xgmac_export[i]) begin
                // XMAC
                p_xgmac_export[i].connect(xgmac_rx[i].analysis_export);
                xgmac_rx[i].p_notify.connect(insect.analysis_export);
            end

            foreach (p_tse_export[i]) begin
                // TSE
                if(i != PORT_CPU && i != PORT_MGMT) begin
                    p_tse_export[i].connect(tse_rx[i].analysis_export);
                    tse_rx[i].p_notify.connect(insect.analysis_export);
                end
            end

            // INP pre cpu to THI/CPU
            insect.p_notify_cpu.connect(inp2cpu_conv.analysis_export);
            // INP post to TM
            insect.p_notify_if.connect(tm.analysis_export);
            // INP pre mon to TM
            foreach(insect.p_notify_mon[i])
                insect.p_notify_mon[i].connect(mon.analysis_export);
        end
        // INP output converters
        inp2cpu_conv.p_notify.connect(x2cpu.analysis_export);

        // CPU prediciton port to MAC
        x2cpu.p_notify.connect(mac_tx[PORT_CPU].analysis_export);

        // TM to MAC TX
        foreach(tm.p_notify[i]) tm.p_notify[i].connect(mac_tx[i].analysis_export);
        foreach(mon.p_notify[i]) mon.p_notify[i].connect(mac_tx[PORT_MON[i]].analysis_export);

        // MAC TX to predictor output
        foreach(mac_tx[i]) mac_tx[i].p_notify.connect(this.p_notify[i]);

        // TBD : need to connect that?
        insect.classifier.dom_idx_ap.connect(exp_dom_prio_conv.analysis_export);

        `uvm_info("CLIPPER_PREDICTOR", "Exiting connect_phase", UVM_LOW)
    endfunction

endclass

`endif
