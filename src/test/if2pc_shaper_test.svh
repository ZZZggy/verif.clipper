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

`ifndef IF2PC_SHAPER_TEST__SVH
`define IF2PC_SHAPER_TEST__SVH

// Class: if2pc_shaper_test
//
// Test path: TRAFFIC(IF) -> Packet Capture Engine -> CPU
//
// - Add shaping and rate measurement to basic IF2PC test
// - Use packet sizes and run length more conducive to rate meter measurements
class if2pc_shaper_test extends if2pc_test;
    `uvm_component_utils(if2pc_shaper_test)

    // Constructor
    function new(string name="if2pc_shaper_test", uvm_component parent=null);
        super.new(name, parent);
        if (!cfg.randomize()) `randerr
        cfg.stim_cnt_time_us = 1_000;
        cfg.size_min = 64;
        cfg.size_max = 512; // Keep packets small for better accuracy of transaction-based acd_meter
        cfg.eot_win_cnt = 100;  // eot-drain after last activity

        if_rate_total = 1_000; // Mbps
        pc_cir_kbps = 600_000;
        // Enable CLI overrides for test parameters
        parse_cli_test_cfg();
    endfunction

    //--------------------------------------------------------------------------------
    // Group: UVM overrides
    //--------------------------------------------------------------------------------

    // Task: configure_phase
    // Configure stimuli rate control MACs, input section and packet capture engine.
    virtual task configure_phase(uvm_phase phase);
        uvm_status_e status;

        phase.raise_objection(this);
        super.configure_phase(phase);

        //-------------------------------------------------------------------
        // Configure rate meters
        //-------------------------------------------------------------------
        env_cfg.tx_eth_cfg.rate_meter_cfg[0].ena               = '1;
        env_cfg.tx_eth_cfg.rate_meter_cfg[0].bit_count_adjust  = 20*8;
        env_cfg.tx_eth_cfg.rate_meter_cfg[0].measure_bps       = '1;
        env_cfg.tx_eth_cfg.rate_meter_cfg[0].check_bps         = '1;
        env_cfg.tx_eth_cfg.rate_meter_cfg[0].interval_rate_ena = '1;
        env_cfg.tx_eth_cfg.rate_meter_cfg[0].interval_rate_bps_expect = pc_cir_kbps / 1000; // FIXME acd_rate_meter using Mbps instead of bps
        env_cfg.tx_eth_cfg.rate_meter_cfg[0].interval_rate_bps_uncertainty = 10;            // FIXME acd_rate_meter using Mbps instead of bps
        env_cfg.tx_eth_cfg.rate_meter_cfg[0].start_interval   = 2;
        env_cfg.tx_eth_cfg.rate_meter_cfg[0].end_interval     = 5;
        env_cfg.tx_eth_cfg.rate_meter_cfg[0].interval_time_ps = longint'(longint'(cfg.stim_cnt_time_us)*1000*1000)/(env_cfg.tx_eth_cfg.rate_meter_cfg[0].end_interval+1);
        begin
            string s = "Rate meter TX0\n";
            s = {s, $sformatf("interval_rate_expect      = %0d\n", env_cfg.tx_eth_cfg.rate_meter_cfg[0].interval_rate_bps_expect)};
            s = {s, $sformatf("interval_rate_uncertainty = %0d\n", env_cfg.tx_eth_cfg.rate_meter_cfg[0].interval_rate_bps_uncertainty)};
            s = {s, $sformatf("start_interval            = %0d\n", env_cfg.tx_eth_cfg.rate_meter_cfg[0].start_interval)};
            s = {s, $sformatf("end_interval              = %0d\n", env_cfg.tx_eth_cfg.rate_meter_cfg[0].end_interval)};
            s = {s, $sformatf("interval_time_ps          = %0d\n", env_cfg.tx_eth_cfg.rate_meter_cfg[0].interval_time_ps)};
            `uvm_info("TEST", s, UVM_MEDIUM)
        end

        // Set somewhat smaller PC MTU for better precision
        env.regmodel.packet_capture.cfg.cpu_mtu_size.set(2048);
        env.regmodel.packet_capture.cfg.update(status);

        phase.drop_objection(this);
    endtask

endclass

`endif

