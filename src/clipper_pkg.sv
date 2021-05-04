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

`ifndef CLIPPER_PKG__SV
`define CLIPPER_PKG__SV

`define PKTGEN_NBR_FLOW 16

package clipper_pkg;

    //-----------------------------------
    //-----------------------------------
    //-----------------------------------
    // Imports
    //-----------------------------------
    //-----------------------------------
    //-----------------------------------

    // UVM include & import
`include "uvm_macros.svh"
    import uvm_pkg::*;

    // ACD includes and imports
`include "acd_macros.svh"
    import acd_uvm_pkg::*;
    import acd_mm_pkg::*;
    import stream_verif_pkg::*;
    import ethernet_pkg::*;
    import thi_uvm_pkg::*;
    import mac_pkg::*;
    import platform_pkg::*;
    import insect_uvm_vip_pkg::*;
    import insect_type_pkg::*;
    import class_action_pkg::*;
    import class_action_type_pkg::*;
    import hidden_rule_frame_pkg::*;

    // Clipper includes and imports
    import tse_mac_reg_pkg::*;
    import mac10g_if_reg_pkg::*;
    import c1lt_reg_pkg::*;

    //-----------------------------------
    //-----------------------------------
    //-----------------------------------
    // Parameters
    //-----------------------------------
    //-----------------------------------
    //-----------------------------------

    //-----------------------------------
    // Group: DUT generics
    //-----------------------------------
    // Number of interface ports (Client + Network + Aux)
    parameter NB_SFP_PORTS           = 12;               // RTL: g_num_of_ports - Number of SFP 1G/10G ports in hardware
    parameter NB_COMBO_PORTS         = 4;                // RTL: g_num_of_ports - Number of SFP 1G/10G ports in hardware
    parameter NB_IF_PORTS            = 12;               // Number of interface ports really used in the design and sim
    // Total number of ports = interface + cpu + mgmt
    parameter NB_ALL_HW_PORTS        = NB_SFP_PORTS + 2; // Total number of ports in the hardware
    parameter NB_ALL_PORTS           = NB_IF_PORTS + 2;  // Total number of ports used in the design and sim
    parameter NB_MON_PORTS           = 2;                // Total number of ports used for monitoring/mirroring
    // Port speed mode - 0: Not used, 1: 1G, 2: 10G, 3: 1G/10G
    parameter [12*4-1:0] PORTS_MODE  = 48'h111133221111; // RTL: g_ports_mode
    // Electric/Optic port combo indication
    parameter [12*4-1:0] PORTS_COMBO = 48'h111100000000; // RTL: g_ports_combo
    parameter DEVICE_TECH            = 1205;
    parameter NB_FANS                = 2;                // RTL: g_num_of_fans
    parameter NB_DRY_CONTACTS        = 4;                // RTL: g_num_of_dry_contacts
    parameter MEZZ_CTRL_W            = 3;                // RTL: g_mezz_ctrl_width
    parameter PCB_REV_W              = 4;                // RTL: g_pcb_rev_width
    parameter CPU_SPARE_W            = 5;                // RTL: g_cpu_spare_width
    parameter TEST_CONN_W            = 4;                // RTL: g_test_conn_width

    //-----------------------------------
    // Group: Clock and reset parameters
    //-----------------------------------
    // Clock periods
    parameter CLK_10K_PER_NS       = 100_000;
    parameter CLK_2p5M_PER_PS      = 400_000;
    parameter CLK_25M_PER_PS       = 40_000;
    parameter CLK_50M_PER_PS       = 20_000;
    parameter CLK_100M_PER_PS      = 10_000;
    parameter CLK_125M_PER_PS      = 8_000;
    parameter CLK_156p25M_PER_PS   = 6_400;
    parameter CLK_166p66M_PER_PS   = 6_000;
    parameter CLK_200M_PER_PS      = 5_000;
    parameter CLK_225M_PER_PS      = 4_444; // Obtained: 225.0225MHZ - Target: 225MHz
    parameter CLK_644p53M_PER_PS   = 1_552; // Obtained: 644.3299MHZ - Target: 644.53125MHz
    // Reset cycles
    parameter CLK_10K_RST_CYC      = 4;
    parameter CLK_2p5M_RST_CYC     = 4;
    parameter CLK_25M_RST_CYC      = 4;
    parameter CLK_50M_RST_CYC      = 4;
    parameter CLK_100M_RST_CYC     = 4;
    parameter CLK_125M_RST_CYC     = 4;
    parameter CLK_156p25M_RST_CYC  = 5;
    parameter CLK_166p66M_RST_CYC  = 5;
    parameter CLK_200M_RST_CYC     = 7;
    parameter CLK_225M_RST_CYC     = 7;
    parameter CLK_644p53M_RST_CYC  = 20;

    //-----------------------------------
    // Group: ACD_MM parameters
    //-----------------------------------
    // TODO: check values
`ifndef ACD_MM_BYTE_WIDTH
    parameter ACD_MM_IF_DATA_WIDTH  = 2;
`else
    parameter ACD_MM_IF_DATA_WIDTH  = `ACD_MM_BYTE_WIDTH;
`endif
    parameter ACD_MM_MA_ADDR_WIDTH  = 20;
    parameter ACD_MM_MA_DATA_WIDTH  = 8;
    parameter ACD_MM_ACK_LATENCY    = 512;
    parameter ACD_MM_MA_MAX_PENDING = 1;
    parameter ACD_MM_EP_DATA_WIDTH  = 8;

    //-----------------------------------
    // Group: RLDRAM3 parameters
    //-----------------------------------
    parameter NB_RLDRAM3           = 4;  // Number of external RLDRAM3 memory modules
    parameter RLDRAM3_BANK_AW      = 4;  // RTL: g_rldram3_bank_add_width
    parameter RLDRAM3_AW           = 21; // RTL: g_rldram3_add_width
    parameter RLDRAM3_DW           = 36; // RTL: g_rldram3_dat_width
    parameter RLDRAM3_QK_W         = 4;  // RTL: g_rldram3_qk_width
    parameter RLDRAM3_DK_W         = 2;  // RTL: g_rldram3_dk_width
    parameter RLDRAM3_DM_W         = 2;  // RTL: g_rldram3_dm_width
    parameter RLDRAM3_QVLD_W       = 2;  // RTL: g_rldram3_qvld_width

    //-----------------------------------
    // Group: MII parameters
    //-----------------------------------
    parameter TSE_MII_DW           = 8;          // TSE_MII data width - GMII
    parameter XGMII_DW             = 64;         // XGMII data width
    parameter XGMII_CW             = XGMII_DW/8; // XGMII control width
    parameter RGMII_DW             = 4;          // RTL: g_rgmii_data_width

    //---------------------------------------------
    // Group: Port Indexes
    //---------------------------------------------
    parameter PORT_CPU      = 0;                       // CPU port index
    parameter PORT_IF       = 1;                       // Base index of 1G/10G Interface ports
    parameter PORT_IF_LAST  = PORT_IF + NB_IF_PORTS-1; // Last index of 1G/10G Interface ports
    parameter PORT_MGMT     = PORT_IF_LAST+1;          // MGMT port simulation index
    parameter PORT_MGMT_PHY = 13;

    // TBD : review
    const int      PORT_TRAFFIC[] = '{1,2,3,4,5,6,7,8,9,10,11,12};
    const shortint PORT_MON[]     = '{8,12};
    const shortint PORT_10G[]     = '{5,6,7,8};
    const shortint PORT_1G[]      = '{1,2,3,4,9,10,11,12};


    const int      PORT_TRF1[] = '{5,6};
    const int      PORT_TRF2[] = '{7,8};
    const shortint PORT_AUX[]  = '{1,2,3,4};

    // Rate controller group IDs
    typedef enum {
        GROUP_TRAFFIC = 0,
        GROUP_AUX     = 1
    } group_id_e;

    //---------------------------------------------
    // Ethernet environment
    //---------------------------------------------
    parameter NB_IF_SUB_AGENTS = 2;  // Number of sub-agents in the Multi Ethernet Agent from Interface ports

    //-----------------------------------
    //-----------------------------------
    //-----------------------------------
    // Typedefs
    //-----------------------------------
    //-----------------------------------
    //-----------------------------------
    typedef virtual clipper_ctrl_if    clipper_ctrl_vif_t;
    typedef virtual clipper_misc_io_if clipper_misc_io_vif_t;
    typedef virtual sfp_ctrl_if #(.NB_SFP(NB_SFP_PORTS)) clipper_sfp_ctrl_vif_t;

    // INP
    typedef virtual stream_if#(64, 0, 8, 1) inp_rx_stream_vif_t;
    typedef virtual stream_if#(64, 0, $bits(insect_type_pkg::insect_tx_pre_descr_st), 1)  inp_tx_pre_stream_vif_t;
    typedef virtual stream_if#(64, 0, $bits(insect_type_pkg::insect_tx_post_descr_st), 1) inp_tx_post_stream_vif_t;

    typedef insect_env_cfg_t#(
        .NB_RX(NB_IF_PORTS),
        .NB_TX(NB_IF_PORTS),
        .T_REG(c1lt_reg_block),
        .T_RX_VIF(inp_rx_stream_vif_t),
        .T_TX_PRE_VIF(inp_tx_pre_stream_vif_t),
        .T_TX_POST_VIF(inp_tx_post_stream_vif_t)
        ) clipper_insect_env_cfg_t;

    typedef insect_env_t#(
        .NB_RX(NB_IF_PORTS),
        .NB_TX(NB_IF_PORTS),
        .T_REG(c1lt_reg_block),
        .T_RX_VIF(inp_rx_stream_vif_t),
        .T_TX_PRE_VIF(inp_tx_pre_stream_vif_t),
        .T_TX_POST_VIF(inp_tx_post_stream_vif_t)
        ) clipper_insect_env_t;

    // Port speed configuration type for MAC sub-agent
    typedef enum {
        MAC_10G  = 0,
        MAC_1G   = 1
    } mac_sub_agent_speed_e;

    // Debug: define options of scoreboard connections
    typedef enum {
        DEFAULT_ETH_SB     = 0,
        DBG_RX_AGENT       = 1,
        DBG_RX_MAC_PREDICT = 2
    } eth_sb_connect_e;

    // Registers information indexed by address
    typedef struct {
        string name;
        uvm_reg_data_t value;
    } reg_info_t [uvm_reg_addr_t];

    //-----------------------------------
    //-----------------------------------
    //-----------------------------------
    // Coverage
    //-----------------------------------
    //-----------------------------------
    //-----------------------------------

    // Covergroup for port speed
    covergroup port_speed_cg with function sample(int port, port_speed_e speed);
        port_cp: coverpoint port {
            bins cpu     = {PORT_CPU};
            bins traffic = {[PORT_IF:PORT_IF_LAST]} with (item inside {PORT_TRAFFIC});
            bins mgmt    = {PORT_MGMT};
            illegal_bins illegal = default;
        }

        speed_cp: coverpoint speed {
            bins port_10M  = {PS_10M};
            bins port_100M = {PS_100M};
            bins port_1G   = {PS_1G};
            bins port_10G  = {PS_10G};
        }

        port_speed_xp: cross port_cp, speed_cp {
            ignore_bins ignore_mgmt_speeds = (binsof(port_cp) intersect {PORT_MGMT}
                                             && binsof(speed_cp) intersect {PS_10G});
            ignore_bins ignore_user_speeds = (binsof(port_cp) intersect {[PORT_IF:PORT_IF_LAST]}
                                             && binsof(speed_cp) intersect {PS_10M, PS_100M});
            ignore_bins ignore_cpu_speeds  = (binsof(port_cp) intersect {PORT_CPU}
                                             && binsof(speed_cp) intersect {PS_10M, PS_100M, PS_10G});
        }
    endgroup

    //-----------------------------------
    //-----------------------------------
    //-----------------------------------
    // Includes
    //-----------------------------------
    //-----------------------------------
    //-----------------------------------

    // converters : Transaction conversion subscribers
`include "item2stream_conv_cfg.svh"
`include "item2stream_conv.svh"
`include "eth2stream_conv.svh"
`include "insect2pce_conv.svh"

    // sub_env/clipper_inp_env
`include "clipper_class_action.sv"
`include "clipper_tse_cfg.svh"
`include "clipper_xgmac_cfg.svh"

    // predictors :
`include "clipper_predictor_cfg.svh"
`include "clipper_predictor_converters.svh"
`include "clipper_mgmt_predictor.svh"
`include "clipper_tm_predictor.svh"
`include "clipper_mon_predictor.svh"
`include "clipper_predictor.svh"

    // env :
`include "clipper_env_cfg.svh"
`include "clipper_env.svh"

    // seq :
`include "clipper_base_vseq.svh"
`include "rate_ctrl_cfg_vseq.svh"
`include "mac_init_seq.svh"
`include "read_flush_stats_vseq.svh"
`include "pktgen_seq_lib.svh"
`include "insect_fwd_cfg_vseq.svh"
`include "domain_catchall_cfg_seq.svh"

    // sub_env_seq :
`include "hidden_rule_reg_seq.svh"
`include "clipper_hard_rule_cfg_reg_seq.svh"

`include "hidden_rule_seq_lib.svh"

endpackage

`endif
