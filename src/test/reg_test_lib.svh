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

//-----------------------------------------------------------------------
// Group: Register test library
//
// Individual testcases for each regblock.
// Note that CLI register block selection will fail with these testcases.
//-----------------------------------------------------------------------

// Macro for generating the testcase
`define FSX_REG_BLOCK_TEST(NAME, BLOCK)\
class reg_test_``NAME`` extends reg_test;\
     `uvm_component_utils(reg_test_``NAME``)\
    function new(string name=`"reg_test_``NAME```", uvm_component parent = null);\
        super.new(name, parent);\
    endfunction\
    function uvm_reg_block get_regmodel();\
        return env.regmodel.``BLOCK``;\
    endfunction\
endclass

`define FSX_REG_BLOCK_ARRAY_TEST(NAME, BLOCK)\
class reg_test_``NAME`` extends reg_test;\
    protected int unsigned iterator = 0;\
     `uvm_component_utils(reg_test_``NAME``)\
    function new(string name=`"reg_test_``NAME```", uvm_component parent = null);\
        super.new(name, parent);\
    endfunction\
    function uvm_reg_block get_regmodel();\
        return env.regmodel.``BLOCK``[iterator];\
    endfunction\
    virtual task main_phase(uvm_phase phase);\
        phase.raise_objection(this);\
        foreach(env.regmodel.``BLOCK``[i]) begin\
            super.main_phase(phase);\
            iterator++;\
        end\
        phase.drop_objection(this);\
    endtask\
endclass

//`define FSX_REG_BLOCK_ARRAY_TEST(BLOCK, IDX)\
//class reg_test_``BLOCK````IDX`` extends reg_test;\
//     `uvm_component_utils(reg_test_``BLOCK````IDX``)\
//    function new(string name=`"reg_test_``BLOCK````IDX```", uvm_component parent = null);\
//        super.new(name, parent);\
//    endfunction\
//    function uvm_reg_block get_regmodel();\
//        return env.regmodel.``BLOCK``[``IDX``];\
//    endfunction\
//endclass


// FIXME need to add new blocks!

`FSX_REG_BLOCK_TEST(globals, globals)
`FSX_REG_BLOCK_TEST(timebase, timebase)
`FSX_REG_BLOCK_TEST(cpu_bucket, cpu_bucket)
`FSX_REG_BLOCK_TEST(i2c, i2c)
`FSX_REG_BLOCK_TEST(platform_ctrl, platform_ctrl)
`FSX_REG_BLOCK_TEST(clock_ctrl, clock_ctrl)
`FSX_REG_BLOCK_TEST(mem_ctrl, mem_ctrl)
`FSX_REG_BLOCK_TEST(cos_mark_table_port, cos_mark_table_port)
`FSX_REG_BLOCK_TEST(acd_seq_checker_reg, acd_seq_checker_reg)
`FSX_REG_BLOCK_TEST(mac_if, mac_if)
`FSX_REG_BLOCK_ARRAY_TEST(mac10g_if, mac10g_if)
`FSX_REG_BLOCK_ARRAY_TEST(inspector, inspector)
`FSX_REG_BLOCK_TEST(phy_if_globals, phy_if.phy_if_global_registers)
`FSX_REG_BLOCK_TEST(pktgen, pktgen)
`FSX_REG_BLOCK_TEST(packet_capture, packet_capture)
`FSX_REG_BLOCK_TEST(bwp, bwp)
`FSX_REG_BLOCK_TEST(vid_pairing_table, vid_pairing_table)
`FSX_REG_BLOCK_TEST(class_stats, class_stats)
`FSX_REG_BLOCK_TEST(flowmeter, flowmeter)
`FSX_REG_BLOCK_TEST(vid_table, vid_table)
`FSX_REG_BLOCK_ARRAY_TEST(cos_pattern_tables, cos_pattern_tables)
`FSX_REG_BLOCK_TEST(action_map_tables, action_map_tables)
`FSX_REG_BLOCK_TEST(cos_action, cos_action)
`FSX_REG_BLOCK_TEST(cpu_monitor_action, cpu_monitor_action)
`FSX_REG_BLOCK_TEST(classifiers, classifiers)
`FSX_REG_BLOCK_TEST(tm_c2, tm_c2)
