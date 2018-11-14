class thi_regmodel_base_seq_t extends uvm_sequence#(ethernet_frame);

    `uvm_object_utils(thi_regmodel_base_seq_t)

    function new(string name="thi_regmodel_base_seq_t");
        super.new(name);
    endfunction

    // handle to upstream sequencer to pull items from
    uvm_sequencer#(thi_fpga_frame_t) regmodel_sequencer_h;
    mailbox#(thi_fpga_frame_t) e_frame_from_monitor_mb;

    virtual task body();

    endtask

        /**
     * @Override
     * Raise in pre_body so the objection is only raised for root sequences.
     * There is no need to raise for sub-sequences since the root sequence
     * will encapsulate the sub-sequence.
     */
    virtual task pre_body();
        if(starting_phase!=null) begin
            `uvm_info(get_type_name(), $sformatf("%s pre_body() raising %s objection",
                get_sequence_path(), starting_phase.get_name()), UVM_MEDIUM)
            starting_phase.raise_objection(this);
        end
    endtask

    /**
     * @Override
     * Drop the objection in the post_body so the objection is removed when
     * the root sequence is complete.
     */
    virtual task post_body();
        if (starting_phase!=null) begin
            `uvm_info(get_type_name(), $sformatf("%s post_body() dropping %s objection",
                get_sequence_path(), starting_phase.get_name()), UVM_MEDIUM)
            starting_phase.drop_objection(this);
        end
    endtask

endclass


//adapter must be at provides_responses = '1;
class thi_regmodel_seq_t extends thi_regmodel_base_seq_t;

    `uvm_object_utils(thi_regmodel_seq_t)

    function new(string name="thi_regmodel_seq_t");
        super.new(name);
        e_frame_from_monitor_mb = new(1);
    endfunction

    virtual task body();

        thi_fpga_frame_t rsp_monitor_frame, regmodel_frame;
        ethernet_frame req;

        `uvm_info(get_sequence_path(), $sformatf("Entering thi_regmodel_seq body"), UVM_HIGH)

        forever begin

            regmodel_sequencer_h.get(regmodel_frame);
            req = ethernet_frame::type_id::create("req",, get_full_name());
            rsp_monitor_frame = thi_fpga_frame_t::type_id::create("rsp_monitor_frame",, get_full_name());

            if (!$cast(req, regmodel_frame.clone)) `uvm_fatal("downcasting to ethernet_frame failed","Provided regmodel_frame of incorrect type")

            start_item(req);

                `uvm_info("SEQ", $sformatf("Regmodel_frame seq item :%s", regmodel_frame.convert2string), UVM_HIGH)
                `uvm_info("SEQ", $sformatf("Req seq item            :%s", req.convert2string), UVM_HIGH)

            finish_item(req);

            e_frame_from_monitor_mb.get(rsp_monitor_frame);
            rsp_monitor_frame.set_id_info(regmodel_frame);
            `uvm_info(get_sequence_path(), $sformatf("Exiting thi_regmodel_seq body: %s", rsp_monitor_frame.convert2string), UVM_HIGH)
            regmodel_sequencer_h.put(rsp_monitor_frame);

        end

    endtask

endclass


// Sequence item to transmit
class thi_cpu2fpga_seq_t extends mac_frame_base_sequence_t;
    `uvm_object_utils(thi_cpu2fpga_seq_t)

    covergroup thi_cpu2fpga_cg with function sample(int access, int burst_len, bit err);
        access_wr_ack_cp:   coverpoint access { bins wr_ack_b   = {thi_uvm_pkg::THI_WR_ACK};   bins invalids[] = default; }
        access_wr_noack_cp: coverpoint access { bins wr_noack_b = {thi_uvm_pkg::THI_WR_NOACK}; bins invalids[] = default; }
        access_rd_cp:       coverpoint access { bins rd_b       = {thi_uvm_pkg::THI_WR_NOACK}; bins invalids[] = default; }

        burst_len_cp: coverpoint burst_len {
            bins zero_b  = {0};
            bins min_b   = {1};
            bins multi_b = {[2:thi_uvm_pkg::THI_MAX_BURST-1]};
            bins max_b   = {thi_uvm_pkg::THI_MAX_BURST};
            bins invalids = {[thi_uvm_pkg::THI_MAX_BURST+1:$]};
        }
        err_cp: coverpoint err;
    endgroup

    function new(string name="thi_cpu2fpga_seq_t");
        super.new(name);
        thi_cpu2fpga_cg = new;
    endfunction

    rand bit[1:0]  access; // wr_ack = 0, wr = 1, read = 2;
    rand bit[19:0] addr;
    rand byte      data[];
    rand bit[7:0]  burst_len;

    constraint constrain_burst_len {
        solve burst_len before data;
        soft burst_len == 1;
        // data size based on burst and access type
        if (access != thi_uvm_pkg::THI_RD) {
            soft data.size == burst_len*8;
        } else {
            // for read, can send short packet but request larger burst
            soft data.size == 8;
        }
    }

    constraint constraint_limit {
        frame_count == 1;
    };

    virtual task body();
        int frame_id = 0;
        string sdata;

        req = thi_fpga_frame_t::type_id::create("f",, get_full_name());

        sdata = " ";
        foreach(data[i]) begin
            sdata = {sdata, $sformatf("%2h ", data[i])};
        end
        `uvm_info("SEQ", $sformatf("CPU2FPGA ACCESS=0x%1h ADDR=0x%5h BURST=0x%2h DATA={%0s}", access, addr, burst_len, sdata),UVM_NONE)

        repeat(frame_count) begin
            frame_id++;
            start_item(req);
            // TODO: support multiple writes, for now hardcoded to one access

            random_thi_frame(req, access, addr, data, burst_len);//FIXME this task is a workaround the constraint scope issue.

            req.frame_id = frame_id;
            req.p_id = id;

            thi_cpu2fpga_cg.sample(access,burst_len,req.is_interface_error);

            finish_item(req);
            `uvm_info("SEQ", $sformatf("Executed MAC frame: %s", req.convert2string), UVM_HIGH)
        end
    endtask

    task random_thi_frame(thi_fpga_frame_t req, bit[1:0]  access, bit[19:0] addr, byte data[], bit[7:0]  burst_len);
        if (!(req.randomize() with {
                req.burst_len == local::burst_len;
                req.cmd       == local::access; // wr_ack = 0, wr = 1, read = 2; //TODO ADD wr =1 //TODO ENUM;//
                req.addr      == local::addr;
                foreach (req.data[i]) { req.data[i] ==  local::data[i]; }
            })) `uvm_fatal("RNDERR", "Randomization failed!")
    endtask

endclass


// Sequence sending CPU2IF frames on the CPU port to a random IF.
// THI CPU2IF KNOBS
// info.if_src_dst
// info.punch_csum
// info.copy_tstamp
// info.punch_tstamp
// info.tstamp_format
// info.tstamp_offset
// xtra_info.inv_csum
// xtra_info.csum_offset
class thi_cpu2if_seq_t extends mac_frame_base_sequence_t;
    `uvm_object_utils(thi_cpu2if_seq_t)

    //---------------------------------------------------------------------------------
    // Variables
    //---------------------------------------------------------------------------------
    thi_if_frame_t cpu2if;
    int NUM_USR_PRTS = 1;
    rand int unsigned if_dest;
    // constrain frame count (in parent sequence)
    constraint c1 {

        soft frame_count == 20;
        soft if_dest inside {1, NUM_USR_PRTS};
    };

    //---------------------------------------------------------------------------------
    // Constructor
    //---------------------------------------------------------------------------------
    function new(string name="thi_cpu2if_seq_t");
        super.new(name);
    endfunction

    //---------------------------------------------------------------------------------
    // body
    //---------------------------------------------------------------------------------
    virtual task body();
        int frame_id = 0;

        cpu2if = thi_if_frame_t::type_id::create("cpu2if");
        repeat(frame_count) begin
            start_item(cpu2if);
            if (!(cpu2if.randomize() with {
                thi_vtag.tpid   == thi_uvm_pkg::THI_TPID_CPU2X;
                info.if_src_dst == if_dest;

                info.punch_tstamp     == 1;
                info.tstamp_format    == 0;
                info.tstamp_offset    == 40;
                info.punch_csum       == 1;
                //xtra_info.csum_offset == 32;

                // CPU MRU: 1518
                // 1518-16(THI info)-4(FCS)-12(MAC addresses)-2(Ethertype)=1484 untagged
                payload_size < 1484-vtags_size*VTAG_BSIZE;
                //frame_size == 100;
            })) `uvm_fatal("RNDERR", "Randomization failed!")
            cpu2if.frame_id = frame_id+1;
            cpu2if.p_id = id;
            finish_item(cpu2if);
            frame_id++;
        end
    endtask
endclass // thi_cpu2if_seq_t

class thi_cpu2if_seq_64_pkt_t extends mac_frame_base_sequence_t;
    `uvm_object_utils(thi_cpu2if_seq_64_pkt_t)

    //---------------------------------------------------------------------------------
    // Variables
    //---------------------------------------------------------------------------------
    thi_if_frame_t cpu2if;
    int NUM_USR_PRTS = 1;

    rand int unsigned if_dst[];

    // constrain frame count (in parent sequence)
    constraint c1 {
        solve frame_count before if_dst;

        soft frame_count == 20;

        if_dst.size == frame_count;
        foreach(if_dst[i]) { if_dst[i] inside {[1:NUM_USR_PRTS]};}
    };

    //---------------------------------------------------------------------------------
    // Constructor
    //---------------------------------------------------------------------------------
    function new(string name="thi_cpu2if_seq_64_pkt_tt");
        super.new(name);
    endfunction

    //---------------------------------------------------------------------------------
    // body
    //---------------------------------------------------------------------------------
    virtual task body();
        int frame_id = 0;

        cpu2if = thi_if_frame_t::type_id::create("cpu2if");
        repeat(frame_count) begin
            start_item(cpu2if);
            if (!(cpu2if.randomize() with {
                thi_vtag.tpid   == thi_uvm_pkg::THI_TPID_CPU2X;
                info.if_src_dst == local::if_dst[local::frame_id];
                frame_size == 64;
            })) `uvm_fatal("RNDERR", "Randomization failed!")
            cpu2if.frame_id = frame_id+1;
            cpu2if.p_id = id;
            finish_item(cpu2if);
            frame_id++;
        end
    endtask
endclass
