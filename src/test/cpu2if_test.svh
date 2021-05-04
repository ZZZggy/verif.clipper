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

class cpu2if_test extends clipper_test_base;

    int unsigned test_cfg_nb_iter = 3;

    `uvm_component_utils(cpu2if_test)

    function new(string name="cpu2if_test", uvm_component parent=null);
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

        phase.raise_objection(this);

        env_cfg.eth_sb_cfg[1].ena_sb = 0;


        //if (!std::randomize(ctrl_vif.timebase_time)) `randerr
        `uvm_info("TEST", $sformatf("Timebase forced to 0x%16h", ctrl_vif.timebase_time), UVM_LOW)


        env.regmodel.timebase.globals.local_time.read(status, data);
        env.regmodel.timebase.globals.pps_local_timestamp.read(status, data);
        env.regmodel.timebase.globals.ntp_time_offset.read(status, data);

        // Force static time

        env_cfg.predictor_cfg.cpu2x_cfg.compensation_ena = 1;

        // Setup sequence
        seq = thi_cpu2if_seq_t::type_id::create("seq", this);
        seq.NUM_USR_PRTS = NB_IF_PORTS;

        csum_seq = thi_cpu2if_csum_punch_seq_t::type_id::create("csum_seq", this);
        csum_seq.NUM_USR_PRTS = NB_IF_PORTS;

        // Multiple iterations of forcing a static time, then sending traffic
        for(int i=0; i<test_cfg_nb_iter; i++) begin

            // Launch sequence
            ctrl_vif.thi_ena = '1;
            if (!seq.randomize() with {id > 1; frame_count == cfg.stim_cnt_time_us; vtags_size_max==0;}) `randerr
            seq.start(env.rx_eth.agent[PORT_CPU].sequencer);

            if (!csum_seq.randomize() with {
                id > 1;
                inv_csum == csum_seq.zero_csum(ctrl_vif.timebase_time);
                vtags_size_max==0;
            }) `randerr
            csum_seq.start(env.rx_eth.agent[PORT_CPU].sequencer);

            eot_drain();

            ctrl_vif.thi_ena = '0;
            env.regmodel.timebase.globals.tod_ptp_timestamp.read(status, data);

        end

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
