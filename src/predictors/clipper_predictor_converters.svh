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

//------------------------------------------------------------------------------
// Group: Predictor transaction converters
// Converter transfer functions, necessary to connect xfer_fun(s) with
// different transaction types.
//------------------------------------------------------------------------------

// TBD : update registers
// Convert INP predictor class_action_trans to ethernet_frame for CPU path.
// Also apply truncation and error handling prediction.
class clipper_inp2cpu_conv extends uvm_subscriber#(class_action_trans);

    uvm_analysis_port#(ethernet_frame) p_notify;

    // Register model
    c1lt_reg_block regmodel;

    `uvm_component_utils(clipper_inp2cpu_conv)

    // Constructor
    function new(string name = "clipper_inp2cpu_conv", uvm_component parent=null);
        super.new(name, parent);
        p_notify = new("inp2cpu_p_notify", this);
    endfunction


    // @Implement
    // @Override
    // Covert class action frame to ethernet frame.
    virtual function void write(class_action_trans t);
        ethernet_frame f;
        if (t.axn.cpu != ACT_FWD) return;

        // Apply error handling
        // FIXME Assuming Store and Forward
//        if (t.is_bad && (regmodel.globals.tm_cfg.if2cpu_bad_pkt_ena.get() == 0)) begin
//            `uvm_info("PREDICT::DISCARD", $sformatf("Discarding bad packet due to configuration."), UVM_HIGH)
//            return;
//        end

        // Apply truncation
        if (t.frame_size > regmodel.globals.cpu_mtu_size.cpu_mtu_size.get()) begin
            `uvm_info("PREDICT::DISCARD", $sformatf("Discarding packet larger than MTU (%0d > %0d).",
                t.frame_size, regmodel.globals.cpu_mtu_size.cpu_mtu_size.get()), UVM_HIGH)
            return;
        end

        // Convert
        f = ethernet_frame::type_id::create("f");
        f.copy(t);
        f.p_id = t.p_id;
        p_notify.write(f);
    endfunction
endclass

// Convert INP predictor class_action_trans to ethernet_frame for FWD path
class clipper_inp2fwd_conv extends uvm_subscriber#(class_action_trans);

    int nb_ports;
    int port_offset;
    uvm_analysis_port#(ethernet_frame) p_notify[];

    `uvm_component_utils(clipper_inp2fwd_conv)

    function new(string name = "clipper_inp2fwd_conv", uvm_component parent=null);
        super.new(name, parent);
    endfunction

    // Covert class action frame to ethernet frame.
    virtual function void write(class_action_trans t);
        ethernet_frame f = ethernet_frame::type_id::create("f");
        f.copy(t);
        f.p_id = t.p_id;
        p_notify[t.p_id-port_offset].write(f);
    endfunction

    // Get configuration
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        // get configuration
        if (!uvm_config_db#(int)::get(this, "", "nb_ports", nb_ports))
            `uvm_fatal("CFGERR", "Failed to get config.")
        if (!uvm_config_db#(int)::get(this, "", "port_offset", port_offset))
            `uvm_fatal("CFGERR", "Failed to get config.")
        p_notify = new[nb_ports];
        foreach(p_notify[i]) p_notify[i] = new($sformatf("%0s_p_notify%0d", get_name(), i), this);
    endfunction
endclass
