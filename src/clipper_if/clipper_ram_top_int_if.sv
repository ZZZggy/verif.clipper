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

`ifndef CLIPPER_RAM_TOP_INT_IF__SV
`define CLIPPER_RAM_TOP_INT_IF__SV

interface clipper_ram_top_int_if #
(
 int g_ram_req_units          = 4,
 int g_ram_burst_len          = 2,
 int g_rldram3_bank_add_width = 4,
 int g_rldram3_add_width      = 21,
 int g_rldram3_dm_width       = 2,
 int g_rldram3_dat_width      = 36,
 bit g_debug                  = 0
 ) ( /*no ports*/ );

    logic                                                           clk;           // out std_logic;
    logic                                                           rst;           // out std_logic;
    logic [g_ram_req_units*g_rldram3_bank_add_width-1:0]            bk_addr;       // in  std_logic_vector()
    logic [g_ram_req_units*g_rldram3_add_width-1:0]                 row_col_addr;  // in  std_logic_vector()
    logic [g_ram_req_units-1:0]                                     wr_req;        // in  std_logic_vector()
    logic [g_ram_req_units-1:0]                                     rd_req;        // in  std_logic_vector()
    logic [g_ram_req_units-1:0]                                     req_bus_afull; // out std_logic_vector()
    logic [g_ram_req_units-1:0]                                     busy;          // out std_logic_vector()
    logic [g_ram_req_units-1:0]                                     data_request;  // out std_logic_vector()
    logic [g_ram_req_units-1:0]                                     rd_data_rdy;   // out std_logic_vector()
    logic [g_ram_req_units*g_ram_burst_len*g_rldram3_dm_width-1:0]  dm;            // in  std_logic_vector()
    logic [g_ram_req_units*g_ram_burst_len*g_rldram3_dat_width-1:0] wr_data;       // in  std_logic_vector()
    logic [g_ram_req_units*g_ram_burst_len*g_rldram3_dat_width-1:0] rd_data;       // out std_logic_vector()
    logic                                                           cal_success;
    logic                                                           cal_fail;
    logic                                                           init_done;

    // TODO modports
    //modport master (...);
    //modport slave  (...);

    generate
        if (g_debug) begin : GEN_DEBUG
            // Write
            task write(input bit [g_ram_req_units*g_rldram3_bank_add_width-1:0]            bank,
                       input bit [g_ram_req_units*g_rldram3_add_width-1:0]                 row_col,
                       input bit [g_ram_req_units*g_ram_burst_len*g_rldram3_dat_width-1:0] data);
                @(negedge clk);
                bk_addr      = bank;
                row_col_addr = row_col;
                wr_data      = data;
                dm           = 'h0;
                wr_req       = '1;
                @(negedge clk);
                wr_req       = '0;
            endtask

            // Read
            task read(input bit [g_ram_req_units*g_rldram3_bank_add_width-1:0]            bank,
                      input bit [g_ram_req_units*g_rldram3_add_width-1:0]                 row_col,
                      input bit [g_ram_req_units*g_ram_burst_len*g_rldram3_dat_width-1:0] data);
                @(negedge clk);
                bk_addr      = bank;
                row_col_addr = row_col;
                dm           = 'h0;
                rd_req       = '1;
                @(negedge clk);
                rd_req       = '0;

                @(posedge rd_data_rdy);
                if (rd_data != data)
                    $error("[EXT_BUF] [bank %0h, row_col %0h] Expected %0h, Read %0h", bk_addr, row_col_addr, data, rd_data);
                else
                    $info("[EXT_BUF] [bank %0h, row_col %0h] Read OK %0h", bk_addr, row_col_addr, data);
            endtask // read
        end // block: GEN_DEBUG
    endgenerate


endinterface

`endif
