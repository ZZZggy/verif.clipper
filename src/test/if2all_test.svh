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

`ifndef IF2ALL_TEST__SVH
`define IF2ALL_TEST__SVH

// Class: if2all_test
// DEBUG TESTCASE
// Classifiers configured to caltchall with all domains enabled and all forwarding enabled.
class if2all_test extends clipper_test_base;
    `uvm_component_utils(if2all_test)

    // Constructor
    function new(string name="if2all_test", uvm_component parent=null);
        super.new(name, parent);
        if (!cfg.randomize()) `uvm_fatal("RNDERR", "test_cfg")
        cfg.stim_cnt_time_us = 100;
        cfg.size_min = 64;
        cfg.size_max = 128;
        // Enable CLI overrides for test parameters
        parse_cli_test_cfg();
    endfunction

    // Configure and send packets
    task main_phase(uvm_phase phase);
        domain_catchall_cfg_seq catch_cfg_seq;
        valid_ethernet_seq_mixin#(ethernet_sequence_base) seq[PORT_IF : PORT_IF_LAST];
        uvm_status_e status;

        phase.raise_objection(this);

        // Allow discard once traffic rate is not limited
        if (!cfg.rate_ctrl) begin
            foreach (env.eth_sb[i]) begin
                env.eth_sb[i].cfg.allow_discard = '1;
                env.eth_sb[i].reporter[SB_LOST].cfg.ena = 0;
            end
        end

        //-------------------------------------------------------------------
        // Configure
        //-------------------------------------------------------------------
        catch_cfg_seq = domain_catchall_cfg_seq::type_id::create("catch_cfg_seq", this);
        init_vseq(catch_cfg_seq);
        for(int i=1; i<=NB_IF_PORTS; i++) begin
            if (!catch_cfg_seq.randomize() with {
                port == i;
//                foreach(domains[j]) domains[j] == 1;
                domains[DOM_CPU] == 1;
            }) `uvm_fatal("RNDERR", "cfg")
            `uvm_info("TEST", catch_cfg_seq.convert2string(), UVM_MEDIUM)
            catch_cfg_seq.start(null);
        end

        // Randomize time offset
//        `uvm_info(get_name, $sformatf("Randomizing the Timebase initial value"),UVM_LOW)
//        env.regmodel.timebase.globals.ntp_time_offset_adjust.sec.set($urandom());
//        env.regmodel.timebase.globals.ntp_time_offset_adjust.update(status);
//        env.regmodel.timebase.globals.ntp_to_ptp_time_offset.sec.set($urandom());
//        env.regmodel.timebase.globals.ntp_to_ptp_time_offset.update(status);

        /*******************************************************************************************************************/
        `uvm_info(get_name, $sformatf("Init Timebase compensation"),UVM_LOW)
        for(int i=0; i < NB_IF_PORTS; i++) begin
            env.regmodel.timebase.compensations[2*i+0].time_offset.fract.set('hFF283); // toa
            env.regmodel.timebase.compensations[2*i+1].time_offset.fract.set('h421); // tod mac comp

//            if(i<5) begin
//                env.regmodel.timebase.compensations[2*i+0].time_offset.fract.set('hFC98 - (ctrl_vif.g_use_phy ? 'h00FF : 0)); // toa
//                env.regmodel.timebase.compensations[2*i+1].time_offset.fract.set('h00B9 + (ctrl_vif.g_use_phy ? 'h00AD : 0)); // tod mac comp
//            end else if (i<9) begin
//                if (ctrl_vif.port_speed[i]==mac_pkg::PS_1G) begin
//                    //TODO SM: Should it be FE7 to take into factor when clock are not aligned and toggle bit crosses clock domains in 1 clock cycle plus some very small delay?
//                    env.regmodel.timebase.compensations[2*i+0].time_offset.fract.set('hFF91 - (ctrl_vif.g_use_phy ? 'h0081 : 0)); // toa
//                    env.regmodel.timebase.compensations[2*i+1].time_offset.fract.set('h005D + (ctrl_vif.g_use_phy ? 'h006A : 0)); // tod mac comp
//                    `ASSERT_MSG(CSATION_THUNDERFLY_1000, 1, "Assertion for Timebase compensation", UVM_NONE);
//                end else begin
//                    env.regmodel.timebase.compensations[2*i+0].time_offset.fract.set('hFC98 - ((ctrl_vif.g_use_phy)? 'h010E: 0)); // toa
//                    env.regmodel.timebase.compensations[2*i+1].time_offset.fract.set('h00B9 + ((ctrl_vif.g_use_phy)? 'h008E: 0)); // mac comp
//                    `ASSERT_MSG(COMPENSATION_ARCHIMEDES_10_000, 1, "Assertion for Timebase compensation", UVM_NONE);
//                end
//            end else begin
//                env.regmodel.timebase.compensations[2*i+0].time_offset.fract.set('hFC98 - (ctrl_vif.g_use_phy ? 'h01FC : 0)); // toa
//                env.regmodel.timebase.compensations[2*i+1].time_offset.fract.set('h00B9 + (ctrl_vif.g_use_phy ? 'h0177 : 0)); // tod mac comp
//            end
        end

        foreach(env.regmodel.timebase.compensations[i]) begin
            env.regmodel.timebase.compensations[i].update(status);
        end
        /*******************************************************************************************************************/

        //-------------------------------------------------------------------
        // Validate that traffic passes
        //-------------------------------------------------------------------
        foreach(seq[i]) begin
            seq[i] = valid_ethernet_seq_mixin#(ethernet_sequence_base)::type_id::create($sformatf("seq%0d", i));
            if (!seq[i].randomize() with {
                p_id           == local::i;
                nb_item        == local::cfg.stim_cnt_time_us;
                frame_size_min == local::cfg.size_min;
                frame_size_max == local::cfg.size_max;
            }) `uvm_fatal("RNDERR", seq[i].get_name)
        end

        fork begin
            foreach(seq[i]) begin
                automatic int s=i;
                fork
                    // Start sequence on Interface port agents
                    begin
                        seq[s].start(env.rx_eth.agent[s].sequencer);
                    end
                join_none
            end
            wait fork;
        end
        join

        phase.drop_objection(this);
    endtask

    //-------------------------------------------------------------------------------
    // TODO (CS): check_phase
    // Validate lost packet counters from scoreboards againts DUT statistics
    //-------------------------------------------------------------------------------

endclass

`endif //IF2ALL_TEST__SVH
