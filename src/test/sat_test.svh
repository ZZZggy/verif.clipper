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

`ifndef SAT_TEST__SVH
`define SAT_TEST__SVH

// Class: sat_test
// SAT internal loopback test
class sat_test extends clipper_test_base;

    pktgen_reg_seq  pktgen;

    `uvm_component_utils(sat_test)

    // Constructor
    function new(string name="sat_test", uvm_component parent=null);
        super.new(name, parent);
        // Configure TRF ports at 10Gbps
        cfg.port_speed[5:8] = '{PS_10G, PS_10G, PS_10G, PS_10G};
        cfg.eot_win_cnt = 100; // 10us drain
//        // Enable CLI overrides for test parameters
//        parse_cli_test_cfg();
    endfunction

    // Send a packet per USER interface
    task main_phase(uvm_phase phase);
        uvm_status_e             status;
        domain_catchall_cfg_seq  catchall;
        pktgen_poll_duration_seq poll_seq;

        phase.raise_objection(this);

        foreach(env_cfg.eth_sb_cfg[m])
            env_cfg.eth_sb_cfg[m].ena_sb = 0;

        // By default the port shaper are closed
         for(int i = 0; i < 2; i++) begin
            env.regmodel.tm.shaper.shaper_group_0.params_cir[i].cbs.set(10);
            env.regmodel.tm.shaper.shaper_group_0.params_cir[i].cir.set(80000);
            env.regmodel.tm.shaper.shaper_group_0.params_cir[i].cir_max.set(80000);
            env.regmodel.tm.shaper.shaper_group_0.params_cir[i].cir_ena.set(0);
            env.regmodel.tm.shaper.shaper_group_0.params_cir[i].update(status);
        end
        for(int i = 0; i < 16; i++) begin
            env.regmodel.tm.shaper.shaper_group_1.params_cir[i].cbs.set(10);
            env.regmodel.tm.shaper.shaper_group_1.params_cir[i].cir.set(80000);
            env.regmodel.tm.shaper.shaper_group_1.params_cir[i].cir_max.set(80000);
            env.regmodel.tm.shaper.shaper_group_1.params_cir[i].cir_ena.set(0);
            env.regmodel.tm.shaper.shaper_group_1.params_cir[i].update(status);
        end

        pktgen = pktgen_reg_seq::type_id::create("pktgen");
        pktgen.regmodel = env.regmodel.pktgen;

        catchall = domain_catchall_cfg_seq::type_id::create("catchall");
        catchall.regmodel = env.regmodel;

        poll_seq = pktgen_poll_duration_seq::type_id::create("poll_seq");
        poll_seq.regmodel = env.regmodel.pktgen;
        ctrl_vif.loopback_en = 14'h1FFE;

        // Setup loopback and inspector
        for(int i=PORT_IF; i <= PORT_IF_LAST; i++) begin
            // Enable catchall rule(s) forwarding to INSP
            if (!catchall.randomize() with {
                port    == i;
                foreach(domains[j]) {
                    j == DOM_INSP -> domains[j] == 1;
                    j != DOM_INSP -> domains[j] == 0;
                }
            }) `randerr
            catchall.start(null);
        end


        if (!pktgen.randomize() with {
            nbr_of_flow  == 2;
            outgoing_port       == 9;
        }) `randerr



        `uvm_info("TEST", pktgen.convert2string(), UVM_LOW)
        pktgen.start(null);
        pktgen.enable_flow();

        // Wait for test to finish
        poll_seq.start(null);

        // Predict class_total_stats
        env.predictor.insect.classifier.stats[pktgen.outgoing_port].classified.packets_good = pktgen.nbr_of_pkt.sum();
        env.predictor.insect.classifier.stats[pktgen.outgoing_port].classified.packets_bad  = 0;
        env.predictor.insect.classifier.stats[pktgen.outgoing_port].classified.bytes_good = 0;
        foreach(pktgen.nbr_of_pkt[i]) begin
            env.predictor.insect.classifier.stats[pktgen.outgoing_port].classified.bytes_good += pktgen.nbr_of_pkt[i] * pktgen.pkt_size_in_byte[i];
        end

        phase.drop_objection(this);
    endtask

    // Validate inspector
    virtual task shutdown_phase(uvm_phase phase);
        uvm_status_e status;
        int flow_nbr;

        phase.raise_objection(phase);

        // Inspector check value
        for(int flow=0;flow<pktgen.nbr_of_flow;flow++) begin
            //all latencies/jitter/delay checks are disabled since timestamps are compensated (pktgen ++, inspector --) but frames don't go through MACs, so this will lead to delay underrun

            //pktgen stats (TX) validationl
            env.regmodel.pktgen.shapping[flow].mirror(status, .check(UVM_NO_CHECK), .parent(null));

            if (!(env.regmodel.pktgen.shapping[flow].byte_count.bytes.get() == pktgen.nbr_of_pkt[flow]*( (pktgen.pkt_size_in_byte[flow] + pktgen.compensation - 4 )))) begin                                   //tx pkt sizes (in bytes) are compensated
                `uvm_error(get_name, $sformatf("Flow[%0d] - Pktgen(Tx) number of bytes (%d) (compensated) is outside expected range.", flow, env.regmodel.pktgen.shapping[flow].byte_count.bytes.get()))
            end
            if (!(env.regmodel.pktgen.shapping[flow].pkt_count.pkts.get() == pktgen.nbr_of_pkt[flow])) begin
                `uvm_error(get_name, $sformatf("Flow[%0d] - Pktgen(Tx) number of pkts (%d) (compensated) is outside expected range.", flow, env.regmodel.pktgen.shapping[flow].pkt_count.pkts.get()))
            end
            if (!(env.regmodel.pktgen.shapping[flow].last_pkt_size.last_pkt_sent_size.get() == pktgen.pkt_size_in_byte[flow] + pktgen.compensation - 4)) begin
                `uvm_error(get_name, $sformatf("Flow[%0d] - Pktgen(Tx) last pkt size (%d) (compensated) is outside expected range.", flow, env.regmodel.pktgen.shapping[flow].last_pkt_size.last_pkt_sent_size.get()))
            end

            //inspector stats (RX) validation
            flow_nbr = pktgen.flow_number[flow];
            //env.regmodel.inspector[flow_nbr].mirror(status, .check(UVM_NO_CHECK), .parent(null));
            env.regmodel.inspector[flow_nbr].latency_min.mirror(status, .check(UVM_NO_CHECK), .parent(null));
            env.regmodel.inspector[flow_nbr].latency_max.mirror(status, .check(UVM_NO_CHECK), .parent(null));
            env.regmodel.inspector[flow_nbr].jitter_min.mirror(status, .check(UVM_NO_CHECK), .parent(null));
            env.regmodel.inspector[flow_nbr].jitter_max.mirror(status, .check(UVM_NO_CHECK), .parent(null));
            env.regmodel.inspector[flow_nbr].sum_latency.mirror(status, .check(UVM_NO_CHECK), .parent(null));
            env.regmodel.inspector[flow_nbr].sum_jitter.mirror(status, .check(UVM_NO_CHECK), .parent(null));
            env.regmodel.inspector[flow_nbr].bytes_good.mirror(status, .check(UVM_NO_CHECK), .parent(null));
            env.regmodel.inspector[flow_nbr].pkts_good.mirror(status, .check(UVM_NO_CHECK), .parent(null));
            env.regmodel.inspector[flow_nbr].bytes_bad.mirror(status, .check(UVM_NO_CHECK), .parent(null));
            env.regmodel.inspector[flow_nbr].pkts_bad.mirror(status, .check(UVM_NO_CHECK), .parent(null));
            env.regmodel.inspector[flow_nbr].first_ts.mirror(status, .check(UVM_NO_CHECK), .parent(null));
            env.regmodel.inspector[flow_nbr].last_ts.mirror(status, .check(UVM_NO_CHECK), .parent(null));
            env.regmodel.inspector[flow_nbr].next_seq_no.mirror(status, .check(UVM_NO_CHECK), .parent(null));
            env.regmodel.inspector[flow_nbr].last_latency.mirror(status, .check(UVM_NO_CHECK), .parent(null));
            env.regmodel.inspector[flow_nbr].last_jitter.mirror(status, .check(UVM_NO_CHECK), .parent(null));
            env.regmodel.inspector[flow_nbr].gap_max.mirror(status, .check(UVM_NO_CHECK), .parent(null));
            env.regmodel.inspector[flow_nbr].gap.mirror(status, .check(UVM_NO_CHECK), .parent(null));
            env.regmodel.inspector[flow_nbr].out_of_seq_or_dup.mirror(status, .check(UVM_NO_CHECK), .parent(null));
            env.regmodel.inspector[flow_nbr].first_gap.mirror(status, .check(UVM_NO_CHECK), .parent(null));
            env.regmodel.inspector[flow_nbr].last_pkt_size.mirror(status, .check(UVM_NO_CHECK), .parent(null));


            if (!(env.regmodel.inspector[flow_nbr].bytes_good.bytes_good.get() == pktgen.nbr_of_pkt[flow]*pktgen.pkt_size_in_byte[flow])) begin
                `uvm_error(get_name, $sformatf("Flow_nbr[%0d] - Inspector (Rx) Bytes Good 0x%0h outside expected range 0x%0h.",
                    flow_nbr, env.regmodel.inspector[flow_nbr].bytes_good.bytes_good.get(), pktgen.nbr_of_pkt[flow]*pktgen.pkt_size_in_byte[flow]))
            end
            if (!(env.regmodel.inspector[flow_nbr].pkts_good.pkts_good.get() == pktgen.nbr_of_pkt[flow])) begin
                `uvm_error(get_name, $sformatf("Flow_nbr[%0d] - Inspector (Rx) Pkts Good 0x%0h outside expected range 0x%0h.",
                    flow_nbr, env.regmodel.inspector[flow_nbr].pkts_good.pkts_good.get(), pktgen.nbr_of_pkt[flow]))
            end
            if (!(env.regmodel.inspector[flow_nbr].bytes_bad.bytes_bad.get() == 0)) begin
                `uvm_error(get_name, $sformatf("Flow_nbr[%0d] - Inspector (Rx) Bytes bad 0x%0h outside expected range (0).", flow_nbr, env.regmodel.inspector[flow_nbr].bytes_bad.bytes_bad.get()))
            end
            if (!(env.regmodel.inspector[flow_nbr].pkts_bad.pkts_bad.get() == 0)) begin
                `uvm_error(get_name, $sformatf("Flow_nbr[%0d] - Inspector (Rx) Pkts bad 0x%0h outside expected range (0).", flow_nbr, env.regmodel.inspector[flow_nbr].pkts_bad.pkts_bad.get()))
            end
            if (!(env.regmodel.inspector[flow_nbr].next_seq_no.next_seq_no.get() == pktgen.nbr_of_pkt[flow])) begin
                `uvm_error(get_name, $sformatf("Flow_nbr[%0d] - Inspector (Rx) Next seq nbr 0x%0h outside expected range 0x%0h.",
                    flow_nbr, env.regmodel.inspector[flow_nbr].next_seq_no.next_seq_no.get(), pktgen.nbr_of_pkt[flow]))
            end
            if (!(env.regmodel.inspector[flow_nbr].next_seq_no.overflow.get() == 0)) begin
                `uvm_error(get_name, $sformatf("Flow_nbr[%0d] - Inspector (Rx) Next seq nbr overflow 0x%0h outside expected range (0).", flow_nbr, env.regmodel.inspector[flow_nbr].next_seq_no.overflow.get()))
            end
            if (!(env.regmodel.inspector[flow_nbr].next_seq_no.first_bad.get() == 0)) begin
                `uvm_error(get_name, $sformatf("Flow_nbr[%0d] - Inspector (Rx) Next seq nbr first bad 0x%0h outside expected range (0).", flow_nbr, env.regmodel.inspector[flow_nbr].next_seq_no.first_bad.get()))
            end
            if (!(env.regmodel.inspector[flow_nbr].next_seq_no.gap.get() == 0)) begin
                `uvm_error(get_name, $sformatf("Flow_nbr[%0d] - Inspector (Rx) Next seq nbr gap 0x%0h outside expected range (0).", flow_nbr, env.regmodel.inspector[flow_nbr].next_seq_no.gap.get()))
            end
            if (!(env.regmodel.inspector[flow_nbr].next_seq_no.first_good.get() == 1)) begin
                `uvm_error(get_name, $sformatf("Flow_nbr[%0d] - Inspector (Rx) Next seq nbr first good 0x%0h outside expected range (1).", flow_nbr, env.regmodel.inspector[flow_nbr].next_seq_no.first_good.get()))
            end
//////
            $display("latency_min %0d", env.regmodel.inspector[flow_nbr].latency_min.latency_min.get() );
            $display("latency_max %0d", env.regmodel.inspector[flow_nbr].latency_max.latency_max.get() );
            $display("Last latency %0d", env.regmodel.inspector[flow_nbr].last_latency.last_latency.get() );
//            if (!(env.regmodel.inspector[flow_nbr].last_latency.last_latency.get() inside {[latency-jitter:latency+jitter]})) begin
//                `uvm_error(get_name, $sformatf("Flow_nbr[%0d] - Latency Last 0x%0h outside expected range.", flow_nbr, env.regmodel.inspector[flow_nbr].last_latency.last_latency.get()))
//            end
            $display("Last jitter %0d", env.regmodel.inspector[flow_nbr].last_jitter.last_jitter.get() );
//            if (!(env.regmodel.inspector[flow_nbr].last_jitter.last_jitter.get() inside {['h00:jitter]})) begin
//                `uvm_error(get_name, $sformatf("Flow_nbr[%0d] - Inspector (Rx) Jitter Last 0x%0h outside expected range.", flow_nbr, env.regmodel.inspector[flow_nbr].last_jitter.last_jitter.get()))
//            end
//////
            if (!(env.regmodel.inspector[flow_nbr].gap_max.gap_max.get() == 0)) begin
                `uvm_error(get_name, $sformatf("Flow_nbr[%0d] - Inspector (Rx) Gap Max 0x%0h outside expected range (0).", flow_nbr, env.regmodel.inspector[flow_nbr].gap_max.gap_max.get()))
            end
            if (!(env.regmodel.inspector[flow_nbr].gap.gap.get() == 0)) begin
                `uvm_error(get_name, $sformatf("Flow_nbr[%0d] - Gap 0x%0h outside expected range (0).", flow_nbr, env.regmodel.inspector[flow_nbr].gap.gap.get()))
            end
            if (!(env.regmodel.inspector[flow_nbr].out_of_seq_or_dup.out_of_seq_or_dup.get() == 0)) begin
                `uvm_error(get_name, $sformatf("Flow_nbr[%0d] - Out of seq or dup 0x%0h outside expected range (0).", flow_nbr, env.regmodel.inspector[flow_nbr].out_of_seq_or_dup.out_of_seq_or_dup.get()))
            end
            if (!(env.regmodel.inspector[flow_nbr].first_gap.first_gap.get() == 0)) begin
                `uvm_error(get_name, $sformatf("Flow_nbr[%0d] - First Gap 0x%0h outside expected range (0).", flow_nbr, env.regmodel.inspector[flow_nbr].first_gap.first_gap.get()))
            end
            if (!(env.regmodel.inspector[flow_nbr].last_pkt_size.last_pkt_size.get() == pktgen.pkt_size_in_byte[flow])) begin
                `uvm_error(get_name, $sformatf("Flow_nbr[%0d] - Last packet size 0x%0h outside expected range 0x%0h.",
                    flow_nbr, env.regmodel.inspector[flow_nbr].last_pkt_size.last_pkt_size.get(), pktgen.pkt_size_in_byte[flow]))
            end
        end

        phase.drop_objection(phase);

    endtask

endclass

`endif

