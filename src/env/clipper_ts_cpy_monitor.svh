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

class clipper_ts_cpy_cfg extends uvm_object;
    // Variable: ena
    // Enables prediction
    bit ena = 0;
    event rd_reg_done;
    event fr_done;

    // Register model
    c1lt_reg_block regmodel;

    `uvm_object_utils(clipper_ts_cpy_cfg)

    function new(string name="clipper_ts_cpy_cfg");
        super.new(name);
    endfunction
endclass

`uvm_analysis_imp_decl(_obs)

// Monitoring of timestamp copy
class clipper_ts_cpy_monitor extends uvm_subscriber#(ethernet_frame);

    // Analysis export - receives observed items
    uvm_analysis_imp_obs#(ethernet_frame, clipper_ts_cpy_monitor) obs_ap;

    // Register model
    clipper_ts_cpy_cfg cfg;

    uvm_status_e status;
    bit [31:0] data;

    ethernet_frame obs_frame;

    ethernet_frame exp_frame[$];

    `uvm_component_utils(clipper_ts_cpy_monitor)

    function new(string name="clipper_ts_cpy_monitor", uvm_component parent=null);
        super.new(name, parent);
    endfunction

    // Get configuration
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        obs_ap = new("obs_ap", this);

        if (!uvm_config_db#(clipper_ts_cpy_cfg)::get(this, "", "cfg", cfg))
            `uvm_fatal("CFGERR", "Failed to get config.")
    endfunction

    virtual task main_phase(uvm_phase phase);
        fork
            read_reg();
        join_none
    endtask

    // Implement subscriber and predict output.
    virtual function void write(ethernet_frame t);
        if(cfg.ena) begin
            exp_frame.push_back(t);
        end
    endfunction


    virtual function void write_obs(ethernet_frame tr);
        if(cfg.ena) begin
            `uvm_info("TS CPY Monitor", $sformatf("Observe = %0h", tr.timebase_freerun), UVM_DEBUG)
            obs_frame = tr;
            -> cfg.fr_done;
        end
    endfunction

    // Convert from NTP to PTP
    function bit[63:0] ntp2ptp(bit[63:0] ntp);
        const real ONE_FRACT_NS = 0.2328306436538;
        real _ns;

        ntp2ptp[63:32] = ntp[63:32];
        ntp2ptp[31:00] = $floor(real'(longint'({1'b0,ntp[31:0]}))*ONE_FRACT_NS);
        // Saturate
        if (ntp2ptp[31:00] > 32'h3B9A_C9FF)
            ntp2ptp[31:00] = 32'h3B9A_C9FF;
        `uvm_info("TS CPY Monitor", $sformatf("ntp=%8h_%8h ptp=%8h_%8h", ntp[63:32], ntp[31:0], ntp2ptp[63:32], ntp2ptp[31:0]),UVM_DEBUG)
        return ntp2ptp;
    endfunction

    task read_reg();
        int delta;
        forever begin
            @(cfg.rd_reg_done);
            data = cfg.regmodel.timebase.globals.tod_ptp_timestamp.get();
            `uvm_info("TS CPY Monitor", $sformatf("tod_ptp_timestamp = %0h", data), UVM_DEBUG)

            `uvm_info("TS CPY Monitor", $sformatf("exp_frame.size = %0d", exp_frame.size()), UVM_DEBUG)
            if(exp_frame.size()) begin

                    acd_uvm_pkg::field_delta_t lhs_field;                               // extracted fields and delta
                    acd_uvm_pkg::field_array_tolerance_t ft = exp_frame[0].field_tolerance["payload"].tol_q[0];                    // field tolerance alias
                    int endian = (ft.ms_byte_offset > ft.ls_byte_offset) ? 1 : -1;           // little-endian: 1 , big-endian: -1
                    int field_size = (ft.ms_byte_offset - ft.ls_byte_offset) * endian + 1;   // field size in array words
                    int field_bits = field_size * $bits(exp_frame[0].payload[0]);                             // field size in bits

                    // Extract and mask field
                    for (int i = 0; i < field_size; i++) begin
                        // An index out of bounds will return '0 (2-state) or 'x (4-state)
                        int idx = ft.ms_byte_offset - i*endian;
                        // Extract field
                        lhs_field = (lhs_field << $bits(obs_frame.payload[idx])) + obs_frame.payload[idx];
                        // Mask local array copy
                        obs_frame.payload[idx] = 0;
                    end

                    `uvm_info("TS CPY Monitor", $sformatf("Observe time stamp = %0h in %s (PTP = %0h), tod_ptp_timestamp = %0h", lhs_field, (ft.expected_is_tod_ntp)? "NTP" : "PTP", ntp2ptp(lhs_field), data), UVM_DEBUG)

                    if(ft.expected_is_tod_ntp) begin
                        if(ntp2ptp(lhs_field) > data)
                            delta = ntp2ptp(lhs_field) - data;
                        else
                            delta = data - ntp2ptp(lhs_field);

                    end else begin
                        if(lhs_field > data)
                            delta = lhs_field - data;
                        else
                            delta = data - lhs_field;
                    end

                    `uvm_info("TS CPY Monitor", $sformatf("TS copy delta = %0h for PID %0d", delta, obs_frame.p_id), UVM_DEBUG)
                    `ASSERT_MSG(CSATION_THUNDERFLY_1000, delta < 'h10, $sformatf("TS copy delta = %0h for PID %0d should be lower than h10", delta, obs_frame.p_id), UVM_HIGH);

                    void'(exp_frame.pop_front());

            end
        end
    endtask

endclass

