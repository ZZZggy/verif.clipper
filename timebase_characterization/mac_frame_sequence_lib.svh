
virtual class mac_frame_base_sequence_t extends ethernet_seq_t;

    `uvm_object_utils(mac_frame_base_sequence_t)

    rand int id;
    rand int unsigned frame_count;
    rand int unsigned max_payload_size;
    constraint constraint_limit {
        soft frame_count inside {1, 1000};
        max_payload_size < 16366;
    };

    function new(string name="mac_frame_base_sequence_t");
        super.new(name);
    endfunction

    // Raise in pre_body so the objection is only raised for root sequences.
    // There is no need to raise for sub-sequences since the root sequence
    // will encapsulate the sub-sequence.
    virtual task pre_body();
        if (starting_phase!=null) begin
           `uvm_info(get_type_name(),
                     $sformatf("%s pre_body() raising %s objection",
                               get_sequence_path(),
                               starting_phase.get_name()), UVM_DEBUG);
           starting_phase.raise_objection(this);
        end
    endtask

    // Drop the objection in the post_body so the objection is removed when
    // the root sequence is complete.
    virtual task post_body();
        if (starting_phase!=null) begin
           `uvm_info(get_type_name(),
                     $sformatf("%s post_body() dropping %s objection",
                               get_sequence_path(),
                               starting_phase.get_name()), UVM_DEBUG);
        starting_phase.drop_objection(this);
        end
    endtask

    virtual task do_frame();
    endtask

endclass


//------------------------------------------------------------------------------
//
//
//------------------------------------------------------------------------------

//class mac_frame_random_sequence_t extends mac_frame_base_sequence_t;

    //`uvm_object_utils(mac_frame_random_sequence_t)

    //function new(string name="mac_frame_random_sequence_t");
        //super.new(name);
    //endfunction

    //rand int frame_count;

    //virtual task body();
        //req = ethernet_frame_t::type_id::create("req",, get_full_name());

        //if(frame_count <= 0) begin
            //`uvm_warning(get_sequence_path(), $psprintf("Sequence requested with an invalid number of frames (%0d).", frame_count))
        //end

        //repeat(frame_count) begin
            //start_item(req);
            //req.randomize();
            //req.mid_do(this);
            //finish_item(req);
            //`uvm_info(get_sequence_path(), $psprintf("Executed MAC frame: %s", req.convert2string), UVM_HIGH)
        //end

      //endtask

//endclass

//
// Generates a mix of packet sizes and and types with vlan tags. No errors.
//
class l2_untagged_64_bytes_sequence_t extends mac_frame_base_sequence_t;

    `uvm_object_utils(l2_untagged_64_bytes_sequence_t)

    function new(string name="l2_untagged_64_bytes_sequence_t");
        super.new(name);
    endfunction

    virtual task body();
        int frame_id = 0;
        req = ethernet_frame::type_id::create("req",, get_full_name());
        
        if(frame_count > 0)
            `uvm_info("SEQ", $sformatf("Starting sequence with %0d frames.", frame_count), UVM_NONE)
        else
            `uvm_fatal("SEQ", $sformatf("Sequence requested with an invalid number of frames: %0d.",
                                        frame_count))            

        repeat(frame_count) begin
            frame_id++;
            start_item(req);
            if (!(req.randomize() with {
                vtags_size         == 0;
                is_bad_fcs         == 0;
                is_runt            == 0;
                is_alignment_error == 0;
                is_extended        == 0;
                is_interface_error == 0;
                da_type dist {
                    ucast := 1,
                    mcast := 0,
                    bcast := 0,
                    pause := 0
                };
                payload_size dist {
                    46   := 1, 63   := 0,
                    64   := 0, 127  := 0,
                    128  := 0, 255  := 0,
                    256  := 0, 511  := 0,
                    512  := 0, 1023 := 0,
                    1024 := 0, 1517 := 0,
                    1518 := 0, 2047 := 0,
                    2048 := 0, 4095 := 0,
                    4096 := 0, 8191 := 0,
                    8192 := 0, max_payload_size := 0
                };
            })) `uvm_fatal(get_name, "Randomization failed!")
            req.frame_id = frame_id;
            req.p_id = id;
            finish_item(req);
            `uvm_info("SEQ", $sformatf("Executed MAC frame [%0d]:\n%s", frame_id, req.convert2string),
                      UVM_HIGH)
        end
        
        `uvm_info("SEQ", $sformatf("Finished sequence with %0d frames.", frame_count), UVM_MEDIUM)
            
      endtask

endclass

//
// Generates a mix of packet sizes and and types with vlan tags. No errors.
//
class mac_frame_good_traffic_sequence_t extends mac_frame_base_sequence_t;

    `uvm_object_utils(mac_frame_good_traffic_sequence_t)

    function new(string name="mac_frame_good_traffic_sequence_t");
        super.new(name);
    endfunction

    virtual task body();
        int frame_id = 0;
        req = ethernet_frame::type_id::create("req",, get_full_name());
        
        if(frame_count > 0)
            `uvm_info("SEQ", $sformatf("Starting sequence with %0d frames.", frame_count), UVM_NONE)
        else
            `uvm_fatal("SEQ", $sformatf("Sequence requested with an invalid number of frames: %0d.",
                                        frame_count))            

        repeat(frame_count) begin
            frame_id++;
            start_item(req);
            if (!(req.randomize() with {
                is_bad_fcs         == 0;
                is_runt            == 0;
                is_alignment_error == 0;
                is_extended        == 0;
                is_interface_error == 0;
                da_type dist {
                    ucast := 5,
                    mcast := 3,
                    bcast := 2,
                    pause := 1
                };
                payload_size dist {
                    46   := 2, 63   := 2,
                    64   := 3, 127  := 3,
                    128  := 4, 255  := 4,
                    256  := 5, 511  := 5,
                    512  := 4, 1023 := 4,
                    1024 := 3, 1517 := 3,
                    1518 := 2, 2047 := 2,
                    2048 := 1, 4095 := 1,
                    4096 := 1, 8191 := 1,
                    8192 := 1, max_payload_size := 1
                };
            })) `uvm_fatal(get_name, "Randomization failed!")
            req.frame_id = frame_id;
            req.p_id = id;
            finish_item(req);
            `uvm_info("SEQ", $sformatf("Executed MAC frame [%0d]:\n%s", frame_id, req.convert2string),
                      UVM_HIGH)
        end
        
        `uvm_info("SEQ", $sformatf("Finished sequence with %0d frames.", frame_count), UVM_MEDIUM)
            
      endtask

endclass
// Old name! alias old name to class name.
typedef mac_frame_good_traffic_sequence_t mac_frame_random_sequence_t;


//
// Generates packets with an invalid FCS.
//
class mac_bad_fcs_sequence_t extends mac_frame_base_sequence_t;

    `uvm_object_utils(mac_bad_fcs_sequence_t)

    function new(string name="mac_bad_fcs_sequence_t");
        super.new(name);
    endfunction

    rand int unsigned frame_count;
    constraint constraint_limit {
        frame_count < 10;
        //max_payload_size < 1500;
    };

    virtual task body();
        req = ethernet_frame::type_id::create("req",, get_full_name());

        if(frame_count <= 0) begin
            `uvm_fatal(get_sequence_path(), $psprintf("Sequence requested with an invalid number of frames (%0d).", frame_count))
        end

        repeat(frame_count) begin
            start_item(req);
            if (!(req.randomize() with {
                payload_size inside {46, 1500, max_payload_size};
                frame_id == 0 -> is_bad_fcs == 1;
                frame_id > 0  -> is_bad_fcs == 0;
            })) `uvm_fatal(get_name, "Randomization failed!")

            finish_item(req);
            `uvm_info(get_sequence_path(), $psprintf("Executed MAC frame: %s", req.convert2string), UVM_HIGH)
        end

      endtask

endclass

