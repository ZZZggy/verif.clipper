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

`ifndef CLIPPER_PREDICTOR__SVH
`define CLIPPER_PREDICTOR__SVH



class clipper_thi_cpu2x_predictor extends thi_cpu2x_predictor;


    // Factory registration
    `uvm_component_utils(clipper_thi_cpu2x_predictor)

        // Constructor: new
    function new(string name = "clipper_thi_cpu2x_predictor", uvm_component parent=null);
        super.new(name, parent);
    endfunction

    c1lt_reg_block regmodel;
    acd_uvm_pkg::field_array_tolerance_t  my_tol;

    /**
     * CPU2IF transfer function, where the THI header should be removed, any timestamp/checksum punched, and the
     * frame forwarded to the appropriate IF.
     */
    virtual function ethernet_frame xfer_fun_if(ethernet_frame t, thi_if_frame_t cpu2if);
        ethernet_frame e = new("e");
        byte bytes[];
        byte unsigned ubytes[];
        int  unsigned bsize;
        int  word_offset;

        if (cpu2if.thi_vtag.tpid == THI_TPID_X2CPU) begin
            `uvm_warning(get_name, "Unexpected IF2CPU TPID detected, no transfer function applied.")
            return t;
        end
        // get regular ethernet frame (should be same as removing THI header, only FCS difference)
        e.copy(cpu2if);
        bytes = e.to_bytes();
        bsize = bytes.size() - FCS_BSIZE;

        // punch at 16-bit offset
        if (cpu2if.info.punch_csum) begin
            word_offset = (cpu2if.xtra_info.csum_offset + cfg.punch_delta)*2;
            if (word_offset <= bsize-2) begin
                bytes[word_offset +: 2] = {>> 8 {calc_csum(cpu2if.timestamp, cpu2if.xtra_info.inv_csum)}}; // FIXME?
            end else begin
                `uvm_info(get_name,$sformatf("Cannot punch checksum at offset %0d (outside of packet bounds %0d).",
                    word_offset, bsize), UVM_HIGH)
            end
        end

        // If timestamp and checksum offset overlap, timestamping has precedence
        // punch at 16-bit offset
        if (cpu2if.info.punch_tstamp) begin
            word_offset = (cpu2if.info.tstamp_offset + cfg.punch_delta)*2;
            if (word_offset <= bsize-8) begin
                bytes[word_offset +: 8] = {>> 8 {cpu2if.timestamp[33:0] + ((cpu2if.info.tstamp_format)? 0 : ((regmodel.timebase.globals.ntp_time_offset_adjust.sec.get() + regmodel.timebase.globals.ntp_time_offset.sec.get()) << 32))}};
                `uvm_info(get_name,$sformatf("Punch timestamp byte [%0d : +8] = %0h + %0h .",word_offset, cpu2if.timestamp[33:0], (cpu2if.info.tstamp_format)? 0 : ((regmodel.timebase.globals.ntp_time_offset_adjust.sec.get() + regmodel.timebase.globals.ntp_time_offset.sec.get()) << 32)), UVM_HIGH)
            end else if (word_offset < bsize) begin
                // Stamp as many bytes as possible
                `uvm_info(get_name,$sformatf("Cannot punch complete timestamp 0x%0h at offset %0d (would fill outside of packet bounds %0d).",
                    cpu2if.timestamp, word_offset, bsize), UVM_HIGH)
                for(int i=0; i < bsize-word_offset; i++) begin
                    bytes[bsize-i-1] = cpu2if.timestamp[(8-i-1)*8 +: 8];
                end
            end else begin
                `uvm_info(get_name,$sformatf("Cannot punch timestamp 0x%0h at offset %0d (outside of packet bounds %0d).",
                    cpu2if.timestamp, word_offset, bsize), UVM_HIGH)
            end
        end

        // If timestamp is to be saved, should save it e.g. in regmodel.core.timebase.ts_rec and shadow_reg(0x21004)
        save_tsatmp(t, cpu2if);

        // construct ethernet_frame to forward
        ubytes = { >> 8 {bytes}};
        e = ethernet_frame::from_bytes(ubytes);
        e.meta_copy(t);
        e.p_id = cpu2if.info.if_src_dst;
        e.update_fcs(0);

        // Set flow_id for per flow scoreboarding
        e.set_flow_id(t.p_id);

        if (cpu2if.info.punch_tstamp) begin
            if(cpu2if.info.tstamp_format == 0) begin
                my_tol.expected_is_tod_ntp = 1;
                my_tol.ms_byte_offset  = (((cpu2if.info.tstamp_offset-6-(cpu2if.vtags.size()*2)-1)+2)*2);
                my_tol.ls_byte_offset  = (((cpu2if.info.tstamp_offset-6-(cpu2if.vtags.size()*2)-1)+2)*2)+4-1;
                my_tol.delta_max = 'hd7;
                e.field_tolerance["payload"].tol_q.push_back(my_tol);

                my_tol.delta_max = 2**16-1;
                my_tol.expected_is_tod_ntp = 0;
                my_tol.expected_is_ptp_corr = 0;
                my_tol.ms_byte_offset  = (cpu2if.xtra_info.csum_offset + cfg.punch_delta-6-(cpu2if.vtags.size()*2)-1)*2;
                my_tol.ls_byte_offset  = ((cpu2if.xtra_info.csum_offset + cfg.punch_delta-6-(cpu2if.vtags.size()*2)-1)*2)+1;
                e.field_tolerance["payload"].tol_q.push_back(my_tol);
                e.field_tolerance["fcs"].delta_max = 1;
            end else begin
                my_tol.expected_is_tod_ptp = 1;
                my_tol.ms_byte_offset  = (((cpu2if.info.tstamp_offset-6-(cpu2if.vtags.size()*2)-1))*2);
                my_tol.ls_byte_offset  = (((cpu2if.info.tstamp_offset-6-(cpu2if.vtags.size()*2)-1)+2)*2)+4-1;
                my_tol.delta_max = 'hd7;
                e.field_tolerance["payload"].tol_q.push_back(my_tol);

                my_tol.delta_max = 2**16-1;
                my_tol.expected_is_tod_ptp = 0;
                my_tol.expected_is_tod_ntp = 0;
                my_tol.expected_is_ptp_corr = 0;
                my_tol.ms_byte_offset  = (cpu2if.xtra_info.csum_offset + cfg.punch_delta-6-(cpu2if.vtags.size()*2)-1)*2;
                my_tol.ls_byte_offset  = ((cpu2if.xtra_info.csum_offset + cfg.punch_delta-6-(cpu2if.vtags.size()*2)-1)*2)+1;
                e.field_tolerance["payload"].tol_q.push_back(my_tol);
                e.field_tolerance["fcs"].delta_max = 1;
            end
        end

        // cover
        thi_cpu2if_cg.sample(cpu2if.info.if_src_dst, e.frame_size,
            cpu2if.info.punch_tstamp, cpu2if.info.copy_tstamp, cpu2if.info.tstamp_format, cpu2if.info.tstamp_offset,
            cpu2if.info.punch_csum, cpu2if.xtra_info.csum_offset);

        `uvm_info("PREDICT::CPU2X", {"Predicted frame:", e.convert2string}, UVM_HIGH)
        p_notify[cpu2if.info.if_src_dst].write(e);
        return e;
    endfunction
endclass


class clipper_x2cpu_predictor extends thi_x2cpu_predictor;

    // Factory registration
    `uvm_component_utils(clipper_x2cpu_predictor)

        // Constructor: new
    function new(string name = "clipper_x2cpu_predictor", uvm_component parent=null);
        super.new(name, parent);
    endfunction

    c1lt_reg_block regmodel;

    // Covert class action frame to IF2CPU/ethernet frame.
    // Truncate/flush packets less than MTU.
    // Truncate/flush packets less than MTU with error flags.
    virtual function void predict(ethernet_frame t);
        thi_if_frame_t if2cpu;
        ethernet_frame f;
        bit [63:0] time_t;

        // check frame
        if (&{cfg.discard_ena, t.is_bad()}) begin
            `uvm_info("PREDICT", "Discarding frame in error.", UVM_DEBUG)
            return;
        end

        time_t = ((regmodel.timebase.globals.ntp_time_offset_adjust.sec.get() + regmodel.timebase.globals.ntp_time_offset.sec.get()) << 32);

        // prepare THI
        if2cpu = thi_if_frame_t::type_id::create("if2cpu");
        if (!if2cpu.randomize() with {
            thi_vtag.tpid   == THI_TPID_X2CPU;
            info.if_src_dst == t.p_id;
            timestamp       == t.timebase_freerun + time_t;
        }) `uvm_fatal(get_name, "Randomization failed!")

        // get a "pure" ethernet frame with the THI header inserted
        f = if2cpu.insert_header(t);
        modify_frame(f);

        // Build a complete THI frame from temporary Ethernet frame ~f~
        if2cpu = null;

        if(!thi_if_frame_t::try_parse(if2cpu, f)) `uvm_error("PREDICT::X2CPU", "Unable to convert Ethernet frame to THI frame")

        // Add THI IF timestamp tolerance
        if (cfg.compensation_ena) begin
            if2cpu.field_tolerance["timestamp"].delta_max = cfg.tolerance_timestamp_if;
            if2cpu.field_tolerance["fcs"].delta_max = '1;
        end

        // Set flow_id for per flow scoreboarding
        if2cpu.set_flow_id(t.p_id);

        `uvm_info("PREDICT::X2CPU", {"Predicted frame:", if2cpu.convert2string}, UVM_HIGH)
        p_notify.write(if2cpu);
    endfunction

endclass




// This predictor is end-to-end, no internal checking.
class clipper_predictor extends uvm_subscriber#(ethernet_frame);
    `uvm_component_utils(clipper_predictor)

    // Configuration
    clipper_predictor_cfg cfg;

    // Output notification ports
    uvm_analysis_port#(ethernet_frame) p_notify [NB_ALL_PORTS];

    // TSE and XGMAC analysis_imp forward ports
    uvm_analysis_export#(ethernet_frame) p_tse_export   [NB_ALL_PORTS];
    uvm_analysis_export#(ethernet_frame) p_xgmac_export [5:8];

    // TSE and XGMAC predictors
    mac_rx_base_predictor tse_rx   [NB_ALL_PORTS];
    mac_rx_base_predictor xgmac_rx [5:8];
    mac_tx_base_predictor mac_tx   [NB_ALL_PORTS];

    // CPU2X
    clipper_thi_cpu2x_predictor cpu2x;

    // Input section (passive mode)
    clipper_insect_xfer_fun insect;

    // TODO Input section (active mode)

    // Mgmt input section
    clipper_mgmt_predictor mgmt;

    // INP output conversion
    clipper_inp2cpu_conv inp2cpu_conv;

    // x2CPU
    clipper_x2cpu_predictor x2cpu;

    // Traffic Manager IF output mesh
    clipper_tm_predictor tm;

    // Monitor
    clipper_mon_predictor mon;



    insect_tx_dom_prio_conv#(12) exp_dom_prio_conv;


    // TODO PKTGEN

    function new(string name = "clipper_predictor", uvm_component parent=null);
        super.new(name, parent);
        // create analysis ports
        foreach (p_notify[i]) p_notify[i] = new($sformatf("p_notify%0d",i), this);
        foreach (p_tse_export[i])   p_tse_export[i]   = new($sformatf("p_tse_export%0d",i), this);
        foreach (p_xgmac_export[i]) p_xgmac_export[i] = new($sformatf("p_xgmac_export%0d",i), this);
    endfunction

    // The uvm_subscriver 'analysis_port' is not used
    function void write(ethernet_frame_t t);
        `uvm_fatal("PREDICT", "The 'analysis_port' is not implemented. Use instead the ports: 'p_tse_export[i]' or 'p_xgmac_export[i]'")
    endfunction

    // Get configuration
    virtual function void build_phase(uvm_phase phase);
        `uvm_info("CLIPPER_PREDICTOR", "Entering build_phase", UVM_LOW)
        super.build_phase(phase);

        // get configuration
        if (!uvm_config_db#(clipper_predictor_cfg)::get(this, "", "cfg", cfg))
            `uvm_fatal("CFGERR", "Failed to get config.")

        // TSE predictors
        foreach (tse_rx[i]) begin
            string tse_name;

            cfg.tse_cfg[i].reg_block = cfg.regmodel.mac_if.tse_mac[i];
            cfg.tse_cfg[i].port_speed= PS_1G;

            tse_name = $sformatf("tse_rx%0d", i);
            uvm_config_db#(mac_base_predictor_cfg)::set(this, tse_name, "cfg", cfg.tse_cfg[i]);
            tse_rx[i] = mac_rx_base_predictor::type_id::create(tse_name, this);
        end

        // XGMAC predictors
        foreach (xgmac_rx[i]) begin
            string xgmac_name;

            cfg.xgmac_cfg[i].reg_block = cfg.regmodel.mac10g_if[i-5];
            cfg.xgmac_cfg[i].port_speed = PS_10G;

            xgmac_name = $sformatf("xgmac_rx%0d", i);
            uvm_config_db#(mac_base_predictor_cfg)::set(this, xgmac_name, "cfg", cfg.xgmac_cfg[i]);
            xgmac_rx[i] = mac_rx_base_predictor::type_id::create(xgmac_name, this);
        end

         foreach (mac_tx[i]) begin
             string mac_name;

            mac_name = $sformatf("mac_tx%0d", i);
            uvm_config_db#(mac_base_predictor_cfg)::set(this, mac_name, "cfg", cfg.tse_cfg[i]);
            mac_tx[i] = mac_tx_base_predictor::type_id::create(mac_name, this);
         end

        // configure and build THI sub-env
        uvm_config_db#(thi_cpu2x_predictor_cfg)::set(this, "cpu2x", "cfg", cfg.cpu2x_cfg);
        cpu2x  = clipper_thi_cpu2x_predictor::type_id::create("cpu2x", this);
        cpu2x.regmodel = cfg.regmodel;
        uvm_config_db#(thi_x2cpu_predictor_cfg)::set(this, "x2cpu", "cfg", cfg.x2cpu_cfg);
        x2cpu  = clipper_x2cpu_predictor::type_id::create("x2cpu", this);
        x2cpu.regmodel = cfg.regmodel;

        if (cfg.active == UVM_ACTIVE) begin
            // TODO
            `uvm_warning("TODO", "Active INP sub-environment currently not supported.")
        end else begin
            uvm_config_db#(c1lt_reg_block)::set(this, "insect", "regmodel", cfg.regmodel);
            insect = clipper_insect_xfer_fun::type_id::create("insect", this);
        end

        uvm_config_db#(c1lt_reg_block)::set(this, "mgmt", "regmodel", cfg.regmodel);
        mgmt = clipper_mgmt_predictor::type_id::create("mgmt", this);

        tm = clipper_tm_predictor::type_id::create("tm", this);

        mon = clipper_mon_predictor::type_id::create("mon", this);

        // configure and build converters
        inp2cpu_conv = clipper_inp2cpu_conv::type_id::create("inp2cpu_conv", this);
        inp2cpu_conv.regmodel = cfg.regmodel;


        exp_dom_prio_conv = insect_tx_dom_prio_conv#(12)::type_id::create("exp_dom_prio_conv", this);


        `uvm_info("CLIPPER_PREDICTOR", "Exiting build_phase", UVM_LOW)
    endfunction

    // TLM connections
    virtual function void connect_phase(uvm_phase phase);
        `uvm_info("CLIPPER_PREDICTOR", "Entering connect_phase", UVM_LOW)
        super.connect_phase(phase);

        // CPU RX MAC IF to cpu2x/THI
        p_tse_export[PORT_CPU].connect(tse_rx[PORT_CPU].analysis_export);
        tse_rx[PORT_CPU].p_notify.connect(cpu2x.analysis_export);

        // CPU2IF and FPGA2CPU
        foreach(cpu2x.p_notify[i]) cpu2x.p_notify[i].connect(mac_tx[i].analysis_export);

        // Management
        p_tse_export[PORT_MGMT].connect(tse_rx[PORT_MGMT].analysis_export);
        tse_rx[PORT_MGMT].p_notify.connect(mgmt.analysis_export);
        mgmt.p_notify.connect(x2cpu.analysis_export);

        // User RX MAC IF to input section
        if (cfg.active == UVM_ACTIVE) begin
            // TODO
            `uvm_warning("TODO", "Active INP sub-environment currently not supported.")
        end else begin
            // INP RX
            foreach (p_xgmac_export[i]) begin
                // XMAC
                p_xgmac_export[i].connect(xgmac_rx[i].analysis_export);
                xgmac_rx[i].p_notify.connect(insect.analysis_export);
            end

            foreach (p_tse_export[i]) begin
                // TSE
                if(i != PORT_CPU && i != PORT_MGMT) begin
                    p_tse_export[i].connect(tse_rx[i].analysis_export);
                    tse_rx[i].p_notify.connect(insect.analysis_export);
                end
            end

            // INP pre cpu to THI/CPU
            insect.p_notify_cpu.connect(inp2cpu_conv.analysis_export);
            // INP post to TM
            insect.p_notify_if.connect(tm.analysis_export);
            // INP pre mon to TM
            foreach(insect.p_notify_mon[i])
                insect.p_notify_mon[i].connect(mon.analysis_export);
        end
        // INP output converters
        inp2cpu_conv.p_notify.connect(x2cpu.analysis_export);

        // CPU prediciton port to MAC
        x2cpu.p_notify.connect(mac_tx[PORT_CPU].analysis_export);

        // TM to MAC TX
        foreach(tm.p_notify[i]) tm.p_notify[i].connect(mac_tx[i].analysis_export);
        foreach(mon.p_notify[i]) mon.p_notify[i].connect(mac_tx[PORT_MON[i]].analysis_export);

        // MAC TX to predictor output
        foreach(mac_tx[i]) mac_tx[i].p_notify.connect(this.p_notify[i]);

        // TBD : need to connect that?
        insect.classifier.dom_idx_ap.connect(exp_dom_prio_conv.analysis_export);

        `uvm_info("CLIPPER_PREDICTOR", "Exiting connect_phase", UVM_LOW)
    endfunction

endclass


`endif
