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

`ifndef READ_FLUSH_STATS_VSEQ__SVH
`define READ_FLUSH_STATS_VSEQ__SVH

// Class: read_flush_stats_vseq
// Sequence for reading Flush Stats registers
class read_flush_stats_vseq extends clipper_base_vseq;

    //------------------------------------
    // Group: Knobs
    //------------------------------------
	
    // Variable: reg_block     
    // Flush stats register block handle
    uvm_reg_block reg_block;

    //------------------------------------
    // Group: Object
    //------------------------------------

    // Variable: flush_stats
    // Flush stats values read from regmodel
    reg_info_t flush_stats;

    `uvm_object_utils(read_flush_stats_vseq)

    // Constructor: new
    function new(string name="read_flush_stats_vseq");
        super.new(name);
    endfunction

    //------------------------------------
    // Group: UVM overrides
    //------------------------------------

    // Task: body
    // Read flush stats registers and store values
    virtual task body();
        uvm_reg       regs[$];   // queue for all registers from the block
        uvm_status_e  status;

        // Get all the registers hierarchically
        reg_block.get_registers(regs, UVM_HIER);

        // Read all registers, creating bursts on consecutive addresses
        foreach(regs[i]) begin
            uvm_reg_addr_t addr    = regs[i].get_address();
            flush_stats[addr].name = regs[i].get_name();
            regs[i].read(status, flush_stats[addr].value);
        end
    endtask

    // Function: get_flush_stats
    // Return flush stats
    virtual function reg_info_t get_flush_stats();
        return flush_stats;
    endfunction

    // Function: convert2string
    // Stringfy
    virtual function string convert2string();
        string s = super.convert2string();
        foreach(flush_stats[addr]) begin
            $swrite(s, "%0s\n0x%8h %0s = 0x%0h", s, addr, flush_stats[addr].name, flush_stats[addr].value);
        end
        return s;
    endfunction

endclass

`endif
