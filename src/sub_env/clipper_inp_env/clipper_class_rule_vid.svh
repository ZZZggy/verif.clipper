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
//-----------------------------------------------------------------------------

// Note that these implementations only need to provide register-model specific
// details.
class clipper_class_rule_vid extends class_rule_vid#(c1lt_reg_block);
    `uvm_object_utils(clipper_class_rule_vid)
        // Constructor: new
    function new(string name="clipper_class_rule_vid");
        super.new(name);
    endfunction

    virtual function bit get_vid_table_mode(shortint unsigned port=0);
        return regmodel.globals.port_input_cfg[port-1].cfg0.vid_table_mode.get();
    endfunction

    virtual function int unsigned get_rule_vlan_type(shortint unsigned port=0, bit[11:0] vid);
        uvm_reg_data_t data;
        `REG_PRT(data =, regmodel.vid_table.p, port,.idx[vid].vlan_type.get())
        return conv_vlan_type(data);
    endfunction

    virtual function int unsigned get_rule_idx_reg(shortint unsigned port=0, bit[11:0] vid);
        `REG_PRT(return, regmodel.vid_table.p, port,.idx[vid].priority_index.get())
        return 0;
    endfunction

    virtual function bit pairing_ena(shortint unsigned port=0, int idx);
        `REG_PRT(return ,regmodel.vid_pairing_table.p, port, .ndx[idx].enable.get())
    endfunction

    virtual function bit[15:0] get_pair_vlan_type(shortint unsigned port=0, int idx);
        uvm_reg_data_t data;
        `REG_PRT(data = ,regmodel.vid_pairing_table.p, port, .ndx[idx].vlan_type.get())
        return conv_vlan_type(data);
    endfunction

    virtual function bit[11:0] get_pair_vid(shortint unsigned port=0, int idx);
        `REG_PRT(return ,regmodel.vid_pairing_table.p, port, .ndx[idx].vid.get())
    endfunction


    function bit[15:0] conv_vlan_type(int v_type);
        case(v_type)
            0: return 'h8100;
            1: return 'h88A8;
            2: return 'h9100;
            3: return (regmodel.globals.global_input_cfg_0.user_vlan_ethertype.get() & 16'hFFFF);
            default: `uvm_error("PORTERR", $sformatf("Unknown VLAN type index: %0d", v_type))
        endcase
    endfunction

    function int unsigned get_last_rule_idx(ethernet_frame_t t);
        case(t.p_id)
            1: return $size(regmodel.vid_pairing_table.p1.ndx)-1;
            2: return $size(regmodel.vid_pairing_table.p2.ndx)-1;
            3: return $size(regmodel.vid_pairing_table.p3.ndx)-1;
            4: return $size(regmodel.vid_pairing_table.p4.ndx)-1;
            5: return $size(regmodel.vid_pairing_table.p5.ndx)-1;
            6: return $size(regmodel.vid_pairing_table.p6.ndx)-1;
            7: return $size(regmodel.vid_pairing_table.p7.ndx)-1;
            8: return $size(regmodel.vid_pairing_table.p8.ndx)-1;
            9: return $size(regmodel.vid_pairing_table.p9.ndx)-1;
            10: return $size(regmodel.vid_pairing_table.p10.ndx)-1;
            11: return $size(regmodel.vid_pairing_table.p11.ndx)-1;
            12: return $size(regmodel.vid_pairing_table.p12.ndx)-1;
            default: `uvm_fatal("PORTERR", $sformatf("Port %0d undefined user port index.", t.p_id))
        endcase
    endfunction


    function bit rule_ena(input ethernet_frame_t t);
        return 1'b1;
    endfunction

    /**
     * @Override
     * VID table priorities are offset to upper half of range.
     */
    function void get_domains(ethernet_frame_t t, ref domain_priority_item dom_prio);
        super.get_domains(t, dom_prio);
        if (!((dom_prio.prio[DOM_IF] == -1) || (dom_prio.prio[DOM_IF] == get_last_rule_idx(t)))) begin

            // FIXME need to get real offsets
            `uvm_warning("FIXME", "GET REAL PRIO OFFSETS")

            case(t.p_id)
                1:  dom_prio.prio[DOM_IF] += 64;
                2:  dom_prio.prio[DOM_IF] += 64;
                3:  dom_prio.prio[DOM_IF] += 64;
                4:  dom_prio.prio[DOM_IF] += 64;
                5:  dom_prio.prio[DOM_IF] += 256;
                6:  dom_prio.prio[DOM_IF] += 256;
                7:  dom_prio.prio[DOM_IF] += 256;
                8:  dom_prio.prio[DOM_IF] += 256;
                9:  dom_prio.prio[DOM_IF] += 64;
                10: dom_prio.prio[DOM_IF] += 64;
                11: dom_prio.prio[DOM_IF] += 64;
                12: dom_prio.prio[DOM_IF] += 64;
                default: begin
                    `uvm_fatal("PORTERR", $sformatf("Port %0d undefined user port index.", t.p_id))
                end
            endcase
        end
    endfunction

endclass

