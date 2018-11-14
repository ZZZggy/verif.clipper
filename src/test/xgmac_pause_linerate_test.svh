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

`ifndef XGMAC_PAUSE_LINERATE_TEST__SVH
`define XGMAC_PAUSE_LINERATE_TEST__SVH

// Class: xgmac_pause_linerate_test
//
// Test XGMAC flow control at line-rate
//
// Traffic ports fixed at 10G (to use XGMAC).
// Enable forwarding from port 5 to 6.
// Generate line-rate traffic in port 5.
// Send pause frames in port 6.
//
// XON-XOFF check:
// - Send pause frame with a large random pause quanta (XOFF)
// - Check that output rate goes to zero
// - Send pause frame with small(0-3) random quanta to re-enable traffic output (XON)
// - Check that output rate goes back to line-rate
// - Stop traffic generation until all buffered frames have come out from DUT
//
// Expired Pause time check:
// - Send pause frame with a not so large random pause quanta
// - Check that output rate goes to zero
// - Wait for necessary time for quanta to expire
// - Check that output rate goes back to line-rate
// - Stop traffic generation until all buffered frames have come out from DUT
//
//--------------------------------------------------------------------------------------------------
// PLUSARGS:
// +STIM_CNT_TIME_US=<int>  Number of times to perform each of the checks above (XON-XOFF & Expired Pause time)
//--------------------------------------------------------------------------------------------------
class xgmac_pause_linerate_test extends pause_frame_test;

    `uvm_component_utils(xgmac_pause_linerate_test)

    // Constructor: new
    function new(string name="xgmac_pause_linerate_test", uvm_component parent=null);
        super.new(name, parent);
        if (!cfg.randomize()) `randerr
        // Fix traffic at 10G
        cfg.port_speed[PORT_TRAFFIC[0]] = PS_10G;
        cfg.port_speed[PORT_TRAFFIC[1]] = PS_10G;
        // Default repetitions
        cfg.stim_cnt_time_us = 10;
        // 1us end-of-test drain
        cfg.eot_win_cnt = 10;
        // Enable CLI overrides for test parameters
        parse_cli_test_cfg();
    endfunction


    //---------------------------------------
    // Group: UVM phase overrides
    //---------------------------------------

    // Task: configure_phase
    // Configure input section for loopback
    virtual task configure_phase(uvm_phase phase);
        phase.raise_objection(this);

        // Disable PC engine
        disable_pce();

        // Configure Input Section by crossing Traffic ports
        configure_insect(.cross_traffic(1), .mon_fwd(0), .cpu_fwd(0));

        // Stimuli rate control enabled
        env.rate_aggr.cfg.ena = 1;
        configure_traffic(.run(1));

        // Enable TX Traffic rate meters
        foreach (PORT_TRAFFIC[i]) begin
            env.tx_eth.rate_meter[PORT_TRAFFIC[i]].cfg.ena = 1;
            env.tx_eth.rate_meter[PORT_TRAFFIC[i]].cfg.bit_count_adjust = (12 + 8) * 8; // IGP + Preamble
            env.tx_eth.rate_meter[PORT_TRAFFIC[i]].cfg.measure_bps = 1;
            env.tx_eth.rate_meter[PORT_TRAFFIC[i]].cfg.check_bps = 0;
            env.tx_eth.rate_meter[PORT_TRAFFIC[i]].cfg.global_rate_ena = 0;
            env.tx_eth.rate_meter[PORT_TRAFFIC[i]].cfg.global_rate_greater = 0;
            env.tx_eth.rate_meter[PORT_TRAFFIC[i]].cfg.global_rate_bps_expect = 0;
            env.tx_eth.rate_meter[PORT_TRAFFIC[i]].cfg.global_rate_bps_uncertainty = 0;
        end

        phase.drop_objection(this);
    endtask

    // Task: main_phase
    // Test XON-XOFF and Pause time expiration mechanisms
    virtual task main_phase(uvm_phase phase);
        typedef bit[15:0] pause_quanta_t;
        // Time of 1 pause_quanta = 512 bits transmisison time
        time t_quanta_10g = 51.2ns;
        // 64B Frame quanta = (64B frame + 8B preamble + 12B IFG) * 8-bits / 512-bits quanta-def
        pause_quanta_t frame_64b_quanta = pause_quanta_t'($ceil((64+8+12) * 8.0 / 512.0));
        //
        time t_frame_64b = frame_64b_quanta * t_quanta_10g;
        // Minimum quanta for pause request in testcase with mixed 1G and 10G ports
        pause_quanta_t min_quanta = 50 * frame_64b_quanta;
        // Maximum quanta allowed
        pause_quanta_t max_quanta = 16'hFFFF;
        // Final quanta value for pause request
        pause_quanta_t quanta;
        // Constants
        const int PORT_IN  = 5;
        const int PORT_OUT = 6;
        const real LINE_RATE_MBPS = 9_000; // 9 Gbps : line rate with 10% margin

        phase.raise_objection(this);

        fork
            // Constant 64B line-rate traffic from Port 5 to 6
            begin : TRAFFIC_GEN
                if_traffic(64, 2**30, '{PORT_IN});
                `uvm_error("TEST", "Traffic generation ended before test")
            end

            // Pause iterations on Port 6
            begin : PAUSE_TEST
                `uvm_info("TEST", "Waiting to get line-rate on output", UVM_LOW)
                env.tx_eth.rate_meter[PORT_OUT].reset();
                #(30 * t_frame_64b);
                check_tx_rate(PORT_OUT, LINE_RATE_MBPS);

                // Loop for XON - XOFF mechanism
                `uvm_info("TEST", $sformatf("XON-XOFF: quanta inside [%0d : %0d]", min_quanta, max_quanta), UVM_LOW)
                for (int i = 0; i < cfg.stim_cnt_time_us; i++) begin
                    `uvm_info("TEST", $sformatf("XON-XOFF iteration: %0d" , i), UVM_LOW)

                    // Pause interfaces
                    if(!std::randomize(quanta) with {quanta inside {[min_quanta : max_quanta]};}) `randerr
                    pause_gen(quanta);
                    env.tx_eth.rate_meter[PORT_OUT].reset();
                    #(5 * t_frame_64b);
                    check_tx_rate(PORT_OUT, 0);

                    // Release Pause
                    if(!std::randomize(quanta) with { quanta dist { 16'h0000 := 50,
                                                                   [16'h0001 : 16'h0003] :/ 50 }; }) `randerr
                    pause_gen(quanta);
                    #(5 * t_frame_64b);
                    env.tx_eth.rate_meter[PORT_OUT].reset();
                    #(30 * t_frame_64b);
                    check_tx_rate(PORT_OUT, LINE_RATE_MBPS);

                    // Empty DUT FIFOs
                    configure_traffic(.run(0));
                    #(100 * t_frame_64b);
                    configure_traffic(.run(1));
                    env.tx_eth.rate_meter[PORT_OUT].reset();
                    #(30 * t_frame_64b);
                    check_tx_rate(PORT_OUT, LINE_RATE_MBPS);

                end // XON-OFF loop

                // Loop Pause time expiration mechanism
                `uvm_info("TEST", $sformatf("Pause expiration: quanta inside [%0d : %0d]", min_quanta, min_quanta+20), UVM_LOW)
                for (int i = 0; i < cfg.stim_cnt_time_us; i++) begin
                    `uvm_info("TEST", $sformatf("Pause expiration iteration: %0d" , i), UVM_LOW)

                    // Pause interfaces
                    if(!std::randomize(quanta) with {quanta inside {[min_quanta : min_quanta+20]};}) `randerr
                    pause_gen(quanta);
                    env.tx_eth.rate_meter[PORT_OUT].reset();
                    #(5 * t_frame_64b);
                    check_tx_rate(PORT_OUT, 0);

                    // Wait end of pause
                    #(quanta * t_quanta_10g);
                    env.tx_eth.rate_meter[PORT_OUT].reset();
                    #(30 * t_frame_64b);
                    check_tx_rate(PORT_OUT, LINE_RATE_MBPS);

                    // Empty DUT FIFOs
                    configure_traffic(.run(0));
                    #(2 * quanta * t_frame_64b);
                    configure_traffic(.run(1));
                    env.tx_eth.rate_meter[PORT_OUT].reset();
                    #(30 * t_frame_64b);
                    check_tx_rate(PORT_OUT, LINE_RATE_MBPS);

                end // Pause expiration loop

            end : PAUSE_TEST

        join_any

        disable fork; // kill traffic thread

        phase.drop_objection(this);
    endtask


    //---------------------------------------
    // Group: Custom methods
    //---------------------------------------

    // Task: check_tx_rate
    // Compare measure TX with min targert
    virtual task check_tx_rate(int port_id, real min_rate_mbps);
        real rate_mbps = env.tx_eth.rate_meter[port_id].get_global_mbps();
        if (rate_mbps >= min_rate_mbps) begin
            `uvm_info("TEST::CHECK", $sformatf("TX Port %0d: %0d mbps", port_id, rate_mbps), UVM_LOW)
        end else begin
            `uvm_error("TEST::CHECK", $sformatf("TX Port %0d: %0d mbps - expected: %0d mbps", port_id, rate_mbps, min_rate_mbps))
        end
    endtask

    // Task: configure_traffic
    // Configures Rate Control to stop traffic when enabled, line rate when disabled
    virtual task configure_traffic(bit run);
        group_id_e group_id[] = '{GROUP_TRAFFIC};
        foreach(group_id[i]) begin
            env.rate_aggr.cfg.set_group_ena(group_id[i],  1);   // enable to apply rates
            env.rate_aggr.cfg.set_group_rate(group_id[i], 0);   // no traffic when enabled
            env.rate_aggr.apply_rates(group_id[i]);
            env.rate_aggr.cfg.set_group_ena(group_id[i], ~run); // final enable state
        end
    endtask


endclass

`endif // XGMAC_PAUSE_LINERATE_TEST__SVH
