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

`ifndef MEM_SUBSYS_IF__SV
`define MEM_SUBSYS_IF__SV

// Interface: mem_subsys_if
// Northwest Logic Memory Subsystem interface
interface mem_subsys_if #(
    int NB_CLK     = 1,
    int MEM_RANKS  = 1,
    int BA_WIDTH   = 1,
    int ADDR_WIDTH = 22,
    int DK_WIDTH   = 1,
    int DM_WIDTH   = 1,
    int DQ_WIDTH   = 1,
    int DQS_WIDTH  = 1, // QK_WIDTH in RLDRAM3
    int QVLD_WIDTH = 1
) ( /*no ports*/ );

                                   // mem_subsystem ports:
    logic                  rst_n;  // input  mem_reset_n
    logic [NB_CLK-1:0]     clk_p;  // input  mem_clk_p
    logic [NB_CLK-1:0]     clk_n;  // input  mem_clk_n
    logic [MEM_RANKS-1:0]  clk_en; // input  mem_cke
    logic [MEM_RANKS-1:0]  odt;    // input  mem_odt
    logic [MEM_RANKS-1:0]  cs_n;   // input  mem_cs_n
    logic [ADDR_WIDTH-1:0] addr;   // input  mem_sa
    logic [BA_WIDTH-1:0]   ba;     // input  mem_ba
    logic [DM_WIDTH-1:0]   dm;     // input  mem_dm
    logic                  ras_n;  // input  mem_ras_n
    logic                  cas_n;  // input  mem_cas_n
    logic                  we_n;   // input  mem_we_n
    // IOs
    tri   [DQ_WIDTH-1:0]   dq;     // inout  mem_dq
    tri   [DQS_WIDTH-1:0]  dqs;    // inout  mem_dqs   - qk   in RLDRAM3
    tri   [DQS_WIDTH-1:0]  dqs_n;  // inout  mem_dqs_n - qk_n in RLDRAM3
    // RLDRAM Memory Additional Ports
    logic [QVLD_WIDTH-1:0] qvld;   // output mem_qvld
    logic [DK_WIDTH-1:0]   dk;     // input  mem_dk
    logic [DK_WIDTH-1:0]   dk_n;   // input  mem_dk
    logic                  ref_n;  // input  mem_ref_n
    // ECC DIMM Support
    logic                  qerr_n; // output mem_qerr_n
    logic                  par_in; // input  mem_par_in

    // Modport: master
    // Signal directions when connecting to memory controller
    modport master (
        input   rst_n,
        input   clk_p,
        input   clk_n,
        input   clk_en,
        input   odt,
        input   cs_n,
        input   addr,
        input   ba,
        input   dm,
        input   ras_n,
        input   cas_n,
        input   we_n,
        inout   dq,
        inout   dqs,
        inout   dqs_n,
        output  qvld,
        input   dk,
        input   dk_n,
        input   ref_n,
        output  qerr_n,
        input   par_in
    );

    // Modport: slave
    // Signal directions when connecting to memory model
    modport slave (
        output  rst_n,
        output  clk_p,
        output  clk_n,
        output  clk_en,
        output  odt,
        output  cs_n,
        output  addr,
        output  ba,
        output  dm,
        output  ras_n,
        output  cas_n,
        output  we_n,
        inout   dq,
        inout   dqs,
        inout   dqs_n,
        input   qvld,
        output  dk,
        output  dk_n,
        output  ref_n,
        input   qerr_n,
        output  par_in
    );

endinterface

`endif // MEM_SUBSYS_IF__SV
