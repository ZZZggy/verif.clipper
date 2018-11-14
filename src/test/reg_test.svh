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

`ifndef REG_TEST__SVH
`define REG_TEST__SVH

//import vid_table_aux_reg_pkg::vid_table_aux_reg_block;
//import vid_table_traffic_reg_pkg::vid_table_traffic_reg_block;
//import cpu_bucket_reg_pkg::cpu_bucket_credit_reg;
//import tse_mac_rx_reg_pkg::rx_cfg_reg;
//import tse_mac_tx_reg_pkg::tx_cfg_reg;
//import timebase_reg_pkg::timebase_ts_updt_reg;
//import cos_actions_reg_pkg::action_index_cfg1_reg;

// Class: reg_test
// Base register testcase
class reg_test extends acd_reg_test#(clipper_test_base);
    `uvm_component_utils(reg_test)

    // Constructor
    function new(string name="reg_test", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    // Set type overrides for proper register behaviour
    virtual function void build_phase(uvm_phase phase);
//        set_type_override_by_type(vid_table_aux_reg_block::get_type(), vid_table_aux_reg_block_init::get_type(), 0);
//        set_type_override_by_type(vid_table_traffic_reg_block::get_type(), vid_table_traffic_reg_block_init::get_type(), 0);
//        set_type_override_by_type(cpu_bucket_credit_reg::get_type(), cpu_bucket_credit_reg_beh::get_type(), 0);
//        factory.set_inst_override_by_type(rx_cfg_reg::get_type(), rx_cfg_reg_cpu_beh::get_type(), "*regmodel.mac_if.tse_mac[0].rx.cfg");
//        factory.set_inst_override_by_type(tx_cfg_reg::get_type(), tx_cfg_reg_cpu_beh::get_type(), "*regmodel.mac_if.tse_mac[0].tx.cfg");
//        set_type_override_by_type(timebase_ts_updt_reg::get_type(), timebase_ts_updt_reg_beh::get_type(), 0);
//        set_type_override_by_type(action_index_cfg1_reg::get_type(), action_index_cfg1_reg_beh::get_type(), 0);

        super.build_phase(phase);
    endfunction

    // Disable FlowMeter
    virtual task reset_phase(uvm_phase phase);
        phase.raise_objection(this);
//        ctrl_vif.freeze_flowmeter_time = '1;
        phase.drop_objection(this);
        super.reset_phase(phase);
    endtask

    // Do not run defaults
    task pre_configure_phase(uvm_phase phase);
    endtask

    // Return the register model
    function uvm_reg_block get_regmodel();
        return env.regmodel;
    endfunction

    // Waive registers from tests
    virtual function void waive_registers();
        // Changing the link_status generates an unsolicited message towards the CPU
        // FIXME Should add predictor with a register callback to generate an expected frame...then we can remove this waive
//        uvm_resource_db#(bit)::set({"REG::", env.regmodel.globals.link_status_sw.get_full_name()}, "NO_REG_TESTS", 1'b1, null);

        // Only 16 CPU buckets exist
//        for(int i=16; i<$size(env.regmodel.cpu_bucket.credit); i++) begin
//            uvm_resource_db#(bit)::set({"REG::", env.regmodel.cpu_bucket.credit[i].get_full_name()}, "NO_REG_TESTS", 1'b1, null);
//        end

        // SPI
//        uvm_resource_db#(bit)::set({"REG::", env.regmodel.platform_ctrl.spi_9553.get_full_name()}, "NO_REG_TESTS", 1'b1, null);

        // PHY IF Globals
//        uvm_resource_db#(bit)::set({"REG::", env.regmodel.phy_if.phy_if_global_registers.phy_reset.get_full_name()}, "NO_REG_TESTS", 1'b1, null);
//        uvm_resource_db#(bit)::set({"REG::", env.regmodel.phy_if.phy_if_global_registers.poll_ctrl.get_full_name()}, "NO_REG_TESTS", 1'b1, null);
//        uvm_resource_db#(bit)::set({"REG::", env.regmodel.phy_if.phy_if_global_registers.reconfig_ctrl.get_full_name()}, "NO_REG_TESTS", 1'b1, null);

        // Memory controller: do not reset
//        uvm_resource_db#(bit)::set({"REG::", env.regmodel.mem_ctrl.phy_ctrl.get_full_name()}, "NO_REG_TESTS", 1'b1, null);

        // Disable PCE keep alive
//        env_cfg.pc_env_cfg.predictor_cfg.ena_keep_alive_check = 0;

        return;
    endfunction


    // No drain time required for register tests.
    virtual task eot_drain();
        #5us;
    endtask

endclass

`endif
