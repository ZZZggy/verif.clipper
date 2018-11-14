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

// Management input section prediction
// TODO This should probably be moved to a more general location...
// FIXME Implemented as a catchall for now. In reality, the management parses out 4 classes of traffic for flood protection: system unicast, unicast, multicast, broadcast.
class clipper_mgmt_predictor extends uvm_subscriber#(ethernet_frame);

    // Output prediction port
    uvm_analysis_port#(ethernet_frame) p_notify;

    // Register model
    c1lt_reg_block regmodel;

    `uvm_component_utils(clipper_mgmt_predictor)

    function new(string name="clipper_mgmt_predictor", uvm_component parent=null);
        super.new(name, parent);
        p_notify = new({get_name(), "_p_notify"}, this);
    endfunction

    // Get configuration
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        if (!uvm_config_db#(c1lt_reg_block)::get(this, "", "regmodel", regmodel))
            `uvm_fatal("CFGERR", "Failed to get config.")
    endfunction

    // Implement subscriber and predict output.
    virtual function void write(ethernet_frame t);
        ethernet_frame f;
        f = predict(t);
        if (f != null) begin
            `uvm_info("PREDICT", $sformatf("\n MGMT: %0s", f.convert2string()), UVM_DEBUG)
            p_notify.write(f);
        end
    endfunction

    // Predict output transaction.
    virtual function ethernet_frame predict(ethernet_frame t);
        ethernet_frame f;

        // MGMT only checks MAC DA and forwards based on available bucket credits
        // FIXME May need to emulate controlled bucket rate...
        if ((t.da_type inside {ucast, mcast, bcast})
            || (is_sys_mac_addr(t.da) && (t.da_type == ucast))) begin
            f = new("f");
            f.copy(t);
            // Management physical and logical ports may be different.
            // Remap source to physical.
            f.p_id = PORT_MGMT_PHY;
            return f;
        end
        return null;
    endfunction

    // Returns true if given address is within the system address range.
    function bit is_sys_mac_addr(address_t addr);
        address_t sys_addr = get_sys_mac_addr();
        return (addr inside {[sys_addr:sys_addr+address_t'(15)]});
    endfunction

    // Returns a (masked) base system address.
    function address_t get_sys_mac_addr();
        address_t addr = 48'h0015ad000000 | (48'h000000ffffff & regmodel.globals.mac_base_addr.nic.get());
        return addr;
    endfunction

endclass
