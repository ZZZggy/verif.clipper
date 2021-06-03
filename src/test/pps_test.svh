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

class pps_test extends clipper_test_base;

    int unsigned test_cfg_nb_iter = 3;

    `uvm_component_utils(pps_test)

    function new(string name="pps_test", uvm_component parent=null);
        super.new(name, parent);

        if (!cfg.randomize()) `randerr
        cfg.port_speed = '{default:PS_1G};
        cfg.stim_cnt_time_us =20;
        cli.get_cli_uint("+STIM_CNT_TIME_US=", cfg.stim_cnt_time_us);

        cli.get_cli_uint("+NB_ITER=", test_cfg_nb_iter);
    endfunction

    virtual task reset_phase(uvm_phase phase);
        phase.raise_objection(this);
        ctrl_vif.freeze_flowmeter_time = '1;
        phase.drop_objection(this);
        super.reset_phase(phase);
    endtask

    virtual task main_phase(uvm_phase phase);
        thi_cpu2if_seq_t seq;
        thi_cpu2if_csum_punch_seq_t csum_seq;
        uvm_status_e status;
        bit [31:0] data;
        bit [31:0] g_data[4];
        bit [31:0] pps_data[4];
        bit [63:0] g_time[4];

        phase.raise_objection(this);

        env_cfg.eth_sb_cfg[1].ena_sb = 0;

        @(negedge ctrl_vif.gps_fpga_clk);

        g_time[0] = ctrl_vif.free_run_timebase;
        env.regmodel.timebase.globals.local_time.read(status, g_data[0]);
        env.regmodel.timebase.globals.pps_local_timestamp.read(status, pps_data[0]);
        `ASSERT_MSG(PPSGpsTimeComp, g_time[0] == pps_data[0], $sformatf("PPS time should be match input time obs %0d, EXP %0d", pps_data[0], g_time[0]), UVM_HIGH)

        #9us;
        g_time[1] = $time();
        env.regmodel.timebase.globals.local_time.read(status, g_data[1]);
        env.regmodel.timebase.globals.pps_local_timestamp.read(status, pps_data[1]);
        `ASSERT_MSG(PPSGpsTime, pps_data[1] == pps_data[0], $sformatf("PPS time should be not updated between to gps clock edge obs T0 %0d, T1 %0d", pps_data[0], pps_data[1]), UVM_HIGH)

        @(negedge ctrl_vif.gps_fpga_clk);
        g_time[2] = ctrl_vif.free_run_timebase;
        env.regmodel.timebase.globals.local_time.read(status, g_data[2]);
        #1us;
        env.regmodel.timebase.globals.pps_local_timestamp.read(status, pps_data[2]);
        `ASSERT_MSG(PPSGpsTimeChg, pps_data[2] != pps_data[1] && pps_data[2] > g_data[2]-200 &&  pps_data[2] < g_data[2]+200, $sformatf("PPS time should be updated on gps clock edge Last Time %0d, new time %0d and exp time %0d", pps_data[1], pps_data[2], g_data[2]), UVM_HIGH)
        `ASSERT_MSG(PPSGpsTimeComp_a, g_time[2] == pps_data[2], $sformatf("PPS time should be match input time obs %0d, EXP %0d", pps_data[2], g_time[2]), UVM_HIGH)
        `ASSERT_MSG(PPSGpsTimeComp_n, g_time[0] != g_time[2], $sformatf("Time between 2 GPS clk should't not equal T0 %0d, T1 %0d", g_time[0], g_time[2]), UVM_HIGH)


        env.regmodel.timebase.globals.pps_ctrl.input_internal.set(1);
        env.regmodel.timebase.globals.pps_ctrl.update(status);
        g_time[0] = $time();
        env.regmodel.timebase.globals.local_time.read(status, g_data[0]);
        env.regmodel.timebase.globals.pps_local_timestamp.read(status, pps_data[0]);

        #20us;

        g_time[1] = $time();
        env.regmodel.timebase.globals.local_time.read(status, g_data[1]);
        env.regmodel.timebase.globals.pps_local_timestamp.read(status,  pps_data[1]);
        `ASSERT_MSG(PPSGpsTimeIn, pps_data[1] == pps_data[0], $sformatf("PPS time should be updated on intern pps and not change between  edge obs T0 %0d, T1 %0d", pps_data[0], pps_data[1]), UVM_HIGH)

        phase.drop_objection(this);
    endtask

    virtual task pre_shutdown_phase(uvm_phase phase);
        super.pre_shutdown_phase(phase);
        phase.raise_objection(phase);
        // Give register access back to acd_mm agent
        ctrl_vif.thi_ena = '0;
        phase.drop_objection(phase);
    endtask

endclass

