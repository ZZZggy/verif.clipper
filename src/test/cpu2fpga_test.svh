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

class cpu2fpga_test extends thi_cpu2fpga_test#(clipper_test_base);

    `uvm_component_utils(cpu2fpga_test)
    // Constructor: new
    function new(string name="cpu2fpga_test", uvm_component parent=null);
        super.new(name, parent);
    endfunction

    //---------------------------------------
    // Group: API implementation
    //---------------------------------------

    virtual function uvm_sequencer#(ethernet_frame) get_sequencer();
        return env.rx_eth.agent[0].sequencer;
    endfunction

    virtual function uvm_reg_block get_regmodel();
        return env.regmodel;
    endfunction

    virtual function uvm_reg_addr_t get_scratch_addr();
        return env.regmodel.globals.scratch.get_address();
    endfunction

    virtual function uvm_reg_addr_t get_unmapped_addr();
        return uvm_reg_addr_t'(9);
    endfunction

    virtual function uvm_reg_block get_reg_block();
        return env.regmodel.action_map_tables.p1;
    endfunction

    virtual function uvm_reg_block get_burst_reg_block();
        return env.regmodel.classifiers.p[0].pe[0];
    endfunction

    virtual function int get_port_id();
        return 0;
    endfunction

    //---------------------------------------
    // Group: Configuration override
    //---------------------------------------

    // Function: build_predictor
    // Override: tighten FPGA2CPU ~cmd_proc_time~ and ~timestamp~ tolerance
    virtual function void build_predictor_cfg();
        super.build_predictor_cfg();

        // THI CPU2x predictor
        env_cfg.predictor_cfg.cpu2x_cfg.tolerance_cmd_proc_time  = 'h1;    // with no congestion and default ~cmd_proc_time_range~ 60ns granularity
        env_cfg.predictor_cfg.cpu2x_cfg.tolerance_timestamp_fpga = 'h20;   // ~7.45ns - empiric value for FSX 1.1

//        env_cfg.predictor_cfg.cpu2x_cfg.compensation_ena = 0;

    endfunction // build_predictor_cfg

    //---------------------------------------
    // Group: Phase overrides
    //---------------------------------------

    // Setup before calling super.main_phase
    virtual task main_phase(uvm_phase phase);
        // Disable PC
        uvm_status_e status;
//        env_cfg.pc_env_cfg.ena_eot_drain = 0;
//        env.regmodel.packet_capture.cfg.ena.set(0);
//        env.regmodel.packet_capture.cfg.keep_alive_ena.set(0);
//        env.regmodel.packet_capture.cfg.update(status);


        env_cfg.predictor_cfg.cpu2x_cfg.compensation_timestamp_fpga = -(((env.regmodel.timebase.globals.ntp_time_offset_adjust.sec.get() + env.regmodel.timebase.globals.ntp_time_offset.sec.get()) << 32) - 'h2b8);

        // Enable ethernet THI path
        cfg.thi_ena = 1;
        ctrl_vif.thi_ena = '1;

        super.main_phase(phase);
    endtask


    // Disable ethernet THI path
    virtual task pre_shutdown_phase(uvm_phase phase);
        super.pre_shutdown_phase(phase);
        phase.raise_objection(this);
        ctrl_vif.thi_ena = '0;
        phase.drop_objection(this);
    endtask

endclass
