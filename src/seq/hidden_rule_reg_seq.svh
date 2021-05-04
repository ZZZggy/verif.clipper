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
//
//-----------------------------------------------------------------------------
// Description:
// Sequence for randomizing the hidden rule configuration
//------------------------------------------------------------------------------

//`include "e5gx_reg_macros.sv"
import c1lt_reg_pkg::*;
import lag_type_pkg::*;
import vid_table_uni1g_reg_pkg::*;
import vid_table_nni10g_reg_pkg::*;

//-----------------------------------------------------------------------------
// Class: inp_globals_reg_seq_t
// Sequence to write INP Globals registers.
//
// This sequence should be randomize and run, and any additional configuration
// requirements applied afterwards.
//------------------------------------------------------------------------------
class hidden_rule_reg_seq_t extends uvm_sequence#(uvm_sequence_item);
    `uvm_object_utils(hidden_rule_reg_seq_t)

    //---------------------------------------------------------------------------------
    // Variable: regmodel
    // Handle to register model
    //---------------------------------------------------------------------------------
    //T_REG regmodel;
    c1lt_reg_block regmodel;

    //---------------------------------------------------------------------------------
    // Variable: port_id
    // User port, 1-based
    //---------------------------------------------------------------------------------
    rand shortint unsigned port_id;

    //---------------------------------------------------------------------------------
    // Variable: ena_dist
    // Percentage enable distribution
    //---------------------------------------------------------------------------------
    rand shortint unsigned ena_dist;

    //---------------------------------------------------------------------------------
    // Variable: flag_vid
    // VIDs for flags (tunneling, CFM, mgmt broadcast)
    //---------------------------------------------------------------------------------
    rand bit[11:0] flag_vids[];

    //---------------------------------------------------------------------------------
    // Variable: mgmt_vlan_ids
    // VLAN ids for management
    //---------------------------------------------------------------------------------
    rand int unsigned mgmt_vids[2];
    rand bit[1:0]     mgmt_vlan_types[2];

    //---------------------------------------------------------------------------------
    // Variable: twamp_dport
    // TWAMP reflector DPORT
    //---------------------------------------------------------------------------------
    rand bit[15:0] twamp_dport;

    //---------------------------------------------------------------------------------
    // Variable: lpbk_domain
    // Loopback domain
    //---------------------------------------------------------------------------------
    rand bit[15:0] ld_domain;

    //---------------------------------------------------------------------------------
    // Variable: is_lp_ring
    // Setup ring
    //---------------------------------------------------------------------------------
    rand bit is_lp_ring;

    //---------------------------------------------------------------------------------
    // Variable: user_vlan
    // User VLAN. Ideally should not match a known protocol
    //---------------------------------------------------------------------------------
    rand bit[15:0] user_vlan;

    //---------------------------------------------------------------------------------
    // Variable: sw_up_soam_ena
    // Enable NP mac address pattern matching in certain CFM rules
    //---------------------------------------------------------------------------------
    rand bit sw_up_soam_ena;

    //---------------------------------------------------------------------------------
    // Variable: internal_lpbk_active_dist
    // Distribution to activate internal loopback, used by isSwUpSoam
    //---------------------------------------------------------------------------------
    rand int unsigned internal_lpbk_active_dist;

    //---------------------------------------------------------------------------------
    // Constraints
    //---------------------------------------------------------------------------------

//     globals_mac_base_addr_reg mac_base_addr_reg = regmodel.globals.mac_base_addr;
//     globals_global_input_cfg_0_reg global_input_cfg_0_reg = regmodel.globals.global_input_cfg_0;
//     globals_global_input_cfg_1_reg global_input_cfg_1_reg = regmodel.globals.global_input_cfg_1;

    constraint c_ena_dist {
        soft ena_dist == 100;
    }

    constraint c_internal_lpbk_active_dist {
        if (port_id < 6)
            soft internal_lpbk_active_dist == 0;
        else
            soft internal_lpbk_active_dist inside {[0:100]};
    }

    constraint c_mgmt_vlans {
        soft mgmt_vids[0] == 99 + port_id;
        soft mgmt_vids[1] == 25 + port_id;

        soft mgmt_vlan_types[0] == 0;
        soft mgmt_vlan_types[1] == 1;
    }

    constraint c_flag_vids {
        flag_vids.size() inside {[8:16]};
        unique{flag_vids};
    }

    constraint c_is_lp_ring {
        is_lp_ring dist {1 := ena_dist, 0 := 100-ena_dist};
    }


    //---------------------------------------------------------------------------------
    // Sequence body
    //---------------------------------------------------------------------------------

    virtual task body();
        uvm_status_e status;

        //---------------------------------------------------------------------------------
        // INP globals
        //---------------------------------------------------------------------------------
        // randomize system MAC address to be "well behaved" in terms of what the DUT actually supports >:-(
        if (!regmodel.globals.mac_base_addr.randomize() with {
            nic.value[3:0]   == 0;
        }) `uvm_fatal(get_name, "Randomization failed.")
        regmodel.globals.mac_base_addr.update(status, .parent(null));

        if (!regmodel.globals.global_input_cfg_0.randomize() with {
            system_acp_md_level.value                         inside {[0:7]};
            soam_lbm_rule_vlan_aware_ena.value                dist {1 := ena_dist, 0 := 100-ena_dist};
            acd_lbm_rule_vlan_aware_ena.value                 dist {1 := ena_dist, 0 := 100-ena_dist};
            acd_lbr_tst_leak_rule_vlan_aware_ena.value        dist {1 := ena_dist, 0 := 100-ena_dist};
            cfm_unicast_rule_vlan_aware_ena.value             dist {1 := ena_dist, 0 := 100-ena_dist};
            cfm_unicast_123_rule_vlan_aware_ena.value         dist {1 := ena_dist, 0 := 100-ena_dist};
            paa_discovery_rule_vlan_aware_ena.value           dist {1 := ena_dist, 0 := 100-ena_dist};
            paa_layer2_rule_vlan_aware_ena.value              dist {1 := ena_dist, 0 := 100-ena_dist};
            twamp_reflector_rule_vlan_aware_ena.value         dist {1 := ena_dist, 0 := 100-ena_dist};
            general_purpose_unicast_rule_vlan_aware_ena.value dist {1 := ena_dist, 0 := 100-ena_dist};
            user_vlan_ethertype.value                         ==  user_vlan;
            sw_up_soam_ena.value                              == local::sw_up_soam_ena;
        }) `uvm_fatal(get_name, "Randomization failed.")
        regmodel.globals.global_input_cfg_0.update(status, .parent(null));

        if (!regmodel.globals.global_input_cfg_1.randomize() with {
            twamp_reflector_dport.value == twamp_dport;
            system_ld_domain.value      == ld_domain;
        }) `uvm_fatal(get_name, "Randomization failed.")
        regmodel.globals.global_input_cfg_1.update(status, .parent(null));


        if (!regmodel.globals.port_input_cfg[port_id-1].cfg0.randomize() with {
            port_mip_md_level.value inside {[0:7]};
            port_mep_md_level.value inside {[0:7]};
            vid_table_mode.value    dist {1 := ena_dist, 0 := 100-ena_dist};
            l2pt_ena.value          dist {1 := ena_dist, 0 := 100-ena_dist};
            acd_src_only.value      dist {1 := ena_dist, 0 := 100-ena_dist};
            other_mac_address.value dist {port_id := ena_dist, port_id-1 := (100-ena_dist)/2, port_id+1 := (100-ena_dist)/2};
            port_blocking_ena.value dist {0 := ena_dist, 1 := 100-ena_dist};
        }) `uvm_fatal(get_name, "Randomization failed.")
        regmodel.globals.port_input_cfg[port_id-1].cfg0.update(status, .parent(null));

        if (!regmodel.globals.port_input_cfg[port_id-1].cfg1.randomize() with {
            drop_self_rule_ena.value                dist {1 := ena_dist, 0 := 100-ena_dist};
            acterna_hello_rule_ena.value            dist {1 := ena_dist, 0 := 100-ena_dist};
            soam_lbm_rule_ena.value                 dist {1 := ena_dist, 0 := 100-ena_dist};
            acd_lbm_rule_ena.value                  dist {1 := ena_dist, 0 := 100-ena_dist};
            acd_lbr_tst_leak_rule_ena.value         dist {1 := ena_dist, 0 := 100-ena_dist};
            r_aps_rule_ena.value                    dist {1 := ena_dist, 0 := 100-ena_dist};
            cfm_multicast2_rule_ena.value           dist {1 := ena_dist, 0 := 100-ena_dist};
            cfm_multicast1_123_rule_ena.value       dist {1 := ena_dist, 0 := 100-ena_dist};
            cfm_multicast1_rule_ena.value           dist {1 := ena_dist, 0 := 100-ena_dist};
            cfm_unicast_123_rule_ena.value          dist {1 := ena_dist, 0 := 100-ena_dist};
            cfm_unicast_rule_ena.value              dist {1 := ena_dist, 0 := 100-ena_dist};
            acp_rule_ena.value                      dist {1 := ena_dist, 0 := 100-ena_dist};
            acp_layer3_rule_ena.value               dist {1 := ena_dist, 0 := 100-ena_dist};
            mgmt_bridge_rule_ena.value              dist {1 := ena_dist, 0 := 100-ena_dist};
            paa_discovery_rule_ena.value            dist {1 := ena_dist, 0 := 100-ena_dist};
            acd_broadcast_rule_ena.value            dist {1 := ena_dist, 0 := 100-ena_dist};
            acd_tunneling_rule_ena.value            dist {1 := ena_dist, 0 := 100-ena_dist};
            cisco_tunneling_rule_ena.value          dist {1 := ena_dist, 0 := 100-ena_dist};
            lacp_rule_ena.value                     dist {1 := ena_dist, 0 := 100-ena_dist};
            lldp_rule_ena.value                     dist {1 := ena_dist, 0 := 100-ena_dist};
            link_oam_rule_ena.value                 dist {1 := ena_dist, 0 := 100-ena_dist};
            ptp_ethernet_rule_ena.value             dist {1 := ena_dist, 0 := 100-ena_dist};
            ptp_ipv4_rule_ena.value                 dist {1 := ena_dist, 0 := 100-ena_dist};
            ptp_ipv6_rule_ena.value                 dist {1 := ena_dist, 0 := 100-ena_dist};
            l2pt_rule_ena.value                     dist {1 := ena_dist, 0 := 100-ena_dist};
            paa_layer2_rule_ena.value               dist {1 := ena_dist, 0 := 100-ena_dist};
            twamp_reflector_rule_ena.value          dist {1 := ena_dist, 0 := 100-ena_dist};
            general_purpose_unicast_rule_ena.value  dist {1 := ena_dist, 0 := 100-ena_dist};
            broadcast_rule_ena.value                dist {1 := ena_dist, 0 := 100-ena_dist};
            ipv6_discovery_rule_ena.value           dist {1 := ena_dist, 0 := 100-ena_dist};
            untagged_bridge_local_rule_ena.value    dist {1 := ena_dist, 0 := 100-ena_dist};
            untagged_bridge_remote_rule_ena.value   dist {1 := ena_dist, 0 := 100-ena_dist};
        }) `uvm_fatal(get_name, "Randomization failed.")
        regmodel.globals.port_input_cfg[port_id-1].cfg1.update(status, .parent(null));

        if (!regmodel.globals.port_input_cfg[port_id-1].cfg2.randomize() with {
            ld_rule_ena.value dist {1 := ena_dist, 0 := 100-ena_dist};
        }) `uvm_fatal(get_name, "Randomization failed.")
        regmodel.globals.port_input_cfg[port_id-1].cfg2.update(status, .parent(null));

        if (!regmodel.globals.port_input_cfg[port_id-1].cfg3.randomize() with {
            vlan1_id.value   == mgmt_vids[0];
            vlan1_type.value == mgmt_vlan_types[0];
            vlan2_id.value   == mgmt_vids[1];
            vlan2_type.value == mgmt_vlan_types[1];
            vlan2_ena.value  inside {[0:1]};
        }) `uvm_fatal(get_name, "Randomization failed.")
        regmodel.globals.port_input_cfg[port_id-1].cfg3.update(status, .parent(null));


        //---------------------------------------------------------------------------------
        // VID table flags
        //---------------------------------------------------------------------------------

        foreach(flag_vids[v]) begin
                case(port_id)
                   0:
                   begin
                     if (uvm_report_enabled(UVM_NONE,UVM_ERROR,get_name))
                       uvm_report_error (get_name, "Port0 undefined user port index.", UVM_NONE, "NA.v", 0);
                   end
                   5,6:
                   begin
                       vid_table_nni10g_reg_block vid_t;
                       $display("port_id %0d", port_id);
                       if (!$cast(vid_t, regmodel.vid_table.get_block_by_name($sformatf("p%0d",port_id)))) `uvm_fatal("CASTERR", "vid_table")
                       if (!vid_t.idx[flag_vids[v]].randomize() with {
                       cpu_l2pt_tunneling_flag.value dist {1 := ena_dist, 0 := 100-ena_dist};
                       cpu_membership.value          dist {1 := ena_dist, 0 := 100-ena_dist};
                       cpu_cfm_membership.value      dist {1 := ena_dist, 0 := 100-ena_dist};})
                       if (uvm_report_enabled(UVM_NONE,UVM_FATAL,get_name))
                           uvm_report_fatal (get_name, "Randomization failed!", UVM_NONE, "NA.v", 0);
                    end
                    7:
                    begin
                        if (!regmodel.vid_table.p7.idx[flag_vids[v]].randomize() with {
                        cpu_l2pt_tunneling_flag.value dist {1 := ena_dist, 0 := 100-ena_dist};
                        cpu_membership.value          dist {1 := ena_dist, 0 := 100-ena_dist};
                        cpu_cfm_membership.value      dist {1 := ena_dist, 0 := 100-ena_dist};})
                        if (uvm_report_enabled(UVM_NONE,UVM_FATAL,get_name))
                            uvm_report_fatal (get_name, "Randomization failed!", UVM_NONE, "NA.v", 0);
                    end
                    8:
                    begin
                        if (!regmodel.vid_table.p8.idx[flag_vids[v]].randomize() with {
                        cpu_l2pt_tunneling_flag.value dist {1 := ena_dist, 0 := 100-ena_dist};
                        cpu_membership.value          dist {1 := ena_dist, 0 := 100-ena_dist};
                        cpu_cfm_membership.value      dist {1 := ena_dist, 0 := 100-ena_dist};})
                        if (uvm_report_enabled(UVM_NONE,UVM_FATAL,get_name))
                            uvm_report_fatal (get_name, "Randomization failed!", UVM_NONE, "NA.v", 0);
                    end
                    default:
                    begin
                        vid_table_uni1g_reg_block  vid_t;
                        $display("port_id %0d = %s", port_id, $sformatf("p%0d",port_id));
                        if (!$cast(vid_t, regmodel.vid_table.get_block_by_name($sformatf("p%0d",port_id)))) `uvm_fatal("CASTERR", "vid_table")
                        if (!vid_t.idx[flag_vids[v]].randomize() with {
                        cpu_l2pt_tunneling_flag.value dist {1 := ena_dist, 0 := 100-ena_dist};
                        cpu_membership.value          dist {1 := ena_dist, 0 := 100-ena_dist};
                        cpu_cfm_membership.value      dist {1 := ena_dist, 0 := 100-ena_dist};})
    //               begin
                     if (uvm_report_enabled(UVM_NONE,UVM_FATAL,get_name))
                       uvm_report_fatal (get_name, "Randomization failed!", UVM_NONE, "NA.v", 0);
                   end
                endcase
            case(port_id)
                0:       `uvm_error(get_name, "Port0 undefined user port index.")
                1,2: begin
                    regmodel.vid_table.get_block_by_name($sformatf("p%0d",port_id)).get_reg_by_name($sformatf("idx[%0d]",flag_vids[v])).update(status, .parent(null));
                end
                default: begin
                    regmodel.vid_table.get_block_by_name($sformatf("p%0d",port_id)).get_reg_by_name($sformatf("idx[%0d]",flag_vids[v])).update(status, .parent(null));
                end
            endcase
        end

        //---------------------------------------------------------------------------------
        // FWD_DB flags
        //---------------------------------------------------------------------------------
        foreach(flag_vids[v]) begin
            int unsigned dom;

            if (!regmodel.fwd_db.fwd_vid.info[flag_vids[v]].randomize() with {
                ring0_fwd_domain.value inside {[0:2**regmodel.fwd_db.fwd_vid.info[0].ring0_fwd_domain.get_n_bits()-1]};
                ring0_vlan_type.value inside {[0:2]};
                ring0_wr_ena.value == 1;
            }) `uvm_fatal("RNDERR", "fwd_db")
            regmodel.fwd_db.fwd_vid.info[flag_vids[v]].update(status);
            dom = regmodel.fwd_db.fwd_vid.info[flag_vids[v]].ring0_fwd_domain.get();
            if (!regmodel.fwd_db.fwd_domain.domain[dom].randomize() with {
                fwd_domain_mode.value dist {G8032_DOM_RING2LDROP := ena_dist, [0:G8032_DOM_RING2LDROP-1] := (100-ena_dist)/2, [G8032_DOM_RING2LDROP+1:15] := (100-ena_dist)/2};
                // Keep other values at default
                erp_instance_number.value == 0;
                data_15_to_0.value  == 1;
                data_31_to_16.value == 0;
                data_60_to_32.value == 0;
            }) `uvm_fatal("RNDERR", "fwd_db")
            regmodel.fwd_db.fwd_domain.domain[dom].update(status);
        end


        //---------------------------------------------------------------------------------
        // LP ring and SOAM
        //---------------------------------------------------------------------------------

        if (is_lp_ring) begin
            // enable LP ring on port
            regmodel.protection_tbl.logical_port[0].physical_port[port_id-1].mode_bridge.mode.set(1);
            regmodel.protection_tbl.logical_port[0].physical_port[port_id-1].mode_bridge.update(status, .parent(null));
        end else begin
            regmodel.protection_tbl.logical_port[0].physical_port[port_id-1].mode_bridge.mode.set(0);
            regmodel.protection_tbl.logical_port[0].physical_port[port_id-1].mode_bridge.update(status, .parent(null));
        end

        // randomize internal loopback to change UP SOAM
        randcase
            internal_lpbk_active_dist: begin
                // enable internal loopback (!isSwUpSoam)
                configure_internal_loopback(port_id-1, 1);
            end
            100-internal_lpbk_active_dist: begin
                // do not enable internal loopback (isSwUpSoam)
                configure_internal_loopback(port_id-1, 0);
            end
        endcase

    endtask

    /**
     * Helper function to configure internal loopback
     */
    virtual task configure_internal_loopback(int prt, bit ena);
        uvm_status_e status;
        // randomize internal loopback to change up SOAM
        // enable internal loopback (!isSwUpSoam)
        if (ena) begin
            `uvm_info(get_name, $sformatf("Port%0d: Enabling internal loopback", prt+1), UVM_MEDIUM)
        end else begin
            `uvm_info(get_name, $sformatf("Port%0d: Disabling internal loopback", prt+1), UVM_MEDIUM)
        end
    // TODO
//        regmodel.core.np_if.np_if_ctrl[prt].port_local_in_ena.port_int_lpbk_in_ena.set(ena);
//        regmodel.core.np_if.np_if_ctrl[prt].port_local_out_ena.port_int_lpbk_out_ena.set(ena);
//        regmodel.core.np_if.np_if_ctrl[prt].port_local_out_map.port_tx_mac_out_map.set(ena ? 2 : 1);
//        regmodel.core.np_if.np_if_ctrl[prt].port_local_in_ena.update(status, .parent(null));
//        regmodel.core.np_if.np_if_ctrl[prt].port_local_out_ena.update(status, .parent(null));
//        regmodel.core.np_if.np_if_ctrl[prt].port_local_out_map.update(status, .parent(null));
    endtask

endclass
