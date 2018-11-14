onerror {resume}
quietly WaveActivateNextPane {} 0

set portaux     [list 1 2 3 4]
set porttraffic [list 5 6]
set portmgmt    [list 7]
set port10g     [list 1 3 5]
set port1g      [list 2 4 6 7]
 
for {set i 0} {$i < 7} {incr i} {

    if {[lsearch $port10g [expr $i+1]] != -1} {
        add wave -noupdate -group "IF2CPU" -group [format "Port-%s" [expr $i+1]] -divider "xgmii"
        add wave -noupdate -group "IF2CPU" -group [format "Port-%s" [expr $i+1]] /top/dut/inst_clipper2_core/inst_multispeed_mac/inst_clipper_xgmac_wrapper/gen_xgmac_inst($i)/inst_xgmac/xgmii_rx_ctrl
        add wave -noupdate -group "IF2CPU" -group [format "Port-%s" [expr $i+1]] /top/dut/inst_clipper2_core/inst_multispeed_mac/inst_clipper_xgmac_wrapper/gen_xgmac_inst($i)/inst_xgmac/xgmii_rx_data
        add wave -noupdate -group "IF2CPU" -group [format "Port-%s" [expr $i+1]] -divider "ts_insertor"
        add wave -noupdate -group "IF2CPU" -group [format "Port-%s" [expr $i+1]] /top/dut/inst_clipper2_core/inst_c2fsx_top/inp_pre2tm([expr $i+1])
        add wave -noupdate -group "IF2CPU" -group [format "Port-%s" [expr $i+1]] /top/dut/inst_clipper2_core/inst_c2fsx_top/blk_traffic_manager/inp_pre2tm_with_ts([expr $i+1])
    } elseif {[lsearch $port1g [expr $i+1]] != -1} {
    
        add wave -noupdate -group "IF2CPU" -group [format "Port-%s" [expr $i+1]] -divider "gmii"
        add wave -noupdate -group "IF2CPU" -group [format "Port-%s" [expr $i+1]] /top/dut/inst_clipper2_core/gm_rx_d([expr $i+1])
        add wave -noupdate -group "IF2CPU" -group [format "Port-%s" [expr $i+1]] /top/dut/inst_clipper2_core/gm_rx_dv([expr $i+1])
        add wave -noupdate -group "IF2CPU" -group [format "Port-%s" [expr $i+1]] /top/dut/inst_clipper2_core/gm_rx_err([expr $i+1])
        add wave -noupdate -group "IF2CPU" -group [format "Port-%s" [expr $i+1]] -divider "ts_insertor"
        add wave -noupdate -group "IF2CPU" -group [format "Port-%s" [expr $i+1]] /top/dut/inst_clipper2_core/inst_c2fsx_top/inp_pre2tm([expr $i+1])
        add wave -noupdate -group "IF2CPU" -group [format "Port-%s" [expr $i+1]] /top/dut/inst_clipper2_core/inst_c2fsx_top/blk_traffic_manager/inp_pre2tm_with_ts([expr $i+1])
    } else {
        exit 1 [format "Case impossible : port_id (%s) is not in port1g (%s) or port10g (%s) list" [expr $i+1] $port1g $port10g]
    }
    
    if {[lsearch $portaux [expr $i+1]] != -1} {
        add wave -noupdate -group "IF2CPU" -group [format "Port-%s" [expr $i+1]] /top/dut/inst_clipper2_core/inst_c2fsx_top/time_base_minus_with_mgmt([expr $i+1])
    } elseif {([lsearch $porttraffic [expr $i+1]] != -1) || ([lsearch $portmgmt [expr $i+1]] != -1)} {
        add wave -noupdate -group "IF2CPU" -group [format "Port-%s" [expr $i+1]] /top/dut/inst_clipper2_core/inst_c2fsx_top/gen_ts_double_comp_patch([expr $i+1])/s_ts_fifo_wr_ena
        add wave -noupdate -group "IF2CPU" -group [format "Port-%s" [expr $i+1]] /top/dut/inst_clipper2_core/inst_c2fsx_top/thi_timebase
        add wave -noupdate -group "IF2CPU" -group [format "Port-%s" [expr $i+1]] /top/dut/inst_clipper2_core/inst_c2fsx_top/time_base_minus_with_mgmt([expr $i+1])
        add wave -noupdate -group "IF2CPU" -group [format "Port-%s" [expr $i+1]] /top/dut/inst_clipper2_core/inst_c2fsx_top/s_time_base_minus_for_dbl_comp([expr $i+1])
        
    }
        
}


add wave -noupdate -group "CPU2IF" -divider "CPU gmii"
add wave -noupdate -group "CPU2IF" /top/dut/inst_clipper2_core/gm_rx_d([expr 0])
add wave -noupdate -group "CPU2IF" /top/dut/inst_clipper2_core/gm_rx_dv([expr 0])
add wave -noupdate -group "CPU2IF" /top/dut/inst_clipper2_core/gm_rx_err([expr 0])

for {set i 0} {$i < 7} {incr i} {
    
    
    if {[lsearch $port10g [expr $i+1]] != -1} {
        add wave -noupdate -group "CPU2IF" -group [format "Port-%s" [expr $i+1]] -divider "xgmii"
        add wave -noupdate -group "CPU2IF" -group [format "Port-%s" [expr $i+1]] /top/dut/inst_clipper2_core/inst_multispeed_mac/inst_clipper_xgmac_wrapper/gen_xgmac_inst($i)/inst_xgmac/xgmii_tx_ctrl
        add wave -noupdate -group "CPU2IF" -group [format "Port-%s" [expr $i+1]] /top/dut/inst_clipper2_core/inst_multispeed_mac/inst_clipper_xgmac_wrapper/gen_xgmac_inst($i)/inst_xgmac/xgmii_tx_data
        add wave -noupdate -group "CPU2IF" -group [format "Port-%s" [expr $i+1]] -divider "ts_punch"
        add wave -noupdate -group "CPU2IF" -group [format "Port-%s" [expr $i+1]] /top/dut/inst_clipper2_core/inst_c2fsx_top/blk_traffic_manager/inst_traffic_manager/blk_tm2onp/gen_tbb_onp([expr $i+1])/inst_tbb_generic/gen_tbb64/u_tbb64/gen_src(0)/gen_buff/inst_pkt_buf/inst_time_stamp/time_base_int
        add wave -noupdate -group "CPU2IF" -group [format "Port-%s" [expr $i+1]] /top/dut/inst_clipper2_core/inst_c2fsx_top/blk_traffic_manager/inst_traffic_manager/i_np_mac2tm_port_speed([expr $i+1])
        add wave -noupdate -group "CPU2IF" -group [format "Port-%s" [expr $i+1]] /top/dut/inst_clipper2_core/inst_c2fsx_top/thi_timebase
        add wave -noupdate -group "CPU2IF" -group [format "Port-%s" [expr $i+1]] /top/dut/inst_clipper2_core/inst_c2fsx_top/time_base_plus_with_mgmt([expr $i+1])
    } elseif {[lsearch $port1g [expr $i+1]] != -1} {
    
        add wave -noupdate -group "CPU2IF" -group [format "Port-%s" [expr $i+1]] -divider "gmii"
        add wave -noupdate -group "CPU2IF" -group [format "Port-%s" [expr $i+1]] /top/dut/inst_clipper2_core/inst_multispeed_mac/u_clipper_tse_wrapper/u_multiport_tse_top/gen_tse_top([expr $i+1])/gen_mac_enable/u_tse_top_mux_stats/u_tse_top/o_gm_tx_en
        add wave -noupdate -group "CPU2IF" -group [format "Port-%s" [expr $i+1]] /top/dut/inst_clipper2_core/inst_multispeed_mac/u_clipper_tse_wrapper/u_multiport_tse_top/gen_tse_top([expr $i+1])/gen_mac_enable/u_tse_top_mux_stats/u_tse_top/o_gm_tx_d
        add wave -noupdate -group "CPU2IF" -group [format "Port-%s" [expr $i+1]] /top/dut/inst_clipper2_core/inst_multispeed_mac/u_clipper_tse_wrapper/u_multiport_tse_top/gen_tse_top([expr $i+1])/gen_mac_enable/u_tse_top_mux_stats/u_tse_top/o_gm_tx_err
        add wave -noupdate -group "CPU2IF" -group [format "Port-%s" [expr $i+1]] -divider "ts_punch"
        
        if {([lsearch $portmgmt [expr $i+1]] != -1)} {
            #add wave -noupdate -group "CPU2IF" -group [format "Port-%s" [expr $i+1]] /top/dut/inst_clipper2_core/inst_c2fsx_top/blk_traffic_manager/inst_traffic_manager/blk_tm2onp/gen_tbb_mgmt([expr $i+1])/inst_tbb_generic/gen_tbb64/u_tbb64/gen_src(0)/gen_buff/inst_pkt_buf/inst_time_stamp/*
            add wave -noupdate -group "CPU2IF" -group [format "Port-%s" [expr $i+1]] /top/dut/inst_clipper2_core/inst_c2fsx_top/blk_traffic_manager/inst_traffic_manager/blk_tm2onp/gen_tbb_mgmt([expr $i+1])/inst_tbb_generic/gen_tbb64/u_tbb64/gen_src(0)/gen_buff/inst_pkt_buf/inst_time_stamp/time_base_int
            add wave -noupdate -group "CPU2IF" -group [format "Port-%s" [expr $i+1]] /top/dut/inst_clipper2_core/inst_c2fsx_top/blk_traffic_manager/inst_traffic_manager/i_np_mac2tm_port_speed([expr $i+1])
            add wave -noupdate -group "CPU2IF" -group [format "Port-%s" [expr $i+1]] /top/dut/inst_clipper2_core/inst_c2fsx_top/thi_timebase
            add wave -noupdate -group "CPU2IF" -group [format "Port-%s" [expr $i+1]] /top/dut/inst_clipper2_core/inst_c2fsx_top/time_base_plus_with_mgmt([expr $i+1])
        } else {
            #add wave -noupdate -group "CPU2IF" -group [format "Port-%s" [expr $i+1]] /top/dut/inst_clipper2_core/inst_c2fsx_top/blk_traffic_manager/inst_traffic_manager/blk_tm2onp/gen_tbb_onp([expr $i+1])/inst_tbb_generic/gen_tbb64/u_tbb64/gen_src(0)/gen_buff/inst_pkt_buf/inst_time_stamp/*
            add wave -noupdate -group "CPU2IF" -group [format "Port-%s" [expr $i+1]] /top/dut/inst_clipper2_core/inst_c2fsx_top/blk_traffic_manager/inst_traffic_manager/blk_tm2onp/gen_tbb_onp([expr $i+1])/inst_tbb_generic/gen_tbb64/u_tbb64/gen_src(0)/gen_buff/inst_pkt_buf/inst_time_stamp/time_base_int
            add wave -noupdate -group "CPU2IF" -group [format "Port-%s" [expr $i+1]] /top/dut/inst_clipper2_core/inst_c2fsx_top/blk_traffic_manager/inst_traffic_manager/i_np_mac2tm_port_speed([expr $i+1])
            add wave -noupdate -group "CPU2IF" -group [format "Port-%s" [expr $i+1]] /top/dut/inst_clipper2_core/inst_c2fsx_top/thi_timebase
            add wave -noupdate -group "CPU2IF" -group [format "Port-%s" [expr $i+1]] /top/dut/inst_clipper2_core/inst_c2fsx_top/time_base_plus_with_mgmt([expr $i+1])
        }
        
    } else {
        exit 1 [format "Case impossible : port_id (%s) is not in port1g (%s) or port10g (%s) list" [expr $i+1] $port1g $port10g]
    }
}



#WaveRestoreCursors {{Cursor 1} {63141000 ps} 1} {{Cursor 2} {62761610 ps} 1} {{Cursor 3} {22917000 ps} 1} {{Cursor 4} {21772010 ps} 0}

TreeUpdate [SetDefaultTree]

#quietly wave cursor active 2
configure wave -namecolwidth 190
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 8000
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits us
update
WaveRestoreZoom {62750390 ps} {62770198 ps}
