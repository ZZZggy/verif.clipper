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

//`include "e5gx_reg_macros.sv"
import rule_type_pkg::*;

//-----------------------------------------------------------------------------
// Class: e5gx_hard_rule_cfg_reg_seq
// Sequence to configure hardcoded rule index and CPU bucket assignments.
//
// Note that there is nothing randomized in this sequence.
//------------------------------------------------------------------------------
class clipper_hard_rule_cfg_reg_seq extends uvm_sequence#(uvm_sequence_item);
    `uvm_object_utils(clipper_hard_rule_cfg_reg_seq)
    // Constructor: new
    function new(string name="clipper_hard_rule_cfg_reg_seq");
        super.new(name);
    endfunction

    // Variable: regmodel
    // Handle to register model
    c1lt_reg_block regmodel;

    // Variable: input_port_id
    // Port to manipulate. First port by default.
    int unsigned input_port_id = 1;

    // Variable: hr_ver
    // Hidden rule version
    hidden_rule_ver_e hr_ver = rule_type_pkg::HR_VER_2_5;

    /*
     Function: body
     */
    virtual task body();
        uvm_status_e status;

        // FIXME Setup IF forwading actions as well?
        `define HR_PRIO_ACT_MAP(PORT, PRIO, IF_ACT, CPU_ACT, CPU_FWD, CPU_BUCKET)\
        `REG_XNI_BY_PRT(, regmodel.action_map_tables., ``PORT``, priority_index[``PRIO``].if_action_index.set(``IF_ACT``))\
        `REG_XNI_BY_PRT(, regmodel.action_map_tables., ``PORT``, priority_index[``PRIO``].cpu_action_index.set(``CPU_ACT``))\
        `REG_XNI_BY_PRT(, regmodel.action_map_tables., ``PORT``, priority_index[``PRIO``].update(status))\
        regmodel.cpu_monitor_action[``PORT``-1].cpu_action[``PRIO``].cpu_forwarding.set(``CPU_FWD``);\
        regmodel.cpu_monitor_action[``PORT``-1].cpu_action[``PRIO``].cpu_bucket.set(``CPU_BUCKET``);\
        regmodel.cpu_monitor_action[``PORT``-1].cpu_action[``PRIO``].update(status);

        // Hardcoded rules 2.3
        //                    PORT           PRIO  IF_ACT  CPU_ACT  CPU_FWD  BUCKET
        // Drop Self
        `HR_PRIO_ACT_MAP(input_port_id, 12,   12,     -1,      0,       0)
        // Acterna Hello
        `HR_PRIO_ACT_MAP(input_port_id, 13,   -1,     13,      1,       1)
        // SOAM LBM
        `HR_PRIO_ACT_MAP(input_port_id, 14,   14,     14,      0,       0)
        // ACCEDIAN LBM
        `HR_PRIO_ACT_MAP(input_port_id, 15,   15,     15,      0,       0)
        // LBR TST LEAK PREVENT
        `HR_PRIO_ACT_MAP(input_port_id, 18,   18,     18,      0,       0)
        // R-APS
        `HR_PRIO_ACT_MAP(input_port_id, 19,   -1,     19,      1,       9)
        // CFM multicast 2  (LTM)
        `HR_PRIO_ACT_MAP(input_port_id, 20,   20,     20,      1,       16)
        // CFM multicast 1 CCM
        `HR_PRIO_ACT_MAP(input_port_id, 21,   21,     21,      1,       17)
        // CFM multicast 1 DMM, SLM
        `HR_PRIO_ACT_MAP(input_port_id, 22,   22,     22,      1,       18)
        // CFM multicast 1 Slow LBM, CSF
        `HR_PRIO_ACT_MAP(input_port_id, 23,   23,     23,      1,       19)
        // CFM multicast 1 other
        `HR_PRIO_ACT_MAP(input_port_id, 24,   24,     24,      1,       20)
        // CFM unicast CCM, DMR, SLR
        `HR_PRIO_ACT_MAP(input_port_id, 25,   25,     25,      1,       17)
        // CFM unicast DMM, SLM, VSM
        `HR_PRIO_ACT_MAP(input_port_id, 26,   26,     26,      1,       18)
        // CFM unicast Slow CSF, LTR, LBR
        `HR_PRIO_ACT_MAP(input_port_id, 27,   27,     27,      1,       19)
        // CFM unicast other
        `HR_PRIO_ACT_MAP(input_port_id, 28,   28,     28,      1,       20)
        // LPDB Port
        `HR_PRIO_ACT_MAP(input_port_id, 29,   29,     29,      1,       23)
        // LPDB Tunnel
        `HR_PRIO_ACT_MAP(input_port_id, 30,   30,     30,      0,       0)
        // ACP
        `HR_PRIO_ACT_MAP(input_port_id, 31,   31,     31,      1,        1)
        // ACP Layer-3
        `HR_PRIO_ACT_MAP(input_port_id, 32,   -1,     32,      1,        3)
        // Management Bridge
        `HR_PRIO_ACT_MAP(input_port_id, 33,   33,     33,      1,        4)
        // PAA Discovery
        `HR_PRIO_ACT_MAP(input_port_id, 34,   -1,     34,      1,        6)
        // Accedian Broadcast
        `HR_PRIO_ACT_MAP(input_port_id, 35,   -1,     35,      1,        6)
        // L2PT Accedian Tunneling
        `HR_PRIO_ACT_MAP(input_port_id, 36,   36,     36,      1,        1)
        // L2PT Cisco Tunneling
        `HR_PRIO_ACT_MAP(input_port_id, 37,   37,     37,      1,        1)
        // LACP
        `HR_PRIO_ACT_MAP(input_port_id, 38,   38,     38,      1,        8)
        // LLDP
        `HR_PRIO_ACT_MAP(input_port_id, 39,   39,     39,      1,        1)
        // Link OAM
        `HR_PRIO_ACT_MAP(input_port_id, 40,   40,     40,      1,        1)
        // PTP ethernet
        `HR_PRIO_ACT_MAP(input_port_id, 41,   -1,     41,      1,       11)
        // PTP ipv4
        `HR_PRIO_ACT_MAP(input_port_id, 42,   -1,     42,      1,       11)
        // PTP ipv6
        `HR_PRIO_ACT_MAP(input_port_id, 43,   -1,     43,      1,       11)
        // L2PT Service frame enabled
        `HR_PRIO_ACT_MAP(input_port_id, 44,   44,     44,      1,        1)
        // L2PT Service frame disabled
        `HR_PRIO_ACT_MAP(input_port_id, 45,   45,     45,      1,        1)
        // PAA L2 Accedian Unicast FWD CPU
        `HR_PRIO_ACT_MAP(input_port_id, 46,   46,     46,      1,       25)
        // PAA L2 Accedian Unicast Discard CPU
        `HR_PRIO_ACT_MAP(input_port_id, 47,   -1,     47,      0,        0)
        // TWAMP Reflector
        `HR_PRIO_ACT_MAP(input_port_id, 48,   48,     48,      1,       26)
        // General Purpose Unicast
        `HR_PRIO_ACT_MAP(input_port_id, 49,   49,     49,      1,        2)
        // Broadcast
        `HR_PRIO_ACT_MAP(input_port_id, 50,   -1,     50,      1,        3)
        // IPv6 neighbor discovery protocol
        `HR_PRIO_ACT_MAP(input_port_id, 51,   -1,     51,      1,        3)
        // Untagged bridge local
        `HR_PRIO_ACT_MAP(input_port_id, 52,   52,     52,      1,        2)
        // Untagged bridge remote
        `HR_PRIO_ACT_MAP(input_port_id, 53,   53,     53,      1,       14)
    endtask

endclass
