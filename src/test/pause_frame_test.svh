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

`ifndef PAUSE_FRAME_TEST__SVH
`define PAUSE_FRAME_TEST__SVH

// Class: pause_frame_test
//
// XON-XOFF check:
// - Send pause frame to all interfaces with a large random pause quanta (XOFF)
// - Send a 64B frame in all interfaces
// - Check that frame does not go out
// - Send pause frame with small(0-3) random quanta to re-enable traffic output (XON)
// - Check that the frame goes out
//
// Expired Pause time check:
// - Send pause frame to all interfaces with a not so large random pause quanta
// - Send a 64B frame
// - Check that frame does not go out
// - Wait for necessary time for quanta to expire
// - Check that the frame goes out
//
//--------------------------------------------------------------------------------------------------
// PLUSARGS:
// +STIM_CNT_TIME_US=<int>  Number of times to perform each of the checks above (XON-XOFF & Expired Pause time)
//--------------------------------------------------------------------------------------------------
class pause_frame_test extends fsx_test_base;

    // Typedef: port_list_t
    // Type for listing port ids
    typedef int unsigned port_list_t[];

    `uvm_component_utils(pause_frame_test)

    // Constructor: new
    function new(string name="pause_frame_test", uvm_component parent=null);
        super.new(name, parent);
        if (!cfg.randomize() with {
            port_speed[PORT_MGMT] == PS_1G;
        }) `randerr
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

        // Configure Input Section in Loopback
        configure_insect(.cross_traffic(0), .mon_fwd(0), .cpu_fwd(0));

        phase.drop_objection(this);
    endtask


    // Task: main_phase
    // Test XON-XOFF and Pause time expiration mechanisms
    virtual task main_phase(uvm_phase phase);
        typedef bit[15:0] pause_quanta_t;
        // Time of 1 pause_quanta = 512 bits transmisison time
        time t_quanta_1g = 512ns; // @10G = 51.2ns
        // 64B Frame quanta = (64B frame + 8B preamble + 12B IFG) * 8-bits / 512-bits quanta-def
        pause_quanta_t frame_64b_quanta = pause_quanta_t'($ceil((64+8+12) * 8.0 / 512.0));
        // Minimum quanta for pause request in testcase with mixed 1G and 10G ports
        pause_quanta_t min_quanta = 50 * frame_64b_quanta;
        // Maximum quanta allowed
        pause_quanta_t max_quanta = 16'hFFFF;
        // Final quanta value for pause request
        pause_quanta_t quanta;

        phase.raise_objection(this);

        // Loop for XON - XOFF mechanism
        `uvm_info("TEST", $sformatf("XON-XOFF: quanta inside [%0d : %0d]", min_quanta, max_quanta), UVM_LOW)
        for (int i = 0; i < cfg.stim_cnt_time_us; i++) begin

            `uvm_info("TEST", $sformatf("XON-XOFF iteration: %0d" , i), UVM_LOW)

            // Pause interfaces
            if(!std::randomize(quanta) with {quanta inside {[min_quanta : max_quanta]};}) `randerr
            pause_gen(quanta);

            // Send one frame at each interface
            if_traffic(64, 1);
            #(2 * frame_64b_quanta * t_quanta_1g); // wait twice the required time for the frame to go out to make sure it is paused
            check_exp_obs(.diff(1));

            // Release Pause
            if(!std::randomize(quanta) with { quanta dist { 16'h0000 := 50,
                                                           [16'h0001 : 16'h0003] :/ 50 }; }) `randerr
            pause_gen(quanta);
            #((frame_64b_quanta + quanta) * t_quanta_1g); // required time for frame to go out plus requested XON quanta
            check_exp_obs(.diff(0));
        end

        // Loop Pause time expiration mechanism
        `uvm_info("TEST", $sformatf("Pause expiration: quanta inside [%0d : %0d]", min_quanta, min_quanta+20), UVM_LOW)
        for (int i = 0; i < cfg.stim_cnt_time_us; i++) begin

            `uvm_info("TEST", $sformatf("Pause expiration iteration: %0d" , i), UVM_LOW)

            // Pause interfaces
            if(!std::randomize(quanta) with {quanta inside {[min_quanta : min_quanta+20]};}) `randerr
            pause_gen(quanta);

            // One frame at each interface
            if_traffic(64, 1);
            #(2 * frame_64b_quanta * t_quanta_1g); // wait twice the required time for the frame to go out to make sure it is paused
            check_exp_obs(.diff(1));

            // Check if Pause is disabled after waiting the requested pause_quanta time
            #(quanta * t_quanta_1g); // giving some margin by waiting complete pause_quanta after waiting 2 x frame_64b_quanta
            check_exp_obs(.diff(0));
        end

        phase.drop_objection(this);
    endtask


    //---------------------------------------
    // Group: Custom methods
    //---------------------------------------

    // Task: disable_pce
    // Disable PC engine
    virtual task disable_pce();

        pce_cfg_vseq pce_cfg_seq = pce_cfg_vseq::type_id::create("pce_cfg_seq");
        pce_cfg_seq.regmodel = env.regmodel;

        if (!pce_cfg_seq.randomize() with {
            ena            == 0;
            keep_alive_ena == 0;
        }) `randerr
        `uvm_info("TEST", pce_cfg_seq.convert2string(), UVM_LOW)
        pce_cfg_seq.start(null);

        // End-of-test drain
        env_cfg.pc_env_cfg.ena_eot_drain = 0;
    endtask


    // Task: configure_insect
    // Configures Input Section: all interface ports in loopback
    virtual task configure_insect(bit cross_traffic=0, bit mon_fwd=1, bit cpu_fwd=1);

        // For all interface ports
        for(shortint unsigned port_id = PORT_IF; port_id <= PORT_IF_LAST; port_id++) begin

            class_action_type_pkg::action_st action;
            shortint unsigned out_port;

            insect_fwd_cfg_vseq insect_cfg_seq = insect_fwd_cfg_vseq::type_id::create("insect_cfg_seq");
            insect_cfg_seq.regmodel = env.regmodel;

            action.cpu  = cpu_fwd ? class_action_type_pkg::ACT_FWD :
                                    class_action_type_pkg::ACT_DIS;
            action.fwd  = class_action_type_pkg::ACT_DIS;
            action.lpbk = class_action_type_pkg::ACT_DIS;
            action.insp = class_action_type_pkg::ACT_DIS;
            action.pc   = class_action_type_pkg::ACT_DIS;

            if (mon_fwd && port_id inside {PORT_TRAFFIC}) begin
                action.mon[0] = class_action_type_pkg::ACT_FWD;
                action.mon[1] = class_action_type_pkg::ACT_FWD;
            end else begin
                action.mon[0] = class_action_type_pkg::ACT_DIS;
                action.mon[1] = class_action_type_pkg::ACT_DIS;
            end

            // Loopback interfaces, or cross traffic when enabled
            out_port = (port_id == PORT_TRAFFIC[0] && cross_traffic) ? PORT_TRAFFIC[1] :  // cross
                       (port_id == PORT_TRAFFIC[1] && cross_traffic) ? PORT_TRAFFIC[0] :
                                                                       port_id;           // loopback

            if (!insect_cfg_seq.randomize() with {
                port           == local::port_id;
                domains        == 5'b11111;
                if_action      == action_type_pkg::ACT_IF_FWD_PHY;
                cpu_mon_action == local::action;
                outgoing_if    == local::out_port;
                // fix prio/action to easy config overwriting
                prio == 1;
                foreach(actions[i]) {actions[i] == 1;}
            }) `sranderr($sformatf("INSECT_CFG::PORT = %0d", port_id))

            `uvm_info("TEST", insect_cfg_seq.convert2string(), UVM_LOW)
            insect_cfg_seq.start(null);
        end
    endtask


    // Task: pause_gen
    // Generate pause frames in all interfaces
    virtual task pause_gen(bit[15:0] quanta = 16'hFFFF);
        pause_ethernet_seq_mixin#(ethernet_sequence_base) pause_seq[PORT_CPU:PORT_MGMT];

        `uvm_info("TEST::PAUSE", $sformatf("quanta=0x%0h", quanta), UVM_LOW)

        foreach(pause_seq[i]) begin
            automatic int s=i;
            pause_seq[s] = pause_ethernet_seq_mixin#(ethernet_sequence_base)::type_id::create($sformatf("pause_seq%0d", s));

            fork
                if (!pause_seq[s].randomize() with {
                    p_id           == local::s;
                    nb_item        == 1;
                    pause_quanta   == local::quanta;
                }) `sranderr(pause_seq[s].get_name())
                pause_seq[s].start(env.rx_eth.agent[s].sequencer);
                `uvm_info("TEST::PAUSE", $sformatf("Sent P%0d", i), UVM_DEBUG)
            join_none
        end // foreach (pause_seq[i])
        wait fork;
        `uvm_info("TEST::PAUSE", "Wait for DUT processing", UVM_DEBUG)
        // Wait pause to be active (with margin) : TSE=120ns XMAC=90ns
        #(250ns);
        `uvm_info("TEST::PAUSE", "Should now be in paused region", UVM_DEBUG)
    endtask


    // Task: if_traffic
    // Generate traffic in interface ports
    virtual task if_traffic(int unsigned size, int unsigned cnt, port_list_t port_list = {PORT_AUX, PORT_TRAFFIC, PORT_MGMT}, int unsigned cnt_1g=(cnt+1)/2);
        valid_ethernet_seq_mixin#(ethernet_sequence_base) eth_seq[PORT_IF:PORT_MGMT];

        `uvm_info("TEST::IF", $sformatf("size=%0d  cnt=%0d  cnt_1g=%0d  port_list=%0p", size, cnt, cnt_1g, port_list), UVM_LOW)

        // Generate traffic in AUX and TRAFFIC ports
        foreach(eth_seq[i]) begin
            automatic int s=i;
            automatic int unsigned frame_cnt = (cfg.port_speed[s] == PS_10G) ? cnt : cnt_1g; // sim speed-up for 1G MGMT

            if (s inside {port_list}) begin
                eth_seq[s] = valid_ethernet_seq_mixin#(ethernet_sequence_base)::type_id::create($sformatf("eth_seq%0d", s));
                fork
                    begin
                        if (!eth_seq[s].randomize() with {
                            p_id           == local::s;
                            nb_item        == local::frame_cnt;
                            vtags_size_min == 0;
                            vtags_size_max == 0;
                            frame_size_min == local::size;
                            frame_size_max == local::size;
                        }) `sranderr(eth_seq[s].get_name())
                        eth_seq[s].start(env.rx_eth.agent[s].sequencer);
                    end
                join_none
            end

        end // foreach (eth_seq[i])
        wait fork;
        `uvm_info("TEST::IF", "Traffic ended", UVM_LOW)
    endtask


    // Function: check_exp_obs
    // Check scoreboard counters for difference between expected and observed frames in TX interfaces
    virtual function void check_exp_obs(int diff=0);
        for (int i = PORT_IF; i <= PORT_IF_LAST; i++) begin
            if (diff != env.eth_sb[i].diff_exp_obs()) begin
                `uvm_error("TEST::CHECK", $sformatf("eth_sb%0d:\n exp=%0d\n obs=%0d\n diff_exp_obs=%0d\n expected_diff=%0d", i,
                           env.eth_sb[i].stats[SB_EXP].get_item_cnt(), env.eth_sb[i].stats[SB_OBS].get_item_cnt(), env.eth_sb[i].diff_exp_obs(), diff))
            end else begin
                `uvm_info("TEST::CHECK", $sformatf("eth_sb%0d.diff_exp_obs=%0d", i, env.eth_sb[i].diff_exp_obs()), UVM_DEBUG)
            end
        end
    endfunction

endclass

`endif // PAUSE_FRAME_TEST__SVH
