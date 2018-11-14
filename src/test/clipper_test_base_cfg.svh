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

`ifndef CLIPPER_TEST_BASE_CFG__SVH
`define CLIPPER_TEST_BASE_CFG__SVH

// These parameters can be modified in testcase extensions, or overridden via CLI.
class clipper_test_base_cfg extends uvm_object;

    //--------------------------------------------------------------------------------
    // Group: Test configuration parameters
    //--------------------------------------------------------------------------------

    // Variable: size_min
    // Minimum Packet size
    int unsigned size_min = 0;

    // Variable: size_max
    // Maximum Packet size
    int unsigned size_max = 0;

    // Variable: stim_cnt_time_us
    // Stimulus generation count or time in us
    int unsigned stim_cnt_time_us;

    // Variable: nb_flow
    // Number of flows
    int unsigned nb_flow = 0;

    // Variable: rate
    //
    real rate = 1000000.0;

    // Variable: trans_rec
    // Transaction recording switch
    bit trans_rec = 0;

    //--------------------------------------------------------------------------------
    // Group: Environment configuration parameters
    //--------------------------------------------------------------------------------

    // Variable: port_speed
    // Select port speed: 10/100/1000/10G, when applicable (default: 1000)
    rand port_speed_e port_speed [NB_ALL_PORTS] = '{default: PS_1G};

    // Variable: rate_ctrl
    // Enable aggregate rate control
    bit rate_ctrl = 0;

    // Variable: thi_ena
    // Enable THI (Tornado Header Interface) for registers access
    // When THI disabled/bypassed, access registers via ACD_MM virtual interface (default)
    bit thi_ena = 0;

    // Variable: sfp_loopback_ena
    // Enable SFP local loopback (default: disabled)
    bit [NB_IF_PORTS-1:0] sfp_loopback_ena = '0;

    // Variable: eot_win_ns
    // End-of-test activity detection window size (default window: 100ns)
    int unsigned eot_win_ns = 100;

    // Variable: eot_win_cnt
    // Maximum number of end-of-test windows to check (default drain time: 100us)
    int unsigned eot_win_cnt = 1000;

    // Variable: reg_cov_ena
    // Enable register coverage. Note that coverage must still be enabled for specific:
    //  -blocks:    <uvm_reg_block>.set_coverage(<models>)
    //  -registers: <uvm_reg>.enable_coverage(<models>)
    bit reg_cov_ena = 0;

    // Variable: uvm_reg_path
    // UVM register access path
    uvm_path_e uvm_reg_path = UVM_DEFAULT_PATH;

    // TODO: review if keep following (and register in uvm fields):
    bit          inp_bp_ena;
    int unsigned inp_bp_duty_lo = 0;
    int unsigned inp_bp_duty_hi = 1;
    string       inp_bp_mode = "READY";


    //---------------------------------
    // Constraints
    //---------------------------------
    constraint port_speed_c {
        foreach(port_speed[i]) {
            if (i == PORT_CPU) {
                port_speed[i] == PS_1G;
            }

            if (i inside {[PORT_IF:PORT_IF_LAST]}) {
                port_speed[i] inside {PS_1G, PS_10G};
            }

            if (i == PORT_MGMT) {
                port_speed[i] inside {PS_100M, PS_1G}; // removed 10M for performance
            }
        }
    }


    //---------------------------------
    // Coverage
    //---------------------------------
    port_speed_cg port_speed_cfg_cg;


    // UVM Factory Registration Macro
    `uvm_object_utils_begin(clipper_test_base_cfg)
        `uvm_field_int(size_min,         UVM_ALL_ON | UVM_UNSIGNED)
        `uvm_field_int(size_max,         UVM_ALL_ON | UVM_UNSIGNED)
        `uvm_field_int(stim_cnt_time_us, UVM_ALL_ON | UVM_UNSIGNED)
        `uvm_field_int(nb_flow,          UVM_ALL_ON | UVM_UNSIGNED)
        `uvm_field_real(rate,            UVM_ALL_ON | UVM_UNSIGNED)
        `uvm_field_sarray_enum(port_speed_e, port_speed, UVM_ALL_ON)
        `uvm_field_int(thi_ena,          UVM_ALL_ON | UVM_UNSIGNED)
        `uvm_field_int(sfp_loopback_ena, UVM_ALL_ON | UVM_HEX)
        `uvm_field_int(reg_cov_ena,      UVM_ALL_ON | UVM_UNSIGNED)
        `uvm_field_enum(uvm_path_e,     uvm_reg_path, UVM_ALL_ON)
    `uvm_object_utils_end

    // Constructor: new
    function new (string name = type_name);
        super.new(name);

        port_speed_cfg_cg = new;
    endfunction

    // Function: sample_coverpoints
    // Collect coverage for current test configuration
    function void sample_coverage();
        for (int i=0; i < NB_ALL_PORTS; i++) begin
            port_speed_cfg_cg.sample(i, port_speed[i]);
        end
    endfunction

    // Function: port_rate
    // Return maximum port rate in Mbps based on <port_speed> configuration
    virtual function int port_rate(int id);
        case(port_speed[id])
            PS_10M  : port_rate = 10;
            PS_100M : port_rate = 100;
            PS_1G   : port_rate = 1000;
            default : port_rate = 10000; //PS_10G
        endcase
    endfunction

endclass

`endif
