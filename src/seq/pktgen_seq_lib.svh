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
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// Class: pktgen_reg_seq
// Sequence to write PKT Gen registers.
//
// This sequence should be randomize and run, and any additional configuration
// requirements applied afterwards.
//------------------------------------------------------------------------------
class pktgen_reg_seq extends uvm_sequence#(uvm_sequence_item);
    `uvm_object_utils(pktgen_reg_seq)

    //---------------------------------------------------------------------------------
    // Variable: regmodel
    // Handle to register model
    //---------------------------------------------------------------------------------
    //T_REG regmodel;
    pktgen_reg_pkg::pktgen_reg_block regmodel;

    //---------------------------------------------------------------------------------
    // General variables
    //---------------------------------------------------------------------------------
    rand int unsigned outgoing_port;
    rand bit          upstream_downstream;  // 0=downstream, 1=upstream
    rand int unsigned compensation;
    rand int unsigned nbr_of_flow;
    rand int unsigned bit_rate_in_mbps[];
    rand int unsigned nbr_of_pkt[];
    rand int unsigned pkt_size_in_byte[];
    rand int unsigned flow_number[];
    rand bit [30:0]   bucket_val[];
    rand bit [47:0]   src_mac_addr[];
    rand bit [47:0]   dst_mac_addr[];
    rand bit          gen_pkt_type; // 0:LBM 0VLAN, 1:Layer 3 0VLAN

    // Constrain indices to proper ranges (hard)
    constraint c1 {
        solve nbr_of_flow before bit_rate_in_mbps;
        solve nbr_of_flow before nbr_of_pkt;
        solve nbr_of_flow before pkt_size_in_byte;
        solve nbr_of_flow before flow_number;
        solve nbr_of_flow before bucket_val;

        outgoing_port        inside {[1:NB_IF_PORTS]};
        nbr_of_flow          inside {[1:NB_IF_PORTS]};

        // Used for shaping, duration and statistics
        //  0 : Cisco (L2 without FCS),
        //  4 : Accedian (L2 with FCS),
        // 24 : MEF (L2 with FCS, IPG, SFD and preamble)
        compensation         inside {0, 4, 24};
        soft compensation    == 24;

        soft gen_pkt_type    == 0;  // Layer 3

        bit_rate_in_mbps.size == nbr_of_flow;
        nbr_of_pkt.size       == nbr_of_flow;
        pkt_size_in_byte.size == nbr_of_flow;
        flow_number.size      == nbr_of_flow;
        bucket_val.size       == nbr_of_flow;
        src_mac_addr.size     == nbr_of_flow;
        dst_mac_addr.size     == nbr_of_flow;

        foreach(bit_rate_in_mbps[i]) {bit_rate_in_mbps[i] inside {[100: 1000]};}
        foreach(nbr_of_pkt[i]      ) {nbr_of_pkt[i]       inside {[  1: 100]};}
        foreach(pkt_size_in_byte[i]) {pkt_size_in_byte[i] inside {[ 60: 256]};}
        foreach(flow_number[i])      {flow_number[i]      inside {[  0: 15]};}
        unique{flow_number};

        foreach(bucket_val[i])       {soft bucket_val[i]  == 0;}
    }

    //---------------------------------------------------------------------------------
    // Constructor: new
    //---------------------------------------------------------------------------------
    function new(string name="pktgen_reg_seq_t");
        super.new(name);
    endfunction

    //---------------------------------------------------------------------------------
    // Task: body
    //---------------------------------------------------------------------------------
    virtual task body();
        uvm_status_e status;
        int unsigned period_factor;
        int unsigned credit_value;

        // Pkt Gen config flow
        //configuring flows (layer 3, 0VLAN) or (LBM 0VLAN)
        foreach(bit_rate_in_mbps[flow]) begin
            period_factor = find_period_factor(bit_rate_in_mbps[flow]);
            credit_value = calculate_credit_value(bit_rate_in_mbps[flow], period_factor);

            `uvm_info(get_name, $sformatf("period_factor=%0d, credit_value=%0d", period_factor, credit_value), UVM_LOW);

            // Flow Header registers
            regmodel.flow_header[flow].flow_header[0].flow_flag.set(0);
            regmodel.flow_header[flow].flow_header[0].flow_data.set(dst_mac_addr[flow][47:32]);
            regmodel.flow_header[flow].flow_header[1].flow_flag.set(0);
            regmodel.flow_header[flow].flow_header[1].flow_data.set(dst_mac_addr[flow][31:16]);
            regmodel.flow_header[flow].flow_header[2].flow_flag.set(0);
            regmodel.flow_header[flow].flow_header[2].flow_data.set(dst_mac_addr[flow][15:0]);
            regmodel.flow_header[flow].flow_header[3].flow_flag.set(0);
            regmodel.flow_header[flow].flow_header[3].flow_data.set(src_mac_addr[flow][47:32]);
            regmodel.flow_header[flow].flow_header[4].flow_flag.set(0);
            regmodel.flow_header[flow].flow_header[4].flow_data.set(src_mac_addr[flow][31:16]);
            regmodel.flow_header[flow].flow_header[5].flow_flag.set(0);
            regmodel.flow_header[flow].flow_header[5].flow_data.set(src_mac_addr[flow][15:0]);
            if (gen_pkt_type == 0) begin
                // LBM 0VLAN
                regmodel.flow_header[flow].flow_header[6].flow_flag.set(0);
                regmodel.flow_header[flow].flow_header[6].flow_data.set('h8902);  // ethertype CFM(IEEE 802.1ag) or OAM(ITU Y.1731)
                regmodel.flow_header[flow].flow_header[7].flow_flag.set(0);
                regmodel.flow_header[flow].flow_header[7].flow_data.set('h0003);  // OAM LBM
                regmodel.flow_header[flow].flow_header[8].flow_flag.set(3);
                regmodel.flow_header[flow].flow_header[8].flow_data.set('h0004);
            end else begin
                // Layer 3 0VLAN
                regmodel.flow_header[flow].flow_header[6].flow_flag.set(0);
                regmodel.flow_header[flow].flow_header[6].flow_data.set('h0800);  // ethertype IP
                regmodel.flow_header[flow].flow_header[7].flow_flag.set(0);
                regmodel.flow_header[flow].flow_header[7].flow_data.set('h4500);
                regmodel.flow_header[flow].flow_header[8].flow_flag.set(1);
                regmodel.flow_header[flow].flow_header[8].flow_data.set('hAC3B);
                regmodel.flow_header[flow].flow_header[9].flow_flag.set(0);
                regmodel.flow_header[flow].flow_header[9].flow_data.set('h0001);
                regmodel.flow_header[flow].flow_header[10].flow_flag.set(0);
                regmodel.flow_header[flow].flow_header[10].flow_data.set('h4000);
                regmodel.flow_header[flow].flow_header[11].flow_flag.set(0);
                regmodel.flow_header[flow].flow_header[11].flow_data.set('hFF11);
                regmodel.flow_header[flow].flow_header[12].flow_flag.set(1);
                regmodel.flow_header[flow].flow_header[12].flow_data.set('h0000);
                regmodel.flow_header[flow].flow_header[13].flow_flag.set(0);
                regmodel.flow_header[flow].flow_header[13].flow_data.set('h0A0A);
                regmodel.flow_header[flow].flow_header[14].flow_flag.set(0);
                regmodel.flow_header[flow].flow_header[14].flow_data.set('h0A0B);
                regmodel.flow_header[flow].flow_header[15].flow_flag.set(0);
                regmodel.flow_header[flow].flow_header[15].flow_data.set('h0A0A);
                regmodel.flow_header[flow].flow_header[16].flow_flag.set(0);
                regmodel.flow_header[flow].flow_header[16].flow_data.set('h0A0A);
                regmodel.flow_header[flow].flow_header[17].flow_flag.set(0);
                regmodel.flow_header[flow].flow_header[17].flow_data.set('h07D0);
                regmodel.flow_header[flow].flow_header[18].flow_flag.set(0);
                regmodel.flow_header[flow].flow_header[18].flow_data.set('h0BB8);
                regmodel.flow_header[flow].flow_header[19].flow_flag.set(1);
                regmodel.flow_header[flow].flow_header[19].flow_data.set('h0000);
                regmodel.flow_header[flow].flow_header[20].flow_flag.set(3);
                regmodel.flow_header[flow].flow_header[20].flow_data.set('h0000);
                regmodel.flow_header[flow].ipv4_options_and_vlans.ip_packet.set(2);
            end
            regmodel.flow_header[flow].vid_range.vid_range_ena_outer.set(0);
            regmodel.flow_header[flow].vid_range.vid_range_ena_inner.set(0);
            regmodel.flow_header[flow].vid_range.vid_range.set(0);
            regmodel.flow_header[flow].vid_range.vid_first.set(0);
            // Padding registers
            regmodel.padding[flow].pad_info_1.padding.set(0);
            regmodel.padding[flow].pad_info_2.mode.set(4);
            regmodel.padding[flow].gen_info.force_crc_error.set(0);
            regmodel.padding[flow].gen_info.info_add_ena.set(1);
            regmodel.padding[flow].seq_nbr.seq_nbr.set(0);
            regmodel.padding[flow].flow_number.flow_number.set(flow_number[flow]);
            regmodel.padding[flow].timestamp_select.freerun.set(0);
            // Shaping registers
            regmodel.shapping[flow].shapping_bucket.signbit.set(1);
            regmodel.shapping[flow].shapping_bucket.bucket_val.set(bucket_val[flow]);
            regmodel.shapping[flow].credit.credit_value.set(credit_value);
            regmodel.shapping[flow].period.period_factor.set(period_factor-1);
            regmodel.shapping[flow].shapping_mode.shapping_ena.set(1);
            regmodel.shapping[flow].shapping_mode.shapping_mode_sel.set(0); // bytes
            regmodel.shapping[flow].duration_bucket.duration_bucket.set(nbr_of_pkt[flow]);
            regmodel.shapping[flow].duration_mode.duration_mode_sel.set(1); // packet
            //regmodel.shapping[flow].EMIX_table.sequence_value_index.set(0);
            //regmodel.shapping[flow].EMIX_table.sequence_value.set('h44);
            //regmodel.shapping[flow].info0_mode_EMIX.mode.set(0);
            //regmodel.shapping[flow].info0_mode_EMIX.last_ptr.set(6);
            //regmodel.shapping[flow].info0_mode_EMIX.first_ptr.set(0);
            //regmodel.shapping[flow].info0_mode_EMIX.ptr_weight7.set(0);
            //regmodel.shapping[flow].info0_mode_EMIX.ptr_weight6.set(1);
            //regmodel.shapping[flow].info0_mode_EMIX.ptr_weight5.set(2);
            //regmodel.shapping[flow].info0_mode_EMIX.ptr_weight4.set(3);
            //regmodel.shapping[flow].info0_mode_EMIX.ptr_weight3.set(4);
            //regmodel.shapping[flow].info0_mode_EMIX.ptr_weight2.set(5);
            //regmodel.shapping[flow].info0_mode_EMIX.ptr_weight1.set(6);
            //regmodel.shapping[flow].info0_mode_EMIX.ptr_weight0.set(7);
            //regmodel.shapping[flow].info0_mode_step_interval.mode.set(0);
            //regmodel.shapping[flow].info0_mode_step_interval.direction_init.set(0);
            //regmodel.shapping[flow].info0_mode_step_interval.direction_mode.set(0);
            //regmodel.shapping[flow].info0_mode_step_interval.max_size.set0);
            //regmodel.shapping[flow].info0_mode_step_interval.min_size.set(0);
            regmodel.shapping[flow].info0_mode_pseudo_random.mode.set(3);                           // Pseudo-random
            regmodel.shapping[flow].info0_mode_pseudo_random.max_size_offset.set(0);                // Constant packet size (max=min)
            regmodel.shapping[flow].info0_mode_pseudo_random.min_size.set(pkt_size_in_byte[flow]);
            //regmodel.shapping[flow].info1_mode_step_interval.step_size.set(0);
            //regmodel.shapping[flow].info2_EMIX.ptr_weight2.set(0);
            //regmodel.shapping[flow].info2_EMIX.next_weight.set(0);
            //regmodel.shapping[flow].info2_EMIX.next_size.set(0);
            //regmodel.shapping[flow].info2_mode_step_interval.next_direction.set(0);
            //regmodel.shapping[flow].info2_mode_step_interval.next_size.set(0);
            regmodel.shapping[flow].info2_mode_pseudo_random.last_random.set(0);
            regmodel.shapping[flow].info2_mode_pseudo_random.random_special_zero.set(0);
            regmodel.shapping[flow].info2_mode_pseudo_random.next_size.set(pkt_size_in_byte[flow]);
        end
        regmodel.update(status, .parent(null)); // Write all pktgen registers to the DUT

        // Ena registers
        regmodel.ena.destination.set(outgoing_port-1);
//        regmodel.ena.upstream_downstream.set(upstream_downstream);    // Down stream
        regmodel.ena.flow_7_ena.set(0);
        regmodel.ena.flow_6_ena.set(0);
        regmodel.ena.flow_5_ena.set(0);
        regmodel.ena.flow_4_ena.set(0);
        regmodel.ena.compensation.set(compensation);
        regmodel.ena.flow_3_ena.set(0);
        regmodel.ena.flow_2_ena.set(0);
        regmodel.ena.flow_1_ena.set(0);
        regmodel.ena.flow_0_ena.set(0);
        regmodel.ena.update(status, .parent(null)); // Write pktgen ena register to the DUT

    endtask

    //---------------------------------------------------------------------------------
    // Task: Enable
    //---------------------------------------------------------------------------------
    virtual task enable_flow(bit ena='1);
        uvm_status_e status;
        bit [7:0] flow_ena;

        //flow_ena = (2**nbr_of_flow)-1;
        flow_ena = ena ? '1 : '0;

        // Ena registers
        regmodel.ena.flow_7_ena.set(flow_ena[7]);
        regmodel.ena.flow_6_ena.set(flow_ena[6]);
        regmodel.ena.flow_5_ena.set(flow_ena[5]);
        regmodel.ena.flow_4_ena.set(flow_ena[4]);
        regmodel.ena.flow_3_ena.set(flow_ena[3]);
        regmodel.ena.flow_2_ena.set(flow_ena[2]);
        regmodel.ena.flow_1_ena.set(flow_ena[1]);
        regmodel.ena.flow_0_ena.set(flow_ena[0]);
        regmodel.ena.update(status, .parent(null)); // Write pktgen ena register to the DUT

    endtask

    //---------------------------------------------------------------------------------
    // Function: find_period_factor
    //---------------------------------------------------------------------------------
    virtual function int unsigned find_period_factor(int unsigned bit_rate_in_mbps_for_this_flow);
        int unsigned period_factor;

        // Find the period factor
        //while((bit_rate_in_mbps_for_this_flow*40*period_factor/1000) != int(bit_rate_in_mbps_for_this_flow*40*period_factor/1000)) period_factor++;
        if ((bit_rate_in_mbps_for_this_flow % 25) == 0) period_factor = 1;
        else if ((bit_rate_in_mbps_for_this_flow % 5) == 0) period_factor = 5;
        else period_factor = 25;

        return period_factor;
    endfunction

    //---------------------------------------------------------------------------------
    // Function: calculate_credit_value
    //---------------------------------------------------------------------------------
    virtual function int unsigned calculate_credit_value(int unsigned bit_rate_in_mbps_for_this_flow, int unsigned period_factor);
        int unsigned credit_value;

        // Calculate the credit value
        // bit_rate_per_sec*320ns*period_factor/8 bit = bit_rate_in_Mbps*10^6*320s/10^9*period_factor/8 bit = bit_rate_in_Mbps*320s/1000*period_factor/8 bit
        credit_value = bit_rate_in_mbps_for_this_flow*40*period_factor/1000;

        return credit_value;
    endfunction

    //---------------------------------------------------------------------------------
    // Function: convert2string
    //---------------------------------------------------------------------------------
    virtual function string convert2string();
        string str;
        int unsigned period_factor;
        int unsigned credit_value;

        str = $sformatf("\nPkt Gen registers\n");
        str = $sformatf("%s outgoing_port      =%0d\n", str, outgoing_port);
        str = $sformatf("%s upstream_downstream=%0d\n", str, upstream_downstream);
        str = $sformatf("%s nbr_of_flow        =%0d\n", str, nbr_of_flow);
        str = $sformatf("%s compensation       =%0d\n", str, compensation);
//        str = $sformatf("%s src_mac_addr       =%12x\n", str, src_mac_addr);
//        str = $sformatf("%s dst_mac_addr       =%12x\n", str, dst_mac_addr);
        str = $sformatf("%s gen_pkt_type       =%0d\n", str, gen_pkt_type);
        // One per flow
        foreach(bit_rate_in_mbps[i]) begin
            period_factor = find_period_factor(bit_rate_in_mbps[i]);
            credit_value = calculate_credit_value(bit_rate_in_mbps[i], period_factor);

            str = $sformatf("%s period_factor[%0d]   =%0d\n", str, i, period_factor);
            str = $sformatf("%s credit_value[%0d]    =%0d\n", str, i, credit_value);
            str = $sformatf("%s bit_rate_in_mbps[%0d]=%0d\n", str, i, bit_rate_in_mbps[i]);
            str = $sformatf("%s nbr_of_pkt[%0d]      =%0d\n", str, i, nbr_of_pkt[i]);
            str = $sformatf("%s pkt_size_in_byte[%0d]=%0d\n", str, i, pkt_size_in_byte[i]);
            str = $sformatf("%s      flow_number[%0d]=%0d\n", str, i, flow_number[i]);
            str = $sformatf("%s      bucket_val[%0d] =%0d\n", str, i, bucket_val[i]);
        end
        return str;
    endfunction

endclass


//-----------------------------------------------------------------------------
// Class: pktgen_poll_duration_seq
// Sequence that polls the duration bucket, exits when done.
//------------------------------------------------------------------------------
class pktgen_poll_duration_seq extends uvm_sequence#(uvm_sequence_item);
    `uvm_object_utils(pktgen_poll_duration_seq)

    //---------------------------------------------------------------------------------
    // Variable: regmodel
    // Handle to register model
    //---------------------------------------------------------------------------------
    //T_REG regmodel;
    pktgen_reg_pkg::pktgen_reg_block regmodel;

    time abs_timeout = 5ms;

    //---------------------------------------------------------------------------------
    // Constructor: new
    //---------------------------------------------------------------------------------
    function new(string name="pktgen_reg_seq_t");
        super.new(name);
    endfunction

    //---------------------------------------------------------------------------------
    // Task: body
    //---------------------------------------------------------------------------------
    virtual task body();
        uvm_status_e status;
        bit [7:0] flow_ena;
        longint unsigned flow_duration[8];
        longint unsigned sum_duration = '1;

        // Get enabled flows
        foreach(flow_ena[i]) begin
            case(i)
                0: flow_ena[i] = regmodel.ena.flow_0_ena.get();
                1: flow_ena[i] = regmodel.ena.flow_1_ena.get();
                2: flow_ena[i] = regmodel.ena.flow_2_ena.get();
                3: flow_ena[i] = regmodel.ena.flow_3_ena.get();
                4: flow_ena[i] = regmodel.ena.flow_4_ena.get();
                5: flow_ena[i] = regmodel.ena.flow_5_ena.get();
                6: flow_ena[i] = regmodel.ena.flow_6_ena.get();
                7: flow_ena[i] = regmodel.ena.flow_7_ena.get();
            endcase
            // Make sure we're not in infinite mode
            if (flow_ena[i] && (regmodel.shapping[i].duration_mode.duration_mode_sel.get() == 3)) begin
                `uvm_error("CFGERR", $sformatf("PktGen Flow%0d shaping set to infinite, no use polling duration...", i))
                flow_ena[i] = 0;
            end
        end
        `uvm_info("POLL", $sformatf("\n\nPKTGEN FLOWS ENABLED: %p\n", flow_ena), UVM_LOW)

        // Poll
        fork
            begin
                fork : PKT_GEN_POLLING
                    begin
                        do begin
                            #10us;
                            foreach(flow_ena[i]) begin
                                if (!flow_ena[i]) continue;
                                regmodel.shapping[i].duration_bucket.mirror(status, .check(UVM_NO_CHECK));
                                flow_duration[i] = regmodel.shapping[i].duration_bucket.duration_bucket.get();
                            end
                            `uvm_info("POLL", $sformatf("\n\nPKTGEN DURATION BUCKETS: %p\n", flow_duration), UVM_LOW)
                            if (flow_duration.sum() >= sum_duration)
                                `uvm_error("POLL", $sformatf("Duration bucket(s) have not decremented: last=%0d this=%0d", flow_duration.sum(), sum_duration))
                            sum_duration = flow_duration.sum();
                        end while(sum_duration != 0);
                    end
                    begin
                        // Absolute timeout
                        #(abs_timeout);
                        `uvm_fatal("TIMEOUT", "PktGen duration polling took too long...")
                    end
                join_any
                disable PKT_GEN_POLLING;
            end
        join

    endtask
endclass
