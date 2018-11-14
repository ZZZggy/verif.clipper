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

`ifndef CLIPPER_MISC_IO_IF__SV
`define CLIPPER_MISC_IO_IF__SV

interface clipper_misc_io_if
(
 input logic clk,
 input logic rst
 );
    import clipper_pkg::*;

    // LEDs control
    logic [2:1][NB_SFP_PORTS-1:0]   led_sfp_n;
    logic [2:1]                     led_mgmt_n;      // Management port
    logic [2:1][NB_COMBO_PORTS-1:0] led_copper_n;
    // CPU
    logic                           cpu_int_n;       // FPGA to CPU Interruption
    tri1  [CPU_SPARE_W:1]           cpu_spare;       // Spare signals
    // FAN status & control
    logic                           fan_enable;      // FANs enable
    logic [NB_FANS-1:0]             fan_ctrl;        // FAN control
    logic [NB_FANS-1:0]             fan_tach;        // FAN tachometer
    // Dying gasp
    logic                           dying_gasp;      // Dying gasp (dut input)
    logic                           dying_gasp_done; // Dying gasp done (dut output)
    // Misc
    logic [NB_DRY_CONTACTS-1:0]     dry_contacts;    // Dry contacts (dut input)
    tri1  [MEZZ_CTRL_W-1:0]         mezz_ctrl;       // Mezzanine control
    logic [PCB_REV_W-1:0]           pcb_rev;         // PCB revision
    logic [TEST_CONN_W-1:0]         fpga_test;       // Connector test pins

    // Modport: dut_side
    // Signals directions when connecting to DUT
    modport dut_side (
        input   led_sfp_n,
        input   led_mgmt_n,
        input   led_copper_n,
        input   cpu_int_n,
        inout   cpu_spare,
        input   fan_enable,
        input   fan_ctrl,
        output  fan_tach,
        output  dying_gasp,
        input   dying_gasp_done,
        output  dry_contacts,
        inout   mezz_ctrl,
        output  pcb_rev,
        input   fpga_test
    );

    // Modport: hw_side
    // Signals directions when connecting to hardware devices
    modport hw_side (
        output  led_sfp_n,
        output  led_copper_n,
        output  led_mgmt_n,
        output  cpu_int_n,
        inout   cpu_spare,
        output  fan_enable,
        output  fan_ctrl,
        input   fan_tach,
        input   dying_gasp,
        output  dying_gasp_done,
        input   dry_contacts,
        inout   mezz_ctrl,
        input   pcb_rev,
        output  fpga_test
     );

endinterface

`endif
