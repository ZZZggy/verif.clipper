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

//-----------------------------------------------------------------------------
// Sequence to configure hidden rule enables and settings.
// This sequence should be randomize and run, and any additional configuration
// requirements applied afterwards.
//------------------------------------------------------------------------------
class clipper_hidden_rule_random_seq extends hidden_rule_random_seq#(c1lt_reg_block);
    `uvm_object_utils(clipper_hidden_rule_random_seq)

    function new(string name="clipper_hidden_rule_random_seq");
        super.new(name);
    endfunction

    //------------------------------------------------------------------
    // Sequence API functions to implement.
    //------------------------------------------------------------------
    function address_t get_sys_mac_addr();
        address_t addr = 48'h0015ad000000 | (48'h000000ffffff & regmodel.globals.mac_base_addr.nic.get());
        addr &= 48'hFFFFFFFFFFF0;
        return addr;
    endfunction

    function bit[2:0] get_mep_md_level(int unsigned prt);
        return regmodel.globals.port_input_cfg[id-1].cfg0.port_mep_md_level.get();
    endfunction

    function bit[2:0] get_acp_md_level(int unsigned prt);
        return regmodel.globals.global_input_cfg_0.system_acp_md_level.get();
    endfunction

    // Get the configuration matching the selected VTAG index.
    function vlan_tag_t get_vtag_cfg(int unsigned prt, int unsigned idx);
        case(idx)
            1: begin
                get_vtag_cfg.tci.vid = regmodel.globals.port_input_cfg[prt-1].cfg3.vlan1_id.get();
                case(regmodel.globals.port_input_cfg[prt-1].cfg3.vlan1_type.get())
                    0: get_vtag_cfg.tpid = 'h8100;
                    1: get_vtag_cfg.tpid = 'h88A8;
                    2: get_vtag_cfg.tpid = 'h9100;
                    3: get_vtag_cfg.tpid = regmodel.globals.global_input_cfg_0.user_vlan_ethertype.get();
                    default: `uvm_error(get_name, "Unknown VLAN/TPID type.")
                endcase
            end
            2: begin
                get_vtag_cfg.tci.vid = regmodel.globals.port_input_cfg[prt-1].cfg3.vlan2_id.get();
                case(regmodel.globals.port_input_cfg[prt-1].cfg3.vlan2_type.get())
                    0: get_vtag_cfg.tpid = 'h8100;
                    1: get_vtag_cfg.tpid = 'h88A8;
                    2: get_vtag_cfg.tpid = 'h9100;
                    3: get_vtag_cfg.tpid = regmodel.globals.global_input_cfg_0.user_vlan_ethertype.get();
                    default: `uvm_error(get_name, "Unknown VLAN/TPID type.")
                endcase
            end
            default: `uvm_fatal("CFGERR", $sformatf("Unsupported VTAG stack index: %0d", idx))
        endcase
    endfunction

    function bit get_vtag2_ena(int unsigned prt);
        return regmodel.globals.port_input_cfg[prt-1].cfg3.vlan2_ena.get();
    endfunction

    function bit[15:0] get_twamp_dport(int unsigned prt);
        return regmodel.globals.global_input_cfg_1.twamp_reflector_dport.get();
    endfunction

    function bit get_l2pt_rule_ena(int unsigned prt);
        return regmodel.globals.port_input_cfg[id-1].cfg1.l2pt_rule_ena.get();
    endfunction

    function bit[15:0] get_sys_ld_domain(int unsigned prt);
        return 0;
        regmodel.vid_table.p1.idx[0].get();
    endfunction

    function bit[11:0] find_bcast_vid(int unsigned prt);
    endfunction
    
    function bit[11:0] find_cfm_vid(int unsigned prt);
    endfunction
    
    function bit[11:0] find_l2pt_vid(int unsigned prt);
    endfunction
    
    function bit[11:0] find_blocking_vid(int unsigned prt);
    endfunction
    
    // TBD : ?
    
    /**
     * Try to find a VID for the given port with CPU flag set.
     * A random VID of those found is returned.
     * If no match is found, all ones is returned.
     */
    /*
`define FIND_VID_WITH_FLAG_SET(FNAME, FLAG)\
    virtual function bit[11:0] ``FNAME``(int unsigned prt);\
        bit[11:0] vids[$];\
        if (prt inside {PORT_TRAFFIC}) begin\
            vid_table_traffic_reg_pkg::p5_idx_reg _reg;\
            foreach (regmodel.vid_table.p5.idx[m]) begin\
                `REG_TRF_PRT(_reg =, regmodel.vid_table.p,prt,.idx[m])\
                if (_reg.``FLAG``.get()) vids.push_back(m);\
            end\
        end else begin\
            vid_table_aux_reg_pkg::p1_idx_reg _reg;\
            foreach (regmodel.vid_table.p1.idx[m]) begin\
                `REG_AUX_PRT(_reg =, regmodel.vid_table.p,prt,.idx[m])\
                if (_reg.``FLAG``.get()) vids.push_back(m);\
            end\
        end\
        if (vids.size()) begin\
            vids.shuffle();\
            return vids[0];\
        end\
        return $urandom_range(4095, 0);\
    endfunction

    `FIND_VID_WITH_FLAG_SET(find_bcast_vid, cpu_membership)
    `FIND_VID_WITH_FLAG_SET(find_cfm_vid, cpu_cfm_membership)
    `FIND_VID_WITH_FLAG_SET(find_l2pt_vid, cpu_l2pt_tunneling_flag)
    `FIND_VID_WITH_FLAG_SET(find_blocking_vid, cpu_l2pt_tunneling_flag)
*/
    
    /**
     * Try to find a VTAG for the given port with isFTDropMatch i.e. FWD_DB domain in RING_2_LOCAL_DROP
     * A random VTAG of those found is returned.
     * If no match is found, a C-VTAG with VID=0 is returned
     */
    virtual function vlan_tag_t find_ft_drop_vtag();
        vlan_tag_t res_tag;
        res_tag.tpid = 'h8100;
        return res_tag;
    endfunction
endclass

//-----------------------------------------------------------------------------
// Sequence to configure hidden rule enables and settings.
//
// This sequence should be randomize and run, and any additional configuration
// requirements applied afterwards.
//------------------------------------------------------------------------------
class clipper_hidden_rule_cfg_reg_seq extends uvm_sequence#(uvm_sequence_item);
    `uvm_object_utils(clipper_hidden_rule_cfg_reg_seq)

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
    // Constraints
    //---------------------------------------------------------------------------------

    constraint c_ena_dist {
        soft ena_dist == 100;
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

    function new(string name="clipper_hidden_rule_cfg_reg_seq");
        super.new(name);
    endfunction

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
            soam_lbm_rule_vlan_aware_ena.value                dist {1 := ena_dist, 0 := 100-ena_dist};
            acd_lbm_rule_vlan_aware_ena.value                 dist {1 := ena_dist, 0 := 100-ena_dist};
            acd_lbr_tst_leak_rule_vlan_aware_ena.value        dist {1 := ena_dist, 0 := 100-ena_dist};
            cfm_unicast_rule_vlan_aware_ena.value             dist {1 := ena_dist, 0 := 100-ena_dist};
            cfm_unicast_123_rule_vlan_aware_ena.value         dist {1 := ena_dist, 0 := 100-ena_dist};
            paa_discovery_rule_vlan_aware_ena.value           dist {1 := ena_dist, 0 := 100-ena_dist};
            paa_layer2_rule_vlan_aware_ena.value              dist {1 := ena_dist, 0 := 100-ena_dist};
            twamp_reflector_rule_vlan_aware_ena.value         dist {1 := ena_dist, 0 := 100-ena_dist};
            general_purpose_unicast_rule_vlan_aware_ena.value dist {1 := ena_dist, 0 := 100-ena_dist};
            system_acp_md_level.value inside {[0:7]};
        }) `uvm_fatal(get_name, "Randomization failed.")
        regmodel.globals.global_input_cfg_0.update(status, .parent(null));

        if (!regmodel.globals.global_input_cfg_1.randomize() with {
            twamp_reflector_dport.value                       == twamp_dport;
        }) `uvm_fatal(get_name, "Randomization failed.")
        regmodel.globals.global_input_cfg_1.update(status, .parent(null));

        if (!regmodel.globals.global_input_cfg_0.randomize() with {
            user_vlan_ethertype.value                         ==  user_vlan;
        }) `uvm_fatal(get_name, "Randomization failed.")
        regmodel.globals.global_input_cfg_0.update(status, .parent(null));


        if (!regmodel.globals.port_input_cfg[port_id-1].cfg0.randomize() with {
            port_mip_md_level.value inside {[0:7]};
            port_mep_md_level.value inside {[0:7]};
            vid_table_mode.value    dist {1 := ena_dist, 0 := 100-ena_dist};
            l2pt_ena.value          dist {1 := ena_dist, 0 := 100-ena_dist};
            acd_src_only.value      dist {1 := ena_dist, 0 := 100-ena_dist};
            other_mac_address.value dist {port_id := ena_dist, port_id-1 := (100-ena_dist)/2, port_id+1 := (100-ena_dist)/2};
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
            `RANDOMIZE_REG_PRT(regmodel.vid_table.p,.idx[flag_vids[v]],port_id, {
                cpu_l2pt_tunneling_flag.value dist {1 := ena_dist, 0 := 100-ena_dist};
                cpu_membership.value          dist {1 := ena_dist, 0 := 100-ena_dist};
                cpu_cfm_membership.value      dist {1 := ena_dist, 0 := 100-ena_dist};
            })
//            `REG_PRT(,regmodel.vid_table.p,port_id,.idx[flag_vids[v]].randomize() with {
//                cpu_l2pt_tunneling_flag.value dist {1 := ena_dist, 0 := 100-ena_dist};
//                cpu_membership.value          dist {1 := ena_dist, 0 := 100-ena_dist};
//                cpu_cfm_membership.value      dist {1 := ena_dist, 0 := 100-ena_dist};
//            })
            `REG_PRT(,regmodel.vid_table.p,port_id,.idx[flag_vids[v]].update(status, .parent(null)))
        end

        //---------------------------------------------------------------------------------
        // FWD_DB flags
        //---------------------------------------------------------------------------------
        foreach(flag_vids[v]) begin
        end


        //---------------------------------------------------------------------------------
        // LP ring and SOAM
        //---------------------------------------------------------------------------------

        if (is_lp_ring) begin
//            // enable LP ring on port
//            regmodel.protection_tbl.logical_port[0].physical_port[port_id-1].mode_bridge.mode.set(1);
//            regmodel.protection_tbl.logical_port[0].physical_port[port_id-1].mode_bridge.update(status, .parent(null));
        end else begin
//            regmodel.protection_tbl.logical_port[0].physical_port[port_id-1].mode_bridge.mode.set(0);
//            regmodel.protection_tbl.logical_port[0].physical_port[port_id-1].mode_bridge.update(status, .parent(null));
        end

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
//        regmodel.core.np_if.np_if_ctrl[prt].port_local_in_ena.port_int_lpbk_in_ena.set(ena);
//        regmodel.core.np_if.np_if_ctrl[prt].port_local_out_ena.port_int_lpbk_out_ena.set(ena);
//        regmodel.core.np_if.np_if_ctrl[prt].port_local_out_map.port_tx_mac_out_map.set(ena);
//        regmodel.core.np_if.np_if_ctrl[prt].port_local_in_ena.update(status, .parent(null));
//        regmodel.core.np_if.np_if_ctrl[prt].port_local_out_ena.update(status, .parent(null));
//        regmodel.core.np_if.np_if_ctrl[prt].port_local_out_map.update(status, .parent(null));
    endtask

endclass



//-----------------------------------------------------------------------------
// Sequence to configure hidden rule enables and settings.
//
// This sequence should be randomize and run, and any additional configuration
// requirements applied afterwards.
//------------------------------------------------------------------------------

// ?

/*
class clipper_hard_rule_2p2_prio_cfg_reg_seq extends hard_rule_2p2_prio_cfg_reg_seq#(c1lt_reg_block);
    `uvm_object_utils(clipper_hard_rule_2p2_prio_cfg_reg_seq)

    function new(string name="clipper_hard_rule_2p2_prio_cfg_reg_seq");
        super.new(name);
    endfunction

    task map_hr_cfg();
        uvm_status_e status;
        foreach(prios[i]) begin
            regmodel.action_map_tables.p1.priority_index[prios[i]].if_action_index.set(if_act[i]);
            `REG_PRT(,regmodel.action_map_tables.p,input_port_id,.priority_index[prios[i]].if_action_index.set(if_act[i]))
            `REG_PRT(,regmodel.action_map_tables.p,input_port_id,.priority_index[prios[i]].cpu_action_index.set(cpu_act[i]))
            `REG_PRT(,regmodel.action_map_tables.p,input_port_id,.priority_index[prios[i]].update(status))
            `REG_PRT(,regmodel.cpu_monitor_action.p,input_port_id,.cpu_action[prios[i]].cpu_forwarding.set(cpu_ena[i]))
            `REG_PRT(,regmodel.cpu_monitor_action.p,input_port_id,.cpu_action[prios[i]].cpu_bucket.set(cpu_bucket[i]))
            `REG_PRT(,regmodel.cpu_monitor_action.p,input_port_id,.cpu_action[prios[i]].update(status))
        end
    endtask

endclass
*/
