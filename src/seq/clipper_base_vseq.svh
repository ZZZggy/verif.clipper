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

`ifndef CLIPPER_BASE_VSEQ__SVH
`define CLIPPER_BASE_VSEQ__SVH

// Creating a useful virtual sequence type:
typedef uvm_sequence#(uvm_sequence_item) uvm_virtual_sequence;

class clipper_base_vseq extends uvm_virtual_sequence;

    // Handle to ethernet sequencers on all ports
    ethernet_sqr_t cpu_sequencer;
    ethernet_sqr_t if_sequencer[NB_IF_PORTS];
    ethernet_sqr_t mgmt_sequencer;

    // Handle to regmodel
    c1lt_reg_block regmodel;

    `uvm_object_utils(clipper_base_vseq)
    function new(string name="clipper_base_vseq");
        super.new(name);
    endfunction

endclass

`endif