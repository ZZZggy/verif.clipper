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

`ifndef ITEM2STREAM_CONV_LIB__SVH
`define ITEM2STREAM_CONV_LIB__SVH

// Converter to stream configuration object
class item2stream_conv_cfg extends uvm_object;

    // List of output port IDs
    int port_id[] = '{ 0 };

    // Set to keep FCS field in resulting stream item
    bit keep_fcs = '0;

    `uvm_object_utils_begin(item2stream_conv_cfg)
        `uvm_field_array_int(port_id, UVM_ALL_ON | UVM_DEC)
        `uvm_field_int(keep_fcs, UVM_ALL_ON)
    `uvm_object_utils_end

    function new (string name = "item2stream_conv_cfg");
        super.new(name);
    endfunction
endclass

// Converter base class for translating items to <stream_trans_t> type
virtual class item2stream_conv#(type T=uvm_sequence_item) extends uvm_subscriber#(T);

    // Configuration object
    item2stream_conv_cfg cfg;

    // Stream items output port
    uvm_analysis_port#(stream_trans_t) p_notify[int];

    `uvm_component_param_utils_begin(item2stream_conv#(T))
        `uvm_field_object(cfg, UVM_ALL_ON)
    `uvm_component_utils_end

    function new (string name = "item2stream_conv", uvm_component parent=null);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        // Configuration
        if (!uvm_config_db #(item2stream_conv_cfg)::get(this, "", "cfg", cfg)) `getcfgerr

        // Output analysis ports
        foreach (cfg.port_id[i]) begin
            p_notify[cfg.port_id[i]] = new($sformatf("p_notify%0d",cfg.port_id[i]), this);
        end

    endfunction

    // Translate input items into stream items
    pure virtual function bit conv2stream(const ref T item, ref stream_trans_t stream, ref stream_trans_extensions ext, output int p_id);

    // Translate items written at <analysis_export> into stream items and forward them trough <p_notify> port
    virtual function void write(T t);
        stream_trans_t stream;
        stream_trans_extensions ext;
        int p_id;

        if (conv2stream(t, stream, ext, p_id)) begin
            // Set extensions
            if (ext) void'(stream.set_extension(ext));

            // Forward item
            `uvm_info("CONVERT", $sformatf("\np_id: %0d\ninput: %0s\nstream: %0s", p_id, t.convert2string(), stream.convert2string()), UVM_MEDIUM)
            p_notify[p_id].write(stream);
        end else begin
            `uvm_error("CONVERT", $sformatf("Error converting item: %0s", t.convert2string()))
        end
    endfunction
endclass

// Translation from <ethernet_frame> to <stream_trans_t>
class eth2stream_conv#(type T=ethernet_frame) extends item2stream_conv#(T);
    `uvm_component_param_utils(eth2stream_conv#(T))

    function new(string name = "eth2stream_conv", uvm_component parent=null);
        super.new(name, parent);
    endfunction

    // Translate ethernet frames into stream items
    virtual function bit conv2stream(const ref T item, ref stream_trans_t stream, ref stream_trans_extensions ext, output int p_id);
        uvm_tlm_generic_payload raw;

        // Create stream item
        raw = item.to_uvm_tlm_generic_payload("stream", cfg.keep_fcs);
        stream = stream_trans_t::type_id::create("stream");
        stream.m_data = { >> 8 {raw.m_data}};

        // Create stream extensions
        ext = stream_trans_extensions::type_id::create("ext");
        ext.ch = shortint'(item.p_id);   // Channel based on port id
        ext.error_flag  = item.is_bad();
        ext.ignore_flag = 0;
        // ext.user        // Used in derived item types
        ext.hdr = 1;
        ext.id  = 0;
        // ext.start_time  // Start-End time information not available in ethernet_frame
        // ext.end_time
        ext.sop_header = 1; // 1 slice
        ext.ts_header  = item.timebase_freerun;

        // Output port routing
        p_id = item.p_id;
        return (stream != null);
    endfunction
endclass

`endif
