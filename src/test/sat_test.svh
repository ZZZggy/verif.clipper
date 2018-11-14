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

    pktgen_reg_seq pktgen;

    `uvm_component_utils(sat_test)

    // Constructor
    function new(string name="sat_test", uvm_component parent=null);
        super.new(name, parent);
        // Configure TRF ports at 10Gbps
        cfg.port_speed[5:8] = '{PS_10G, PS_10G, PS_10G, PS_10G};
        cfg.eot_win_cnt = 100; // 10us drain
        // Enable CLI overrides for test parameters
        parse_cli_test_cfg();
    endfunction

    // Send a packet per USER interface
    task main_phase(uvm_phase phase);
        uvm_status_e             status;
        domain_catchall_cfg_seq  catchall;
        pktgen_poll_duration_seq poll_seq;

        phase.raise_objection(this);

        ctrl_vif.loopback_en = 14'h1FFE;
        
        pktgen = pktgen_reg_seq::type_id::create("pktgen");
        pktgen.regmodel = env.regmodel.pktgen;

        catchall = domain_catchall_cfg_seq::type_id::create("catchall");
        catchall.regmodel = env.regmodel;

        poll_seq = pktgen_poll_duration_seq::type_id::create("poll_seq");
        poll_seq.regmodel = env.regmodel.pktgen;

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
            `uvm_info("TEST", catchall.convert2string(), UVM_LOW)
        end

        // Configure PKTGEN
        if (!(pktgen.randomize() with
            {
             outgoing_port       == 5;
             nbr_of_flow         == 1;
             bit_rate_in_mbps[0] == 10000;
             bucket_val[0]       == 1000;
             gen_pkt_type        == 2;
             }
            )) `randerr
        `uvm_info("TEST", pktgen.convert2string(), UVM_LOW)
        pktgen.start(null);

        // Configure the inspector exta offset based on the selected gen_pkt_type
        env.regmodel.inspector.inspector_global.cfg_auto_mode.extra_offset_auto_mode_ipv6.set(pktgen.extra_offset_cfg);
        env.regmodel.inspector.inspector_global.cfg_auto_mode.update(status);

        pktgen.enable_flow();

        // By default the port shaper are closed
        env.regmodel.tm.shaper.shaper_group_0.params_cir[0].cbs.set(4);
        env.regmodel.tm.shaper.shaper_group_0.params_cir[0].cir.set(80000);
        env.regmodel.tm.shaper.shaper_group_0.params_cir[0].cir_max.set(80000);
        env.regmodel.tm.shaper.shaper_group_0.params_cir[0].cir_ena.set(0);
        env.regmodel.tm.shaper.shaper_group_0.params_cir[0].update(status);

        // Wait for test to finish
        poll_seq.start(null);

        // Predict class_total_stats
 //       env.predictor.insect.classifier.stats[pktgen.outgoing_port].classified.packets_good = pktgen.nbr_of_pkt.sum();
 //       env.predictor.insect.classifier.stats[pktgen.outgoing_port].classified.packets_bad  = 0;
 //       env.predictor.insect.classifier.stats[pktgen.outgoing_port].classified.bytes_good = 0;
        foreach(pktgen.nbr_of_pkt[i]) begin
 //           env.predictor.insect.classifier.stats[pktgen.outgoing_port].classified.bytes_good += pktgen.nbr_of_pkt[i] * pktgen.pkt_size_in_byte[i];
        end

        phase.drop_objection(this);
    endtask

    // Validate inspector
    virtual task shutdown_phase(uvm_phase phase);
        uvm_status_e status;
        int flow_nbr;
        int pktgen_bytes;
        int last_pkt;
        
        phase.raise_objection(phase);

        // Inspector check value
        for(int flow=0;flow<pktgen.nbr_of_flow;flow++) begin
            // all latencies/jitter/delay checks are disabled since timestamps are compensated
            // (pktgen ++, inspector --) but frames don't go through MACs, so this will lead to delay underrun

            // Disable check on fields
            env.regmodel.pktgen.shaping_flow[flow].last_pkt_size.dbg_pkt_afull              .set_compare(UVM_NO_CHECK);
            env.regmodel.pktgen.shaping_flow[flow].last_pkt_size.dbg_pkt_request_valid      .set_compare(UVM_NO_CHECK);
            env.regmodel.pktgen.shaping_flow[flow].last_pkt_size.dbg_size_rdy               .set_compare(UVM_NO_CHECK);
            env.regmodel.pktgen.shaping_flow[flow].last_pkt_size.dbg_duration_rdy           .set_compare(UVM_NO_CHECK);
            env.regmodel.pktgen.shaping_flow[flow].last_pkt_size.dbg_shaping_ready          .set_compare(UVM_NO_CHECK);
            env.regmodel.pktgen.shaping_flow[flow].last_pkt_size.dbg_pktgen_fsm_state       .set_compare(UVM_NO_CHECK);
            env.regmodel.pktgen.shaping_flow[flow].last_pkt_size.dbg_pktgen_remain_bytes_cnt.set_compare(UVM_NO_CHECK);

            // pktgen stats (TX) validation
            last_pkt     = pktgen.pkt_size_in_byte[flow] + pktgen.compensation - 4;
            pktgen_bytes = pktgen.nbr_of_pkt[flow]*last_pkt;
            void'(env.regmodel.pktgen.shaping_flow[flow].byte_count.bytes.predict                (pktgen_bytes));
            void'(env.regmodel.pktgen.shaping_flow[flow].pkt_count.pkts.predict                  (pktgen.nbr_of_pkt[flow]));
            void'(env.regmodel.pktgen.shaping_flow[flow].last_pkt_size.last_pkt_sent_size.predict(last_pkt));
            env.regmodel.pktgen.shaping_flow[flow].byte_count   .mirror(status, .check(UVM_CHECK), .parent(null));
            env.regmodel.pktgen.shaping_flow[flow].pkt_count    .mirror(status, .check(UVM_CHECK), .parent(null));
            env.regmodel.pktgen.shaping_flow[flow].last_pkt_size.mirror(status, .check(UVM_CHECK), .parent(null));
            
            // inspector stats (RX) validation
            flow_nbr = pktgen.flow_number[flow];

            void'(env.regmodel.inspector.inspector_flow[flow_nbr].bytes_good.bytes_good.predict              (pktgen.nbr_of_pkt[flow]*pktgen.pkt_size_in_byte[flow]));
            void'(env.regmodel.inspector.inspector_flow[flow_nbr].pkts_good.pkts_good.predict                (pktgen.nbr_of_pkt[flow]));
            void'(env.regmodel.inspector.inspector_flow[flow_nbr].bytes_bad.bytes_bad.predict                (0));
            void'(env.regmodel.inspector.inspector_flow[flow_nbr].pkts_bad.pkts_bad.predict                  (0));
            void'(env.regmodel.inspector.inspector_flow[flow_nbr].next_seq_no.next_seq_no.predict            (pktgen.nbr_of_pkt[flow]));
            void'(env.regmodel.inspector.inspector_flow[flow_nbr].next_seq_no.overflow.predict               (0));
            void'(env.regmodel.inspector.inspector_flow[flow_nbr].next_seq_no.first_bad.predict              (0));
            void'(env.regmodel.inspector.inspector_flow[flow_nbr].next_seq_no.gap.predict                    (0));
            void'(env.regmodel.inspector.inspector_flow[flow_nbr].next_seq_no.first_good.predict             (1));
            void'(env.regmodel.inspector.inspector_flow[flow_nbr].gap_max.gap_max.predict                    (0));
            void'(env.regmodel.inspector.inspector_flow[flow_nbr].gap.gap.predict                            (0));
            void'(env.regmodel.inspector.inspector_flow[flow_nbr].out_of_seq_or_dup.out_of_seq_or_dup.predict(0));
            void'(env.regmodel.inspector.inspector_flow[flow_nbr].first_gap.first_gap.predict                (0));
            void'(env.regmodel.inspector.inspector_flow[flow_nbr].last_pkt_size.last_pkt_size.predict        (pktgen.pkt_size_in_byte[flow]));
            env.regmodel.inspector.inspector_flow[flow_nbr].bytes_good       .mirror(status, .check(UVM_CHECK), .parent(null));
            env.regmodel.inspector.inspector_flow[flow_nbr].pkts_good        .mirror(status, .check(UVM_CHECK), .parent(null));
            env.regmodel.inspector.inspector_flow[flow_nbr].bytes_bad        .mirror(status, .check(UVM_CHECK), .parent(null));
            env.regmodel.inspector.inspector_flow[flow_nbr].pkts_bad         .mirror(status, .check(UVM_CHECK), .parent(null));
            env.regmodel.inspector.inspector_flow[flow_nbr].next_seq_no      .mirror(status, .check(UVM_CHECK), .parent(null));
            env.regmodel.inspector.inspector_flow[flow_nbr].gap_max          .mirror(status, .check(UVM_CHECK), .parent(null));
            env.regmodel.inspector.inspector_flow[flow_nbr].gap              .mirror(status, .check(UVM_CHECK), .parent(null));
            env.regmodel.inspector.inspector_flow[flow_nbr].out_of_seq_or_dup.mirror(status, .check(UVM_CHECK), .parent(null));
            env.regmodel.inspector.inspector_flow[flow_nbr].first_gap        .mirror(status, .check(UVM_CHECK), .parent(null));
            env.regmodel.inspector.inspector_flow[flow_nbr].last_pkt_size    .mirror(status, .check(UVM_CHECK), .parent(null));
        end

        phase.drop_objection(phase);

    endtask

endclass

`endif

