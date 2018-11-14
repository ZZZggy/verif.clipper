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

`ifndef RATE_CTRL_CFG_VSEQ__SVH
`define RATE_CTRL_CFG_VSEQ__SVH

// Class: rate_ctrl_cfg_vseq
// Sequence for configuring rate control for a group of ports
class rate_ctrl_cfg_vseq extends clipper_base_vseq;

    //-----------------------------------------
    // Group: Configurations from Environment
    //-----------------------------------------

    // Varible: rate_aggr
    // Handle to aggregated rate control component
    acd_rate_controller_aggregate rate_aggr;

    // Variable: group_id
    // Rate control group identification
    int unsigned group_id = 0;

    // Variable: rate_unit
    // Defines the rate unit used.
    rate_unit_e rate_unit = RATE_MBPS;

    //-----------------------------------------
    // Group: Knobs
    //-----------------------------------------

    // Rate control enable
    rand bit rate_ctrl_ena;

    // Rate control group enable
    rand bit group_ena;

    // Port group aggreagated rate
    rand int unsigned aggregate_rate;

    // Distribution strategy for interface rate limits
    rand dstr_mode_e  if_rate_dstr;

    // Soft constrained granularity for random rate distribution
    rand shortint unsigned granularity;

    // Minimum and maximum values expected in each interface port
    rand int unsigned if_rate_min[int];
    rand int unsigned if_rate_max[int];

    // Burst
    rand int unsigned burst_size_min;
    rand int unsigned burst_size_max;
    rand int unsigned burst_ratio;

    //-----------------------------------------
    // Group: Constraints
    //-----------------------------------------

    // Default constraints
    constraint default_c {
        soft rate_ctrl_ena == '1;
        soft group_ena == '1;
        soft granularity == 1;
        burst_ratio inside {[0 : acd_rate_controller_cfg::MAX_RATIO]};
    }

    //------------------------------------
    // Group: Object
    //------------------------------------

    `uvm_object_utils(rate_ctrl_cfg_vseq)

    // Constructor: new
    function new(string name="rate_ctrl_cfg_vseq");
        super.new(name);
    endfunction

    //------------------------------------
    // Group: UVM overrides
    //------------------------------------

    // Function: pre_randomize
    // Initialize associative arrays
    function void pre_randomize();
        if (!rate_aggr) `uvm_fatal("CFGERR", "Bad <rate_aggr> handle")
        if (!rate_aggr.cfg.group_cfg.exists(group_id) || rate_aggr.cfg.group_cfg[group_id] == null) begin
            `uvm_fatal("CFGERR", "Null configuration for <group_id>")
        end
        foreach(rate_aggr.cfg.group_cfg[group_id].slave_cfg[i]) begin
            if (!if_rate_min.exists(i)) if_rate_min[i] = 0;
            if (!if_rate_max.exists(i)) if_rate_max[i] = '1;
        end
    endfunction

    // Task: body
    // Apply configurations
    virtual task body();

        // Aggregated rate control
        rate_aggr.cfg.ena = rate_ctrl_ena;
        // Configure group
        rate_aggr.cfg.set_group_ena(group_id, group_ena);
        // Set aggregate rate strategy
        rate_aggr.cfg.set_group_rate(group_id, aggregate_rate, if_rate_dstr, granularity, rate_unit);
        // Set per-port target_rate range
        foreach(if_rate_min[slave_id]) begin
            rate_aggr.cfg.set_slave_target_range(group_id, slave_id, if_rate_min[slave_id], if_rate_max[slave_id]);
        end
        rate_aggr.cfg.set_group_burst(group_id, burst_size_min, burst_size_max, burst_ratio);
        rate_aggr.apply_rates(group_id);

    endtask

    // Function: convert2string
    virtual function string convert2string();
        string s="\nRATE_CTRL_CFG:";
        $swrite(s, "%0s\n group_id       = %0d", s, group_id);
        $swrite(s, "%0s\n rate_unit      = %0s", s, rate_unit.name);
        $swrite(s, "%0s\n rate_ctrl_ena  = %0d", s, rate_ctrl_ena);
        $swrite(s, "%0s\n group_ena      = %0d", s, group_ena);
        $swrite(s, "%0s\n aggregate_rate = %0d", s, aggregate_rate);
        $swrite(s, "%0s\n if_rate_dstr   = %0s", s, if_rate_dstr.name);
        $swrite(s, "%0s\n granularity    = %0d", s, granularity);
        foreach (if_rate_min[i]) begin
            $swrite(s, "%0s\n if_rate_min[%0d] = %0d", s, i, if_rate_min[i]);
            $swrite(s, "%0s\n if_rate_max[%0d] = %0d", s, i, if_rate_max[i]);
        end
        $swrite(s, "%0s\n burst_size_min = %0d", s, burst_size_min);
        $swrite(s, "%0s\n burst_size_max = %0d", s, burst_size_max);
        $swrite(s, "%0s\n burst_ratio    = %0d", s, burst_ratio);
        return s;
    endfunction

endclass

`endif
