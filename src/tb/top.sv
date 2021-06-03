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

`ifndef TOP__SV
`define TOP__SV

module top #(
    bit G_USE_PHY     = 0, // Use PHY for interface ports:
                           //   0 = force clocks and MII internally to DUT
                           //   1 = drive clocks and SFP ports outside DUT
    bit G_USE_RGMII   = 0, // Use RGMII for CPU and MGMT ports:
                           //   0 = force DUT's internal GMII
                           //   1 = drive DUT's external RGMII
    bit G_USE_BEH_RAM = 1, // 0: use "real" models, 1: use behavioral mem_ctrl+RAM
    bit G_USE_I2C     = 0, // 1: instantiate i2c EEPROM
    bit G_SYNTHESIS   = 0  // default is non-synthesis to speed up simulations
)
( /* No ports.*/ );

`include "uvm_macros.svh"
    import uvm_pkg::*;
`include "acd_macros.svh"
    import acd_uvm_pkg::*;
    import acd_mm_pkg::*;
    import ethernet_pkg::*;
    import mac_pkg::*;
    import thi_uvm_pkg::*;
    import clipper_pkg::*;
    import clipper_test_pkg::*;

    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    // Instantiation
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------

    //--------------------------------------------------------------------------
    // Clock interfaces
    //--------------------------------------------------------------------------

    // External clocks
    //-----------------
    // 1GE ports reference clock
    clkgen #(.INIT_PERIOD (CLK_125M_PER_PS * 1ps),    .RST_CYCLES(CLK_125M_RST_CYC))
    clk_125M ();
    // 10GE PHY reference clock
    clkgen #(.INIT_PERIOD (CLK_644p53M_PER_PS * 1ps), .RST_CYCLES(CLK_644p53M_RST_CYC))
    clk_644M ();
    // GPS external clock (normally is 1 sec but we will use 10 kHz for simulation
    clkgen #(.INIT_PERIOD (CLK_10K_PER_NS * 1ns),     .RST_CYCLES(CLK_10K_RST_CYC))
    clk_10K ();

    // Internal clocks
    //-----------------
    // MGMT port at 10Mbps - 2.5MHz
    clkgen #(.INIT_PERIOD (CLK_2p5M_PER_PS * 1ps), .RST_CYCLES(CLK_2p5M_RST_CYC))
    clk_2M5 ();
    // MGMT port at 100Mbps - 25MHz
    clkgen #(.INIT_PERIOD (CLK_25M_PER_PS * 1ps),  .RST_CYCLES(CLK_25M_RST_CYC))
    clk_25M ();
    // XGMII clock - 156.25MHz
    clkgen #(.INIT_PERIOD (CLK_156p25M_PER_PS * 1ps), .RST_CYCLES(CLK_156p25M_RST_CYC))
    clk_156M ();
    // Core clock - 166.66MHz
    clkgen #(.INIT_PERIOD (CLK_166p66M_PER_PS * 1ps), .RST_CYCLES(CLK_166p66M_RST_CYC))
    clk_166M ();
    // 200MHz clock
    clkgen #(.INIT_PERIOD (CLK_200M_PER_PS * 1ps), .RST_CYCLES(CLK_200M_RST_CYC))
    clk_200M ();
    // 200MHz clock
    clkgen #(.INIT_PERIOD (CLK_100M_PER_PS * 1ps), .RST_CYCLES(CLK_100M_RST_CYC))
    clk_100M ();
    // 225MHz clock
    clkgen #(.INIT_PERIOD (CLK_225M_PER_PS * 1ps), .RST_CYCLES(CLK_225M_RST_CYC))
    clk_225M ();

    //--------------------------------------------------------------------------
    // Testbench control interface
    //--------------------------------------------------------------------------
    clipper_ctrl_if ctrl_if();

    // Propagating testbench parameters to testcase
    assign ctrl_if.g_use_phy     = G_USE_PHY;
    assign ctrl_if.g_use_rgmii   = G_USE_RGMII;
    assign ctrl_if.g_use_beh_ram = G_USE_BEH_RAM;
    assign ctrl_if.g_use_i2c     = G_USE_I2C;
    assign ctrl_if.g_synthesis   = G_SYNTHESIS;

    // Combined reset signal
    assign ctrl_if.rst = |{clk_2M5.rst,
                           clk_25M.rst,
                           clk_125M.rst,
                           clk_156M.rst,
                           clk_166M.rst,
                           clk_100M.rst,
                           clk_200M.rst,
                           clk_225M.rst,
                           clk_644M.rst
                           };

    //--------------------------------------------------------------------------
    // TSE_MII/XGMII interfaces
    //--------------------------------------------------------------------------

    // TSE MII clock enable always asserted - MGMT speed controled by GMII clock frequency
    logic [NB_ALL_PORTS-1:0] gmii_clk_en = '1;

    // TSE MII clocks and resets - change source only for MGMT port
    logic [NB_ALL_PORTS-1:0] gmii_clk;
    logic [NB_ALL_PORTS-1:0] gmii_rst;

    // GMII/XGMII rate status
    logic [NB_ALL_PORTS-1:0] mii_rate_10;
    logic [NB_ALL_PORTS-1:0] mii_rate_100;
    logic [NB_ALL_PORTS-1:0] mii_rate_1000;
    logic [NB_ALL_PORTS-1:0] mii_rate_10000;
    logic [NB_ALL_PORTS-1:0] loopback_en;

    // TSE MII ports - default to GMII mode for 8 bits data width
    tse_mii_if #(.DATA_WIDTH(TSE_MII_DW))
    gmii_rx_if [NB_ALL_PORTS-1:0] (gmii_clk, gmii_rst, gmii_clk_en);

    tse_mii_if #(.DATA_WIDTH(TSE_MII_DW))
    gmii_tx_if [NB_ALL_PORTS-1:0] (gmii_clk, gmii_rst, gmii_clk_en);

    // XGMII - 10G Interface port (Client/Network/Aux)
    xgmii_if #(.DATA_WIDTH(XGMII_DW))
    xgmii_rx_if [8:5] (clk_156M.clk, clk_156M.rst, 1'b1);

    xgmii_if #(.DATA_WIDTH(XGMII_DW))
    xgmii_tx_if [8:5] (clk_156M.clk, clk_156M.rst, 1'b1);

    // Set default GMII clock to 125MHz (1G), except to MGMT port which is 10/100/1000
    assign gmii_clk[PORT_IF_LAST : PORT_CPU] = '{default: clk_125M.clk};
    assign gmii_rst[PORT_IF_LAST : PORT_CPU] = '{default: clk_125M.rst};

    // Configure dynamic port rates based on port_speed from test configuration (via TB control interface)
    always_comb begin
        // No rate definition by default, except for CPU port which is always 1G
        mii_rate_10                        = '0;  // Only MGMT port can be 10/100
        mii_rate_100                       = '0;
        mii_rate_1000[PORT_CPU]            = '1;
        mii_rate_1000[PORT_MGMT : PORT_IF] = '0;
        mii_rate_10000                     = '0;  // Only Interface ports can be 10G
        // MGMT port: Kill clock and set MII mode by default
        gmii_clk[PORT_MGMT] = '0;
        gmii_rst[PORT_MGMT] = '0;
        gmii_tx_if[PORT_MGMT].mode = ethernet_pkg::MII;
        gmii_rx_if[PORT_MGMT].mode = ethernet_pkg::MII;
        // Set Interface ports rate
        for (int i = PORT_IF; i <= PORT_IF_LAST; i++) begin
            case (ctrl_if.port_speed[i])
                PS_1G   : mii_rate_1000[i]  = '1;
                PS_10G  : mii_rate_10000[i] = '1;
                default : ;
            endcase
        end
        // Set MGMT port config
        case(ctrl_if.port_speed[PORT_MGMT])
            PS_10M : begin
                mii_rate_10[PORT_MGMT]     = '1;
                gmii_clk[PORT_MGMT]        = clk_2M5.clk;
                gmii_rst[PORT_MGMT]        = clk_2M5.rst;
            end
            PS_100M : begin
                mii_rate_100[PORT_MGMT]    = '1;
                gmii_clk[PORT_MGMT]        = clk_25M.clk;
                gmii_rst[PORT_MGMT]        = clk_25M.rst;
            end
            PS_1G : begin
                mii_rate_1000[PORT_MGMT]   = '1;
                gmii_clk[PORT_MGMT]        = clk_125M.clk;
                gmii_rst[PORT_MGMT]        = clk_125M.rst;
                gmii_tx_if[PORT_MGMT].mode = ethernet_pkg::GMII;
                gmii_rx_if[PORT_MGMT].mode = ethernet_pkg::GMII;
            end
            default : ;
        endcase
    end

    // TODO: move to agent/monitor if required only for end of simulation detection
    // MII interfaces activity detection
    logic [NB_ALL_PORTS-1:0] rx_act;
    logic [NB_ALL_PORTS-1:0] tx_act;
    genvar g_j;
    generate
        for (g_j = 0; g_j < NB_ALL_PORTS; g_j++) begin : GEN_ACTIVITY
            if (&{g_j>4,g_j<9}) begin
                // Detects XGMII activity only on data characters
                assign rx_act[g_j] = |{gmii_rx_if[g_j].valid, ~&xgmii_rx_if[g_j].ctrl};
                assign tx_act[g_j] = |{gmii_tx_if[g_j].valid, ~&xgmii_tx_if[g_j].ctrl};
            end else begin
                assign rx_act[g_j] = gmii_rx_if[g_j].valid;
                assign tx_act[g_j] = gmii_tx_if[g_j].valid;
            end
        end
    endgenerate
    assign ctrl_if.rx_activity = |rx_act;
    assign ctrl_if.tx_activity = |tx_act;

    //--------------------------------------------------------------------------
    // ACD_MM Register interface (internal)
    //--------------------------------------------------------------------------
    logic acd_mm_clk;
    logic acd_mm_rst;
    acd_mm_if #(
        .IF_DATA_WIDTH  (clipper_pkg::ACD_MM_IF_DATA_WIDTH),
        .MA_ADDR_WIDTH  (clipper_pkg::ACD_MM_MA_ADDR_WIDTH),
        .MA_DATA_WIDTH  (clipper_pkg::ACD_MM_MA_DATA_WIDTH),
        .ACK_LATENCY    (clipper_pkg::ACD_MM_ACK_LATENCY),
        .MA_MAX_PENDING (clipper_pkg::ACD_MM_MA_MAX_PENDING)
    ) reg_acd_mm_if(acd_mm_clk, acd_mm_rst);

    //--------------------------------------------------------------------------
    // External RLDRAM3 memory interface
    //--------------------------------------------------------------------------
    mem_subsys_if #
    (
     .NB_CLK     (1              ),
     .MEM_RANKS  (1              ),
     .BA_WIDTH   (RLDRAM3_BANK_AW),
     .ADDR_WIDTH (RLDRAM3_AW     ),
     .DK_WIDTH   (RLDRAM3_DK_W   ),
     .DM_WIDTH   (RLDRAM3_DM_W   ),
     .DQ_WIDTH   (RLDRAM3_DW     ),
     .DQS_WIDTH  (RLDRAM3_QK_W   ),
     .QVLD_WIDTH (RLDRAM3_QVLD_W )
     ) ram_if [1 : NB_RLDRAM3] (/*no ports*/);

    //--------------------------------------------------------------------------
    // DUT miscellaneous and quasi-static IOs interface
    //--------------------------------------------------------------------------
    // Misc IOs
    clipper_misc_io_if misc_if(clk_166M.clk, clk_166M.rst);

    // SFP control interfaces
    sfp_ctrl_if #(.NB_SFP(NB_SFP_PORTS)) sfp_if (clk_166M.clk, clk_166M.rst);

    //--------------------------------------------------------------------------
    // DUT - clipper_chiptop
    //--------------------------------------------------------------------------
    // DUT IO signals
    wire                    cpu_fpga_reset_n;
    // Tranceivers reference clocks
    wire                    ref_clk_10g;
    wire                    ref_clk_synce_r;
    // Output ref to SyncE
    wire                    fpga_synce_ref_clk;
    // Internal refclk (for External RAM)
    wire                    ref_clk_t;
    wire                    ref_clk_b;
    // External clocks
    wire                    mezz_fpga_external_clk;
    wire                    fpga_mezz_external_clk;
    // Tranceivers IO
    wire [NB_SFP_PORTS-1:0] sfp_fpga;
    wire [NB_SFP_PORTS-1:0] fpga_sfp;
    // Management port RGMII
    wire                    mgmtphy_fpga_rgmii_clk;
    wire                    mgmtphy_fpga_rgmii_ctl;
    wire [RGMII_DW-1:0]     mgmtphy_fpga_rgmii_d;
    wire                    fpga_mgmtphy_rgmii_clk;
    wire                    fpga_mgmtphy_rgmii_ctl;
    wire [RGMII_DW-1:0]     fpga_mgmtphy_rgmii_d;
    // CPU port RGMII
    wire                    cpu_fpga_rgmii_clk;
    wire                    cpu_fpga_rgmii_ctl;
    wire [RGMII_DW-1:0]     cpu_fpga_rgmii_d;
    wire                    fpga_cpu_rgmii_clk;
    wire                    fpga_cpu_rgmii_ctl;
    wire [RGMII_DW-1:0]     fpga_cpu_rgmii_d;
    // SFP I2C
    tri1 [NB_SFP_PORTS-1:0] fpga_sfp_i2cclk;
    tri1 [NB_SFP_PORTS-1:0] fpga_sfp_i2cdat;
    // PLL AD9553 9553 SPI control
    // TODO: spi memory model is suficient since SPI master is register mapped
    // Lower priority since solution is already validate in other products
    wire                    fpga_9553_sclk;
    wire                    fpga_9553_cs_n;
    tri1                    fpga_9553_sdio;

    //--------------------------------------------------------------------------
    // Assign
    //--------------------------------------------------------------------------
    // Main reset
    assign cpu_fpga_reset_n       = ~ctrl_if.rst;

    // Non-system clocks
    assign ctrl_if.gps_fpga_clk   = clk_10K.clk; // Speedup for sim - real period: 1 sec
    assign mezz_fpga_external_clk = '0;          // not used

    // SFP loopback: FPGA_out -> FPGA_in, with enable signal
    assign sfp_fpga               = fpga_sfp & ctrl_if.sfp_loopback_ena;

    // DUT instance
    clipper_chiptop #
    (
     .g_technology             (DEVICE_TECH    ),
     .g_synthesis              (G_SYNTHESIS    ),
     .g_num_of_ports           (NB_IF_PORTS    ),
     .g_num_of_sfpplus         (4              ),
     .g_num_of_sfp             (4              ),
     .g_num_of_combo           (4              ),
     .g_enable_extra_sfp       (0              ),
     // External RLDRAM3
     .g_rldram3_bank_add_width (RLDRAM3_BANK_AW),
     .g_rldram3_add_width      (RLDRAM3_AW     ),
     .g_rldram3_dat_width      (RLDRAM3_DW     ),
     .g_rldram3_qk_width       (RLDRAM3_QK_W   ),
     .g_rldram3_dk_width       (RLDRAM3_DK_W   ),
     .g_rldram3_dm_width       (RLDRAM3_DM_W   ),
     .g_rldram3_qvld_width     (RLDRAM3_QVLD_W ),
     // RGMII
     .g_rgmii_data_width       (RGMII_DW       ),
     // Misc
     .g_num_of_fans            (NB_FANS        ),
     .g_num_of_dry_contacts    (NB_DRY_CONTACTS),
     .g_mezz_ctrl_width        (MEZZ_CTRL_W    ),
     .g_pcb_rev_width          (PCB_REV_W      ),
     .g_cpu_spare_width        (CPU_SPARE_W    ),
     .g_test_conn_width        (TEST_CONN_W    )
     ) dut
    (
     //----------------------------------------------------------------------
     // CLK & RST
     //----------------------------------------------------------------------
     .i_cpu_fpga_reset_n              (cpu_fpga_reset_n           ),
     // Tranceivers reference clocks (Differential pairs)
     .i_ref_clk_10g                   (ref_clk_10g                ),
     .i_ref_clk_synce_r               (ref_clk_synce_r            ),
     .i_ref_clk_synce_l               (ref_clk_synce_r            ),
     // Output ref to SyncE
     .o_fpga_synce_ref_clk            (fpga_synce_ref_clk         ),
     // Internal refclk (required for External RAM)
     .i_ref_clk_t                     (ref_clk_t                  ),
     .i_ref_clk_b                     (ref_clk_b                  ),
     // GPS reference clock
     .i_gps_fpga_clk                  (ctrl_if.gps_fpga_clk       ),
     // External clocks
     .i_mezz_fpga_external_clk        (mezz_fpga_external_clk     ),
     .o_fpga_mezz_external_clk        (fpga_mezz_external_clk     ),
     .i_combophy_fpga_rcvclk0         (), // TBD
     .i_combophy_fpga_rcvclk1         (), // TBD
     .o_fpga_mgmtphy_clkout           (),

     //----------------------------------------------------------------------
     // Tranceivers (All tranceiver ports are differential pair signals)
     //----------------------------------------------------------------------
     .i_sfpplus_fpga_p0               (sfp_fpga[0]                ),
     .o_fpga_sfpplus_p0               (fpga_sfp[0]                ),
     .i_sfpplus_fpga_p1               (sfp_fpga[1]                ),
     .o_fpga_sfpplus_p1               (fpga_sfp[1]                ),
     .i_sfpplus_fpga_p2               (sfp_fpga[2]                ),
     .o_fpga_sfpplus_p2               (fpga_sfp[2]                ),
     .i_sfpplus_fpga_p3               (sfp_fpga[3]                ),
     .o_fpga_sfpplus_p3               (fpga_sfp[3]                ),
     .i_sfp_fpga_p0                   (sfp_fpga[4]                ),
     .o_fpga_sfp_p0                   (fpga_sfp[4]                ),
     .i_sfp_fpga_p1                   (sfp_fpga[5]                ),
     .o_fpga_sfp_p1                   (fpga_sfp[5]                ),
     .i_sfp_fpga_p2                   (sfp_fpga[6]                ),
     .o_fpga_sfp_p2                   (fpga_sfp[6]                ),
     .i_sfp_fpga_p3                   (sfp_fpga[7]                ),
     .o_fpga_sfp_p3                   (fpga_sfp[7]                ),
     .i_combophy_fpga_p0              (sfp_fpga[8]                ),
     .o_fpga_combophy_p0              (fpga_sfp[8]                ),
     .i_combophy_fpga_p1              (sfp_fpga[9]                ),
     .o_fpga_combophy_p1              (fpga_sfp[9]                ),
     .i_combophy_fpga_p2              (sfp_fpga[10]               ),
     .o_fpga_combophy_p2              (fpga_sfp[10]               ),
     .i_combophy_fpga_p3              (sfp_fpga[11]               ),
     .o_fpga_combophy_p3              (fpga_sfp[11]               ),
     //----------------------------------------------------------------------
     // RGMII interfaces
     //----------------------------------------------------------------------
     // Management port Phy
     .i_mgmtphy_fpga_rgmii_clk        (mgmtphy_fpga_rgmii_clk     ),
     .i_mgmtphy_fpga_rgmii_ctl        (mgmtphy_fpga_rgmii_ctl     ),
     .i_mgmtphy_fpga_rgmii_d          (mgmtphy_fpga_rgmii_d       ),
     .o_fpga_mgmtphy_rgmii_clk        (fpga_mgmtphy_rgmii_clk     ),
     .o_fpga_mgmtphy_rgmii_ctl        (fpga_mgmtphy_rgmii_ctl     ),
     .o_fpga_mgmtphy_rgmii_d          (fpga_mgmtphy_rgmii_d       ),
     // CPU
     .i_cpu_fpga_rgmii_clk            (cpu_fpga_rgmii_clk         ),
     .i_cpu_fpga_rgmii_ctl            (cpu_fpga_rgmii_ctl         ),
     .i_cpu_fpga_rgmii_d              (cpu_fpga_rgmii_d           ),
     .o_fpga_cpu_rgmii_clk            (fpga_cpu_rgmii_clk         ),
     .o_fpga_cpu_rgmii_ctl            (fpga_cpu_rgmii_ctl         ),
     .o_fpga_cpu_rgmii_d              (fpga_cpu_rgmii_d           ),
     //----------------------------------------------------------------------
     // SFP status & control
     //----------------------------------------------------------------------
     // SFP
     .o_fpga_sfp_sfp_en_n             (sfp_if.ena_n[3:0]          ),
     .o_fpga_sfp_tx_disable           (sfp_if.tx_disable[3:0]     ),
     .o_fpga_sfp_rate_sel_0           (sfp_if.rate_sel[0][3:0]    ),
     .i_sfp_fpga_sfp_detect_n         (sfp_if.detect_n[3:0]       ),
     .i_sfp_fpga_los                  (sfp_if.los[3:0]            ),
     .i_sfp_fpga_tx_fault             (sfp_if.tx_fault[3:0]       ),
     .b_fpga_sfp_i2cclk               (fpga_sfp_i2cclk[3:0]       ),
     .b_fpga_sfp_i2cdat               (fpga_sfp_i2cdat[3:0]       ),
     // SFPP
     .o_fpga_sfpplus_sfp_en_n         (sfp_if.ena_n[7:4]          ),
     .o_fpga_sfpplus_tx_disable       (sfp_if.tx_disable[7:4]     ),
     .o_fpga_sfpplus_rate_sel_0       (sfp_if.rate_sel[0][7:4]    ),
     .o_fpga_sfpplus_rate_sel_1       (sfp_if.rate_sel[1][7:4]    ),
     .i_sfpplus_fpga_sfp_detect_n     (sfp_if.detect_n[7:4]       ),
     .i_sfpplus_fpga_los              (sfp_if.los[7:4]            ),
     .i_sfpplus_fpga_tx_fault         (sfp_if.tx_fault[7:4]       ),
     .b_fpga_sfpplus_i2cclk           (fpga_sfp_i2cclk[7:4]       ),
     .b_fpga_sfpplus_i2cdat           (fpga_sfp_i2cdat[7:4]       ),
     // COMBO
     .o_fpga_combosfp_sfp_en_n        (sfp_if.ena_n[11:8]         ),
     .o_fpga_combosfp_tx_disable      (sfp_if.tx_disable[11:8]    ),
     .o_fpga_combosfp_rate_sel_0      (sfp_if.rate_sel[0][11:8]   ),
     .i_combosfp_fpga_sfp_detect_n    (sfp_if.detect_n[11:8]      ),
     .i_combosfp_fpga_los             (sfp_if.los[11:8]           ),
     .i_combosfp_fpga_tx_fault        (sfp_if.tx_fault[11:8]      ),
     .b_fpga_combosfp_i2cclk          (fpga_sfp_i2cclk[11:8]      ),
     .b_fpga_combosfp_i2cdat          (fpga_sfp_i2cdat[11:8]      ),
     //----------------------------------------------------------------------
     // LEDs
     // SFP interfaces
     .o_fpga_sfp_led1_n               (misc_if.led_sfp_n[1][3:0]  ),
     .o_fpga_sfp_led2_n               (misc_if.led_sfp_n[2][3:0]  ),
     .o_fpga_sfpplus_led1_n           (misc_if.led_sfp_n[1][7:4]  ),
     .o_fpga_sfpplus_led2_n           (misc_if.led_sfp_n[2][7:4]  ),
     .o_fpga_combosfp_led1_n          (misc_if.led_sfp_n[1][11:8] ),
     .o_fpga_combosfp_led2_n          (misc_if.led_sfp_n[2][11:8] ),
     // Management port
     .o_fpga_mgmt_led1_n              (misc_if.led_mgmt_n[1]      ),
     .o_fpga_mgmt_led2_n              (misc_if.led_mgmt_n[2]      ),
     // Copper
     .o_fpga_copper_led1_n            (misc_if.led_copper_n[1]    ),
     .o_fpga_copper_led2_n            (misc_if.led_copper_n[2]    ),
     // TBD
     .i_combophy_fpga_link_fail       (1'b0                       ),
     .o_fpga_combophy_coma_mode       (                           ),
     .i_combophy_fpga_spi_clk         (1'b0                       ),
     .i_combophy_fpga_spi_cs          (1'b0                       ),
     .i_combophy_fpga_spi_d           (1'b0                       ),
     .i_combophy_fpga_pps             (4'h0                       ),
     .o_fpga_combophy_load_save       (                           ),
     .o_fpga_cpu_int_n                (                           ),
     .b_cpu_fpga_spare                (                           ),
     .i_nperstl0                      (1'b0                       ),
     //----------------------------------------------------------------------
     // RLDRAM3 Interfaces
     //----------------------------------------------------------------------
     // Mem interface 1
     .o_mem_1_ck                      (ram_if[1].clk_p            ),
     .o_mem_1_ck_n                    (ram_if[1].clk_n            ),
     .o_mem_1_reset_n                 (ram_if[1].rst_n            ),
     .o_mem_1_cs_n                    (ram_if[1].cs_n             ),
     .o_mem_1_we_n                    (ram_if[1].we_n             ),
     .o_mem_1_ref_n                   (ram_if[1].ref_n            ),
     .o_mem_1_ba                      (ram_if[1].ba               ),
     .o_mem_1_a                       (ram_if[1].addr             ),
     .o_mem_1_dk                      (ram_if[1].dk               ),
     .o_mem_1_dk_n                    (ram_if[1].dk_n             ),
     .o_mem_1_dm                      (ram_if[1].dm               ),
     .b_mem_1_dq                      (ram_if[1].dq               ),
     .i_mem_1_qvld                    (ram_if[1].qvld             ),
     .i_mem_1_qk                      (ram_if[1].dqs              ),
     .i_mem_1_qk_n                    (ram_if[1].dqs_n            ),
     // Mem interface 2
     .o_mem_2_ck                      (ram_if[2].clk_p            ),
     .o_mem_2_ck_n                    (ram_if[2].clk_n            ),
     .o_mem_2_reset_n                 (ram_if[2].rst_n            ),
     .o_mem_2_cs_n                    (ram_if[2].cs_n             ),
     .o_mem_2_we_n                    (ram_if[2].we_n             ),
     .o_mem_2_ref_n                   (ram_if[2].ref_n            ),
     .o_mem_2_ba                      (ram_if[2].ba               ),
     .o_mem_2_a                       (ram_if[2].addr             ),
     .o_mem_2_dk                      (ram_if[2].dk               ),
     .o_mem_2_dk_n                    (ram_if[2].dk_n             ),
     .o_mem_2_dm                      (ram_if[2].dm               ),
     .b_mem_2_dq                      (ram_if[2].dq               ),
     .i_mem_2_qvld                    (ram_if[2].qvld             ),
     .i_mem_2_qk                      (ram_if[2].dqs              ),
     .i_mem_2_qk_n                    (ram_if[2].dqs_n            ),
     // Mem interface 3
     .o_mem_3_ck                      (ram_if[3].clk_p            ),
     .o_mem_3_ck_n                    (ram_if[3].clk_n            ),
     .o_mem_3_reset_n                 (ram_if[3].rst_n            ),
     .o_mem_3_cs_n                    (ram_if[3].cs_n             ),
     .o_mem_3_we_n                    (ram_if[3].we_n             ),
     .o_mem_3_ref_n                   (ram_if[3].ref_n            ),
     .o_mem_3_ba                      (ram_if[3].ba               ),
     .o_mem_3_a                       (ram_if[3].addr             ),
     .o_mem_3_dk                      (ram_if[3].dk               ),
     .o_mem_3_dk_n                    (ram_if[3].dk_n             ),
     .o_mem_3_dm                      (ram_if[3].dm               ),
     .b_mem_3_dq                      (ram_if[3].dq               ),
     .i_mem_3_qvld                    (ram_if[3].qvld             ),
     .i_mem_3_qk                      (ram_if[3].dqs              ),
     .i_mem_3_qk_n                    (ram_if[3].dqs_n            ),
     // Mem interface 4
     .o_mem_4_ck                      (ram_if[4].clk_p            ),
     .o_mem_4_ck_n                    (ram_if[4].clk_n            ),
     .o_mem_4_reset_n                 (ram_if[4].rst_n            ),
     .o_mem_4_cs_n                    (ram_if[4].cs_n             ),
     .o_mem_4_we_n                    (ram_if[4].we_n             ),
     .o_mem_4_ref_n                   (ram_if[4].ref_n            ),
     .o_mem_4_ba                      (ram_if[4].ba               ),
     .o_mem_4_a                       (ram_if[4].addr             ),
     .o_mem_4_dk                      (ram_if[4].dk               ),
     .o_mem_4_dk_n                    (ram_if[4].dk_n             ),
     .o_mem_4_dm                      (ram_if[4].dm               ),
     .b_mem_4_dq                      (ram_if[4].dq               ),
     .i_mem_4_qvld                    (ram_if[4].qvld             ),
     .i_mem_4_qk                      (ram_if[4].dqs              ),
     .i_mem_4_qk_n                    (ram_if[4].dqs_n            ),
     //----------------------------------------------------------------------
     // RZQ calibration resistor
     //----------------------------------------------------------------------
     .i_rzq_1v2                       (1'b0                       ),
     .i_rzq_2v5                       (1'b0                       ),
     //----------------------------------------------------------------------
     // Misc
     //----------------------------------------------------------------------
     // Clk ctrl
     .o_fpga_9553_sclk                (fpga_9553_sclk             ),
     .o_fpga_9553_cs_n                (fpga_9553_cs_n             ),
     .b_fpga_9553_sdio                (fpga_9553_sdio             ),
     // FAN status & control
     .o_fpga_fan_enable               (misc_if.fan_enable         ),
     .o_fpga_fan_ctrl                 (misc_if.fan_ctrl           ),
     .i_fan_fpga_tach                 (misc_if.fan_tach           ),
     // Dying gasp
     .i_power_fpga_dying_gasp         (misc_if.dying_gasp         ),
     .o_fpga_power_dying_gasp_done    (misc_if.dying_gasp_done    ),
     // Dry contacts
     .i_drycontacts_fpga              (misc_if.dry_contacts       ),
     // Mezzanine control
     .o_fpga_mezz_ctrl                (misc_if.mezz_ctrl          ),
     // PCB revision
     .i_pcbrev_fpga                   (misc_if.pcb_rev            ),
     // Test pins (to test connector)
     .o_fpga_test                     (misc_if.fpga_test          )
     );

    //--------------------------------------------------------------------------
    // RGMII / GMII convertion
    // convert from GMII to RGMII for IF->DUT_RX
    // convert from RGMII to GMII for DUT_TX->IF
    //--------------------------------------------------------------------------
    generate
        if (G_USE_RGMII) begin : GEN_RGMII
            // CPU port
            rgmiiconv #
            (
             .g_disable_fcs_invert_on_tx_error (0          ),
             .g_technology                     (DEVICE_TECH)
             ) cpu_fpga_rgmiiconv
            (
             .reset_rx_clk (gmii_rst[PORT_CPU]         ),
             .reset_tx_clk (gmii_clk[PORT_CPU]         ),
             .tx_clk       (gmii_clk[PORT_CPU]         ),
             // RGMII Transmit Interface
             .rgmii_tx_ctl (cpu_fpga_rgmii_ctl         ),
             .rgmii_tx_d   (cpu_fpga_rgmii_d           ),
             // RGMII Receive Interface
             .rgmii_rxc    (fpga_cpu_rgmii_clk         ),
             .rgmii_rx_ctl (fpga_cpu_rgmii_ctl         ),
             .rgmii_rx_d   (fpga_cpu_rgmii_d           ),
             // MII/GMII Receive Interface
             .rx_d         (gmii_tx_if[PORT_CPU].data  ),
             .rx_dv        (gmii_tx_if[PORT_CPU].valid ),
             .rx_err       (gmii_tx_if[PORT_CPU].error ),
             .rx_crs       (                           ),
             .rx_col       (                           ),
             // GMII Transmit Interface
             .gmii_tx_d    (gmii_rx_if[PORT_CPU].data  ),
             .gmii_tx_en   (gmii_rx_if[PORT_CPU].valid ),
             .gmii_tx_err  (gmii_rx_if[PORT_CPU].error ),
             // MII Transmit Interface
             .mii_tx_d     (4'h0                       ),
             .mii_tx_en    (1'b0                       ),
             .mii_tx_err   (1'b0                       ),
             // RGMII optional status directly from PHY
             .rgmii_link   (                           ),
             .rgmii_speed  (                           ),
             .rgmii_dup    (                           ),
             // Control
             .ena_auto     (1'b0                       ),
             .set_1000     (1'b1                       ),
             .set_10       (1'b0                       ),
             .set_fd       (1'b1                       ),
             .o_dbg        (                           )
             );

            // MGMT port
            rgmiiconv #
            (
             .g_disable_fcs_invert_on_tx_error (0       ),
             .g_technology                     ()                    // TBD
             ) mgmt_fpga_rgmiiconv
            (
             .reset_rx_clk (gmii_rst[PORT_MGMT]         ),
             .reset_tx_clk (gmii_clk[PORT_MGMT]         ),
             .tx_clk       (gmii_clk[PORT_MGMT]         ),
             // RGMII Transmit Interface
             .rgmii_tx_ctl (mgmt_fpga_rgmii_ctl         ),
             .rgmii_tx_d   (mgmt_fpga_rgmii_d           ),
             // RGMII Receive Interface
             .rgmii_rxc    (fpga_mgmt_rgmii_clk         ),
             .rgmii_rx_ctl (fpga_mgmt_rgmii_ctl         ),
             .rgmii_rx_d   (fpga_mgmt_rgmii_d           ),
             // MII/GMII Receive Interface
             .rx_d         (gmii_tx_if[PORT_MGMT].data  ),
             .rx_dv        (gmii_tx_if[PORT_MGMT].valid ),
             .rx_err       (gmii_tx_if[PORT_MGMT].error ),
             .rx_crs       (                            ),
             .rx_col       (                            ),
             // GMII Transmit Interface
             .gmii_tx_d    (gmii_rx_if[PORT_MGMT].data  ),
             .gmii_tx_en   (gmii_rx_if[PORT_MGMT].valid ),
             .gmii_tx_err  (gmii_rx_if[PORT_MGMT].error ),
             // MII Transmit Interface
             .mii_tx_d     (4'h0                        ),
             .mii_tx_en    (1'b0                        ),
             .mii_tx_err   (1'b0                        ),
             // RGMII optional status directly from PHY
             .rgmii_link   (                            ),
             .rgmii_speed  (                            ),
             .rgmii_dup    (                            ),
             // Control
             .ena_auto     (1'b0                        ),
             .set_1000     (1'b1                        ),
             .set_10       (1'b0                        ),
             .set_fd       (1'b1                        ),
             .o_dbg        (                            )
             );
        end
    endgenerate

    //--------------------------------------------------------------------------
    // Components paths
    //--------------------------------------------------------------------------
    `define DUT_TOP_HIER       top.dut
    `define DUT_CLKBLK_HIER    `DUT_TOP_HIER.inst_clock_block
    `define DUT_C2CORE_HIER    `DUT_TOP_HIER.inst_clipper_core
    `define DUT_MULTIMAC_HIER  `DUT_C2CORE_HIER.inst_multispeed_mac
    `define DUT_TSE_WRP_HIER   `DUT_MULTIMAC_HIER.u_clipper_tse_wrapper
    `define DUT_XGMAC_GEN_HIER `DUT_MULTIMAC_HIER.inst_clipper_xgmac_wrapper.gen_xgmac_inst
    `define DUT_ACD_MM_HIER    `DUT_C2CORE_HIER.acd_core_inst.inst_clipper_reg_master
    `define DUT_TIMEBASE_HIER  `DUT_C2CORE_HIER.acd_core_inst.u_clipper_timebase
    `define DUT_TM_HIER        `DUT_C2CORE_HIER.acd_core_inst.u_traffic_manager

    //--------------------------------------------------------------------------
    // External memory
    //--------------------------------------------------------------------------
    generate
        // TBD : TO ADD
        if (!G_USE_BEH_RAM) begin : GEN_RAM_SUBSYS

            //--------------------------------------------------------------------------
            // "Real" memory controller + RAM
            //--------------------------------------------------------------------------

            // Assign ref clocks
            assign ref_clk_t = clk_125M.clk;
            //TODO (NZ) If we conly use memory controller 3, we should be able to kill the bottom clock
            assign ref_clk_b = clk_125M.clk;

            // TBD
            // Memory model wrapper
            /*
            mem_subsys_wrp #
            (
             .NB_MEM_IF  (NB_RLDRAM3     ),
             .NB_CLK     (1              ),
             .MEM_RANKS  (1              ),
             .BA_WIDTH   (RLDRAM3_BANK_AW),
             .ADDR_WIDTH (RLDRAM3_AW     ),
             .DK_WIDTH   (RLDRAM3_DK_W   ),
             .DM_WIDTH   (RLDRAM3_DM_W   ),
             .DQ_WIDTH   (RLDRAM3_DW     ),
             .DQS_WIDTH  (RLDRAM3_QK_W   ),
             .QVLD_WIDTH (RLDRAM3_QVLD_W )
             ) mem_subsys
            (
             .model_reset ('0),
             .mem         (ram_if)
             );
             */
        end else begin : GEN_RAM_BEH
            //--------------------------------------------------------------------------
            // Tap into DUT to emulate memory controller + RAM
            //--------------------------------------------------------------------------

            // Kill ref clocks
            assign ref_clk_t = '0;
            assign ref_clk_b = '0;

            clipper_ram_top_int_if#
            (
             .g_ram_req_units          (4  ),
             .g_ram_burst_len          (2  ),
             .g_rldram3_bank_add_width (4  ),
             .g_rldram3_add_width      (21 ),
             .g_rldram3_dm_width       (2  ),
             .g_rldram3_dat_width      (36 )
             ) ctrl_ram_top_if();

            // Only one memory is actually used
            assign ctrl_ram_top_if.clk = clk_125M.clk;
            assign ctrl_ram_top_if.rst = clk_125M.rst;

            clipper_ram_top_int_if#
            (
             .g_ram_req_units          (4  ),
             .g_ram_burst_len          (2  ),
             .g_rldram3_bank_add_width (4  ),
             .g_rldram3_add_width      (19 ),
             .g_rldram3_dm_width       (2  ),
             .g_rldram3_dat_width      (72 )
             ) data_ram_top_if();

            // Only one memory is actually used
            assign data_ram_top_if.clk = clk_125M.clk;
            assign data_ram_top_if.rst = clk_125M.rst;

            // Internal connections
            always @(*) begin
                force `DUT_TM_HIER.i_ctrl_ram_clk                 = ctrl_ram_top_if.clk;
                force `DUT_TM_HIER.i_ctrl_ram_rst                 = ctrl_ram_top_if.rst;
                force `DUT_TM_HIER.i_ctrl_ram_busy                = ctrl_ram_top_if.busy;
                force `DUT_TM_HIER.i_ctrl_ram_req_buf_almost_full = ctrl_ram_top_if.req_bus_afull;
                force `DUT_TM_HIER.i_ctrl_ram_r_valid             = ctrl_ram_top_if.rd_data_rdy;
                force `DUT_TM_HIER.i_ctrl_ram_data                = ctrl_ram_top_if.rd_data;
                force `DUT_TM_HIER.i_ctrl_ram_d_req               = ctrl_ram_top_if.data_request;

                force `DUT_TM_HIER.i_data_ram_clk                 = data_ram_top_if.clk;
                force `DUT_TM_HIER.i_data_ram_rst                 = data_ram_top_if.rst;
                force `DUT_TM_HIER.i_data_ram_busy                = data_ram_top_if.busy;
                force `DUT_TM_HIER.i_data_ram_req_buf_almost_full = data_ram_top_if.req_bus_afull;
                force `DUT_TM_HIER.i_data_ram_r_valid             = data_ram_top_if.rd_data_rdy;
                force `DUT_TM_HIER.i_data_ram_data                = data_ram_top_if.rd_data;
                force `DUT_TM_HIER.i_data_ram_d_req               = data_ram_top_if.data_request;

                force `DUT_C2CORE_HIER.acd_core_inst.tm_nb_mau_injected = 19'h0_07FF;
            end

            assign ctrl_ram_top_if.wr_data      = `DUT_TM_HIER.o_ctrl_ram_data;
            assign ctrl_ram_top_if.rd_req       = `DUT_TM_HIER.o_ctrl_ram_r_req;
            assign ctrl_ram_top_if.wr_req       = `DUT_TM_HIER.o_ctrl_ram_w_req;
            assign ctrl_ram_top_if.dm           = `DUT_TM_HIER.o_ctrl_ram_dm;
            assign ctrl_ram_top_if.bk_addr      = `DUT_TM_HIER.o_ctrl_ram_bank_addr;
            assign ctrl_ram_top_if.row_col_addr = `DUT_TM_HIER.o_ctrl_ram_rowcol_addr;

            assign data_ram_top_if.wr_data      = `DUT_TM_HIER.o_data_ram_data;
            assign data_ram_top_if.rd_req       = `DUT_TM_HIER.o_data_ram_r_req;
            assign data_ram_top_if.wr_req       = `DUT_TM_HIER.o_data_ram_w_req;
            assign data_ram_top_if.dm           = `DUT_TM_HIER.o_data_ram_dm;
            assign data_ram_top_if.bk_addr      = `DUT_TM_HIER.o_data_ram_bank_addr;
            assign data_ram_top_if.row_col_addr = `DUT_TM_HIER.o_data_ram_rowcol_addr;

            acd_mm_if #
            (
             .IF_DATA_WIDTH  (clipper_pkg::ACD_MM_IF_DATA_WIDTH ),
             .MA_ADDR_WIDTH  (clipper_pkg::ACD_MM_MA_ADDR_WIDTH ),
             .MA_DATA_WIDTH  (clipper_pkg::ACD_MM_MA_DATA_WIDTH ),
             .ACK_LATENCY    (clipper_pkg::ACD_MM_ACK_LATENCY   ),
             .MA_MAX_PENDING (clipper_pkg::ACD_MM_MA_MAX_PENDING)
             ) ext_buf_beh_acd_mm_if(acd_mm_clk, acd_mm_rst);

            clipper_ram_top_beh#() ctrl_ram_top (ext_buf_beh_acd_mm_if, ctrl_ram_top_if);
            clipper_ram_top_beh#() data_ram_top (ext_buf_beh_acd_mm_if, data_ram_top_if);

        end
    endgenerate

    //--------------------------------------------------------------------------
    // I2C slave EEPROM devices mapped to A0 and A2 (TODO: check A0 A2 mapping) Olivier
    //--------------------------------------------------------------------------
    genvar i2c_idx;
    generate
        if (G_USE_I2C) begin : GEN_I2C_EEPROM
            for(i2c_idx = 0; i2c_idx < NB_SFP_PORTS; i2c_idx++) begin
                M24AA08H i2c_eeprom_a0_a2
                (
                 .A0    (1'b0                    ),
                 .A1    (1'b0                    ),
                 .A2    (1'b0                    ),
                 .WP    (1'b0                    ),
                 .SCL   (fpga_sfp_i2cclk[i2c_idx]),
                 .SDA   (fpga_sfp_i2cdat[i2c_idx]),
                 .RESET (ctrl_if.rst             )
                 );
            end
        end
    endgenerate

    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    // Tapping signals inside DUT
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------

    //--------------------------------------------------------------------------
    // Force internal clock conections
    //--------------------------------------------------------------------------

    // Clock and signal forcing to speed up simulations if PHYs are not used
    generate
        // Drive clocks internally
        if (!G_USE_PHY) begin : GEN_FORCE_CLK

            // Kill external clocks
            assign ref_clk_10g     = '0;
            assign ref_clk_synce_r = '0;

            // Force internal signals
            initial begin
                // force PLL lock status
                // force clock block outputs
                force `DUT_CLKBLK_HIER.o_clk_125m       = clk_125M.clk;
                force `DUT_CLKBLK_HIER.o_clk_166_66m    = clk_166M.clk; // o_clk_166_66m +
                                                                        // o_clk_66m     +
                                                                        // o_inp_clock[13:9,4:1]
                force `DUT_CLKBLK_HIER.o_clk_200m       = clk_200M.clk; // o_clk_200m +
                                                                        // o_clk_bwp
                force `DUT_CLKBLK_HIER.o_clk_100m       = clk_100M.clk; // o_clk_100m
                force `DUT_CLKBLK_HIER.o_clk_225m       = clk_225M.clk; // o_clk_225m +
                                                                        // o_inp_clock[8:5]
                // force clock block resets
                force `DUT_CLKBLK_HIER.o_por_125m_top_p = clk_125M.rst;
                force `DUT_CLKBLK_HIER.o_rst_125m_p     = clk_125M.rst;
                force `DUT_CLKBLK_HIER.o_rst_166_66m_p  = clk_166M.rst; // o_rst_166_66m_p +
                                                                        // o_rst_66m_p     +
                                                                        // o_inp_reset[13:9,4:1]
                force `DUT_CLKBLK_HIER.o_rst_200m_p     = clk_200M.rst; // o_rst_200m_p +
                                                                        // o_rst_bwp_p
                force `DUT_CLKBLK_HIER.o_rst_100m_p     = clk_100M.rst; // o_rst_200m_p +
                force `DUT_CLKBLK_HIER.o_rst_225m_p     = clk_225M.rst; // o_rst_225m_p +
                                                                        // o_inp_reset[8:5]
                // TODO: kill undesired signals/clocks (any left clocks?)
                clk_644M.kill_clk();
                force clk_644M.rst = '0;
                //clk_10K.kill_clk();
                //force clk_10K.rst = '0;
                force `DUT_TOP_HIER.inst_phy_if.i_ref_clk_avalon = '0;
            end
        end

        // Use external clocking
        if (G_USE_PHY) begin : GEN_USE_PHY_CLK
            assign ref_clk_10g     = clk_644M.clk;
            assign ref_clk_synce_r = clk_125M.clk;
        end
    endgenerate

    //--------------------------------------------------------------------------
    // TSE_MII/XGMII direct access
    //--------------------------------------------------------------------------

    //-------------------------------------------------------------------------
    // Macro: TSE_CONNECT
    // Tap into the design to "skip" some internal logic using SV force (not Mentor's SignalSpy)
`define TSE_CONNECT(IF_HW, IF_SIM) \
    wire                  #10ps gm_rx_rst_``IF_SIM``     = gmii_rx_if[``IF_SIM``].rst;\
    wire                  #10ps gm_tx_rst_``IF_SIM``     = gmii_tx_if[``IF_SIM``].rst;\
    wire                  #10ps gm_rx_clk_en_``IF_SIM``  = gmii_rx_if[``IF_SIM``].ena;\
    wire                  #10ps gm_tx_clk_en_``IF_SIM``  = gmii_tx_if[``IF_SIM``].ena;\
    wire                  #10ps gm_rate_1000_``IF_SIM``  = mii_rate_1000[``IF_SIM``];\
    wire                  #10ps gm_rate_100_``IF_SIM``   = mii_rate_100[``IF_SIM``];\
    wire                  #10ps gm_rate_10_``IF_SIM``    = mii_rate_10[``IF_SIM``];\
    wire [TSE_MII_DW-1:0] #10ps gm_rx_d_``IF_SIM``       = gmii_rx_if[``IF_SIM``].data;\
    wire                  #10ps gm_rx_dv_``IF_SIM``      = gmii_rx_if[``IF_SIM``].valid;\
    wire                  #10ps gm_rx_err_``IF_SIM``     = gmii_rx_if[``IF_SIM``].error;\
    // GMII clocks\
    initial begin\
        force `DUT_TOP_HIER.mac_1g_rx_clk[``IF_HW``] = gmii_rx_if[``IF_SIM``].clk;\
        force `DUT_TOP_HIER.mac_1g_tx_clk[``IF_HW``] = gmii_tx_if[``IF_SIM``].clk;\
    end\
    always @(posedge gmii_clk[``IF_SIM``]) begin\
        // Clock enable and reset\
        force `DUT_TOP_HIER.core_rx_gmii_rst_out[``IF_HW``]  = gm_rx_rst_``IF_SIM``;\
        force `DUT_TOP_HIER.core_sgmii_rx_clk_ena[``IF_HW``] = gm_rx_clk_en_``IF_SIM``;\
        force `DUT_TOP_HIER.core_tx_gmii_rst_out[``IF_HW``]  = gm_tx_rst_``IF_SIM``;\
        force `DUT_TOP_HIER.core_sgmii_tx_clk_ena[``IF_HW``] = gm_tx_clk_en_``IF_SIM``;\
        // Interface ports are 1G/10G - CPU always 1G - MGMT is 10/100/1000\
        force `DUT_TOP_HIER.core_sgmii_rate_1000[``IF_HW``]  = gm_rate_1000_``IF_SIM``;\
        force `DUT_TOP_HIER.core_sgmii_rate_100[``IF_HW``]   = gm_rate_100_``IF_SIM``;\
        force `DUT_TOP_HIER.core_sgmii_rate_10[``IF_HW``]    = gm_rate_10_``IF_SIM``;\
        // Data connection\
        if (ctrl_if.loopback_en[``IF_SIM``]) begin \
            force `DUT_TOP_HIER.core_gmii_rx_d[``IF_HW``]        = `DUT_TOP_HIER.core_gmii_tx_d[``IF_HW``];\
            force `DUT_TOP_HIER.core_gmii_rx_dv[``IF_HW``]       = `DUT_TOP_HIER.core_gmii_tx_en[``IF_HW``];\
            force `DUT_TOP_HIER.core_gmii_rx_err[``IF_HW``]      = `DUT_TOP_HIER.core_gmii_tx_err[``IF_HW``];\
        end else begin \
            force `DUT_TOP_HIER.core_gmii_rx_d[``IF_HW``]        = gm_rx_d_``IF_SIM``;\
            force `DUT_TOP_HIER.core_gmii_rx_dv[``IF_HW``]       = gm_rx_dv_``IF_SIM``;\
            force `DUT_TOP_HIER.core_gmii_rx_err[``IF_HW``]      = gm_rx_err_``IF_SIM``;\
        end \
    end\
    assign gmii_tx_if[``IF_SIM``].data  = `DUT_TOP_HIER.core_gmii_tx_d[``IF_HW``];\
    assign gmii_tx_if[``IF_SIM``].valid = `DUT_TOP_HIER.core_gmii_tx_en[``IF_HW``];\
    assign gmii_tx_if[``IF_SIM``].error = `DUT_TOP_HIER.core_gmii_tx_err[``IF_HW``];\
    // Timestamp\
    assign gmii_rx_if[``IF_SIM``].freerun_tbase = `DUT_TIMEBASE_HIER.gen_sim_probe.sim_probe_local_timestamp_reference;\
    assign gmii_tx_if[``IF_SIM``].freerun_tbase = `DUT_TIMEBASE_HIER.gen_sim_probe.sim_probe_local_timestamp_reference;\
    // end TSE_CONNECT
    //-------------------------------------------------------------------------

    //-------------------------------------------------------------------------
    // Macro: XGMAC_CONNECT
    // Skip 10G phy and connect XGMII directly to DUT internal signals
`define XGMAC_CONNECT(IF_HW, IF_SIM) \
    wire                xgm_rx_reset_n_``IF_SIM``;\
    wire                xgm_tx_reset_n_``IF_SIM``;\
    wire                xgm_rate_10000_``IF_SIM``;\
    wire [XGMII_DW-1:0] xgm_rx_data_``IF_SIM``   ;\
    wire [XGMII_CW-1:0] xgm_rx_ctrl_``IF_SIM``   ;\
    wire                xgm_rx_aligned_``IF_SIM``;\
    assign #10ps xgm_rx_reset_n_``IF_SIM`` = ~xgmii_rx_if[``IF_SIM``].rst;\
    assign #10ps xgm_tx_reset_n_``IF_SIM`` = ~xgmii_tx_if[``IF_SIM``].rst;\
    assign #10ps xgm_rate_10000_``IF_SIM`` = mii_rate_10000[``IF_SIM``];\
    assign #10ps xgm_rx_data_``IF_SIM``    = xgmii_rx_if[``IF_SIM``].data;\
    assign #10ps xgm_rx_ctrl_``IF_SIM``    = xgmii_rx_if[``IF_SIM``].ctrl;\
    assign #10ps xgm_rx_aligned_``IF_SIM`` = xgmii_rx_if[``IF_SIM``].aligned;\
    // XGMII clocks\
    initial begin\
        force `DUT_TOP_HIER.xgmii_rx_clk[``IF_SIM``-1] = xgmii_rx_if[``IF_SIM``].clk;\
        force `DUT_TOP_HIER.xgmii_tx_clk[``IF_SIM``-1] = xgmii_tx_if[``IF_SIM``].clk;\
    end\
    always @(posedge clk_156M.clk) begin\
        // Reset and rate control\
        force `DUT_TOP_HIER.xgmii_rx_reset_n[``IF_SIM``-1] = xgm_rx_reset_n_``IF_SIM``;\
        force `DUT_TOP_HIER.xgmii_tx_reset_n[``IF_SIM``-1] = xgm_tx_reset_n_``IF_SIM``;\
        force `DUT_TOP_HIER.core_rate_10000[``IF_SIM``-1]  = xgm_rate_10000_``IF_SIM``;\
        // Data connection\
        if (ctrl_if.loopback_en[``IF_SIM``]) begin \
            force `DUT_XGMAC_GEN_HIER[``IF_HW``].inst_xgmac.xgmii_rx_data    = `DUT_XGMAC_GEN_HIER[``IF_HW``].inst_xgmac.xgmii_tx_data;\
            force `DUT_XGMAC_GEN_HIER[``IF_HW``].inst_xgmac.xgmii_rx_ctrl    = `DUT_XGMAC_GEN_HIER[``IF_HW``].inst_xgmac.xgmii_tx_ctrl;\
            force `DUT_XGMAC_GEN_HIER[``IF_HW``].inst_xgmac.xgmii_rx_aligned = 1'b1;\
        end else begin \
            force `DUT_XGMAC_GEN_HIER[``IF_HW``].inst_xgmac.xgmii_rx_data    = xgm_rx_data_``IF_SIM``;\
            force `DUT_XGMAC_GEN_HIER[``IF_HW``].inst_xgmac.xgmii_rx_ctrl    = xgm_rx_ctrl_``IF_SIM``;\
            force `DUT_XGMAC_GEN_HIER[``IF_HW``].inst_xgmac.xgmii_rx_aligned = xgm_rx_aligned_``IF_SIM``;\
        end \
    end\
    assign xgmii_tx_if[``IF_SIM``].data = `DUT_XGMAC_GEN_HIER[``IF_HW``].inst_xgmac.xgmii_tx_data;\
    assign xgmii_tx_if[``IF_SIM``].ctrl = `DUT_XGMAC_GEN_HIER[``IF_HW``].inst_xgmac.xgmii_tx_ctrl;\
    // Timestamp\
    assign xgmii_rx_if[``IF_SIM``].freerun_tbase =  `DUT_TIMEBASE_HIER.gen_sim_probe.sim_probe_local_timestamp_reference;\
    assign xgmii_tx_if[``IF_SIM``].freerun_tbase =  `DUT_TIMEBASE_HIER.gen_sim_probe.sim_probe_local_timestamp_reference;\
    // end XGMAC_CONNECT
    //-------------------------------------------------------------------------

    genvar g_ps_idx; // Port speed index
    generate
        // Direct GMII connection for CPU and MGMT ports
        if (!G_USE_RGMII) begin : GEN_FORCE_MII_CPU_MGMT
            `TSE_CONNECT(0            , PORT_CPU )
            `TSE_CONNECT(PORT_MGMT_PHY, PORT_MGMT)
        end

        // Direct GMII and XGMII connection for Interface ports
        if (!G_USE_PHY) begin : GEN_FORCE_MII_IF
            // TSE - GMII
            `TSE_CONNECT(1,   1)  // IF port 1
            `TSE_CONNECT(2,   2)  // IF port 2
            `TSE_CONNECT(3,   3)  // IF port 3
            `TSE_CONNECT(4,   4)  // IF port 4
            `TSE_CONNECT(5,   5)  // IF port 5
            `TSE_CONNECT(6,   6)  // IF port 6
            `TSE_CONNECT(7,   7)  // IF port 7
            `TSE_CONNECT(8,   8)  // IF port 8
            `TSE_CONNECT(9,   9)  // IF port 9
            `TSE_CONNECT(10, 10)  // IF port 10
            `TSE_CONNECT(11, 11)  // IF port 11
            `TSE_CONNECT(12, 12)  // IF port 12

            // XGMAC - XGMII
            `XGMAC_CONNECT(0, 5)  // IF port 1
            `XGMAC_CONNECT(1, 6)  // IF port 2
            `XGMAC_CONNECT(2, 7)  // IF port 3
            `XGMAC_CONNECT(3, 8)  // IF port 4

            // Drive 'port_typespeed_sel' to select DUT's SFP port speed: 1G (1'b1) or 10G (1'b0 - default)
            for (g_ps_idx = 0; g_ps_idx < NB_IF_PORTS; g_ps_idx++) begin : GEN_PORT_TYPESPEED_SEL
                always_comb begin
                    force `DUT_TOP_HIER.port_typespeed_sel[g_ps_idx] = 1;//(ctrl_if.port_speed[PORT_IF + g_ps_idx] == PS_1G);
                end
            end

            // Drive MGMT speed
            // FIXME Not needed if G_USE_RGMII?
            // FIXME phy_if should drive this signal when G_USE_RGMII=1,
            // FIXME however not sure if need to supply anything more than the clock in this case
            wire #10ps gm_rate_1000_mgmt  = mii_rate_1000[PORT_MGMT_PHY];
            wire #10ps gm_rate_100_mgmt   = mii_rate_100[PORT_MGMT_PHY];
            wire #10ps gm_rate_10_mgmt    = mii_rate_10[PORT_MGMT_PHY];
            initial begin
                force `DUT_TOP_HIER.mngt_rgmii_speed_core_clk = ctrl_if.port_speed[PORT_MGMT] == PS_10M  ? 2'b00 :
                                                                ctrl_if.port_speed[PORT_MGMT] == PS_100M ? 2'b01 :
                                                                ctrl_if.port_speed[PORT_MGMT] == PS_1G   ? 2'b10 :
                                                                2'b11;
                force `DUT_TOP_HIER.mngt_rgmii_rate_1000  = gm_rate_1000_mgmt;
                force `DUT_TOP_HIER.mngt_rgmii_rate_1000  = gm_rate_100_mgmt;
                force `DUT_TOP_HIER.mngt_rgmii_rate_1000  = gm_rate_10_mgmt;
            end
        end
    endgenerate

    //--------------------------------------------------------------------------
    // ACD_MM direct access
    //--------------------------------------------------------------------------
    assign acd_mm_clk = `DUT_ACD_MM_HIER.i_clk;
    assign acd_mm_rst = `DUT_ACD_MM_HIER.i_reset;
    always @(posedge acd_mm_clk) begin
        //(dis)allow forcing of ACD_MM bus
        if (!ctrl_if.thi_ena) begin
            // for endpoint selection decoding, need to drive the THI addr
            force `DUT_ACD_MM_HIER.i_thi_addr    = reg_acd_mm_if.i_acd_mm_addr;
            force `DUT_ACD_MM_HIER.acd_mm_addr   = reg_acd_mm_if.i_acd_mm_addr;
            force `DUT_ACD_MM_HIER.acd_mm_wrdata = reg_acd_mm_if.i_acd_mm_wrdata;
            force `DUT_ACD_MM_HIER.acd_mm_wr     = reg_acd_mm_if.i_acd_mm_wr;
            force `DUT_ACD_MM_HIER.acd_mm_ena    = reg_acd_mm_if.i_acd_mm_ena;
            force `DUT_ACD_MM_HIER.acd_mm_bcnt   = reg_acd_mm_if.i_acd_mm_bcnt;

            reg_acd_mm_if.o_acd_mm_rddata = `DUT_ACD_MM_HIER.acd_mm_rddata;
            reg_acd_mm_if.o_acd_mm_ack    = `DUT_ACD_MM_HIER.acd_mm_ack;
            reg_acd_mm_if.o_acd_mm_end    = `DUT_ACD_MM_HIER.acd_mm_end;
        end else begin
            release `DUT_ACD_MM_HIER.i_thi_addr;
            release `DUT_ACD_MM_HIER.acd_mm_addr;
            release `DUT_ACD_MM_HIER.acd_mm_wrdata;
            release `DUT_ACD_MM_HIER.acd_mm_wr;
            release `DUT_ACD_MM_HIER.acd_mm_ena;
            release `DUT_ACD_MM_HIER.acd_mm_bcnt;

            reg_acd_mm_if.o_acd_mm_rddata = 0;
            reg_acd_mm_if.o_acd_mm_ack    = 0;
            reg_acd_mm_if.o_acd_mm_end    = 0;
        end
    end

    //------------------------------------------------
    // TIMEBASE testbench environment control
    //------------------------------------------------
    logic [63:0]  accell_timebase = '0;

        // Load an initial timebase time
    always @(ctrl_if.timebase_force) begin
        @(posedge `DUT_C2CORE_HIER.i_clk_sys_1g);
        `uvm_info("TOP", "Forcing inital timebase2 time", UVM_MEDIUM)
        force `DUT_TIMEBASE_HIER.u_timebase2.initial_acc_data  = ctrl_if.timebase_time;
        force `DUT_TIMEBASE_HIER.u_timebase2.load_initial_acc_data  = '1;
        #10ns;
        @(posedge `DUT_C2CORE_HIER.i_clk_sys_1g)
        force `DUT_TIMEBASE_HIER.u_timebase2.load_initial_acc_data  = '0;
        @(posedge `DUT_C2CORE_HIER.i_clk_sys_1g)
        release `DUT_TIMEBASE_HIER.u_timebase2.initial_acc_data ;
        release `DUT_TIMEBASE_HIER.u_timebase2.load_initial_acc_data ;
    end

    assign ctrl_if.free_run_timebase = `DUT_TIMEBASE_HIER.gen_sim_probe.sim_probe_local_timestamp_reference;

//    always @(posedge `DUT_TIMEBASE_HIER.i_clk) begin
//        //(dis)allow forcing of timebase
//        if (ctrl_if.timebase_force) begin
//            //force cpu_rx_mii_if[0].freerun_tbase               = ctrl_if.timebase_time;
//            force `DUT_TIMEBASE_HIER.o_timestamp               = ctrl_if.timebase_time;
//            force `DUT_TIMEBASE_HIER.o_timestamp_ns            = ctrl_if.timebase_time;
//            force `DUT_TIMEBASE_HIER.o_time_base_minus         = '{default: ctrl_if.timebase_time};
//            force `DUT_TIMEBASE_HIER.o_time_base_minus_ns      = '{default: ctrl_if.timebase_time};
//            force `DUT_TIMEBASE_HIER.o_time_base_plus          = '{default: ctrl_if.timebase_time};
//            force `DUT_TIMEBASE_HIER.o_time_base_plus_ns       = '{default: ctrl_if.timebase_time};
//            force `DUT_TIMEBASE_HIER.o_time_base_freerun_minus = '{default: ctrl_if.timebase_time[63:24]};
//            force `DUT_TIMEBASE_HIER.o_time_base_freerun_plus  = '{default: ctrl_if.timebase_time[63:24]};
//            force `DUT_TIMEBASE_HIER.o_timestamp_fr            = ctrl_if.timebase_time[63:24];
//            force `DUT_TIMEBASE_HIER.timestamp_int             = ctrl_if.timebase_time;
//
//       end else if (ctrl_if.timebase_accelerate) begin
//            accell_timebase = accell_timebase + 32'h20C4;
//            //force cpu_rx_mii_if[0].freerun_tbase               = ctrl_if.timebase_time;
//            force `DUT_TIMEBASE_HIER.o_timestamp               = accell_timebase;
//            force `DUT_TIMEBASE_HIER.o_timestamp_ns            = accell_timebase;
//            force `DUT_TIMEBASE_HIER.o_time_base_minus         = '{default: accell_timebase};
//            force `DUT_TIMEBASE_HIER.o_time_base_minus_ns      = '{default: accell_timebase};
//            force `DUT_TIMEBASE_HIER.o_time_base_plus          = '{default: accell_timebase};
//            force `DUT_TIMEBASE_HIER.o_time_base_plus_ns       = '{default: accell_timebase};
//            force `DUT_TIMEBASE_HIER.o_time_base_freerun_minus = '{default: accell_timebase[63:24]};
//            force `DUT_TIMEBASE_HIER.o_time_base_freerun_plus  = '{default: accell_timebase[63:24]};
//            force `DUT_TIMEBASE_HIER.o_timestamp_fr            = accell_timebase[63:24];
//            force `DUT_TIMEBASE_HIER.timestamp_int             = accell_timebase;
//        end else begin
//            //release cpu_rx_mii_if[0].freerun_tbase;
//            release `DUT_TIMEBASE_HIER.o_timestamp;
//            release `DUT_TIMEBASE_HIER.o_timestamp_ns;
//            release `DUT_TIMEBASE_HIER.o_time_base_minus;
//            release `DUT_TIMEBASE_HIER.o_time_base_minus_ns;
//            release `DUT_TIMEBASE_HIER.o_time_base_plus;
//            release `DUT_TIMEBASE_HIER.o_time_base_plus_ns;
//            release `DUT_TIMEBASE_HIER.o_time_base_freerun_minus;
//            release `DUT_TIMEBASE_HIER.o_time_base_freerun_plus;
//            release `DUT_TIMEBASE_HIER.o_timestamp_fr;
//            release `DUT_TIMEBASE_HIER.timestamp_int;
//        end
//    end

    // TBD : ADD
    // Freeze FlowMeter time
    /*
    always @(posedge `DUT_FM_HIER.i_clk) begin
        if (ctrl_if.freeze_flowmeter_time) begin
            force `DUT_FM_HIER.i_timebase = '0;
        end else begin
            release `DUT_FM_HIER.i_timebase;
        end
    end
     */

    //--------------------------------------------------------------------------
    // Other internal connections (includes)
    //--------------------------------------------------------------------------


    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    // Put interface handles in UVM config database and launch the test
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------

    // Set TSE_MII and XGMII virtual interface handles in configuration database
    genvar g_i;
    generate
        // TSE GMII
        for (g_i = 0; g_i < NB_ALL_PORTS; g_i++) begin : GEN_GMII_VIF
            initial begin
                uvm_config_db#(ethernet_vif_base)::set(uvm_root::get(), "*",
                    $sformatf("RX_GMII_VIF%0d", g_i), gmii_rx_if[g_i].get_vif_base());
                uvm_config_db#(ethernet_vif_base)::set(uvm_root::get(), "*",
                    $sformatf("TX_GMII_VIF%0d", g_i), gmii_tx_if[g_i].get_vif_base());
            end
        end
        // XGMII start after all TSE GMIIs in eth_vif array
        for (g_i = 5; g_i <= 8; g_i++) begin : GEN_XGMII_VIF
            initial begin
                uvm_config_db#(ethernet_vif_base)::set(uvm_root::get(), "*",
                    $sformatf("RX_XGMII_VIF%0d", g_i), xgmii_rx_if[g_i].get_vif_base());
                uvm_config_db#(ethernet_vif_base)::set(uvm_root::get(), "*",
                    $sformatf("TX_XGMII_VIF%0d", g_i), xgmii_tx_if[g_i].get_vif_base());
            end
        end
    endgenerate

    initial begin : RUN_TEST
        uvm_config_db#(acd_mm_max_vif)::set(uvm_root::get()      ,   "*", "ACD_MM_VIF", reg_acd_mm_if.intf);
        uvm_config_db#(clipper_ctrl_vif_t)::set(uvm_root::get(),     "*", "CTRL_VIF", ctrl_if);
        uvm_config_db#(clipper_misc_io_vif_t)::set(uvm_root::get(),  "*", "MISC_VIF", misc_if);
        uvm_config_db#(clipper_sfp_ctrl_vif_t)::set(uvm_root::get(), "*", "SFP_VIF",  sfp_if);

        `uvm_info($sformatf("%m"), $sformatf("*************************************"), UVM_NONE)
        `uvm_info($sformatf("%m"), $sformatf("TESTBENCH GENERICS"), UVM_NONE)
        `uvm_info($sformatf("%m"), $sformatf("G_USE_PHY     = %0d", G_USE_PHY),     UVM_NONE)
        `uvm_info($sformatf("%m"), $sformatf("G_USE_RGMII   = %0d", G_USE_RGMII),   UVM_NONE)
        `uvm_info($sformatf("%m"), $sformatf("G_USE_BEH_RAM = %0d", G_USE_BEH_RAM), UVM_NONE)
        `uvm_info($sformatf("%m"), $sformatf("G_USE_I2C     = %0d", G_USE_I2C),     UVM_NONE)
        `uvm_info($sformatf("%m"), $sformatf("G_SYNTHESIS   = %0d", G_SYNTHESIS),   UVM_NONE)
        `uvm_info($sformatf("%m"), $sformatf("*************************************"), UVM_NONE)

        // Begin factory create and phasing based on command line argument e.g. +UVM_TESTNAME=???
        run_test();
    end

    //-----------------------------------------------------
    // DUMMY VIRTUAL INTERFACES
    // Instead of using -permit_unmatched_virtual_intf
    //-----------------------------------------------------
    pkt_key_if dummy_key_if(1'b0, 1'b1);
    domain_priority_if#(.NB_DOMAIN(5), .NB_PRIO_IDX(2)) dummy_dom_if();
    stream_if#(.DATA_WIDTH(64), .LATENCY(0), .USER_WIDTH(8 ), .NB_CH(1 )) dummy_stream_if_inp_rx   (1'b0, 1'b1);
    stream_if#(.DATA_WIDTH(64), .LATENCY(0), .USER_WIDTH(53), .NB_CH(1 )) dummy_stream_if_inp_post (1'b0, 1'b1);
    stream_if#(.DATA_WIDTH(64), .LATENCY(0), .USER_WIDTH(42), .NB_CH(1 )) dummy_stream_if_inp_pre  (1'b0, 1'b1);
    stream_if#(.DATA_WIDTH(64), .LATENCY(0), .USER_WIDTH(1 ), .NB_CH(15)) dummy_stream_if_inp_other(1'b0, 1'b1);
    stream_if#(.DATA_WIDTH(64), .LATENCY(0), .USER_WIDTH(84), .NB_CH(15)) dummy_stream_if_user     (1'b0, 1'b1);
//    pkt_side_key_if#(.NBR_CHANNEL(16))                                    dummy_pkt_side_key       (1'b0);
//    vcx_cksm_itf                                                          dummy_vcx_cksm_itf       ();

endmodule

`endif
