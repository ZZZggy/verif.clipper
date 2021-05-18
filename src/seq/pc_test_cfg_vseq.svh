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

`ifndef PC_TEST_CFG_VSEQ__SVH
`define PC_TEST_CFG_VSEQ__SVH

// Class: pc_test_cfg_vseq
// Sequence for configuring IF2PC test scenarios.
class pc_test_cfg_vseq#(shortint unsigned MAX_GROUP=2) extends clipper_base_vseq;

    // Parameter: MAX_GROUP
    // Max number of port configuration groups.
    // Kept as low as possible for randomization performance.

    //-----------------------------------------
    // Group: Overridable reference values
    //-----------------------------------------

    // Define group and port IDs to apply configurations.
    // Number of group entries should not exceed MAX_GROUP.
    group_id_e        group_id[MAX_GROUP]  = '{GROUP_TRAFFIC, GROUP_AUX};
    shortint unsigned port_id[MAX_GROUP][] = '{{PORT_TRAFFIC},{PORT_AUX}};

    // Packet Capture MTU typical values, including min[0] and max[$]
    int unsigned pc_mtu_typ[$] = '{9900, 16000};

    // MAC MRU typical values, including min[0] and max[$]
    int unsigned mac_mru_typ[$] = '{1518, 1536, 10240};

    // Minimum and maximum values expected in each interface port.
    // Before randomization, not defined values will be auto calculated based on port speeds.
    int unsigned if_rate_min[MAX_GROUP][int];
    int unsigned if_rate_max[MAX_GROUP][int];

    //-----------------------------------------
    // Group: Environment handles
    // TODO (CS): makes sense to go into fsx_base_vseq?
    //-----------------------------------------

    // Variable: test_cfg
    // Handle to FSX base test configuration
    clipper_test_base_cfg test_cfg;

    // Varible: rate_aggr
    // Handle to aggregated rate control component
    acd_rate_controller_aggregate rate_aggr;

    //-----------------------------------------
    // Group: General Knobs
    //-----------------------------------------

    // Enable all configurations for the group
    rand bit group_ena[MAX_GROUP];

    // MTU / MRU sizes
    rand int unsigned pc_mtu;
    rand int unsigned if_mru;

    constraint mtu_mru_c {
        pc_mtu inside {[pc_mtu_typ[0]  : pc_mtu_typ[$]]};
        if_mru inside {[mac_mru_typ[0] : mac_mru_typ[$]]};
    }

    //-----------------------------------------
    // Group: Packet Capture Engine Knobs
    //-----------------------------------------

    // PCE modes
    rand bit bad_pkt_ena;
    rand bit long_pkt_ena;
    rand bit      keep_alive_ena;
    rand bit[1:0] keep_alive_timer;

    constraint keep_alive_c {
        soft keep_alive_ena   == 1;
        soft keep_alive_timer == 2'b00; // 250us
    }

    // PCE shaper configs
    rand int unsigned cir_kbps;
    rand int unsigned cbs_bytes;

    // Shaper CIR/CBS design constraints
    constraint cir_cbs_c {
        // CIR maximum: 10Gbps
        cir_kbps <= 10_000_000;
        // CIR granularity: 125 kbps
        cir_kbps % 125 == 0;
        // CBS maximum: 2 MiB
        cbs_bytes <= 2**21;
        // CBS granularity: 1 KiB
        cbs_bytes % 1024 == 0;
    }

    //-----------------------------------------
    // Group: Rate control Knobs
    //-----------------------------------------

    // Rate control enable
    rand bit rate_ctrl_ena;

    // Rate control group enable
    rand bit rate_group_ena[MAX_GROUP];

    // Port group aggreagated rate
    rand int unsigned aggr_rate[MAX_GROUP];

    // Distribution strategy for interface rate limits
    rand dstr_mode_e  if_rate_dstr[MAX_GROUP];

    // Random interface rate distribution granularity
    rand shortint unsigned if_rate_gran[MAX_GROUP];

    // Burst
    rand int unsigned burst_size_min[MAX_GROUP];
    rand int unsigned burst_size_max[MAX_GROUP];
    rand shortint unsigned burst_ratio[MAX_GROUP];

    constraint rate_ctrl_c {
        foreach(aggr_rate[i]) {
            aggr_rate[i] <= if_rate_max[i].sum();
            soft if_rate_dstr[i] == acd_uvm_pkg::DSTR_RANDOM;
            burst_size_min[i] <= burst_size_max[i];
            burst_ratio[i] inside {[0 : acd_rate_controller_cfg::MAX_RATIO]};
        }
    }

    //-----------------------------------------
    // Group: Input Section Knobs
    //-----------------------------------------

    // Matching domains
    rand bit[4:0] domains[MAX_GROUP];

    // Interface domain forwarding action
    rand action_type_pkg::act_if_rule_e if_action[MAX_GROUP];

    // CPU and MON domains forwarding actions
    rand class_action_type_pkg::action_st cpu_mon_action[MAX_GROUP];

    // Interface port forwarding destination
    // If defined, force destination port, else, let child sequence randomize it
    shortint unsigned outgoing_if[MAX_GROUP][int];

    //------------------------------------
    // Group: Object
    //------------------------------------

    `uvm_object_param_utils(pc_test_cfg_vseq#(MAX_GROUP))

    // Constructor: new
    function new(string name="pc_test_cfg_vseq");
        super.new(name);
    endfunction


    //------------------------------------
    // Group: UVM overrides
    //------------------------------------

    // Function: pre_randomize
    // Populate <if_rate_min> and <if_rate_max> with port speed information, but do not overwrite existing values
    function void pre_randomize();
        if (!test_cfg) `uvm_fatal("CFGERR", "Empty <test_cfg> handle")
        foreach (port_id[i,j]) begin
            if (!if_rate_min[i].exists(port_id[i][j])) if_rate_min[i][port_id[i][j]] = 0;
            if (!if_rate_max[i].exists(port_id[i][j])) if_rate_max[i][port_id[i][j]] = test_cfg.port_rate(port_id[i][j]);
        end
        `uvm_info("SEQ", $sformatf("if_rate_min: %0p", if_rate_min), UVM_DEBUG)
        `uvm_info("SEQ", $sformatf("if_rate_max: %0p", if_rate_max), UVM_DEBUG)
    endfunction

    // Task: body
    // Apply configurations
    virtual task body();
        // Child sequences
        mac_init_seq        mac_cfg_seq;
//        pce_cfg_vseq        pce_cfg_seq;
//        rate_ctrl_cfg_vseq  rate_ctrl_cfg_seq;
        domain_catchall_cfg_seq insect_cfg_seq;

        // MACs
        mac_cfg_seq = mac_init_seq::type_id::create("mac_cfg_seq");
        mac_cfg_seq.regmodel = regmodel;
        if (!mac_cfg_seq.randomize() with {
            if_mru  == local::if_mru;
        }) `sranderr("MAC")
        `uvm_info("SEQ", mac_cfg_seq.convert2string(), UVM_LOW)
        mac_cfg_seq.start(null);

        // Packet Capture Engine
//        pce_cfg_seq = pce_cfg_vseq::type_id::create("pce_cfg_seq");
//        pce_cfg_seq.regmodel = regmodel;
//        if (!pce_cfg_seq.randomize() with {
//            bad_pkt_ena  == local::bad_pkt_ena;
//            long_pkt_ena == local::long_pkt_ena;
//            keep_alive_ena   == local::keep_alive_ena;
//            keep_alive_timer == local::keep_alive_timer;
//            cpu_mtu_size == local::pc_mtu;
//            cir_kbps     == local::cir_kbps;
//            cbs_bytes    == local::cbs_bytes;
//        }) `sranderr("PCE")
//        `uvm_info("SEQ", pce_cfg_seq.convert2string(), UVM_LOW)
//        pce_cfg_seq.start(null);

        // Stimuli Rate Control
        // Randomize and run rate control configuration sequence for each group
//        foreach(group_id[i]) begin
//            shortint unsigned group_port[] = port_id[i];
//            rate_ctrl_cfg_seq = rate_ctrl_cfg_vseq::type_id::create("rate_ctrl_cfg_seq");
//            rate_ctrl_cfg_seq.rate_aggr = rate_aggr;
//            if (group_ena[i]) begin
//                rate_ctrl_cfg_seq.group_id = group_id[i];
//                if (!rate_ctrl_cfg_seq.randomize() with {
//                    rate_ctrl_ena  == local::rate_ctrl_ena;
//                    group_ena      == local::rate_group_ena[i];
//                    aggregate_rate == local::aggr_rate[i];
//                    if_rate_dstr   == local::if_rate_dstr[i];
//                    granularity    == local::if_rate_gran[i];
//                    burst_size_min == local::burst_size_min[i];
//                    burst_size_max == local::burst_size_max[i];
//                    burst_ratio    == local::burst_ratio[i];
//                    foreach(group_port[j]) {
//                        if_rate_min[port_id[i][j]] == local::if_rate_min[i][port_id[i][j]];
//                        if_rate_max[port_id[i][j]] == local::if_rate_max[i][port_id[i][j]];
//                    }
//                }) `sranderr({"RATE_CTRL::", group_id[i].name})
//                `uvm_info("SEQ", {group_id[i].name, rate_ctrl_cfg_seq.convert2string()}, UVM_LOW)
//                rate_ctrl_cfg_seq.start(null);
//            end
//        end

        // Input section
        foreach(port_id[i,j]) begin
            shortint unsigned out_if = (outgoing_if[i].exists(j) ? outgoing_if[i][j] : 0); // avoid associative array warning in constraint
            insect_cfg_seq = domain_catchall_cfg_seq::type_id::create("insect_cfg_seq");
            insect_cfg_seq.regmodel = regmodel;
            if (group_ena[i]) begin
                if (!insect_cfg_seq.randomize() with {
                    port           == local::port_id[i][j];
                    domains        == local::domains[i];
//                    if_action      == local::if_action[i];
//                    cpu_mon_action == local::cpu_mon_action[i];
                    local::outgoing_if[i].exists(j) -> outgoing_if == local::out_if;
                }) `sranderr($sformatf("INSECT::PORT = %0d", port_id[i][j]))
                `uvm_info("SEQ", insect_cfg_seq.convert2string(), UVM_LOW)
                insect_cfg_seq.start(null);
            end
        end

    endtask

    // Macros for convert2string implementation
    `define conv2str_int(VAR)  $swrite(s, "%0s\n %-30s = %0d", s, `"VAR`", VAR);
    `define conv2str_enum(VAR) $swrite(s, "%0s\n %-30s = %0s", s, `"VAR`", VAR.name);
    `define conv2str_unpacked(VAR) $swrite(s, "%0s\n %-30s = %0p", s, `"VAR`", VAR);
    `define conv2str_line(SIZE) $swrite(s, "%0s\n%0s", s, {SIZE{"-"}});

    // Function: convert2string
    virtual function string convert2string();
        string s="\nPC_TEST_CFG:";
        // MRU/MTU
        `conv2str_int(pc_mtu)
        `conv2str_int(if_mru)
        // PCE
        `conv2str_int(bad_pkt_ena)
        `conv2str_int(long_pkt_ena)
        `conv2str_int(keep_alive_ena)
        `conv2str_int(keep_alive_timer)
        `conv2str_int(cir_kbps)
        `conv2str_int(cbs_bytes)
        // Rate control common
        `conv2str_int(rate_ctrl_ena)
        // Groups
        foreach (group_id[i]) begin
            `conv2str_line(50)
            `conv2str_enum(group_id[i])
            `conv2str_unpacked(port_id[i])
            `conv2str_int(group_ena[i])
            if (group_ena[i]) begin
                // Rate control
                `conv2str_int(rate_group_ena[i])
                `conv2str_int(aggr_rate[i])
                `conv2str_unpacked(if_rate_min[i])
                `conv2str_unpacked(if_rate_max[i])
                `conv2str_enum(if_rate_dstr[i])
                `conv2str_int(if_rate_gran[i])
                `conv2str_int(burst_size_min[i])
                `conv2str_int(burst_size_max[i])
                `conv2str_int(burst_ratio[i])
                //Input section
                `conv2str_int(domains[i])
                `conv2str_enum(if_action[i])
                `conv2str_enum(cpu_mon_action[i].cpu)
                `conv2str_enum(cpu_mon_action[i].pc)
                `conv2str_enum(cpu_mon_action[i].mon[0])
                `conv2str_enum(cpu_mon_action[i].mon[1])
                `conv2str_unpacked(outgoing_if[i])
            end
         end
        return s;
    endfunction

endclass

`endif // PC_TEST_CFG_VSEQ__SVH
