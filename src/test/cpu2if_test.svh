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

class thi_cpu2if_ts_copy_seq_t extends thi_cpu2if_csum_punch_seq_t;

    rand int unsigned if_dst;

    `uvm_object_utils(thi_cpu2if_ts_copy_seq_t)


    constraint c1 {
        if_dst inside {[1:NUM_USR_PRTS]};
    };

    //---------------------------------------------------------------------------------
    // Constructor
    //---------------------------------------------------------------------------------
    function new(string name="thi_cpu2if_ts_copy_seq_t");
        super.new(name);
    endfunction

    //---------------------------------------------------------------------------------
    // body
    //---------------------------------------------------------------------------------
    virtual task body();
        int frame_id = 0;

        `uvm_info("SEQ", "Entering body", UVM_HIGH)
        cpu2if = thi_if_frame_t::type_id::create("cpu2if");

            `uvm_info("SEQ", $sformatf("Starting frame_id: %0d", frame_id), UVM_DEBUG)
            start_item(cpu2if);

            if (!(cpu2if.randomize() with {
                solve vtags_size before payload_size;
                thi_vtag.tpid      == thi_uvm_pkg::THI_TPID_CPU2X;
                info.if_src_dst    == if_dst;

                info.punch_tstamp  == 1;
                info.tstamp_format == 0;

                info.copy_tstamp   == 1;

                info.punch_csum    == 1;
                xtra_info.inv_csum == inv_csum;

                vtags_size inside {[local::vtags_size_min : local::vtags_size_max]};

                // CPU MRU: 1518
                // 1518-16(THI info)-4(FCS)-12(MAC addresses)-2(Ethertype)=1484 untagged
                payload_size inside {[(local::frame_size_min - 34 - vtags_size*VTAG_BSIZE) :
                                      (local::frame_size_max - 34 - vtags_size*VTAG_BSIZE)]};
            })) `randerr
            cpu2if.frame_id = frame_id+1;
            cpu2if.p_id = id;
            finish_item(cpu2if);
            frame_id++;
    endtask // body


endclass


class cpu2if_test extends clipper_test_base;

    int unsigned test_cfg_nb_iter = 20;

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
        thi_cpu2if_ts_copy_seq_t csum_seq;

        phase.raise_objection(this);

        env_cfg.eth_sb_cfg[1].ena_sb = 0;

        //if (!std::randomize(ctrl_vif.timebase_time)) `randerr
        `uvm_info("TEST", $sformatf("Timebase forced to 0x%16h", ctrl_vif.timebase_time), UVM_HIGH)

        // Force static time

        env_cfg.predictor_cfg.cpu2x_cfg.compensation_ena = 1;

        // Setup sequence
        seq = thi_cpu2if_seq_t::type_id::create("seq", this);
        seq.NUM_USR_PRTS = NB_IF_PORTS;

        csum_seq = thi_cpu2if_ts_copy_seq_t::type_id::create("csum_seq", this);
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


class cpu2if_tod_rec_test extends clipper_test_base;

    int unsigned test_cfg_nb_iter = 50;

    `uvm_component_utils(cpu2if_tod_rec_test)

    function new(string name="cpu2if_tod_rec_test", uvm_component parent=null);
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
        thi_cpu2if_ts_copy_seq_t csum_seq;
        uvm_status_e status;
        bit [31:0] data;
        int frame_id;

        phase.raise_objection(this);

        env_cfg.eth_sb_cfg[1].ena_sb = 0;

        //if (!std::randomize(ctrl_vif.timebase_time)) `randerr
        `uvm_info("TEST", $sformatf("Timebase forced to 0x%16h", ctrl_vif.timebase_time), UVM_LOW)


        env.regmodel.timebase.globals.local_time.read(status, data);
        env.regmodel.timebase.globals.pps_local_timestamp.read(status, data);
        env.regmodel.timebase.globals.ntp_time_offset.read(status, data);

        env.regmodel.timebase.globals.tod_ptp_timestamp.read(status, data);

        // Force static time

        env_cfg.predictor_cfg.cpu2x_cfg.compensation_ena = 1;
        env_cfg.ts_cpy_cfg.ena                           = 1;

        // Setup sequence
        seq = thi_cpu2if_seq_t::type_id::create("seq", this);
        seq.NUM_USR_PRTS = NB_IF_PORTS;

        csum_seq = thi_cpu2if_ts_copy_seq_t::type_id::create("csum_seq", this);
        csum_seq.NUM_USR_PRTS = NB_IF_PORTS;

        for(int i=0; i < NB_IF_PORTS; i++) begin
            env.regmodel.timebase.compensations[2*i+0].time_offset.fract.set('h0); // toa
            env.regmodel.timebase.compensations[2*i+1].time_offset.fract.set('h0); // tod mac comp
        end

        foreach(env.regmodel.timebase.compensations[i]) begin
            env.regmodel.timebase.compensations[i].update(status);
        end

        // Multiple iterations of forcing a static time, then sending traffic
        for(int i=0; i<test_cfg_nb_iter; i++) begin

            if (!csum_seq.randomize() with {
                id > 1;
                inv_csum == csum_seq.zero_csum(ctrl_vif.timebase_time);
                vtags_size_max==0;
            }) `randerr

            frame_id = csum_seq.if_dst-1;

            if(frame_id<5) begin
                env.regmodel.timebase.compensations[(2*frame_id+0)].time_offset.fract.set('hFF283); // toa
                env.regmodel.timebase.compensations[(2*frame_id+1)].time_offset.fract.set('h406); // tod mac comp
            end else if (frame_id<9) begin
                if (ctrl_vif.port_speed[i]==mac_pkg::PS_1G) begin
                    //TODO SM: Should it be FE7 to take into factor when clock are not aligned and toggle bit crosses clock domains in 1 clock cycle plus some very small delay?
                    env.regmodel.timebase.compensations[(2*frame_id+0)].time_offset.fract.set('hFF283); // toa
                    env.regmodel.timebase.compensations[(2*frame_id+1)].time_offset.fract.set('h41A); // tod mac comp
                end else begin
                    env.regmodel.timebase.compensations[(2*frame_id+0)].time_offset.fract.set('hFF283); // toa
                    env.regmodel.timebase.compensations[(2*frame_id+1)].time_offset.fract.set('h421); // tod mac comp
                end
            end else begin
                env.regmodel.timebase.compensations[(2*frame_id+0)].time_offset.fract.set('hFF283); // toa
                env.regmodel.timebase.compensations[(2*frame_id+1)].time_offset.fract.set('h406); // tod mac comp
            end
            env.regmodel.timebase.compensations[(2*frame_id+0)].update(status);
            env.regmodel.timebase.compensations[(2*frame_id+1)].update(status);

            ctrl_vif.thi_ena           = '1;

            csum_seq.start(env.rx_eth.agent[PORT_CPU].sequencer);

            @(env_cfg.ts_cpy_cfg.fr_done);

            ctrl_vif.thi_ena = '0;

            env.regmodel.timebase.globals.tod_ptp_timestamp.read(status, data);
            -> env_cfg.ts_cpy_cfg.rd_reg_done;

            env.regmodel.timebase.compensations[(2*frame_id+0)].time_offset.fract.set(0); // toa
            env.regmodel.timebase.compensations[(2*frame_id+1)].time_offset.fract.set(0); // tod mac comp
            env.regmodel.timebase.compensations[(2*frame_id+0)].update(status);
            env.regmodel.timebase.compensations[(2*frame_id+1)].update(status);

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
