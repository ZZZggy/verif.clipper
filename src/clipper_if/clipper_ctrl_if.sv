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

`ifndef CLIPPER_CTRL_IF__SV
`define CLIPPER_CTRL_IF__SV

// Interface: fsx_ctrl_if
// Interface for controlling Velocity FSX top level configuration pins.
// TODO: review needed signals
interface clipper_ctrl_if();
    import clipper_pkg::*;
    import mac_pkg::port_speed_e;

    // Combined reset signals from clock generators
    bit rst;

    // TSE_MII/XGMII interface activity detectors
    bit rx_activity;
    bit tx_activity;

    // If the THI is enabled, register accesses via ACD_MM agent are disabled
    bit thi_ena;

    // Per-port port speed
    // Possible values: PS_10M, PS_100M, PS_1G, PS_10G
    port_speed_e port_speed [NB_ALL_PORTS] = '{default: mac_pkg::PS_1G};


    // Force timebase time
    bit       timebase_force;
    bit       timebase_accelerate;
    bit[63:0] timebase_time;

    // Freeze timers
    bit freeze_flowmeter_time = '0;

    // Variable: sfp_loopback_ena
    // Enable local loopback in SFP IOs.
    bit [NB_IF_PORTS-1:0]  sfp_loopback_ena = '1;
    bit [NB_ALL_PORTS-1:0] loopback_en = '0;

    // enable forcing of input section READY signal for backpressure emulation
    bit       inp_bp_ena; // TODO: nedded?
    bit       gps_fpga_clk;

    //-----------------------------------------
    // Group: Testbench parameters propagation
    //-----------------------------------------
    bit g_use_phy;     // Use PHY for interface ports
    bit g_use_rgmii;   // Use RGMII for CPU and MGMT ports
    bit g_use_beh_ram; // Use behavioral RAM and memory controller
    bit g_use_i2c;     // Instantiate I2C EEPROM model
    bit g_synthesis;   // Use RTL for synthesis
endinterface

`endif
