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

// Traffic manager (routing) prediction
// TBD : incorporate the TM sub env
class clipper_tm_predictor extends uvm_subscriber#(class_action_trans);

    // Output prediction port
    uvm_analysis_port#(ethernet_frame) p_notify[PORT_IF:PORT_IF_LAST];

    `uvm_component_utils(clipper_tm_predictor)
    // Constructor: new
    function new(string name="clipper_tm_predictor", uvm_component parent=null);
        super.new(name, parent);
        foreach(p_notify[i]) p_notify[i] = new({get_name(), $sformatf("_p_notify%0d", i)}, this);
    endfunction

    // Get configuration
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction

    // Implement subscriber and predict output.
    virtual function void write(class_action_trans t);
        ethernet_frame f;

        // check if the transaction is to be forwarded
        if (t.axn.fwd == ACT_DIS) begin
            `uvm_info("PREDICT", $sformatf("\n TM discarding: %0s", f.convert2string()), UVM_DEBUG)
            return;
        end

        // create ethernet frame type copy
        f = ethernet_frame::type_id::create("f");
        f.copy(t);

        // validate routing based on source port
        if (f.p_id inside {PORT_TRAFFIC}) begin
            // Traffic source can only go to another traffic
            if (!(t.dest[0] inside {PORT_TRAFFIC})) begin
                `uvm_info("PREDICT", $sformatf("\n TM discarding packet from TRF not destined to TRF: %0s", t.convert2string()), UVM_DEBUG)
                return;
            end
        end

        // Set "flow" identification, which in this case is the original source port
        f.set_flow_id(t.p_id);
        f.flow_id = f.get_flow_id();

        // Route to output analysis port
        `uvm_info("PREDICT", $sformatf("\n TM forwarding from %0d to %0d: %0s", t.p_id, t.dest[0], f.convert2string()), UVM_DEBUG)
        p_notify[t.dest[0]].write(f);
    endfunction

endclass
