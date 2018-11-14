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

// Monitor/mirror prediction
// FIXME no flush prediction/checking...
class clipper_mon_predictor extends uvm_subscriber#(class_action_trans);

    // Output prediction port
    uvm_analysis_port#(ethernet_frame) p_notify[NB_MON_PORTS];

    `uvm_component_utils(clipper_mon_predictor)
    // Constructor: new
    function new(string name="clipper_mon_predictor", uvm_component parent=null);
        super.new(name, parent);
        foreach(p_notify[i]) p_notify[i] = new({get_name(), $sformatf("_p_notify%0d", i)}, this);
    endfunction

    // Get configuration
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction

    // Implement subscriber and predict output.
    virtual function void write(class_action_trans t);
        // check if the transaction is to be forwarded to a MON
        foreach(t.axn.mon[i]) begin
            if (t.axn.mon[i] == ACT_FWD) begin
                // validate routing based on source port
                // Only traffic ports can target the monitors
                if (t.p_id inside {PORT_TRAFFIC}) begin
                    ethernet_frame f;

                    // create ethernet frame type copy
                    f = ethernet_frame::type_id::create("f");
                    f.copy(t);

                    // Set "flow" identification, which in this case is the original source port
                    f.set_flow_id(t.p_id);
                    f.flow_id = f.get_flow_id();
                    // Route to output analysis port
                    `uvm_info("PREDICT", $sformatf("\n TM monitor%0d mirroring from port %0d to port %0d: %0s",
                        i+1, t.p_id, PORT_MON[i], f.convert2string()), UVM_DEBUG)
                    p_notify[i].write(f);
                end else begin
                    `uvm_fatal("CFGERR", "Monitor port cannot be targeted by AUX!")
                end
            end
        end
    endfunction
endclass
