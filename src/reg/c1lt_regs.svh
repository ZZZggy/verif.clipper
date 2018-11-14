//------------------------------------------------------------------------------
// ACCEDIAN NETWORKS
// High Performance Service Assurance (TM)
//
// Accedian Networks, Inc.
// 4878 Levy, suite 202
// Saint-Laurent, Quebec Canada H4R 2P1
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
//
//------------------------------------------------------------------------------
// !!! AUTO-GENERATED FILE !!!
// Register definitions for c1lt register block.
//
// To enable per-instance coverage: regmodel...set_per_instance_coverage(1, UVM_(NO_)HIER);
// To enable singleton coverage:    regmodel...set_per_instance_coverage(0, UVM_(NO_)HIER);
// To enable coverage:              void'(regmodel...set_coverage(1));
// To enable hierarchical coverage: void'(regmodel...set_coverage(UVM_CVR_ALL));
//
// TODO: <field>.configure: need to replace:has_reset => actual, individually_accessible => byte lane accessible
// TODO: add address coverage to register blocks
// TODO: for memories in blocks, n_bits and access should be configured somehow
//       mem = new("mem", addressRange, `UVM_REG_DATA_WIDTH, "RW", UVM_NO_COVERAGE); // mem_type::type_id::create("mem", , get_full_name());
// TODO: for block default_map, specify actual n_bytes, endian-ness, byte_addressing
//------------------------------------------------------------------------------

`include "uvm_macros.svh"

//---------------------------------------------------------
// Group: c1lt
//---------------------------------------------------------

package c1lt_reg_pkg;
    import uvm_pkg::*;
    import acd_uvm_pkg::*;
    import chip_global_reg_pkg::*;
    import protection_tbl_reg_pkg::*;
    import timebase_reg_pkg::*;
    import cpu_bucket_reg_pkg::*;
    import flush_stat_reg_pkg::*;
    import i2c_reg_pkg::*;
    import platform_ctrl_reg_pkg::*;
    import clock_ctrl_reg_pkg::*;
    import mem_ctrl_reg_pkg::*;
    import cos_mark_tbl_reg_pkg::*;
    import acd_seq_checker_reg_reg_pkg::*;
    import mac_if_reg_pkg::*;
    import mac10g_if_reg_pkg::*;
    import inspector_multi_flow_block_reg_pkg::*;
    import phy_if_reg_pkg::*;
    import q_map_tbl_reg_pkg::*;
    import pktgen_reg_pkg::*;
    import bwp_reg_pkg::*;
    import fwd_db_reg_pkg::*;
    import vid_pairing_table_reg_pkg::*;
    import class_stats_top_reg_pkg::*;
    import vid_table_reg_pkg::*;
    import cos_pattern_tables_top_reg_pkg::*;
    import rule_action_mapping_top_reg_pkg::*;
    import cos_action_top_reg_pkg::*;
    import cpu_monitor_domain_action_reg_pkg::*;
    import traffic_manager_reg_pkg::*;
    import classifiers_reg_pkg::*;
    import access_logger_reg_pkg::*;






// Class: c1lt_reg_block
// Register Block .c1lt: 
class c1lt_reg_block extends uvm_reg_block;

    // Validate register width
    local static bit valid_reg_data_width = check_data_width(`UVM_REG_DATA_WIDTH);

    rand chip_global_reg_block globals;
    rand protection_tbl_reg_block protection_tbl;
    rand timebase_reg_block timebase;
    rand cpu_bucket_reg_block cpu_bucket;
    rand flush_stat_reg_block flush_stat;
    rand i2c_reg_block i2c;
    rand platform_ctrl_reg_block platform_ctrl;
    rand clock_ctrl_reg_block clock_ctrl;
    rand mem_ctrl_reg_block mem_ctrl;
    rand cos_mark_tbl_reg_block cos_mark_table_port;
    rand acd_seq_checker_reg_reg_block acd_seq_checker_reg;
    rand mac_if_reg_block mac_if;
    rand inspector_multi_flow_block_reg_block inspector;
    rand phy_if_reg_block phy_if;
    rand q_map_tbl_reg_block q_mapping_table;
    rand pktgen_reg_block pktgen;
    rand bwp_reg_block bwp;
    rand fwd_db_reg_block fwd_db;
    rand vid_pairing_table_reg_block vid_pairing_table;
    rand class_stats_top_reg_block class_stats;
    rand vid_table_reg_block vid_table;
    rand cos_pattern_tables_top_reg_block cos_pattern_tables;
    rand rule_action_mapping_top_reg_block action_map_tables;
    rand cos_action_top_reg_block cos_action;
    rand traffic_manager_reg_block tm;
    rand classifiers_reg_block classifiers;
    rand access_logger_reg_block access_logger;
    rand mac10g_if_reg_block mac10g_if[];
    rand cpu_monitor_domain_action_reg_block cpu_monitor_action[];

    // Variable: params
    // Parameter key/value lookup.
    static protected acd_reg_param_cfg m_params;

    // Variable: cg_per_instance
    // Assert to construct all sub-block and register covergroups per instance rather than singleton
    protected bit cg_per_instance;

    `uvm_object_utils(c1lt_reg_pkg::c1lt_reg_block)

    // Constructor: new
    function new(string name = "c1lt_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction


    // Function: build
    virtual function void build();
        if ((m_params == null) && (0 > 0))
            if (!uvm_config_db#(acd_reg_param_cfg)::get(null, get_full_name(), "cfg", m_params))
                `uvm_fatal("CFGERR", {get_full_name(), " failed to get configuration for parameters."})

        mac10g_if = new[4];
        cpu_monitor_action = new[12];

        globals = chip_global_reg_block::type_id::create("globals", , get_full_name());
        protection_tbl = protection_tbl_reg_block::type_id::create("protection_tbl", , get_full_name());
        timebase = timebase_reg_block::type_id::create("timebase", , get_full_name());
        cpu_bucket = cpu_bucket_reg_block::type_id::create("cpu_bucket", , get_full_name());
        flush_stat = flush_stat_reg_block::type_id::create("flush_stat", , get_full_name());
        i2c = i2c_reg_block::type_id::create("i2c", , get_full_name());
        platform_ctrl = platform_ctrl_reg_block::type_id::create("platform_ctrl", , get_full_name());
        clock_ctrl = clock_ctrl_reg_block::type_id::create("clock_ctrl", , get_full_name());
        mem_ctrl = mem_ctrl_reg_block::type_id::create("mem_ctrl", , get_full_name());
        cos_mark_table_port = cos_mark_tbl_reg_block::type_id::create("cos_mark_table_port", , get_full_name());
        acd_seq_checker_reg = acd_seq_checker_reg_reg_block::type_id::create("acd_seq_checker_reg", , get_full_name());
        mac_if = mac_if_reg_block::type_id::create("mac_if", , get_full_name());
        inspector = inspector_multi_flow_block_reg_block::type_id::create("inspector", , get_full_name());
        phy_if = phy_if_reg_block::type_id::create("phy_if", , get_full_name());
        q_mapping_table = q_map_tbl_reg_block::type_id::create("q_mapping_table", , get_full_name());
        pktgen = pktgen_reg_block::type_id::create("pktgen", , get_full_name());
        bwp = bwp_reg_block::type_id::create("bwp", , get_full_name());
        fwd_db = fwd_db_reg_block::type_id::create("fwd_db", , get_full_name());
        vid_pairing_table = vid_pairing_table_reg_block::type_id::create("vid_pairing_table", , get_full_name());
        class_stats = class_stats_top_reg_block::type_id::create("class_stats", , get_full_name());
        vid_table = vid_table_reg_block::type_id::create("vid_table", , get_full_name());
        cos_pattern_tables = cos_pattern_tables_top_reg_block::type_id::create("cos_pattern_tables", , get_full_name());
        action_map_tables = rule_action_mapping_top_reg_block::type_id::create("action_map_tables", , get_full_name());
        cos_action = cos_action_top_reg_block::type_id::create("cos_action", , get_full_name());
        tm = traffic_manager_reg_block::type_id::create("tm", , get_full_name());
        classifiers = classifiers_reg_block::type_id::create("classifiers", , get_full_name());
        access_logger = access_logger_reg_block::type_id::create("access_logger", , get_full_name());
        foreach(mac10g_if[m]) begin
            mac10g_if[m] = mac10g_if_reg_block::type_id::create($sformatf("mac10g_if[%0d]",m), , get_full_name());
        end
        foreach(cpu_monitor_action[m]) begin
            cpu_monitor_action[m] = cpu_monitor_domain_action_reg_block::type_id::create($sformatf("cpu_monitor_action[%0d]",m), , get_full_name());
        end

        globals.configure(this);
        protection_tbl.configure(this);
        timebase.configure(this);
        cpu_bucket.configure(this);
        flush_stat.configure(this);
        i2c.configure(this);
        platform_ctrl.configure(this);
        clock_ctrl.configure(this);
        mem_ctrl.configure(this);
        cos_mark_table_port.configure(this);
        acd_seq_checker_reg.configure(this);
        mac_if.configure(this);
        inspector.configure(this);
        phy_if.configure(this);
        q_mapping_table.configure(this);
        pktgen.configure(this);
        bwp.configure(this);
        fwd_db.configure(this);
        vid_pairing_table.configure(this);
        class_stats.configure(this);
        vid_table.configure(this);
        cos_pattern_tables.configure(this);
        action_map_tables.configure(this);
        cos_action.configure(this);
        tm.configure(this);
        classifiers.configure(this);
        access_logger.configure(this);
        foreach(mac10g_if[m]) begin
            mac10g_if[m].configure(this);
        end
        foreach(cpu_monitor_action[m]) begin
            cpu_monitor_action[m].configure(this);
        end

        globals.build();
        protection_tbl.build();
        timebase.build();
        cpu_bucket.build();
        flush_stat.build();
        i2c.build();
        platform_ctrl.build();
        clock_ctrl.build();
        mem_ctrl.build();
        cos_mark_table_port.build();
        acd_seq_checker_reg.build();
        mac_if.build();
        inspector.build();
        phy_if.build();
        q_mapping_table.build();
        pktgen.build();
        bwp.build();
        fwd_db.build();
        vid_pairing_table.build();
        class_stats.build();
        vid_table.build();
        cos_pattern_tables.build();
        action_map_tables.build();
        cos_action.build();
        tm.build();
        classifiers.build();
        access_logger.build();
        foreach(mac10g_if[m]) begin
            mac10g_if[m].build();
        end
        foreach(cpu_monitor_action[m]) begin
            cpu_monitor_action[m].build();
        end

        // define default map
        default_map = create_map("c1lt_default_map", 'h0, `UVM_REG_DATA_WIDTH/8, UVM_NO_ENDIAN, 0);
        this.default_map.add_submap(this.globals.default_map, 'h0);
        this.default_map.add_submap(this.protection_tbl.default_map, 'h80);
        this.default_map.add_submap(this.timebase.default_map, 'h100);
        this.default_map.add_submap(this.cpu_bucket.default_map, 'h200);
        this.default_map.add_submap(this.flush_stat.default_map, 'h300);
        this.default_map.add_submap(this.i2c.default_map, 'h400);
        this.default_map.add_submap(this.platform_ctrl.default_map, 'h500);
        this.default_map.add_submap(this.clock_ctrl.default_map, 'h600);
        this.default_map.add_submap(this.mem_ctrl.default_map, 'h700);
        this.default_map.add_submap(this.cos_mark_table_port.default_map, 'h800);
        this.default_map.add_submap(this.acd_seq_checker_reg.default_map, 'h900);
        this.default_map.add_submap(this.mac_if.default_map, 'h1000);
        this.default_map.add_submap(this.inspector.default_map, 'h6000);
        this.default_map.add_submap(this.phy_if.default_map, 'h8000);
        this.default_map.add_submap(this.q_mapping_table.default_map, 'hC000);
        this.default_map.add_submap(this.pktgen.default_map, 'h10000);
        this.default_map.add_submap(this.bwp.default_map, 'h20000);
        this.default_map.add_submap(this.fwd_db.default_map, 'h30000);
        this.default_map.add_submap(this.vid_pairing_table.default_map, 'h38000);
        this.default_map.add_submap(this.class_stats.default_map, 'h40000);
        this.default_map.add_submap(this.vid_table.default_map, 'h50000);
        this.default_map.add_submap(this.cos_pattern_tables.default_map, 'h60000);
        this.default_map.add_submap(this.action_map_tables.default_map, 'h64000);
        this.default_map.add_submap(this.cos_action.default_map, 'h68000);
        this.default_map.add_submap(this.tm.default_map, 'h80000);
        this.default_map.add_submap(this.classifiers.default_map, 'hC0000);
        this.default_map.add_submap(this.access_logger.default_map, 'hE0000);
        foreach(mac10g_if[m]) begin
            this.default_map.add_submap(this.mac10g_if[m].default_map, 'h4000 + m*('h200));
        end
        foreach(cpu_monitor_action[m]) begin
            this.default_map.add_submap(this.cpu_monitor_action[m].default_map, 'h70000 + m*('h100));
        end

        // Recursively lock register model and build the address map to enable
        // uvm_reg_map::get_reg_by_offset() and uvm_reg_map::get_mem_by_offset() methods.
        // It is impossible to unlock a model.
        lock_model();
    endfunction


     // Function: set_per_instance_coverage
     // Enable or disable instance coverage, otherwise singleton coverage.
     virtual function void set_per_instance_coverage(bit per_inst, uvm_hier_e hier=UVM_HIER);
         this.cg_per_instance = per_inst;

        // Use UVM_CVR_ALL for hierarchical enabling.
        if(hier == UVM_HIER) begin
            globals.set_per_instance_coverage(per_inst, hier);
            protection_tbl.set_per_instance_coverage(per_inst, hier);
            timebase.set_per_instance_coverage(per_inst, hier);
            cpu_bucket.set_per_instance_coverage(per_inst, hier);
            flush_stat.set_per_instance_coverage(per_inst, hier);
            i2c.set_per_instance_coverage(per_inst, hier);
            platform_ctrl.set_per_instance_coverage(per_inst, hier);
            clock_ctrl.set_per_instance_coverage(per_inst, hier);
            mem_ctrl.set_per_instance_coverage(per_inst, hier);
            cos_mark_table_port.set_per_instance_coverage(per_inst, hier);
            acd_seq_checker_reg.set_per_instance_coverage(per_inst, hier);
            mac_if.set_per_instance_coverage(per_inst, hier);
            inspector.set_per_instance_coverage(per_inst, hier);
            phy_if.set_per_instance_coverage(per_inst, hier);
            q_mapping_table.set_per_instance_coverage(per_inst, hier);
            pktgen.set_per_instance_coverage(per_inst, hier);
            bwp.set_per_instance_coverage(per_inst, hier);
            fwd_db.set_per_instance_coverage(per_inst, hier);
            vid_pairing_table.set_per_instance_coverage(per_inst, hier);
            class_stats.set_per_instance_coverage(per_inst, hier);
            vid_table.set_per_instance_coverage(per_inst, hier);
            cos_pattern_tables.set_per_instance_coverage(per_inst, hier);
            action_map_tables.set_per_instance_coverage(per_inst, hier);
            cos_action.set_per_instance_coverage(per_inst, hier);
            tm.set_per_instance_coverage(per_inst, hier);
            classifiers.set_per_instance_coverage(per_inst, hier);
            access_logger.set_per_instance_coverage(per_inst, hier);
            foreach(mac10g_if[m]) begin
                mac10g_if[m].set_per_instance_coverage(per_inst, hier);
            end
            foreach(cpu_monitor_action[m]) begin
                cpu_monitor_action[m].set_per_instance_coverage(per_inst, hier);
            end
        end
     endfunction


    // Function: set_coverage
    // Override base function to create covergroups for all registers in this block.
    //
    // In order to enable hierarchical creation, use UVM_CVR_ALL.
    virtual function uvm_reg_cvr_t set_coverage(uvm_reg_cvr_t is_on);
        //void'(uvm_config_db#(bit)::get(null, get_full_name(), "cg_per_instance", cg_per_instance));
        set_coverage = super.set_coverage(is_on);
        // Use UVM_CVR_ALL for hierarchical enabling.
        if(is_on == UVM_CVR_ALL) begin
            //void'(uvm_config_db#(bit)::set(null, globals.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(globals.set_coverage(is_on));
            //void'(uvm_config_db#(bit)::set(null, protection_tbl.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(protection_tbl.set_coverage(is_on));
            //void'(uvm_config_db#(bit)::set(null, timebase.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(timebase.set_coverage(is_on));
            //void'(uvm_config_db#(bit)::set(null, cpu_bucket.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(cpu_bucket.set_coverage(is_on));
            //void'(uvm_config_db#(bit)::set(null, flush_stat.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(flush_stat.set_coverage(is_on));
            //void'(uvm_config_db#(bit)::set(null, i2c.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(i2c.set_coverage(is_on));
            //void'(uvm_config_db#(bit)::set(null, platform_ctrl.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(platform_ctrl.set_coverage(is_on));
            //void'(uvm_config_db#(bit)::set(null, clock_ctrl.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(clock_ctrl.set_coverage(is_on));
            //void'(uvm_config_db#(bit)::set(null, mem_ctrl.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(mem_ctrl.set_coverage(is_on));
            //void'(uvm_config_db#(bit)::set(null, cos_mark_table_port.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(cos_mark_table_port.set_coverage(is_on));
            //void'(uvm_config_db#(bit)::set(null, acd_seq_checker_reg.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(acd_seq_checker_reg.set_coverage(is_on));
            //void'(uvm_config_db#(bit)::set(null, mac_if.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(mac_if.set_coverage(is_on));
            //void'(uvm_config_db#(bit)::set(null, inspector.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(inspector.set_coverage(is_on));
            //void'(uvm_config_db#(bit)::set(null, phy_if.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(phy_if.set_coverage(is_on));
            //void'(uvm_config_db#(bit)::set(null, q_mapping_table.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(q_mapping_table.set_coverage(is_on));
            //void'(uvm_config_db#(bit)::set(null, pktgen.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(pktgen.set_coverage(is_on));
            //void'(uvm_config_db#(bit)::set(null, bwp.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(bwp.set_coverage(is_on));
            //void'(uvm_config_db#(bit)::set(null, fwd_db.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(fwd_db.set_coverage(is_on));
            //void'(uvm_config_db#(bit)::set(null, vid_pairing_table.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(vid_pairing_table.set_coverage(is_on));
            //void'(uvm_config_db#(bit)::set(null, class_stats.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(class_stats.set_coverage(is_on));
            //void'(uvm_config_db#(bit)::set(null, vid_table.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(vid_table.set_coverage(is_on));
            //void'(uvm_config_db#(bit)::set(null, cos_pattern_tables.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(cos_pattern_tables.set_coverage(is_on));
            //void'(uvm_config_db#(bit)::set(null, action_map_tables.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(action_map_tables.set_coverage(is_on));
            //void'(uvm_config_db#(bit)::set(null, cos_action.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(cos_action.set_coverage(is_on));
            //void'(uvm_config_db#(bit)::set(null, tm.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(tm.set_coverage(is_on));
            //void'(uvm_config_db#(bit)::set(null, classifiers.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(classifiers.set_coverage(is_on));
            //void'(uvm_config_db#(bit)::set(null, access_logger.get_full_name(), "cg_per_instance", cg_per_instance));
            void'(access_logger.set_coverage(is_on));
            foreach(mac10g_if[m]) begin
                //void'(uvm_config_db#(bit)::set(null, mac10g_if[m].get_full_name(), "cg_per_instance", cg_per_instance));
                void'(mac10g_if[m].set_coverage(is_on));
            end
            foreach(cpu_monitor_action[m]) begin
                //void'(uvm_config_db#(bit)::set(null, cpu_monitor_action[m].get_full_name(), "cg_per_instance", cg_per_instance));
                void'(cpu_monitor_action[m].set_coverage(is_on));
            end
        end
        return set_coverage;
    endfunction


    // Function: fields2string
    // Stringify.
    virtual function string convert2string();
        string s = "";
        uvm_reg regs[$];
        uvm_reg_field fields[$];

        get_registers(regs, UVM_HIER);
        $swrite(s, "\nUVM_REG_BLOCK::%0s (%0d registers)\n", get_name, regs.size());
        foreach (regs[m]) begin
            $swrite(s, "%0s    %0s=0x%16h\n", s, regs[m].get_full_name, regs[m].get());
            // Getting the fields is optional might be too verbose
            //fields.delete();
            //regs[m].get_fields(fields);
            //foreach (fields[n]) begin
                //$swrite(s, "%0s        %0s=0x%0h\n", s, fields[n].get_full_name, fields[n].value);
            //end
        end
        return s;
    endfunction


    // Function: regs2update
    // Stringifying only regmodel registers that need updating. Useful after randomization.
    virtual function string regs2update();
        string s = "";
        uvm_reg regs[$];
        uvm_reg_field fields[$];

        get_registers(regs, UVM_HIER);
        $swrite(s, "\nRegisters requiring update in UVM_REG_BLOCK::%0s\n", get_name);
        foreach (regs[m]) begin
            if (regs[m].needs_update()) begin
                $swrite(s, "%0s    %0s=0x%16h\n", s, regs[m].get_full_name, regs[m].get());
                // Getting the fields is optional might be too verbose
                fields.delete();
                regs[m].get_fields(fields);
                foreach (fields[n]) begin
                    $swrite(s, "%0s        %0s=0x%0h\n", s, fields[n].get_full_name, fields[n].value);
                end
            end
        end
        return s;
    endfunction

endclass

endpackage