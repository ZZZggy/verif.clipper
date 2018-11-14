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

`ifndef REG_INVALID_ADDR_TEST__SVH
`define REG_INVALID_ADDR_TEST__SVH

// Class: reg_invalid_addr_test
// Base register testcase
class reg_invalid_addr_test extends reg_test;
    `uvm_component_utils(reg_invalid_addr_test)

    // Constructor
    function new(string name="reg_invalid_addr_test", uvm_component parent = null);
        super.new(name, parent);
    endfunction


    virtual task main_phase(uvm_phase phase);
        acd_mm_raw_reg_sequence raw_seq = acd_mm_raw_reg_sequence::type_id::create("raw_seq", this);

        phase.raise_objection(this);

        // Read valid addresses
        raw_seq.kind = acd_mm_rw::READ;
        raw_seq.addr = 'ha100;
        raw_seq.start(env.acd_mm.agent.sequencer);

        // Read invalid addresses
        raw_seq.kind = acd_mm_rw::READ;
        raw_seq.addr = 'h8000;
        raw_seq.start(env.acd_mm.agent.sequencer);

        // Read valid addresses
        raw_seq.kind = acd_mm_rw::READ;
        raw_seq.addr = 'ha100;
        raw_seq.start(env.acd_mm.agent.sequencer);

        #100us;

        // Read valid addresses
        raw_seq.kind = acd_mm_rw::WRITE;
        raw_seq.addr = 'h0704;
        raw_seq.data = 'h0301;
        raw_seq.start(env.acd_mm.agent.sequencer);

        // Read valid addresses
        raw_seq.kind = acd_mm_rw::WRITE;
        raw_seq.addr = 'h0700;
        raw_seq.data = 'h0000000008000030;
        raw_seq.start(env.acd_mm.agent.sequencer);

        #100us;

        phase.drop_objection(this);
    endtask

endclass
`endif // REG_INVALID_ADDR_TEST__SVH

