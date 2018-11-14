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
// Description:
// Behavioral wrapper for memory controller and external memory.
// No work has been done to emulate any latency or busy.
//
//------------------------------------------------------------------------------

`ifndef CLIPPER_RAM_TOP_BEH__SV
`define CLIPPER_RAM_TOP_BEH__SV

module clipper_ram_top_beh #(NO_DELAY=1)
(
 acd_mm_if              reg_if,
 clipper_ram_top_int_if mem_app_if
 );

`include "uvm_macros.svh"
    import uvm_pkg::*;

    localparam ADDR_W = $bits(mem_app_if.bk_addr) + $bits(mem_app_if.row_col_addr);
    typedef bit[ADDR_W-1:0] addr_t;

    // memory
    bit[$bits(mem_app_if.wr_data)-1:0] mem[*];

    addr_t rw_addr;

    assign rw_addr = {mem_app_if.bk_addr, mem_app_if.row_col_addr};

    generate
        if (NO_DELAY) begin
            logic data_request_d1;
            addr_t wr_addr, wr_addr_d1;
            addr_t rd_addr;

            //--------------------------------------------
            // WRITE
            //--------------------------------------------
            always @(posedge mem_app_if.clk) begin
                if (mem_app_if.rst) begin
                end else begin
                    mem_app_if.data_request <= '0;

                    if (mem_app_if.wr_req) begin
                        wr_addr <= rw_addr;
                        mem_app_if.data_request <= '1;
                    end

                    data_request_d1 <= mem_app_if.data_request;
                    wr_addr_d1      <= wr_addr;

                    if (data_request_d1) begin
                        mem[wr_addr_d1] = mem_app_if.wr_data;
                    end
                end
            end

            //--------------------------------------------
            // READ
            //--------------------------------------------
            always @(posedge mem_app_if.clk) begin
                if (mem_app_if.rst) begin
                end else begin
                    mem_app_if.rd_data_rdy <= '0;

                    if (mem_app_if.rd_req) begin
                        mem_app_if.rd_data_rdy <= '1;
                        mem_app_if.rd_data <= mem[rw_addr];
                    end
                end
            end

        end else begin : MODEL_DELAY

            addr_t wr_addr_q[$];
            addr_t rd_addr_q[$];

            // Capture requests
            always @(posedge mem_app_if.clk) begin
                if (mem_app_if.rst) begin
                end else begin
                    if (mem_app_if.wr_req) begin
                        wr_addr_q.push_back(rw_addr);
                    end

                    if (mem_app_if.rd_req) begin
                        rd_addr_q.push_back(rw_addr);
                    end
                end
            end


            //--------------------------------------------
            // WRITE
            //--------------------------------------------

            task write_mem_dispatch();
                forever begin
                    if (wr_addr_q.size()) begin
                        write_mem(wr_addr_q.pop_front());
                    end else begin
                        @(posedge mem_app_if.clk);
                    end
                end
            endtask

            task write_mem(input addr_t addr);
                // Added delay to model command consumption
                mem_app_if.data_request <= '0;
                rand_wait(0,2);
                mem_app_if.data_request <= '1;
                @(posedge mem_app_if.clk);
                mem_app_if.data_request <= '0;
                @(posedge mem_app_if.clk);
                mem[addr] = mem_app_if.wr_data;
            endtask


            //--------------------------------------------
            // READ
            //--------------------------------------------

            task read_mem_dispatch();
                forever begin
                    if (rd_addr_q.size()) begin
                        read_mem(rd_addr_q.pop_front());
                    end else begin
                        @(posedge mem_app_if.clk);
                    end
                end
            endtask

            task read_mem(input addr_t raddr);
                // Added delay to model command consumption
                rand_wait(0,2);
                mem_app_if.rd_data_rdy <= '0;
                if (mem.exists(raddr)) begin
                    mem_app_if.rd_data_rdy <= '1;
                    mem_app_if.rd_data     <= mem[raddr];
                    @(posedge mem_app_if.clk);
                    mem_app_if.rd_data_rdy <= '0;
                    mem.delete(raddr);
                end else begin
                    `uvm_fatal("MEM_CTRL_BEH", $sformatf("Read from unwritten address: 0x%0h", raddr))
                end
            endtask


            // Random wait
            task rand_wait(int _min, int _max);
                automatic int randvar;
                randvar = {$random} % _max; // LRM 20.15.1
                if (randvar < _min) randvar = _min;
                repeat(randvar) @(posedge mem_app_if.clk);
            endtask

            //--------------------------------------------
            // MAIN ENTRY
            //--------------------------------------------
            initial begin
                fork
                    calibration();
                    write_mem_dispatch();
                    read_mem_dispatch();
                join
            end
        end
    endgenerate


    //--------------------------------------------
    // MAIN ENTRY
    //--------------------------------------------
    initial begin
        fork
            calibration();
        join
    end


    //--------------------------------------------
    // FLAGS
    //--------------------------------------------

    // Fake calibration
    task calibration();
        mem_app_if.cal_fail    <= '0;
        mem_app_if.cal_success <= '0;
        mem_app_if.init_done   <= '0;
        #(500 * 1ns);
        mem_app_if.cal_success <= '1;
        mem_app_if.init_done   <= '1;
    endtask


    // Other flags
    assign mem_app_if.busy          = '0;
    assign mem_app_if.req_bus_afull = '0;

    //--------------------------------------------
    // REG
    //--------------------------------------------
    always @(posedge reg_if.i_clk) begin
        if (reg_if.i_rst) begin

        end else begin
            reg_if.o_acd_mm_ack <= '0;
            reg_if.o_acd_mm_end <= '0;
            if (reg_if.i_acd_mm_ena) begin
                reg_if.o_acd_mm_ack <= '1;
                reg_if.o_acd_mm_end <= '1;
            end
        end
    end

    //--------------------------------------------
    // ASSERTIONS
    //--------------------------------------------

    // No concurrent RD/WR requests
    always @(posedge mem_app_if.clk) begin
        if (mem_app_if.rst) begin
        end else begin
            if (mem_app_if.rd_req && mem_app_if.wr_req) begin
                `uvm_fatal("MEM_CTRL_BEH", "Read and write collision!")
            end
        end
    end

endmodule
`endif