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

`ifndef SAT_HSI_TEST__SVH
`define SAT_HSI_TEST__SVH

// Class: sat_hsi_test
// The testbench environment.
class sat_hsi_test extends fsx_test_base;

    `uvm_component_utils(sat_hsi_test)

    // Constructor
    function new(string name="sat_hsi_test", uvm_component parent=null);
        super.new(name, parent);
    endfunction

    // Send a packet per USER interface
    task main_phase(uvm_phase phase);
        acd_mm_rw item = new("item");

        phase.raise_objection(this);

        item.kind = acd_mm_rw::WRITE;

        //*** FLOW HEADER 5 ***//
        //root@C401-4910:root# ether -l 64 -R 0x10140
        item.addr = 'h10140; item.data = 'h0000000000000015; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10141; item.data = 'h000000000000AD12; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10142; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10143; item.data = 'h0000000000000015; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10144; item.data = 'h000000000000AD29; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10145; item.data = 'h0000000000002EE5; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10146; item.data = 'h0000000000008100; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10147; item.data = 'h0000000000000320; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10148; item.data = 'h0000000000008902; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10149; item.data = 'h000000000000E003; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h1014A; item.data = 'h0000000000030004; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h1014B; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h1014C; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h1014D; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h1014E; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h1014F; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10150; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10151; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10152; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10153; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10154; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10155; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10156; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10157; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10158; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10159; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h1015A; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h1015B; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h1015C; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h1015D; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h1015E; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h1015F; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10160; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10161; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10162; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10163; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10164; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10165; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10166; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10167; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10168; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10169; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h1016A; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h1016B; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h1016C; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h1016D; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h1016E; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h1016F; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10170; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10171; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10172; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10173; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10174; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10175; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10176; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10177; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10178; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10179; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h1017A; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h1017B; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h1017C; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h1017D; item.data = 'h0000000000000001; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h1017E; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h1017F; item.data = 'h0000000080060320; env.acd_mm.agent.sequencer.execute_item(item);

        //*** PADDING 5 *** //
        //root@C401-4910:root# ether -l 16 -R 0x10450
        item.addr = 'h10450; item.data = 'h0000000012345678; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10451; item.data = 'h0000000000000002; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10452; item.data = 'h0000000000000001; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10453; item.data = 'h0000000000F2D255; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10454; item.data = 'h00000052CB995350; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10455; item.data = 'h000000E8CC7A91CB; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10456; item.data = 'h0000000000000005; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10457; item.data = 'h0000000000000001; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10458; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h10459; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h1045A; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h1045B; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h1045C; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h1045D; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h1045E; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);
        item.addr = 'h1045F; item.data = 'h0000000000000000; env.acd_mm.agent.sequencer.execute_item(item);

        //*** SHAPPING 5 ***//
        //root@C401-4910:root# ether -l 16 -R 0x10850
       item.addr = 'h10850; item.data = 'h000000007FFFDEAA;  env.acd_mm.agent.sequencer.execute_item(item);
       item.addr = 'h10851; item.data = 'h0000000000000078;  env.acd_mm.agent.sequencer.execute_item(item);
       item.addr = 'h10852; item.data = 'h0000000000000000;  env.acd_mm.agent.sequencer.execute_item(item);
       item.addr = 'h10853; item.data = 'h0000000000000008;  env.acd_mm.agent.sequencer.execute_item(item);
       item.addr = 'h10854; item.data = 'h0000000000000000;  env.acd_mm.agent.sequencer.execute_item(item);
       item.addr = 'h10855; item.data = 'h0000000000000003;  env.acd_mm.agent.sequencer.execute_item(item);
       item.addr = 'h10856; item.data = 'hBAADBAADBAADBAAD;  env.acd_mm.agent.sequencer.execute_item(item);
       item.addr = 'h10857; item.data = 'hBAADBAADBAADBAAD;  env.acd_mm.agent.sequencer.execute_item(item);
       item.addr = 'h10858; item.data = 'h0000000000000000;  env.acd_mm.agent.sequencer.execute_item(item);
       item.addr = 'h10859; item.data = 'h00000000C009A6CC;  env.acd_mm.agent.sequencer.execute_item(item);
       item.addr = 'h1085A; item.data = 'h00000000BAADBAAD;  env.acd_mm.agent.sequencer.execute_item(item);
       item.addr = 'h1085B; item.data = 'h000000003CBC0000;  env.acd_mm.agent.sequencer.execute_item(item);
       item.addr = 'h1085C; item.data = 'h0000000028C15250;  env.acd_mm.agent.sequencer.execute_item(item);
       item.addr = 'h1085D; item.data = 'h00000000613890D8;  env.acd_mm.agent.sequencer.execute_item(item);
       item.addr = 'h1085E; item.data = 'h10040E0E000026FE;  env.acd_mm.agent.sequencer.execute_item(item);
       item.addr = 'h1085F; item.data = 'h0000000004000580;  env.acd_mm.agent.sequencer.execute_item(item);

        //*** ENA *** //
        //root@C401-4910:root# ether -r 0x108ff
        item.addr = 'h108FF; item.data = 'h04000580;         env.acd_mm.agent.sequencer.execute_item(item);

        #100us;

        phase.drop_objection(this);
    endtask

endclass

`endif


