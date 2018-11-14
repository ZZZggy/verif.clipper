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

`ifndef SFP_CTRL_IF__SV
`define SFP_CTRL_IF__SV

// Interface: sfp_ctrl_if
// SFP control and status interface.
interface sfp_ctrl_if #(int NB_SFP=1) (
    input logic clk,
    input logic rst
);
    // Control
    logic [NB_SFP-1:0] ena_n;        // Power enable (active low)
    logic [NB_SFP-1:0] tx_disable;   // Tx_disable
    logic [NB_SFP-1:0] rate_sel [2]; // Rate select
    // Status
    logic [NB_SFP-1:0] detect_n;     // SFP_detect (active low)
    logic [NB_SFP-1:0] los;          // Loss of signal
    logic [NB_SFP-1:0] tx_fault;     // Tx_fault

    // Modport: dut_side
    // Signals directions when connecting to DUT
    modport dut_side (
        input   ena_n,
        input   tx_disable,
        input   rate_sel,
        output  detect_n,
        output  los,
        output  tx_fault
    );

    // Modport: hw_side
    // Signals directions when connecting to SFP devices
    modport sfp_side (
        output  ena_n,
        output  tx_disable,
        output  rate_sel,
        input   detect_n,
        input   los,
        input   tx_fault
     );

endinterface

`endif
