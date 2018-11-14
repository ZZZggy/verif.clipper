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

class cpu2if_test extends fsx_test_base;

    int unsigned test_cfg_nb_iter = 3;

    `uvm_component_utils(cpu2if_test)

    function new(string name="cpu2if_test", uvm_component parent=null);
        super.new(name, parent);

        if (!cfg.randomize()) `randerr
        cfg.stim_cnt_time_us =100;
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

        phase.raise_objection(this);

        // Disable PC
        env_cfg.pc_env_cfg.ena_eot_drain = 0;
        env.regmodel.packet_capture.cfg.ena.set(0);
        env.regmodel.packet_capture.cfg.keep_alive_ena.set(0);
        env.regmodel.packet_capture.cfg.update(status);

        // Force static time
        env.regmodel.timebase.ts_incr.write(status, 0);

        // Setup sequence
        seq = thi_cpu2if_seq_t::type_id::create("seq", this);
        seq.NUM_USR_PRTS = NB_IF_PORTS + 1 /*Management*/;

        csum_seq = thi_cpu2if_csum_punch_seq_t::type_id::create("csum_seq", this);
        csum_seq.NUM_USR_PRTS = NB_IF_PORTS + 1 /*Management*/;

        // Multiple iterations of forcing a static time, then sending traffic
        for(int i=0; i<test_cfg_nb_iter; i++) begin
            // Randomize time, forcing both fractional and nanosecond
            ctrl_vif.timebase_force = '1;
            begin
                bit[63:0] randtime;
                if (!std::randomize(randtime)) `randerr
                ctrl_vif.timebase_time = randtime;
            end
            //if (!std::randomize(ctrl_vif.timebase_time)) `randerr
            `uvm_info("TEST", $sformatf("Timebase forced to 0x%16h", ctrl_vif.timebase_time), UVM_LOW)

            // Launch sequence
            ctrl_vif.thi_ena = '1;
            if (!seq.randomize() with {frame_count == cfg.stim_cnt_time_us;}) `randerr
            seq.start(env.rx_eth.agent[PORT_CPU].sequencer);

            if (!csum_seq.randomize() with {
                inv_csum == csum_seq.zero_csum(ctrl_vif.timebase_time);
            }) `randerr
            csum_seq.start(env.rx_eth.agent[PORT_CPU].sequencer);

            eot_drain();

            ctrl_vif.thi_ena = '0;
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
