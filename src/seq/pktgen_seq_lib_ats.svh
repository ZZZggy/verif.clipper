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

`include "clipper_macros.sv"

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
    rand int unsigned bit_rate_in_mbps [];
    rand int unsigned nbr_of_pkt       [];
    rand int unsigned pkt_size_in_byte [];
    rand int unsigned flow_number      [];
    rand bit [30:0]   bucket_val       [];
    rand bit [47:0]   src_mac_addr;
    rand bit [47:0]   dst_mac_addr;
    rand int unsigned gen_pkt_type;   // 0:Layer 2 LBM 0VLAN, 1:Layer 3 0VLAN, 2:Layer 3 IPv6/UDP/TWAMP
    rand int unsigned min_frame_size; // with gen_pkt_type=0: 64 , with gen_pkt_type=1: 82, with gen_pkt_type=2: 122, 
    int unsigned extra_offset_cfg;
    

    // Constrain indices to proper ranges (hard)
    constraint c1 {
        solve nbr_of_flow before bit_rate_in_mbps;
        solve nbr_of_flow before nbr_of_pkt;
        solve nbr_of_flow before pkt_size_in_byte;
        solve nbr_of_flow before flow_number;
        solve nbr_of_flow before bucket_val;

        outgoing_port inside {[1:NB_IF_PORTS]};
        nbr_of_flow   inside {[0:`PKTGEN_NBR_FLOW-1]};

        // Used for shaping, duration and statistics
        //  0 : Cisco (L2 without FCS),
        //  4 : Accedian (L2 with FCS),
        // 24 : MEF (L2 with FCS, IPG, SFD and preamble)
        compensation         inside {0, 4, 24};
        soft compensation    == 24;

        soft gen_pkt_type    == 0;   // Layer 2 LBM, 0 VLAN
        soft min_frame_size  == 64;  // with gen_pkt_type=0: 64 
        //soft gen_pkt_type    == 1;   // Layer 3 IPv4/UDP/OAM, 0 VLAN
        //soft min_frame_size  == 82;  // with gen_pkt_type=1: 82 
        //soft gen_pkt_type    == 2;   // Layer 3 IPv6/UDP/TWAMP, 0 VLAN
        //soft min_frame_size  == 122; // with gen_pkt_type=2: 122, 

        src_mac_addr         != dst_mac_addr;

        bit_rate_in_mbps.size == nbr_of_flow;
        nbr_of_pkt.size       == nbr_of_flow;
        pkt_size_in_byte.size == nbr_of_flow;
        flow_number.size      == nbr_of_flow;
        bucket_val.size       == nbr_of_flow;

//        foreach(bit_rate_in_mbps[i]) {bit_rate_in_mbps[i] inside {[100: 1000]};}
        foreach(nbr_of_pkt[i]      ) {nbr_of_pkt[i]       inside {[  1000:  2000]};}
        foreach(pkt_size_in_byte[i]) {pkt_size_in_byte[i] inside {[ min_frame_size:  256]};}
        foreach(flow_number[i])      {flow_number[i]      inside {[  0:   15]};}

        unique{flow_number};

//        foreach(bucket_val[i])       {soft bucket_val[i]  == 0;}
    }

    function new(string name="pktgen_reg_seq_t");
        super.new(name);
    endfunction

    virtual task body();
        uvm_status_e status;
        int unsigned period_factor;
        int unsigned credit_value;

        // Pkt Gen config flow
        //configuring flows (layer 3 0VLAN) or (Layer 2 LBM 0VLAN) or (Layer 3 IPv6/UDP/TWAMP)
        foreach(bit_rate_in_mbps[flow]) begin
            period_factor = find_period_factor(bit_rate_in_mbps[flow]);
            credit_value = calculate_credit_value(bit_rate_in_mbps[flow], period_factor);

            `uvm_info(get_name, $sformatf("period_factor=%0d, credit_value=%0d", period_factor, credit_value), UVM_LOW);
            // Forcing shaper values
            ////period_factor = 'h32;
            ////credit_value = 'h3de;
            `uvm_info(get_name, $sformatf("FORCED VALUES: period_factor=%0d, credit_value=%0d", period_factor, credit_value), UVM_LOW);

            // Flow Header registers
            regmodel.header_flow[flow].header[0].flag.set(0);
            regmodel.header_flow[flow].header[0].data.set(dst_mac_addr[47:32]);
            regmodel.header_flow[flow].header[1].flag.set(0);
            regmodel.header_flow[flow].header[1].data.set(dst_mac_addr[31:16]);
            regmodel.header_flow[flow].header[2].flag.set(0);
            regmodel.header_flow[flow].header[2].data.set(dst_mac_addr[15:0]);
            regmodel.header_flow[flow].header[3].flag.set(0);
            regmodel.header_flow[flow].header[3].data.set(src_mac_addr[47:32]);
            regmodel.header_flow[flow].header[4].flag.set(0);
            regmodel.header_flow[flow].header[4].data.set(src_mac_addr[31:16]);
            regmodel.header_flow[flow].header[5].flag.set(0);
            regmodel.header_flow[flow].header[5].data.set(src_mac_addr[15:0]);
            if (gen_pkt_type == 0) begin
                // Layer 2 LBM 0VLAN
                extra_offset_cfg = 0;

                regmodel.header_flow[flow].header[ 6].flag.set(0);
                regmodel.header_flow[flow].header[ 6].data.set('h88a8); // VLAN ethertype
                regmodel.header_flow[flow].header[ 7].flag.set(0);
                regmodel.header_flow[flow].header[ 7].data.set('h4eb0); // VLAN tag
                regmodel.header_flow[flow].header[ 8].flag.set(0);
                regmodel.header_flow[flow].header[ 8].data.set('h8902);  // ethertype CFM(IEEE 802.1ag) or OAM(ITU Y.1731)
                regmodel.header_flow[flow].header[ 9].flag.set(0);
                regmodel.header_flow[flow].header[ 9].data.set('h0003);  // OAM LBM
                regmodel.header_flow[flow].header[10].flag.set(3);
                regmodel.header_flow[flow].header[10].data.set('h0004);
                regmodel.padding_flow[flow].frame_info.mpls_vlan_stack_size.set(1);
                regmodel.padding_flow[flow].frame_info.protocol.set(0);
                regmodel.padding_flow[flow].frame_info.ip_options_extensions_stack_size.set(0);
                regmodel.padding_flow[flow].frame_info.extra_offset_stack_size.set(extra_offset_cfg);
                regmodel.padding_flow[flow].checksum.partial_ipv4_chcksm.set(16'hBAAD);
                regmodel.padding_flow[flow].checksum.partial_l4_chcksm.set(16'hBAAD);
                regmodel.padding_flow[flow].modif_header.min.set(0);
                regmodel.padding_flow[flow].modif_header.incr.set(0);
                regmodel.padding_flow[flow].modif_header.mod_div_adj.set(0);
                regmodel.padding_flow[flow].modif_header.offset.set(0);
                regmodel.padding_flow[flow].modif_header.ena.set(0);
                regmodel.padding_flow[flow].modif_header.udp_chksm_mod_ena.set(0);
                regmodel.padding_flow[flow].modif_header.ipv4_chksm_mod_ena.set(0);
            end else if (gen_pkt_type == 1)  begin
                // Layer 3 0VLAN
                extra_offset_cfg = 0;

                regmodel.header_flow[flow].header[ 6].flag.set(0);
                regmodel.header_flow[flow].header[ 6].data.set('h0800);  // ethertype IP
                regmodel.header_flow[flow].header[ 7].flag.set(0);
                regmodel.header_flow[flow].header[ 7].data.set('h4500);
                regmodel.header_flow[flow].header[ 8].flag.set(1);
                regmodel.header_flow[flow].header[ 8].data.set('hBAAD);
                regmodel.header_flow[flow].header[ 9].flag.set(0);
                regmodel.header_flow[flow].header[ 9].data.set('h0001);
                regmodel.header_flow[flow].header[10].flag.set(0);
                regmodel.header_flow[flow].header[10].data.set('h4000);
                regmodel.header_flow[flow].header[11].flag.set(0);
                regmodel.header_flow[flow].header[11].data.set('hFF11);
                regmodel.header_flow[flow].header[12].flag.set(1);
                regmodel.header_flow[flow].header[12].data.set('hBAAD);
                regmodel.header_flow[flow].header[13].flag.set(0);
                regmodel.header_flow[flow].header[13].data.set('h0A0A);
                regmodel.header_flow[flow].header[14].flag.set(0);
                regmodel.header_flow[flow].header[14].data.set('h0A0B);
                regmodel.header_flow[flow].header[15].flag.set(0);
                regmodel.header_flow[flow].header[15].data.set('h0A0A);
                regmodel.header_flow[flow].header[16].flag.set(0);
                regmodel.header_flow[flow].header[16].data.set('h0A0A);
                regmodel.header_flow[flow].header[17].flag.set(0);
                regmodel.header_flow[flow].header[17].data.set('h07D0);
                regmodel.header_flow[flow].header[18].flag.set(0);
                regmodel.header_flow[flow].header[18].data.set('h0BB8);
                regmodel.header_flow[flow].header[19].flag.set(1);
                regmodel.header_flow[flow].header[19].data.set('hBAAD);
                regmodel.header_flow[flow].header[20].flag.set(3);
                regmodel.header_flow[flow].header[20].data.set('hBAAD);
                regmodel.padding_flow[flow].frame_info.mpls_vlan_stack_size.set(0);
                regmodel.padding_flow[flow].frame_info.protocol.set(1);
                regmodel.padding_flow[flow].frame_info.ip_options_extensions_stack_size.set(0);
                regmodel.padding_flow[flow].frame_info.extra_offset_stack_size.set(extra_offset_cfg);
                // partial_ipv4_chcksm = 0x4500 + 0x0000 + 0x0001 + 0x4000 + 0xFF11 + 0x0000 + 0x0A0A + 0x0A0B + 0x0A0A + 0x0A0A = 0x1AC3B -> 0xAC3B + 0x1 = 0xAC3C
                regmodel.padding_flow[flow].checksum.partial_ipv4_chcksm.set(16'hAC3C);
                // partial_udp_chcksm  = 0x0A0A + 0x0A0B + 0x0A0A + 0x0A0A + 0x0011 + 0x0000 + 0x07D0 + 0x0BB8 + 0x0000 + 0x0000 = 0x03BC2 -> 0x3BC2 + 0x0 = 0x3BC2
                regmodel.padding_flow[flow].checksum.partial_l4_chcksm.set(16'h3BC2);
                regmodel.padding_flow[flow].modif_header.min.set(0);
                regmodel.padding_flow[flow].modif_header.incr.set(0);
                regmodel.padding_flow[flow].modif_header.mod_div_adj.set(0);
                regmodel.padding_flow[flow].modif_header.offset.set(0);
                regmodel.padding_flow[flow].modif_header.ena.set(0);
                regmodel.padding_flow[flow].modif_header.udp_chksm_mod_ena.set(0);
                regmodel.padding_flow[flow].modif_header.ipv4_chksm_mod_ena.set(0);
            end else begin // if (gen_pkt_type == 2)
                // Layer 3 IPv6/UDP/TWAMP
                extra_offset_cfg = 21;
                
                regmodel.header_flow[flow].header[ 6].flag.set(0);
                regmodel.header_flow[flow].header[ 6].data.set('h86DD);  // ethertype IP
                regmodel.header_flow[flow].header[ 7].flag.set(0);
                regmodel.header_flow[flow].header[ 7].data.set('h6000);
                regmodel.header_flow[flow].header[ 8].flag.set(0);
                regmodel.header_flow[flow].header[ 8].data.set('h0000);
                regmodel.header_flow[flow].header[ 9].flag.set(1);
                regmodel.header_flow[flow].header[ 9].data.set('h0000);
                regmodel.header_flow[flow].header[10].flag.set(0);
                regmodel.header_flow[flow].header[10].data.set('h117B);
                regmodel.header_flow[flow].header[11].flag.set(0);
                regmodel.header_flow[flow].header[11].data.set('h1111);
                regmodel.header_flow[flow].header[12].flag.set(0);
                regmodel.header_flow[flow].header[12].data.set('h2222);
                regmodel.header_flow[flow].header[13].flag.set(0);
                regmodel.header_flow[flow].header[13].data.set('h3333);
                regmodel.header_flow[flow].header[14].flag.set(0);
                regmodel.header_flow[flow].header[14].data.set('h4444);
                regmodel.header_flow[flow].header[15].flag.set(0);
                regmodel.header_flow[flow].header[15].data.set('h5555);
                regmodel.header_flow[flow].header[16].flag.set(0);
                regmodel.header_flow[flow].header[16].data.set('h6666);
                regmodel.header_flow[flow].header[17].flag.set(0);
                regmodel.header_flow[flow].header[17].data.set('h7777);
                regmodel.header_flow[flow].header[18].flag.set(0);
                regmodel.header_flow[flow].header[18].data.set('h8888);
                regmodel.header_flow[flow].header[19].flag.set(0);
                regmodel.header_flow[flow].header[19].data.set('h8888);
                regmodel.header_flow[flow].header[20].flag.set(0);
                regmodel.header_flow[flow].header[20].data.set('h9999);
                regmodel.header_flow[flow].header[21].flag.set(0);
                regmodel.header_flow[flow].header[21].data.set('hAAAA);
                regmodel.header_flow[flow].header[22].flag.set(0);
                regmodel.header_flow[flow].header[22].data.set('hBBBB);
                regmodel.header_flow[flow].header[23].flag.set(0);
                regmodel.header_flow[flow].header[23].data.set('hCCCC);
                regmodel.header_flow[flow].header[24].flag.set(0);
                regmodel.header_flow[flow].header[24].data.set('hDDDD);
                regmodel.header_flow[flow].header[25].flag.set(0);
                regmodel.header_flow[flow].header[25].data.set('hEEEE);
                regmodel.header_flow[flow].header[26].flag.set(0);
                regmodel.header_flow[flow].header[26].data.set('hFFFF);
                regmodel.header_flow[flow].header[27].flag.set(0);
                regmodel.header_flow[flow].header[27].data.set('h0320);
                regmodel.header_flow[flow].header[28].flag.set(0);
                regmodel.header_flow[flow].header[28].data.set('h1770);
                regmodel.header_flow[flow].header[29].flag.set(1);
                regmodel.header_flow[flow].header[29].data.set('h0000);
                regmodel.header_flow[flow].header[30].flag.set(2);
                regmodel.header_flow[flow].header[30].data.set('h0000);
                regmodel.header_flow[flow].header[31].flag.set(0);
                regmodel.header_flow[flow].header[31].data.set('h0000);
                regmodel.header_flow[flow].header[32].flag.set(0);
                regmodel.header_flow[flow].header[32].data.set('h0000);
                regmodel.header_flow[flow].header[33].flag.set(0);
                regmodel.header_flow[flow].header[33].data.set('h0000);
                regmodel.header_flow[flow].header[34].flag.set(0);
                regmodel.header_flow[flow].header[34].data.set('h0000);
                regmodel.header_flow[flow].header[35].flag.set(0);
                regmodel.header_flow[flow].header[35].data.set('h0000);
                regmodel.header_flow[flow].header[36].flag.set(0);
                regmodel.header_flow[flow].header[36].data.set('h0000);
                regmodel.header_flow[flow].header[37].flag.set(0);
                regmodel.header_flow[flow].header[37].data.set('h0000);
                regmodel.header_flow[flow].header[38].flag.set(0);
                regmodel.header_flow[flow].header[38].data.set('h0000);
                regmodel.header_flow[flow].header[39].flag.set(0);
                regmodel.header_flow[flow].header[39].data.set('h0000);
                regmodel.header_flow[flow].header[40].flag.set(0);
                regmodel.header_flow[flow].header[40].data.set('h0000);
                regmodel.header_flow[flow].header[41].flag.set(0);
                regmodel.header_flow[flow].header[41].data.set('h0000);
                regmodel.header_flow[flow].header[42].flag.set(0);
                regmodel.header_flow[flow].header[42].data.set('h0000);
                regmodel.header_flow[flow].header[43].flag.set(0);
                regmodel.header_flow[flow].header[43].data.set('h0000);
                regmodel.header_flow[flow].header[44].flag.set(0);
                regmodel.header_flow[flow].header[44].data.set('h0000);
                regmodel.header_flow[flow].header[45].flag.set(0);
                regmodel.header_flow[flow].header[45].data.set('h0000);
                regmodel.header_flow[flow].header[46].flag.set(0);
                regmodel.header_flow[flow].header[46].data.set('h0000);
                regmodel.header_flow[flow].header[47].flag.set(0);
                regmodel.header_flow[flow].header[47].data.set('h0000);
                regmodel.header_flow[flow].header[48].flag.set(0);
                regmodel.header_flow[flow].header[48].data.set('h0000);
                regmodel.header_flow[flow].header[49].flag.set(0);
                regmodel.header_flow[flow].header[49].data.set('h0000);
                regmodel.header_flow[flow].header[50].flag.set(0);
                regmodel.header_flow[flow].header[50].data.set('h0000);
                regmodel.header_flow[flow].header[51].flag.set(3);
                regmodel.header_flow[flow].header[51].data.set('h0000);
                regmodel.padding_flow[flow].frame_info.mpls_vlan_stack_size.set(0);
                regmodel.padding_flow[flow].frame_info.protocol.set(3);
                regmodel.padding_flow[flow].frame_info.ip_options_extensions_stack_size.set(0);
                regmodel.padding_flow[flow].frame_info.extra_offset_stack_size.set(extra_offset_cfg);
                regmodel.padding_flow[flow].checksum.partial_ipv4_chcksm.set(16'h0000);
                regmodel.padding_flow[flow].checksum.partial_l4_chcksm.set(16'h0000);
                regmodel.padding_flow[flow].modif_header.min.set(0);
                regmodel.padding_flow[flow].modif_header.incr.set(0);
                regmodel.padding_flow[flow].modif_header.mod_div_adj.set(0);
                regmodel.padding_flow[flow].modif_header.offset.set(0);
                regmodel.padding_flow[flow].modif_header.ena.set(0);
                regmodel.padding_flow[flow].modif_header.udp_chksm_mod_ena.set(0);
                regmodel.padding_flow[flow].modif_header.ipv4_chksm_mod_ena.set(0);
            end
            
            // Padding registers
            regmodel.padding_flow[flow].pad_info_1.padding.set('h12345678);
            regmodel.padding_flow[flow].pad_info_2.mode.set(2);
            regmodel.padding_flow[flow].gen_info.flow_hdr_only.set(0);
            regmodel.padding_flow[flow].gen_info.force_crc_error.set(0);
            regmodel.padding_flow[flow].gen_info.y1731_info_add_ena.set(1);
            regmodel.padding_flow[flow].seq_nbr.seq_nbr.set(0);
            regmodel.padding_flow[flow].flow_number.flow_number.set(flow_number[flow]);
            regmodel.padding_flow[flow].timestamp_select.freerun.set(1);
            // Shaping registers
            regmodel.shaping_flow[flow].shaping_bucket.signbit.set(0);
            regmodel.shaping_flow[flow].shaping_bucket.bucket_val.set(bucket_val[flow]); // bucket should initialise to -1 -> 0x7fffffff
            regmodel.shaping_flow[flow].credit.value.set(credit_value); ////'hc8);
            regmodel.shaping_flow[flow].period.factor.set(period_factor-1); ////'h0);
            regmodel.shaping_flow[flow].shaping_mode.ena.set(1);
            regmodel.shaping_flow[flow].shaping_mode.sel.set(0); // bytes
            
            regmodel.shaping_flow[flow].duration_bucket.duration_bucket.set('h9c4); ////nbr_of_pkt[flow]);
            regmodel.shaping_flow[flow].duration_mode.sel.set(1); // packet
            //regmodel.shaping_flow[flow].info0.value.set(32'hC0000000 + pkt_size_in_byte[flow]);
            regmodel.shaping_flow[flow].info0.value.set('hc0000040); ////32'hC0244040); // replaced by random 64B to 209B for FPGAB-316
            regmodel.shaping_flow[flow].info2.value.set('h40); ////pkt_size_in_byte[flow]);

//            regmodel.shaping_flow[flow].emix_table.sequence_value_index.set(0);
//            regmodel.shaping_flow[flow].emix_table.sequence_value.set('h44);

//            regmodel.shaping_flow[flow].info0_mode_EMIX.mode.set(0);
//            regmodel.shaping_flow[flow].info0_mode_EMIX.last_ptr.set(6);
//            regmodel.shaping_flow[flow].info0_mode_EMIX.first_ptr.set(0);
//            regmodel.shaping_flow[flow].info0_mode_EMIX.ptr_weight7.set(0);
//            regmodel.shaping_flow[flow].info0_mode_EMIX.ptr_weight6.set(1);
//            regmodel.shaping_flow[flow].info0_mode_EMIX.ptr_weight5.set(2);
//            regmodel.shaping_flow[flow].info0_mode_EMIX.ptr_weight4.set(3);
//            regmodel.shaping_flow[flow].info0_mode_EMIX.ptr_weight3.set(4);
//            regmodel.shaping_flow[flow].info0_mode_EMIX.ptr_weight2.set(5);
//            regmodel.shaping_flow[flow].info0_mode_EMIX.ptr_weight1.set(6);
//            regmodel.shaping_flow[flow].info0_mode_EMIX.ptr_weight0.set(7);
//            regmodel.shaping_flow[flow].info0_mode_step_interval.mode.set(0);
//            regmodel.shaping_flow[flow].info0_mode_step_interval.direction_init.set(0);
//            regmodel.shaping_flow[flow].info0_mode_step_interval.direction_mode.set(0);
//            regmodel.shaping_flow[flow].info0_mode_step_interval.max_size.set0);
//            regmodel.shaping_flow[flow].info0_mode_step_interval.min_size.set(0);
//            regmodel.shaping_flow[flow].info0_mode_pseudo_random.mode.set(3);                           // Pseudo-random
//            regmodel.shaping_flow[flow].info0_mode_pseudo_random.max_size_offset.set(0);                // Constant packet size (max=min)
//            regmodel.shaping_flow[flow].info0_mode_pseudo_random.min_size.set(pkt_size_in_byte[flow]);
//            regmodel.shaping_flow[flow].info1_mode_step_interval.step_size.set(0);
//            regmodel.shaping_flow[flow].info2_EMIX.ptr_weight2.set(0);
//            regmodel.shaping_flow[flow].info2_EMIX.next_weight.set(0);
//            regmodel.shaping_flow[flow].info2_EMIX.next_size.set(0);
//            regmodel.shaping_flow[flow].info2_mode_step_interval.next_direction.set(0);
//            regmodel.shaping_flow[flow].info2_mode_step_interval.next_size.set(0);
//            regmodel.shaping_flow[flow].info2_mode_pseudo_random.last_random.set(0);
//            regmodel.shaping_flow[flow].info2_mode_pseudo_random.random_special_zero.set(0);
//            regmodel.shaping_flow[flow].info2_mode_pseudo_random.next_size.set(pkt_size_in_byte[flow]);
        end

        // Write all pktgen registers to the DUT
        regmodel.update(status, .parent(null));

        // Ena registers
        regmodel.pktgen_global.ena.set(0);
        regmodel.pktgen_global.ena.destination.set(outgoing_port-1);
        regmodel.pktgen_global.ena.upstream_downstream.set(upstream_downstream);    // Down stream
        regmodel.pktgen_global.ena.compensation.set(compensation);
        regmodel.pktgen_global.ena.update(status, .parent(null));
    endtask

    //---------------------------------------------------------------------------------
    // Task: Enable
    //---------------------------------------------------------------------------------
    virtual task enable_flow();
        uvm_status_e status;

        // Ena registers
        // Write pktgen ena register to the DUT
        if ( 0 < nbr_of_flow) regmodel.pktgen_global.ena.flow_0.set(1);
        if ( 1 < nbr_of_flow) regmodel.pktgen_global.ena.flow_1.set(1);
        if ( 2 < nbr_of_flow) regmodel.pktgen_global.ena.flow_2.set(1);
        if ( 3 < nbr_of_flow) regmodel.pktgen_global.ena.flow_3.set(1);
        if ( 4 < nbr_of_flow) regmodel.pktgen_global.ena.flow_4.set(1);
        if ( 5 < nbr_of_flow) regmodel.pktgen_global.ena.flow_5.set(1);
        if ( 6 < nbr_of_flow) regmodel.pktgen_global.ena.flow_6.set(1);
        if ( 7 < nbr_of_flow) regmodel.pktgen_global.ena.flow_7.set(1);
        if ( 8 < nbr_of_flow) regmodel.pktgen_global.ena.flow_8.set(1);
        if ( 9 < nbr_of_flow) regmodel.pktgen_global.ena.flow_9.set(1);
        if (10 < nbr_of_flow) regmodel.pktgen_global.ena.flow_10.set(1);
        if (11 < nbr_of_flow) regmodel.pktgen_global.ena.flow_11.set(1);
        if (12 < nbr_of_flow) regmodel.pktgen_global.ena.flow_12.set(1);
        if (13 < nbr_of_flow) regmodel.pktgen_global.ena.flow_13.set(1);
        if (14 < nbr_of_flow) regmodel.pktgen_global.ena.flow_14.set(1);
        if (15 < nbr_of_flow) regmodel.pktgen_global.ena.flow_15.set(1);
        regmodel.pktgen_global.ena.update(status, .parent(null));

    endtask

    //---------------------------------------------------------------------------------
    // Function: find_period_factor
    //---------------------------------------------------------------------------------
    virtual function int unsigned find_period_factor(int unsigned bit_rate_in_mbps_for_this_flow);
        int unsigned period_factor;

        // Find the period factor for 1G design
        //while((bit_rate_in_mbps_for_this_flow*40*period_factor/1000) != int(bit_rate_in_mbps_for_this_flow*40*period_factor/1000)) period_factor++;
        //if ((bit_rate_in_mbps_for_this_flow % 25) == 0) period_factor = 1;
        //else if ((bit_rate_in_mbps_for_this_flow % 5) == 0) period_factor = 5;
        //else if ((bit_rate_in_mbps_for_this_flow % 1) == 0) period_factor = 25;
        //else period_factor = 200; // implies a min rate increments of 125 kbps

        // Find the period factor for 10G design
        //while((bit_rate_in_mbps_for_this_flow*40*period_factor/1000) != int(bit_rate_in_mbps_for_this_flow*40*period_factor/1000)) period_factor++;
        if ((bit_rate_in_mbps_for_this_flow % 50) == 0) period_factor = 1;
        else if ((bit_rate_in_mbps_for_this_flow % 10) == 0) period_factor = 5;
        else if ((bit_rate_in_mbps_for_this_flow % 5) == 0) period_factor = 10;
        else if ((bit_rate_in_mbps_for_this_flow % 1) == 0) period_factor = 50;
        else period_factor = 100; // implies a min rate increment of 500 kbps

        return period_factor;
    endfunction

    //---------------------------------------------------------------------------------
    // Function: calculate_credit_value
    //---------------------------------------------------------------------------------
    virtual function int unsigned calculate_credit_value(int unsigned bit_rate_in_mbps_for_this_flow, int unsigned period_factor);
        int unsigned credit_value;

        // Calculate the credit value for 1G design
        // bit_rate_per_sec*320ns*period_factor/8 bit = bit_rate_in_Mbps*10^6*320s/10^9*period_factor/8 bit = bit_rate_in_Mbps*320s/1000*period_factor/8 bit
        //credit_value = bit_rate_in_mbps_for_this_flow*40*period_factor/1000;

        // Calculate the credit value for 10G design
        // bit_rate_per_sec*160ns*period_factor/8 bit = bit_rate_in_Mbps*10^6*160s/10^9*period_factor/8 bit = bit_rate_in_Mbps*160s/1000*period_factor/8 bit
        credit_value = bit_rate_in_mbps_for_this_flow*20*period_factor/1000;

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
        str = $sformatf("%s src_mac_addr       =%12x\n", str, src_mac_addr);
        str = $sformatf("%s dst_mac_addr       =%12x\n", str, dst_mac_addr);
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

    function new(string name="pktgen_reg_seq_t");
        super.new(name);
    endfunction

    virtual task body();
        uvm_status_e status;
        bit [`PKTGEN_NBR_FLOW-1:0] flow_ena;
        longint unsigned flow_duration[8];
        longint unsigned sum_duration = '1;

        // Get enabled flows
        foreach(flow_ena[i]) begin
            case(i)
                0 : flow_ena[i] = regmodel.pktgen_global.ena.flow_0.get();
                1 : flow_ena[i] = regmodel.pktgen_global.ena.flow_1.get();
                2 : flow_ena[i] = regmodel.pktgen_global.ena.flow_2.get();
                3 : flow_ena[i] = regmodel.pktgen_global.ena.flow_3.get();
                4 : flow_ena[i] = regmodel.pktgen_global.ena.flow_4.get();
                5 : flow_ena[i] = regmodel.pktgen_global.ena.flow_5.get();
                6 : flow_ena[i] = regmodel.pktgen_global.ena.flow_6.get();
                7 : flow_ena[i] = regmodel.pktgen_global.ena.flow_7.get();
                8 : flow_ena[i] = regmodel.pktgen_global.ena.flow_8.get();
                9 : flow_ena[i] = regmodel.pktgen_global.ena.flow_9.get();
                10: flow_ena[i] = regmodel.pktgen_global.ena.flow_10.get();
                11: flow_ena[i] = regmodel.pktgen_global.ena.flow_11.get();
                12: flow_ena[i] = regmodel.pktgen_global.ena.flow_12.get();
                13: flow_ena[i] = regmodel.pktgen_global.ena.flow_13.get();
                14: flow_ena[i] = regmodel.pktgen_global.ena.flow_14.get();
                15: flow_ena[i] = regmodel.pktgen_global.ena.flow_15.get();
            endcase
            // Make sure we're not in infinite mode
            if (flow_ena[i] && (regmodel.shaping_flow[i].duration_mode.sel.get() == 3)) begin
                `uvm_error("CFGERR", $sformatf("PktGen Flow%0d shaping set to infinite, no use polling duration...", i))
                flow_ena[i] = 0;
            end
        end
        `uvm_info("POLL", $sformatf("\n\nPKTGEN FLOWS ENABLED: %0x\n", flow_ena), UVM_LOW)

        // Poll
        fork
            begin
                fork : PKT_GEN_POLLING
                    begin
                        do begin
                            #10us;
                            foreach(flow_ena[i]) begin
                                if (!flow_ena[i]) continue;
                                regmodel.shaping_flow[i].duration_bucket.mirror(status, .check(UVM_NO_CHECK));
                                flow_duration[i] = regmodel.shaping_flow[i].duration_bucket.duration_bucket.get();
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
