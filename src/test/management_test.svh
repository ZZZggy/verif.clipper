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

class management_test extends clipper_test_base;
    `uvm_component_utils(management_test)

    function new(string name="management_test", uvm_component parent=null);
        super.new(name, parent);
    endfunction

    virtual task main_phase(uvm_phase phase);
        intf_error_ethernet_seq_mixin#(ethernet_sequence_base) seq;

        phase.raise_objection(this);

        seq = intf_error_ethernet_seq_mixin#(ethernet_sequence_base)::type_id::create("seq", this);
        if(!seq.randomize() with {
            nb_item          == 50;
            p_id             == NB_ALL_PORTS-1; // last port is MGMT
            frame_size_min   == 64;
            frame_size_max   == 1536;
            vtags_size_min   == 0;
            vtags_size_max   == 3;
            err_dist         == 20;
        }) `uvm_fatal("RNDERR", "seq")
        seq.start(env.rx_eth.agent[NB_ALL_PORTS-1].sequencer);

        phase.drop_objection(this);
    endtask
endclass
