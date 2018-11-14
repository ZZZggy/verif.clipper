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

`ifndef CLIPPER_RAM_TOP__SV
`define CLIPPER_RAM_TOP__SV

//------------------------------------------------------------------------------
// Wrapper for RLDRAM controller(s) and external mem(s).
//------------------------------------------------------------------------------
module clipper_ram_top_wrp
#(
  NB_RLDRAM3      = 2,  // Number of external RLDRAM3 memory modules
  ENA_MEM_TEST    = 1'b1,
  RLDRAM3_BANK_AW = 4,  // RTL: g_rldram3_bank_add_width
  RLDRAM3_AW      = 21, // RTL: g_rldram3_add_width
  RLDRAM3_DW      = 36, // RTL: g_rldram3_dat_width
  RLDRAM3_QK_W    = 4,  // RTL: g_rldram3_qk_width
  RLDRAM3_DK_W    = 2,  // RTL: g_rldram3_dk_width
  RLDRAM3_DM_W    = 2,  // RTL: g_rldram3_dm_width
  RLDRAM3_QVLD_W  = 2,  // RTL: g_rldram3_qvld_width
  IF_DATA_WIDTH   = 8,  // acd_mm interface datawidth data width for acd_mm in number of bytes
  MA_ADDR_WIDTH   = 20, // Master number of address bit
  MA_DATA_WIDTH   = 8,  // Master data width, it define the number of beat needed to transfer the data
  ACK_LATENCY     = 10, // Number of clock cycles for end-point to respond to a transfer beat
  MA_MAX_PENDING  = 1   // Burst length
  )
(
 acd_mm_if                reg_if,
 clipper2_ram_top_int_if  ram_top_if[2],
 input logic              reset,
 input logic              ref_clk_t,
 input logic              ref_clk_b
 );

    clipper_ram_top_int_if#
    (
     .g_ram_req_units          (4                       ),
     .g_ram_burst_len          (2                       ),
     .g_rldram3_bank_add_width (4                       ),
     .g_rldram3_add_width      (21                      ),
     .g_rldram3_dm_width       (2                       ),
     .g_rldram3_dat_width      (36                      )
     ) unused_ram_top_if[1]();

    //--------------------------------------------------------------------------
    // External RLDRAM3 memory interface
    //--------------------------------------------------------------------------
    mem_subsys_if #
    (
     .NB_CLK     (1),
     .MEM_RANKS  (1),
     .BA_WIDTH   (RLDRAM3_BANK_AW),
     .ADDR_WIDTH (RLDRAM3_AW),
     .DK_WIDTH   (RLDRAM3_DK_W),
     .DM_WIDTH   (RLDRAM3_DM_W),
     .DQ_WIDTH   (RLDRAM3_DW),
     .DQS_WIDTH  (RLDRAM3_QK_W),
     .QVLD_WIDTH (RLDRAM3_QVLD_W)
     ) ram_if [1 : NB_RLDRAM3] (/*no ports*/);
    
    //--------------------------------------------------------------------------
    // Clipper RAM Top
    //--------------------------------------------------------------------------
    clipper2_ram_top#
    (
     //.g_technology             (), // integer := c_altera_stratix5;  -- Use value from technologies_physical_const_pkg
     //.g_synthesis              (), // integer := 1;
     .g_enable_mem_test        (ENA_MEM_TEST), // integer := 1;
     .g_rldram3_bank_add_width (RLDRAM3_BANK_AW), // integer := 4;
     .g_rldram3_add_width      (RLDRAM3_AW), // integer := 21;  -- Connect NF(A19) & NF(A20) pins to allow for possible futur depth expansion
     .g_rldram3_dat_width      (RLDRAM3_DW), // integer := 36;
     //.g_rldram3_qk_width       (), // integer := 4;
     //.g_rldram3_dk_width       (), // integer := 2;
     //.g_rldram3_dm_width       (), // integer := 2;
     //.g_rldram3_qvld_width     (), // integer := 2;
     .g_ram_req_units          (4), // integer := 4;
     .g_ram_burst_len          (2), // integer := 2;
     .g_IfDataWidth            (IF_DATA_WIDTH ), // integer := 2;   -- acd_mm interface datawidth data width for acd_mm in number of bytes
     .g_MaAddrWidth            (MA_ADDR_WIDTH ), // integer := 8;  -- Master number of address bit
     .g_MaDataWidth            (MA_DATA_WIDTH ), // integer := 8;   -- Master data width, it define the number of beat needed to transfer the data
     .g_MaxPending             (MA_MAX_PENDING), // integer := 1;   -- Burst length
     .g_EpDataWidth            (MA_DATA_WIDTH ), // integer := 4;   -- End point data width in bytes granularity
     .g_EpAddrWidth            (MA_ADDR_WIDTH ), // integer := 8;   -- End point address width.
     .g_EpAckLantency          (ACK_LATENCY   )  // integer := 10   -- Enp point maximum ack latency (0 to disable the timer) (after the latency a end will be generated to terminate the data transfer)
     ) wrp
    (
     .i_reset        (reset       ), // in  std_logic; -- Main reset
     .i_acd_mm_reset (reg_if.i_rst), // in  std_logic; -- Register interface reset
     .i_acd_mm_clk   (reg_if.i_clk), // in  std_logic; -- Register interface clk
     .i_ref_clk_t    (ref_clk_t   ), // in  std_logic; -- Top (ram 3&4) reference clock
     .i_ref_clk_b    (ref_clk_b   ), // in  std_logic; -- Bottom (ram 1&2) reference clock
     //---------------------------------------------------------------------------
     //-- External RLDRAM3 Interfaces
     //---------------------------------------------------------------------------
     //-- Mem interface 1 (FPGA Bank 3, bottom)
     .o_mem_1_reset_n (ram_if[1].rst_n), // out std_logic;
     .o_mem_1_ck      (ram_if[1].clk_p), // out std_logic;
     .o_mem_1_ck_n    (ram_if[1].clk_n), // out std_logic;
     .o_mem_1_cs_n    (ram_if[1].cs_n ), // out std_logic;
     .o_mem_1_we_n    (ram_if[1].we_n ), // out std_logic;
     .o_mem_1_ref_n   (ram_if[1].ref_n), // out std_logic;
     .o_mem_1_ba      (ram_if[1].ba   ), // out std_logic_vector(g_rldram3_bank_add_width-1 downto 0);
     .o_mem_1_a       (ram_if[1].addr ), // out std_logic_vector(g_rldram3_add_width-1 downto 0);
     .o_mem_1_dk      (ram_if[1].dk   ), // out   std_logic_vector(g_rldram3_dk_width-1 downto 0);
     .o_mem_1_dk_n    (ram_if[1].dk_n ), // out   std_logic_vector(g_rldram3_dk_width-1 downto 0);
     .o_mem_1_dm      (ram_if[1].dm   ), // out   std_logic_vector(g_rldram3_dm_width-1 downto 0);
     .b_mem_1_dq      (ram_if[1].dq   ), // inout std_logic_vector(g_rldram3_dat_width-1 downto 0);
     .i_mem_1_qvld    (ram_if[1].qvld ), // in    std_logic_vector(g_rldram3_dm_width-1 downto 0);
     .i_mem_1_qk      (ram_if[1].dqs  ), // in    std_logic_vector(g_rldram3_qk_width-1 downto 0);
     .i_mem_1_qk_n    (ram_if[1].dqs_n), // in    std_logic_vector(g_rldram3_qk_width-1 downto 0);
     //---------------------------------------------------------------------------
     //-- Mem interface 2 (FPGA Bank 4, bottom)
     .o_mem_2_reset_n (ram_if[2].rst_n), // out std_logic;
     .o_mem_2_ck      (ram_if[2].clk_p), // out std_logic;
     .o_mem_2_ck_n    (ram_if[2].clk_n), // out std_logic;
     .o_mem_2_cs_n    (ram_if[2].cs_n ), // out std_logic;
     .o_mem_2_we_n    (ram_if[2].we_n ), // out std_logic;
     .o_mem_2_ref_n   (ram_if[2].ref_n), // out std_logic;
     .o_mem_2_ba      (ram_if[2].ba   ), // out std_logic_vector(g_rldram3_bank_add_width-1 downto 0);
     .o_mem_2_a       (ram_if[2].addr ), // out std_logic_vector(g_rldram3_add_width-1 downto 0);
     .o_mem_2_dk      (ram_if[2].dk   ), // out   std_logic_vector(g_rldram3_dk_width-1 downto 0);
     .o_mem_2_dk_n    (ram_if[2].dk_n ), // out   std_logic_vector(g_rldram3_dk_width-1 downto 0);
     .o_mem_2_dm      (ram_if[2].dm   ), // out   std_logic_vector(g_rldram3_dm_width-1 downto 0);
     .b_mem_2_dq      (ram_if[2].dq   ), // inout std_logic_vector(g_rldram3_dat_width-1 downto 0);
     .i_mem_2_qvld    (ram_if[2].qvld ), // in    std_logic_vector(g_rldram3_dm_width-1 downto 0);
     .i_mem_2_qk      (ram_if[2].dqs  ), // in    std_logic_vector(g_rldram3_qk_width-1 downto 0);
     .i_mem_2_qk_n    (ram_if[2].dqs_n), // in    std_logic_vector(g_rldram3_qk_width-1 downto 0);
     //---------------------------------------------------------------------------
     //-- Mem interface 3 (FPGA Bank 7, top)
     .o_mem_3_reset_n (/*ram_if[3].rst_n*/), // out std_logic;
     .o_mem_3_ck      (/*ram_if[3].clk_p*/), // out std_logic;
     .o_mem_3_ck_n    (/*ram_if[3].clk_n*/), // out std_logic;
     .o_mem_3_cs_n    (/*ram_if[3].cs_n */), // out std_logic;
     .o_mem_3_we_n    (/*ram_if[3].we_n */), // out std_logic;
     .o_mem_3_ref_n   (/*ram_if[3].ref_n*/), // out std_logic;
     .o_mem_3_ba      (/*ram_if[3].ba   */), // out std_logic_vector(g_rldram3_bank_add_width-1 downto 0);
     .o_mem_3_a       (/*ram_if[3].addr */), // out std_logic_vector(g_rldram3_add_width-1 downto 0);
     .o_mem_3_dk      (/*ram_if[3].dk   */), // out   std_logic_vector(g_rldram3_dk_width-1 downto 0);
     .o_mem_3_dk_n    (/*ram_if[3].dk_n */), // out   std_logic_vector(g_rldram3_dk_width-1 downto 0);
     .o_mem_3_dm      (/*ram_if[3].dm   */), // out   std_logic_vector(g_rldram3_dm_width-1 downto 0);
     .b_mem_3_dq      (/*ram_if[3].dq   */), // inout std_logic_vector(g_rldram3_dat_width-1 downto 0);
     .i_mem_3_qvld    (/*ram_if[3].qvld */), // in    std_logic_vector(g_rldram3_dm_width-1 downto 0);
     .i_mem_3_qk      (/*ram_if[3].dqs  */), // in    std_logic_vector(g_rldram3_qk_width-1 downto 0);
     .i_mem_3_qk_n    (/*ram_if[3].dqs_n*/), // in    std_logic_vector(g_rldram3_qk_width-1 downto 0);
     //---------------------------------------------------------------------------
     //-- Mem interface 4 (FPGA Bank 8, top)
     .o_mem_4_reset_n (/*ram_if[4].rst_n*/), // out std_logic;
     .o_mem_4_ck      (/*ram_if[4].clk_p*/), // out std_logic;
     .o_mem_4_ck_n    (/*ram_if[4].clk_n*/), // out std_logic;
     .o_mem_4_cs_n    (/*ram_if[4].cs_n */), // out std_logic;
     .o_mem_4_we_n    (/*ram_if[4].we_n */), // out std_logic;
     .o_mem_4_ref_n   (/*ram_if[4].ref_n*/), // out std_logic;
     .o_mem_4_ba      (/*ram_if[4].ba   */), // out std_logic_vector(g_rldram3_bank_add_width-1 downto 0);
     .o_mem_4_a       (/*ram_if[4].addr */), // out std_logic_vector(g_rldram3_add_width-1 downto 0);
     .o_mem_4_dk      (/*ram_if[4].dk   */), // out   std_logic_vector(g_rldram3_dk_width-1 downto 0);
     .o_mem_4_dk_n    (/*ram_if[4].dk_n */), // out   std_logic_vector(g_rldram3_dk_width-1 downto 0);
     .o_mem_4_dm      (/*ram_if[4].dm   */), // out   std_logic_vector(g_rldram3_dm_width-1 downto 0);
     .b_mem_4_dq      (/*ram_if[4].dq   */), // inout std_logic_vector(g_rldram3_dat_width-1 downto 0);
     .i_mem_4_qvld    (/*ram_if[4].qvld */), // in    std_logic_vector(g_rldram3_dm_width-1 downto 0);
     .i_mem_4_qk      (/*ram_if[4].dqs  */), // in    std_logic_vector(g_rldram3_qk_width-1 downto 0);
     .i_mem_4_qk_n    (/*ram_if[4].dqs_n*/), // in    std_logic_vector(g_rldram3_qk_width-1 downto 0);
     //---------------------------------------------------------------------------
     //-- Internal interface
     //---------------------------------------------------------------------------
     .o_ram_1_2_clk         (ram_top_if[0].clk          ), // out std_logic;
     .o_ram_1_2_rst         (ram_top_if[0].rst          ), // out std_logic;
     .i_ram_1_bk_addr       (ram_top_if[0].bk_addr      ), // in  std_logic_vector(g_ram_req_units*g_rldram3_bank_add_width-1 downto 0);
     .i_ram_1_row_col_addr  (ram_top_if[0].row_col_addr ), // in  std_logic_vector(g_ram_req_units*g_rldram3_add_width-1 downto 0);
     .i_ram_1_wr_req        (ram_top_if[0].wr_req       ), // in  std_logic_vector(g_ram_req_units-1 downto 0);
     .i_ram_1_rd_req        (ram_top_if[0].rd_req       ), // in  std_logic_vector(g_ram_req_units-1 downto 0);
     .o_ram_1_req_bus_afull (ram_top_if[0].req_bus_afull), // out std_logic_vector(g_ram_req_units-1 downto 0);
     .o_ram_1_busy          (ram_top_if[0].busy         ), // out std_logic_vector(g_ram_req_units-1 downto 0);
     .o_ram_1_data_request  (ram_top_if[0].data_request ), // out std_logic_vector(g_ram_req_units-1 downto 0);
     .o_ram_1_rd_data_rdy   (ram_top_if[0].rd_data_rdy  ), // out std_logic_vector(g_ram_req_units-1 downto 0);
     .i_ram_1_dm            (ram_top_if[0].dm           ), // in  std_logic_vector(g_ram_req_units * g_ram_burst_len * g_rldram3_dm_width-1 downto 0);
     .i_ram_1_wr_data       (ram_top_if[0].wr_data      ), // in  std_logic_vector(g_ram_req_units * g_ram_burst_len * g_rldram3_dat_width-1 downto 0);
     .o_ram_1_rd_data       (ram_top_if[0].rd_data      ), // out std_logic_vector(g_ram_req_units * g_ram_burst_len * g_rldram3_dat_width-1 downto 0);
     //---------------------------------------------------------------------------
     .i_ram_2_bk_addr       (ram_top_if[1].bk_addr      ), // in  std_logic_vector(g_ram_req_units*g_rldram3_bank_add_width-1 downto 0);
     .i_ram_2_row_col_addr  (ram_top_if[1].row_col_addr ), // in  std_logic_vector(g_ram_req_units*g_rldram3_add_width-1 downto 0);
     .i_ram_2_wr_req        (ram_top_if[1].wr_req       ), // in  std_logic_vector(g_ram_req_units-1 downto 0);
     .i_ram_2_rd_req        (ram_top_if[1].rd_req       ), // in  std_logic_vector(g_ram_req_units-1 downto 0);
     .o_ram_2_req_bus_afull (ram_top_if[1].req_bus_afull), // out std_logic_vector(g_ram_req_units-1 downto 0);
     .o_ram_2_busy          (ram_top_if[1].busy         ), // out std_logic_vector(g_ram_req_units-1 downto 0);
     .o_ram_2_data_request  (ram_top_if[1].data_request ), // out std_logic_vector(g_ram_req_units-1 downto 0);
     .o_ram_2_rd_data_rdy   (ram_top_if[1].rd_data_rdy  ), // out std_logic_vector(g_ram_req_units-1 downto 0);
     .i_ram_2_dm            (ram_top_if[1].dm           ), // in  std_logic_vector(g_ram_req_units * g_ram_burst_len * g_rldram3_dm_width-1 downto 0);
     .i_ram_2_wr_data       (ram_top_if[1].wr_data      ), // in  std_logic_vector(g_ram_req_units * g_ram_burst_len * g_rldram3_dat_width-1 downto 0);
     .o_ram_2_rd_data       (ram_top_if[1].rd_data      ), // out std_logic_vector(g_ram_req_units * g_ram_burst_len * g_rldram3_dat_width-1 downto 0);
     //-- Terminations calibration control
     .i_rzq_1v2             (1'b0), // in std_logic;
     //---------------------------------------------------------------------------
     //-- Registers access
     .i_acd_mm_addr   (reg_if.i_acd_mm_addr  ), // in  std_logic_vector(g_MaAddrWidth-1 downto 0);
     .i_acd_mm_wrdata (reg_if.i_acd_mm_wrdata), // in  std_logic_vector(g_IfDataWidth*8-1 downto 0);
     .i_acd_mm_wr     (reg_if.i_acd_mm_wr    ), // in  std_logic;    -- 1: write; 0: read
     .i_acd_mm_bcnt   (reg_if.i_acd_mm_bcnt  ), // in  std_logic_vector(acd_max(1, log2(g_MaDataWidth/g_IfDataWidth))-1 downto 0);
     .i_acd_mm_ena    (reg_if.i_acd_mm_ena   ), // in  std_logic;    -- transfer enable
     .o_acd_mm_rddata (reg_if.o_acd_mm_rddata), // out std_logic_vector(g_IfDataWidth*8-1 downto 0);
     .o_acd_mm_ack    (reg_if.o_acd_mm_ack   ), // out std_logic;    -- ack the beat transfer.
     .o_acd_mm_end    (reg_if.o_acd_mm_end   ), // out std_logic;    -- allow to end a transfer
     //---------------------------------------------------------------------------
     //-- Debug bus
     .o_calibration_success ({unused_ram_top_if[0].cal_success, ram_top_if[1].cal_success, ram_top_if[0].cal_success}), // out std_logic_vector(1 downto 0);
     .o_calibration_fail    ({unused_ram_top_if[0].cal_fail,    ram_top_if[1].cal_fail,    ram_top_if[0].cal_fail}   ), // out std_logic_vector(1 downto 0);
     .o_init_done           ({unused_ram_top_if[0].init_done,   ram_top_if[1].init_done,   ram_top_if[0].init_done}  )  // out std_logic_vector(1 downto 0)
     );

    //--------------------------------------------------------------------------
    // External memory
    //--------------------------------------------------------------------------
    generate
        begin : GEN_RAM_SUBSYS
            // Memory model wrapper
            mem_subsys_wrp #
            (
             .NB_MEM_IF  (NB_RLDRAM3),
             .NB_CLK     (1),
             .MEM_RANKS  (1),
             .BA_WIDTH   (RLDRAM3_BANK_AW),
             .ADDR_WIDTH (RLDRAM3_AW),
             .DK_WIDTH   (RLDRAM3_DK_W),
             .DM_WIDTH   (RLDRAM3_DM_W),
             .DQ_WIDTH   (RLDRAM3_DW),
             .DQS_WIDTH  (RLDRAM3_QK_W),
             .QVLD_WIDTH (RLDRAM3_QVLD_W)
             ) mem_subsys
            (
             .model_reset ('0),
             .mem         (ram_if)
             );
        end
    endgenerate

endmodule
`endif
