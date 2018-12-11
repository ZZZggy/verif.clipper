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

`ifndef CLIPPER_ENV__SVH
`define CLIPPER_ENV__SVH

class clipper_env extends platform_env#(c1lt_reg_block);
    `uvm_component_utils(clipper_env)

    //--------------------------------------------------------------------------------
    // Group: Environment
    //--------------------------------------------------------------------------------
    clipper_env_cfg   cfg;
    clipper_predictor predictor;
    thi_filter        cpu_filter;
    acd_scoreboard#(ethernet_frame) eth_sb[PORT_CPU:PORT_MGMT];

    //--------------------------------------------------------------------------------
    // Group: sub-environment
    //--------------------------------------------------------------------------------
//    insect2pce_conv insect2pcm;

    function new (string name = type_name, uvm_component parent=null);
        super.new(name, parent);
    endfunction

    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    // UVM phasing overrides
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------

    // Override: Call platform_env build phase and create scoreboards
    virtual function void build_phase(uvm_phase phase);
        `uvm_info("CLIPPER_ENV", "Entering build_phase", UVM_LOW)
        regmodel_parameterization();
        super.build_phase(phase);

        // Get env config handle from super class
        if (!$cast(cfg, super.cfg)) `uvm_fatal("CFGERR", "Config cast from base class failed.")

        // Create predictor
        cfg.predictor_cfg.regmodel = regmodel;
        // ?
//        cfg.predictor_cfg.cpu2x_cfg.cmd_proc_time_range_reg = regmodel.globals.cmd_proc_time_range;
        uvm_config_db#(clipper_predictor_cfg)::set(this, "predictor", "cfg", cfg.predictor_cfg);
        predictor = clipper_predictor::type_id::create("predictor", this);

        // Input section converter
        // ?
//        cfg.insect2pcm_cfg = item2stream_conv_cfg::type_id::create("insect2pcm_cfg", this);
//        cfg.insect2pcm_cfg.port_id = PORT_TRAFFIC;
//        uvm_config_db#(item2stream_conv_cfg)::set(this, "insect2pcm", "cfg", cfg.insect2pcm_cfg);
//        insect2pcm = insect2pce_conv::type_id::create("insect2pcm", this);

        // CPU THI filter
        uvm_config_db#(thi_filter_cfg)::set(this, "cpu_filter", "cfg", cfg.cpu_filter_cfg);
        cpu_filter = thi_filter::type_id::create("cpu_filter", this);

        // Ethernet scoreboards
        foreach (eth_sb[i]) begin
            string obj_name = $sformatf("eth_sb%0d", i);
            uvm_config_db#(acd_scoreboard_config)::set(this, obj_name, "cfg", cfg.eth_sb_cfg[i]);
            eth_sb[i] = acd_scoreboard#(ethernet_frame)::type_id::create(obj_name, this);
        end
        `uvm_info("CLIPPER_ENV", "Exiting build_phase", UVM_LOW)
    endfunction

    // Override: Connect sub-components
    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);

        // Ingress Packets to Predictor
        foreach (rx_eth.agent[i]) begin
            // Interface ports have multi_agents. Connect TSE and XGMAC to respective export ports.
            if (&{i>4,i<9}) begin
                multi_ethernet_agent multi_agent = multi_ethernet_agent'(rx_eth.agent[i]);
                multi_agent.sub_agent[MAC_1G].p_notify.connect(predictor.p_tse_export[i]);
                multi_agent.sub_agent[MAC_10G].p_notify.connect(predictor.p_xgmac_export[i]);
            end else begin
                // CPU and MGMT have regular TSE agent
                rx_eth.agent[i].p_notify.connect(predictor.p_tse_export[i]);
            end
        end

        // CPU filter connection
        tx_eth.agent[PORT_CPU].p_notify.connect(cpu_filter.analysis_export);
        // ?
//        cpu_filter.others_port.connect(eth2pcth.analysis_export);

        // Ethernet scoreboards connection
        foreach (eth_sb[i]) begin
            case (cfg.eth_sb_connect)
                // Default: Black box Predictor and Egress ports
                DEFAULT_ETH_SB : begin
                    predictor.p_notify[i].connect(eth_sb[i].exp_ap);
                    if (i == PORT_CPU) begin
                        cpu_filter.thi_port.connect(eth_sb[i].obs_ap);
                    end else begin
                        tx_eth.agent[i].p_notify.connect(eth_sb[i].obs_ap);
                    end
                end
                // RX_ETH_AGENT debug
                DBG_RX_AGENT : begin
                    rx_eth.agent[i].req_port.connect(eth_sb[i].exp_ap);
                    rx_eth.agent[i].p_notify.connect(eth_sb[i].obs_ap);
                end
                // RX MAC_PREDICTOR debug
                DBG_RX_MAC_PREDICT : begin
                    rx_eth.agent[i].req_port.connect(eth_sb[i].exp_ap);
                    predictor.tse_rx[i].p_notify.connect(eth_sb[i].obs_ap);
                    if (&{i>4,i<9}) begin
                        predictor.xgmac_rx[i].p_notify.connect(eth_sb[i].obs_ap);
                    end
                end
                default : ;
            endcase
        end
    endfunction


    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    // Environment functions
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------

    // Create and load register parameterizations for blocks that need it.
    // Should be called before regmodel.build()
    // FIXME Needs to be updated with real parameters eventually...
    // ?
    virtual function void regmodel_parameterization();
        acd_reg_param_cfg reg_param = acd_reg_param_cfg::type_id::create("reg_param", this);
        int prt, nb_pe, nb_rule, nb_field;

        for (int i=0; i<NB_IF_PORTS; i++) begin
            prt      = i+1;
            nb_pe    = prt inside {PORT_1G} ?   1 :   4;
            nb_rule  = prt inside {PORT_1G} ? 256 :  32;
            nb_field = prt inside {PORT_1G} ? 512 :  64;

            reg_param.cfg[$sformatf("regmodel.classifiers.p[%0d].CLASS2_NB_PE", i)]                                              = nb_pe;
            reg_param.cfg[$sformatf("regmodel.classifiers.p[%0d].globals.pe.CLASS2_NB_PE", i)]                                   = nb_pe;
            reg_param.cfg[{$sformatf("regmodel.classifiers.p[%0d].globals.capabilities", i), ".CLASS2_NB_RULES"}]                = nb_rule;
            reg_param.cfg[{$sformatf("regmodel.classifiers.p[%0d].globals.capabilities", i), ".CLASS2_NB_FIELDS"}]               = nb_field;
            reg_param.cfg[{$sformatf("regmodel.classifiers.p[%0d].globals.capabilities", i), ".CLASS2_NB_RULES_WIDTH"}]          = prt inside {PORT_1G} ? 8 : 5;
            reg_param.cfg[{$sformatf("regmodel.classifiers.p[%0d].globals.capabilities", i), ".CLASS2_NB_FIELDS_WIDTH"}]         = prt inside {PORT_1G} ? 9 : 6;
            reg_param.cfg[{$sformatf("regmodel.classifiers.p[%0d].globals.capabilities", i), ".CLASS2_CMPLX_CLK_PER_PS"}]        = prt inside {PORT_1G} ? 6000 : 4444;
            reg_param.cfg[{$sformatf("regmodel.classifiers.p[%0d].globals.capabilities", i), ".CLASS2_NB_COMPARATOR_PER_PE"}]    = 2;
            reg_param.cfg[{$sformatf("regmodel.classifiers.p[%0d].globals.capabilities", i), ".CLASS2_NB_COMPARATOR16b_PER_PE"}] = 2;
            reg_param.cfg[{$sformatf("regmodel.classifiers.p[%0d].rule_info", i), ".CLASS2_NB_PE"}]                              = nb_pe;

            for(int j=0; j < nb_pe; j++) begin
                reg_param.cfg[{$sformatf("regmodel.classifiers.p[%0d].rule_info.cfg_status[%0d]",i,j), ".CLASS2_NB_RULES_WIDTH"}]     = prt inside {PORT_1G} ? 8 : 5;
                reg_param.cfg[{$sformatf("regmodel.classifiers.p[%0d].rule_info.cfg[%0d]",i,j), ".CLASS2_NB_RULES_WIDTH"}]            = prt inside {PORT_1G} ? 8 : 5;
                reg_param.cfg[{$sformatf("regmodel.classifiers.p[%0d].rule_info.cfg[%0d]",i,j), ".CLASS2_MAX_NB_RULE_TO_SCAN_WIDTH"}] = prt inside {PORT_1G} ? 7 : 4;
                reg_param.cfg[{$sformatf("regmodel.classifiers.p[%0d].rule_info.cfg[%0d]",i,j), ".CLASS2_NB_RULE_DOMAINS"}]           = 5;
                reg_param.cfg[{$sformatf("regmodel.classifiers.p[%0d].pe[%0d]",i,j), ".CLASS2_NB_RULES"}]                             = nb_rule;
                reg_param.cfg[{$sformatf("regmodel.classifiers.p[%0d].pe[%0d]",i,j), ".CLASS2_NB_FIELDS"}]                            = nb_field;
                for(int k=0; k<nb_rule; k++) begin
                    // TBD : 7 and 8 different
                    reg_param.cfg[{$sformatf("regmodel.classifiers.p[%0d].pe[%0d].rule[%0d]",i,j,k), ".CLASS2_NB_FIELDS_WIDTH"}]            = prt inside {PORT_1G} ? 9 : 6;
                    reg_param.cfg[{$sformatf("regmodel.classifiers.p[%0d].pe[%0d].rule[%0d]",i,j,k), ".CLASS2_INDEX_WIDTH"}]                = prt inside {PORT_1G} ? 9 : 11;
                    reg_param.cfg[{$sformatf("regmodel.classifiers.p[%0d].pe[%0d].rule[%0d]",i,j,k), ".CLASS2_NB_RULE_DOMAINS"}]            = 5;
                    reg_param.cfg[{$sformatf("regmodel.classifiers.p[%0d].pe[%0d].rule[%0d]",i,j,k), ".CLASS2_PREFILTER_KEYS_WIDTH"}]       = 15;
                    reg_param.cfg[{$sformatf("regmodel.classifiers.p[%0d].pe[%0d].rule[%0d]",i,j,k), ".CLASS2_MAX_NB_FIELD_TO_SCAN_WIDTH"}] = 4;
                end
            end
        end

        // put parameterization in configuration database
        uvm_config_db#(acd_reg_param_cfg)::set(null , "regmodel.classifiers.*", "cfg", reg_param);

    endfunction

endclass

`endif
