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

`ifndef CLIPPER_TEST_BASE__SVH
`define CLIPPER_TEST_BASE__SVH

virtual class clipper_test_base extends uvm_test;
    `uvm_component_utils(clipper_test_base)

    //--------------------------------------------------------------------------------
    // Group: Environment
    //--------------------------------------------------------------------------------
    clipper_test_base_cfg cfg;
    clipper_env           env;
    clipper_env_cfg       env_cfg;
    clipper_base_vseq     vseq;
    clipper_ctrl_vif_t    ctrl_vif;
    uvm_table_printer     printer;
    acd_cli_processor     cli = acd_cli_processor::get();

    function new (string name = type_name, uvm_component parent=null);
        super.new(name, parent);
        // Creating config in the constructor to allow derived testcases to
        // override default values
        cfg = clipper_test_base_cfg::type_id::create("cfg", this);
    endfunction

    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    // UVM phasing overrides
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------

    // Override: Create test environment: parse CLI, apply environment and type overrides,
    //           search for virtual interfaces, create and configure agents and sub-environments
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        // Initialize printer
        printer = new();
        printer.knobs.depth = 4;

        //-----------------------------------------------------------------------
        // Parse command line overrides for the environment
        //-----------------------------------------------------------------------
        parse_cli_env_cfg();

        // UVM Transaction recording config
        uvm_config_db#(int)::set(null, cfg.trans_rec ? "*" : "", "recording_detail", cfg.trans_rec);
        if (!cfg.trans_rec) uvm_config_db#(uvm_bitstream_t)::set(null, "", "recording_detail", 0);

        //-----------------------------------------------------------------------
        // Apply default type overrides.
        // Note that the "replace" parameter is set to 0 so that class extensions
        // can override the type.
        //-----------------------------------------------------------------------
        set_type_override_by_type(mac_frame_base_sequence_t::get_type(),
                                  mac_frame_good_traffic_sequence_t::get_type(), 0);

        //-----------------------------------------------------------------------
        // Create configuration objects and get virtual interfaces from config_db
        //-----------------------------------------------------------------------
        // Get testbench control interface
        if(!uvm_config_db#(clipper_ctrl_vif_t)::get(this, "", "CTRL_VIF", ctrl_vif))
                `uvm_fatal("CFGERR", "Failed to get CTRL_VIF from uvm_config_db")

        // Create top environment configuration
        env_cfg = clipper_env_cfg::type_id::create("env_cfg", this);

        // Get SFP control interface
        if(!uvm_config_db#(clipper_sfp_ctrl_vif_t)::get(this, "", "SFP_VIF", env_cfg.sfp_vif))
                `uvm_fatal("CFGERR", "Failed to get SFP_VIF from uvm_config_db")

        // Get MISC IOs interface
        if(!uvm_config_db#(clipper_misc_io_vif_t)::get(this, "", "MISC_VIF", env_cfg.misc_vif))
                `uvm_fatal("CFGERR", "Failed to get MISC_VIF from uvm_config_db")

        // Build sub-environments configuration
        build_acd_mm_cfg();
        build_eth_cfg();
        build_predictor_cfg();
        build_cpu_filter_cfg();
        build_eth_sb_cfg();
        set_regmodel_overrides();

        env_cfg.ts_cpy_cfg = clipper_ts_cpy_cfg::type_id::create("ts_cpy_cfg", this);

        //-----------------------------------------------------------------------
        // Apply CLI overrides to environment
        //-----------------------------------------------------------------------
        env_cfg.thi_ena           = cfg.thi_ena;
        ctrl_vif.thi_ena          = cfg.thi_ena;
        ctrl_vif.port_speed       = cfg.port_speed;
        ctrl_vif.sfp_loopback_ena = cfg.sfp_loopback_ena;

        //-----------------------------------------------------------------------
        // Build environment
        //-----------------------------------------------------------------------
        uvm_config_db#(platform_env_cfg)::set(this, "env", "cfg", env_cfg);
        env = clipper_env::type_id::create("env", this);

        //Print Factory configuration (overrides only)
        if (uvm_report_enabled(UVM_MEDIUM)) begin
            uvm_pkg::factory.print(.all_types(0));
        end

    endfunction // build_phase

    // Override: Connect sub-components
    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
    endfunction

    // Override: Report test topology
    virtual function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        // Collect test config coverage after elaboration
        cfg.sample_coverage();
        // Print test configuration
        `uvm_info("TEST", {"Test configuration :\n", cfg.sprint(printer)}, UVM_LOW)
        // Print test topology
        `uvm_info("TEST", {"Test topology :\n", this.sprint(printer)}, UVM_DEBUG)
    endfunction

//    // Override: Set drain time to 50us
//    virtual task run_phase(uvm_phase phase);
//        phase.raise_objection(this);
//        super.run_phase(phase);
//
//        uvm_test_done.set_drain_time(this, 50us);
//
//        phase.drop_objection(this);
//    endtask

    // Wait for resets to deassert before continuing.
    virtual task reset_phase(uvm_phase phase);
        super.reset_phase(phase);
        phase.raise_objection(this);
        fork
            begin
                fork
                    begin
                        if (ctrl_vif.rst) @(negedge ctrl_vif.rst);
                        env.regmodel.reset();
                    end
                    begin
                        #10us;
                        `uvm_fatal("TEST", "Reset failed to deassert!")
                    end
                join_any
                disable fork;
            end
        join
        // Additional delay for now...
        #1us;
        phase.drop_objection(this);
    endtask

    // Default configuration and initialization.
    virtual task pre_configure_phase(uvm_phase phase);
        uvm_status_e status;
        mac_init_seq mac_init;

        phase.raise_objection(this);

        // Misc.
        env.regmodel.timebase.globals.pps_ctrl.input_sel.set(0);
        env.regmodel.timebase.globals.pps_ctrl.input_internal.set(0);
        env.regmodel.timebase.globals.pps_ctrl.input_delay_compensation.set('hFFECB);
        env.regmodel.timebase.globals.pps_ctrl.update(status);

        // Initialize MACs
        mac_init = mac_init_seq::type_id::create("mac_init", this);
        init_vseq(mac_init);
        mac_init.start(null);

        phase.drop_objection(this);
    endtask

    // Wait for external memory calibration to complete.
    virtual task post_configure_phase(uvm_phase phase);
        uvm_status_e status;
        int timeout = $time;
        bit cal_done;

        super.post_configure_phase(phase);
        phase.raise_objection(this);

        `uvm_info("TEST", "Waiting for external memory to calibrate...", UVM_LOW)
        do begin
            #60us;
            if (ctrl_vif.g_use_beh_ram) begin
                cal_done = 1;
                break;
            end
            env.regmodel.mem_ctrl.phy_status.mirror(status, .check(UVM_NO_CHECK));
            cal_done = env.regmodel.mem_ctrl.phy_status.table_ram_master_phy_cal_success.get();
            cal_done &= env.regmodel.mem_ctrl.phy_status.data_ram_slave_phy_cal_success.get();
            cal_done &= env.regmodel.mem_ctrl.phy_status.data_ram_master_phy_cal_success.get();
        end while(timeout < ($time + 500us) && !cal_done);
        if (!cal_done)
            `uvm_fatal("TIMEOUT", "Calibration of external memories unsuccessful!")
        `uvm_info("TEST", "External memory calibrated", UVM_LOW)

        /*******************************************************************************************************************/
        `uvm_info(get_name, $sformatf("Init Timebase compensation"),UVM_LOW)
        for(int i=0; i < NB_IF_PORTS; i++) begin

            if(i<5) begin
                env.regmodel.timebase.compensations[2*i+0].time_offset.fract.set('hFF283); // toa
                env.regmodel.timebase.compensations[2*i+1].time_offset.fract.set('h406); // tod mac comp
            end else if (i<9) begin
                if (ctrl_vif.port_speed[i]==mac_pkg::PS_1G) begin
                    //TODO SM: Should it be FE7 to take into factor when clock are not aligned and toggle bit crosses clock domains in 1 clock cycle plus some very small delay?
                    env.regmodel.timebase.compensations[2*i+0].time_offset.fract.set('hFF283); // toa
                    env.regmodel.timebase.compensations[2*i+1].time_offset.fract.set('h41A); // tod mac comp
                    `ASSERT_MSG(CSATION_THUNDERFLY_1000, 1, "Assertion for Timebase compensation", UVM_NONE);
                end else begin
                    env.regmodel.timebase.compensations[2*i+0].time_offset.fract.set('hFF283); // toa
                    env.regmodel.timebase.compensations[2*i+1].time_offset.fract.set('h421); // tod mac comp
                    `ASSERT_MSG(COMPENSATION_ARCHIMEDES_10_000, 1, "Assertion for Timebase compensation", UVM_NONE);
                end
            end else begin
                env.regmodel.timebase.compensations[2*i+0].time_offset.fract.set('hFF283); // toa
                env.regmodel.timebase.compensations[2*i+1].time_offset.fract.set('h406); // tod mac comp
            end
        end

        foreach(env.regmodel.timebase.compensations[i]) begin
            env.regmodel.timebase.compensations[i].update(status);
        end

        /*******************************************************************************************************************/


        phase.drop_objection(this);
    endtask

    // Add end-of-test drain time
    virtual task pre_shutdown_phase(uvm_phase phase);
        phase.raise_objection(this);

        eot_drain();

        phase.drop_objection(this);
    endtask

    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    // Sub-environment configuration functions
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------

    // Build ACD_MM environment configuration object
    virtual function void build_acd_mm_cfg();
        env_cfg.acd_mm_cfg                         = acd_mm_env_cfg::type_id::create("acd_mm_cfg", this);
        env_cfg.acd_mm_cfg.agent_cfg               = acd_mm_agent_cfg::type_id::create("acd_mm_agent_cfg", this);
        env_cfg.acd_mm_cfg.agent_cfg.ena_latched   = '1;
        env_cfg.acd_mm_cfg.agent_cfg.ena_multibeat = '1;
        env_cfg.acd_mm_cfg.agent_cfg.ma_data_width = ACD_MM_MA_DATA_WIDTH * 8;
        env_cfg.acd_mm_cfg.agent_cfg.if_data_width = ACD_MM_IF_DATA_WIDTH * 8;
        env_cfg.acd_mm_cfg.agent_cfg.ack_latency   = ACD_MM_ACK_LATENCY;

        if(!uvm_config_db#(acd_mm_max_vif)::get(this, "", "ACD_MM_VIF", env_cfg.acd_mm_cfg.agent_cfg.vif))
            `uvm_fatal("CFGERR", "Failed to get ACD_MM_VIF from uvm_config_db")
    endfunction

    // Build TX and RX Ethernet environments configuration objects
    virtual function void build_eth_cfg();
        string dir[2] = '{"tx", "rx"}; // helper array to process both TX and RX directions

        // Set TSE_MII and XGMII overrides by instance
        for (int i = 0; i < NB_ALL_PORTS; i++) begin
            // Set overrides for RX and TX agents instances
            foreach (dir[d]) begin
                string eth_agent     = $sformatf("env.%s_eth.agent%0d",     dir[d], i);
                string eth_agent_cfg = $sformatf("env.%s_eth.agent_cfg%0d", dir[d], i);

                // Multi Ethernet Agent in Interface ports
                if (&{i>4,i<9}) begin
                    string sub_agent; // Name of sub-agent
                    // Top Multi Ethernet Agent
                    set_inst_override_by_type(eth_agent,     ethernet_agent::get_type,     multi_ethernet_agent::get_type);
                    set_inst_override_by_type(eth_agent_cfg, ethernet_agent_cfg::get_type, multi_ethernet_agent_cfg::get_type);
                    // XGMII sub-agent
                    sub_agent = $sformatf("%s.sub_agent%0d", eth_agent, MAC_10G);
                    set_inst_override_by_type({sub_agent,".driver"},      ethernet_driver::get_type,      xgmii_driver::get_type);
                    set_inst_override_by_type({sub_agent,".driver_cfg"},  ethernet_driver_cfg::get_type,  xgmii_driver_cfg::get_type);
                    set_inst_override_by_type({sub_agent,".monitor"},     ethernet_monitor::get_type,     xgmii_monitor::get_type);
                    set_inst_override_by_type({sub_agent,".monitor_cfg"}, ethernet_monitor_cfg::get_type, xgmii_monitor_cfg::get_type);
                    // TSE_MII sub-agent
                    sub_agent = $sformatf("%s.sub_agent%0d", eth_agent, MAC_1G);
                    set_inst_override_by_type({sub_agent,".driver"},      ethernet_driver::get_type,      tse_mii_driver::get_type);
                    set_inst_override_by_type({sub_agent,".driver_cfg"},  ethernet_driver_cfg::get_type,  tse_mii_driver_cfg::get_type);
                    set_inst_override_by_type({sub_agent,".monitor"},     ethernet_monitor::get_type,     tse_mii_monitor::get_type);
                    set_inst_override_by_type({sub_agent,".monitor_cfg"}, ethernet_monitor_cfg::get_type, tse_mii_monitor_cfg::get_type);
                end else begin
                    // else regular TSE_MII agents in CPU and MGMT ports
                    set_inst_override_by_type({eth_agent,".driver"},      ethernet_driver::get_type,      tse_mii_driver::get_type);
                    set_inst_override_by_type({eth_agent,".driver_cfg"},  ethernet_driver_cfg::get_type,  tse_mii_driver_cfg::get_type);
                    set_inst_override_by_type({eth_agent,".monitor"},     ethernet_monitor::get_type,     tse_mii_monitor::get_type);
                    set_inst_override_by_type({eth_agent,".monitor_cfg"}, ethernet_monitor_cfg::get_type, tse_mii_monitor_cfg::get_type);
                end
            end
        end

        // Create Multi Ethernet sub-environments configuration
        env_cfg.tx_eth_cfg           = multi_ethernet_env_cfg::type_id::create("tx_eth_cfg", this);
        env_cfg.rx_eth_cfg           = multi_ethernet_env_cfg::type_id::create("rx_eth_cfg", this);
        env_cfg.tx_eth_cfg.nb_agents = NB_ALL_PORTS;
        env_cfg.rx_eth_cfg.nb_agents = NB_ALL_PORTS;
        env_cfg.tx_eth_cfg.agent_cfg = new[NB_ALL_PORTS];
        env_cfg.rx_eth_cfg.agent_cfg = new[NB_ALL_PORTS];

        //Create Ethernet agent configuration for each port
        for (int i = 0; i < NB_ALL_PORTS; i++) begin
            // And for both TX and RX directions
            foreach (dir[d]) begin
                ethernet_agent_cfg agent_cfg; // Helper agent configuration object
                string agent_cfg_name = $sformatf("agent_cfg%0d", i);
                string agent_context  = $sformatf("env.%s_eth", dir[d]);
                string vif_name       = $sformatf("%s_GMII_VIF%0d", dir[d].toupper(), i);
                ethernet_vif_base gmii_vif; // GMII virtual interface present in all ports

                // Get GMII virtual interface handle
                if (!uvm_config_db #(ethernet_vif_base)::get(this, "", vif_name, gmii_vif)) `getcfgerr

                // If Interface ports, create Multi Ethernet agent config
                if (&{i>4,i<9}) begin
                    multi_ethernet_agent_cfg multi_agent_cfg = multi_ethernet_agent_cfg::type_id::create(agent_cfg_name, this, agent_context);
                    // Enable agent if not using PHY in simulation
                    multi_agent_cfg.ena           = ~ctrl_vif.g_use_phy;
                    multi_agent_cfg.nb_sub_agents = NB_IF_SUB_AGENTS;
                    multi_agent_cfg.sub_agent_cfg = new[NB_IF_SUB_AGENTS];
                    // Set active sub-agent based on configured port speed
                    case(cfg.port_speed[i])
                        PS_10G  : multi_agent_cfg.sel_agent = MAC_10G;
                        PS_1G   : multi_agent_cfg.sel_agent = MAC_1G;
                        default : `uvm_fatal("CFGERR", $sformatf("Unsupported speed %0s in port %0d", cfg.port_speed[i].name, i))
                    endcase
                    agent_context = $sformatf("%s.agent%0d", agent_context, i);
                    multi_agent_cfg.sub_agent_cfg[MAC_10G] = ethernet_agent_cfg::type_id::create($sformatf("sub_agent_cfg%0d", MAC_10G), this, agent_context);
                    multi_agent_cfg.sub_agent_cfg[MAC_1G]  = ethernet_agent_cfg::type_id::create($sformatf("sub_agent_cfg%0d", MAC_1G),  this, agent_context);
                    // Driver config
                    multi_agent_cfg.sub_agent_cfg[MAC_10G].driver_cfg             = xgmii_driver_cfg::type_id::create($sformatf("sub_agent_cfg%0d.driver_cfg", MAC_10G),  this, agent_context);
                    multi_agent_cfg.sub_agent_cfg[MAC_10G].driver_cfg.ipg_min     = 10;
                    multi_agent_cfg.sub_agent_cfg[MAC_10G].driver_cfg.ipg_avg     = 12;
                    multi_agent_cfg.sub_agent_cfg[MAC_10G].driver_cfg.ipg_max     = 14;
                    multi_agent_cfg.sub_agent_cfg[MAC_1G].driver_cfg              = tse_mii_driver_cfg::type_id::create($sformatf("sub_agent_cfg%0d.driver_cfg", MAC_1G),  this, agent_context);
                    multi_agent_cfg.sub_agent_cfg[MAC_1G].driver_cfg.preamble_min = 5;
                    multi_agent_cfg.sub_agent_cfg[MAC_1G].driver_cfg.preamble_max = 9;
                    multi_agent_cfg.sub_agent_cfg[MAC_1G].driver_cfg.ipg_min      = 10;
                    multi_agent_cfg.sub_agent_cfg[MAC_1G].driver_cfg.ipg_avg      = 12;
                    multi_agent_cfg.sub_agent_cfg[MAC_1G].driver_cfg.ipg_max      = 14;
                    // Set TSE_MII virtual interface
                    multi_agent_cfg.sub_agent_cfg[MAC_1G].vif = gmii_vif;
                    multi_agent_cfg.sub_agent_cfg[MAC_1G].ena = multi_agent_cfg.ena;
                    // Get and set XGMII virtual interface handle
                    vif_name = $sformatf("%s_XGMII_VIF%0d", dir[d].toupper(), i);
                    if (!uvm_config_db #(ethernet_vif_base)::get(this, "", vif_name, multi_agent_cfg.sub_agent_cfg[MAC_10G].vif))
                        `uvm_fatal("CFGERR", {"Virtual interface ", vif_name, " not found in uvm_config_db."})
                    multi_agent_cfg.sub_agent_cfg[MAC_10G].ena = multi_agent_cfg.ena;
                    // Implicit cast to base class
                    agent_cfg = multi_agent_cfg;

                end else begin
                    // else if CPU or MGMT ports, create regular Ethernet agent config with TSE_MII interface
                    agent_cfg     = ethernet_agent_cfg::type_id::create(agent_cfg_name, this, agent_context);
                    agent_cfg.vif = gmii_vif;
                    agent_cfg.ena = ~ctrl_vif.g_use_rgmii;
                    // Driver config
                    agent_cfg.driver_cfg              = tse_mii_driver_cfg::type_id::create("driver_cfg", this, agent_context);
                    agent_cfg.driver_cfg.preamble_min = 5;
                    agent_cfg.driver_cfg.preamble_max = 9;
                    agent_cfg.driver_cfg.ipg_min      = 10;
                    agent_cfg.driver_cfg.ipg_max      = 14;
                end
                // Common configurations to regular and multi agents
                agent_cfg.id            = i;
                agent_cfg.use_rate_ctrl = '1;
                // Using DUT name convetion, TX agent receives DUT's TX packets and RX agent drives DUT's RX port
                agent_cfg.active = (dir[d] == "tx" ? UVM_PASSIVE : UVM_ACTIVE);

                // Assign configuration to corresponding agent based on direction
                if (dir[d] == "tx") env_cfg.tx_eth_cfg.agent_cfg[i] = agent_cfg;
                else                env_cfg.rx_eth_cfg.agent_cfg[i] = agent_cfg;

            end
        end

        // Aggregated rate control
        env_cfg.rate_aggr_cfg     = acd_rate_controller_aggregate_cfg::type_id::create("rate_aggr_cfg");
        env_cfg.rate_aggr_cfg.ena = cfg.rate_ctrl;
        // Traffic-1
        env_cfg.rate_aggr_cfg.add_group(GROUP_TRAFFIC);
        foreach(PORT_TRAFFIC[i]) begin
            env_cfg.rate_aggr_cfg.add_slave(GROUP_TRAFFIC, PORT_TRAFFIC[i], env_cfg.rx_eth_cfg.agent_cfg[PORT_TRAFFIC[i]].rate_ctrl_cfg);
        end
        env_cfg.rate_aggr_cfg.set_group_ena(GROUP_TRAFFIC, env_cfg.rate_aggr_cfg.ena);
        env_cfg.rate_aggr_cfg.set_group_rate(GROUP_TRAFFIC, 20_000, acd_uvm_pkg::DSTR_RANDOM); // aggregate_rate = 2x 10Gbps
        env_cfg.rate_aggr_cfg.set_group_target_range(GROUP_TRAFFIC, 0, 10_000); // target_rate : 0 to 10Gbps
        env_cfg.rate_aggr_cfg.set_group_burst(GROUP_TRAFFIC, 0, 256*1024, 0);   // burst_size  : 0 to 256KiB, burst_ratio = 0%
    endfunction

    // Build predictor configuration objects
    virtual function void build_predictor_cfg();
        `uvm_info("CLIPPER_TEST_BASE", "Entering build_predictor_cfg", UVM_LOW)

        env_cfg.predictor_cfg = clipper_predictor_cfg::type_id::create("predictor_cfg", this);

        // THI CPU2x predictor
        env_cfg.predictor_cfg.cpu2x_cfg = thi_cpu2x_predictor_cfg::type_id::create("cpu2x_cfg", this);
        env_cfg.predictor_cfg.cpu2x_cfg.nb_ports = NB_ALL_PORTS;
        env_cfg.predictor_cfg.cpu2x_cfg.punch_delta = 0;
        // Configure compesations and tolerances
        env_cfg.predictor_cfg.cpu2x_cfg.compensation_ena              = '1;
        env_cfg.predictor_cfg.cpu2x_cfg.compensation_cmd_proc_time_rx = 'h0;  // Latency measured for FSX 1.1
        env_cfg.predictor_cfg.cpu2x_cfg.compensation_cmd_proc_time_tx = 'h0;  // Latency measured for FSX 1.1
        env_cfg.predictor_cfg.cpu2x_cfg.compensation_timestamp_fpga   = 'h0;  // Latency measured for FSX 1.1
        env_cfg.predictor_cfg.cpu2x_cfg.tolerance_cmd_proc_time       = 'h10;   // without congestion and with default ~cmd_proc_time_range~
                                                                                // no extra tolerance needed other then its 60ns granularity
        env_cfg.predictor_cfg.cpu2x_cfg.tolerance_timestamp_fpga      = 'h700;  // without congestion: 'h20 ~7.45ns
        // THI x2CPU predictor
        env_cfg.predictor_cfg.x2cpu_cfg = thi_x2cpu_predictor_cfg::type_id::create("x2cpu_cfg", this);
        env_cfg.predictor_cfg.x2cpu_cfg.compensation_ena              = '1;
        env_cfg.predictor_cfg.x2cpu_cfg.tolerance_timestamp_if        = 'hD7; // 50ns //'h200;  // ~119.2ns - empiric value for FSX 1.1

        // TSE predictor config
        foreach (env_cfg.predictor_cfg.tse_cfg[i]) begin
            env_cfg.predictor_cfg.tse_cfg[i] = clipper_tse_cfg::type_id::create($sformatf("tse_cfg%0d",i), this);
            env_cfg.predictor_cfg.tse_cfg[i].port_speed = cfg.port_speed[i];
            env_cfg.predictor_cfg.tse_cfg[i].vtags_cap =3;
        end

        // XGMAC predictor config
        foreach (env_cfg.predictor_cfg.xgmac_cfg[i]) begin
            env_cfg.predictor_cfg.xgmac_cfg[i] = clipper_xgmac_cfg::type_id::create($sformatf("xgmac_cfg%0d",i), this);
            env_cfg.predictor_cfg.xgmac_cfg[i].port_speed = cfg.port_speed[i];
            env_cfg.predictor_cfg.xgmac_cfg[i].vtags_cap = 3;
        end

        // type overrides
        set_type_override_by_type(class_action_xfer_fun_base#(c1lt_reg_block)::get_type(), clipper_insect_xfer_fun::get_type(), 0);
        set_type_override_by_type(clipper_class_rule_filter_hidden::get_type(), clipper_class_rule_filter_hidden_2_2::get_type(), 0);
        set_type_override_by_type(classifier_base#(c1lt_reg_block)::get_type(), clipper_classifier::get_type(), 0);

        `uvm_info("CLIPPER_TEST_BASE", "Exiting build_predictor_cfg", UVM_LOW)
    endfunction

    // Function to build CPU THI filter configuration object
    function void build_cpu_filter_cfg();
        env_cfg.cpu_filter_cfg = thi_filter_cfg::type_id::create("cpu_filter_cfg", this);
        // Disable warnings for unsupported frames (PC engine)
        // env_cfg.cpu_filter_cfg.unsupported_severity = UVM_INFO;
    endfunction

    // Function to build Ethernet scoreboards configuration object
    function void build_eth_sb_cfg();
        foreach(env_cfg.eth_sb_cfg[i]) begin
            env_cfg.eth_sb_cfg[i] = acd_scoreboard_config::type_id::create($sformatf("eth_sb_cfg%0d",i),this);
            // Do not expect activity in any port by default
            env_cfg.eth_sb_cfg[i].expect_activity = '0;
            // Enable Miscompare messages in UVM_DEBUG
            if (uvm_report_enabled(UVM_DEBUG)) env_cfg.eth_sb_cfg[i].miscompare_show_max = 10;
        end
        // Set THI stats type override
        set_inst_override_by_type("env.eth_sb0.stats_SB_MATCH", acd_scoreboard_stats#(acd_scoreboard_container#(ethernet_frame))::get_type,
                                                                thi_scoreboard_stats#(acd_scoreboard_container#(ethernet_frame))::get_type);
    endfunction

    // Overrideable function to set regmodel type overrides.
    virtual function void set_regmodel_overrides();
        // vsim has added "mem load" to VID tables so that their priority indexes are set to lowest priority by default
        //set_type_override_by_type(vid_table_reg_block::get_type(), vid_table_reg_block_init::get_type(), 0);
    endfunction

    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    // Sequence manipulation functions
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------

    // Method to initialise the virtual sequence handles
    function void init_vseq(clipper_base_vseq vseq);
        vseq.cpu_sequencer = env.rx_eth.agent[0].sequencer;
        foreach(vseq.if_sequencer[i]) begin
            vseq.if_sequencer[i] = env.rx_eth.agent[i+1].sequencer;
        end
        vseq.mgmt_sequencer = env.rx_eth.agent[NB_ALL_PORTS-1].sequencer;

        vseq.regmodel = env.regmodel;
    endfunction

    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    // Test control functions
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------

    // End of test drain.
    // Wait for activity to finish on MAC drivers and monitors.
    // Use a simple filter to "debounce" the activity detection.
    virtual task eot_drain();
        int cnt = cfg.eot_win_cnt;
        bit [28:0] tmp;

        `uvm_info("TEST", "End-of-test drain...", UVM_LOW)
        while(cnt > 0) begin
            #(cfg.eot_win_ns*1ns);
//            tmp = env.regmodel.flowmeter.fm_stats.port[0].fm_stat[255].packet_count.get();
            cnt = (ctrl_vif.rx_activity || ctrl_vif.tx_activity) ? cfg.eot_win_cnt : cnt-1;
        end
        `uvm_info("TEST", "End-of-test drain ended", UVM_DEBUG)
    endtask

    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    // CLI parsing functions
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------

    // Parse command line arguments and override environment configuration parameters e.g.
    // +UVM_REG_PATH=<UVM_FRONTDOOR|UVM_BACKDOOR|UVM_DEFAULT_PATH>
    // +THI_ENA=<0,1>
    virtual function void parse_cli_env_cfg();

        // Parse: port_speed
        get_cli_port_speed("+PORT_SPEED=", cfg.port_speed);

        cli.get_cli_bit("+RATE_CTRL=", cfg.rate_ctrl);

        // Parse: thi_ena
        // Enables THI path instead of ACD_MM for register accesses
        cli.get_cli_bit("+THI_ENA=", cfg.thi_ena);

        // Parse: sfp_loopback_ena
        get_cli_sfp_loopback("+SFP_LOOPBACK_ENA=", cfg.sfp_loopback_ena);

        // Parse: reg_cov_ena
        cli.get_cli_bit("+REG_COV_ENA=", cfg.reg_cov_ena);

        // Parse: uvm_reg_path
        cli.get_cli_reg_path("+UVM_REG_PATH=", cfg.uvm_reg_path);

        // TODO: review if keep following:
        // INP backpressure enable
        cli.get_cli_bit("+INP_BP_ENA=",      cfg.inp_bp_ena);
        // INP backpressure duty cycle
        cli.get_cli_uint("+INP_BP_DUTY_LO=", cfg.inp_bp_duty_lo);
        cli.get_cli_uint("+INP_BP_DUTY_HI=", cfg.inp_bp_duty_hi);
        // INP backpressure mode
        cli.get_cli_string("+INP_BP_MODE=",  cfg.inp_bp_mode);
    endfunction

    // Should be called by derived test cases
    // Parse command line arguments and override test configuration parameters e.g.
    // +SIZE_MIN=<val>
    virtual function void parse_cli_test_cfg();

        // Packet size
        cli.get_cli_uint("+SIZE_MIN=", cfg.size_min);
        cli.get_cli_uint("+SIZE_MAX=", cfg.size_max);

        // Stimulus generation count or time in us
        cli.get_cli_uint("+STIM_CNT_TIME_US=", cfg.stim_cnt_time_us);

        // Number of flows. The concept of "flow" is kept generic here to that testcases
        // can use it as they wish e.g. flow=rule_idx, flow=VIDs, flow=MAC addresses, etc.
        cli.get_cli_uint("+NB_FLOW=", cfg.nb_flow);

        // Rate
        cli.get_cli_real("+RATE=", cfg.rate);

        // Transaction recording
        cli.get_cli_bit("+TRANS_REC=", cfg.trans_rec);
    endfunction

    `DECLARE_GET_CLI_COUPLES(cli, port_speed,   port_speed_e ret [NB_ALL_PORTS], .atoi(), 1)
    `DECLARE_GET_CLI_COUPLES(cli, sfp_loopback, bit [NB_IF_PORTS-1:0] ret,       .atoi(), 1)

endclass

`endif
