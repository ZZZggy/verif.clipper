# Work library name
WORK     = work
# Top level Makefile
PRJ_TOP  = 1
# Technology: Altera
ALT      = 1
# Compile Xilinx only for acd_basic simulation
XIL      = 1
# Simulation top module
SIM_TOP  = top

# Testbench SV files
VER_SRC = \
src/reg/clipper_top.sv \
src/clipper_pkg.sv \
src/clipper_test_pkg.sv \
src/ram/clipper_ram_top_beh.sv \
src/clipper_if/mem_subsys_if.sv \
src/clipper_if/clipper_ram_top_int_if.sv \
src/clipper_if/clipper_ctrl_if.sv \
src/clipper_if/clipper_misc_io_if.sv \
src/clipper_if/sfp_ctrl_if.sv \
src/tb/top.sv

# Testbench SVH files which are included by other SV files
INCLUDES = \
src/env/*.svh \
src/sub_env/*.svh \
src/sub_env/clipper_inp_env/*.svh \
src/predictors/*.svh \
src/test/*.svh \
src/seq/*.svh \
src/sub_env_seq/*.svh \
src/converters/*.svh \
src/tb/*.sv \
src/reg_by_hand/*.svh \
src/reg/*.svh \
src/reg/*.sv

# Simulation libraries
# Chip uses Altera StratixV, Xilinx included here only for acd_basic
LIST_LIB = \
-L work -L uvm_vip \
-L altera_mf_ver \
-L altera_lnsim_ver \
-L lpm_ver \
-L sgate_ver \
-L altera_ver \
-L arriaii_ver \
-L arriaii_hssi_ver \
-L stratixv_ver \
-L stratixv_hssi_ver \
-L sgate \
-L altera_lnsim \
-L stratixv \
-L stratixv_hssi \
-L altera_mf \
-L ethernet_xgmac \
-L pll_class2 \
-L pll_10g_synce \
-L pll_sys \
-L phy_1g10g_reset_controller \
-L phy_1g_reset_controller \
-L phy_1g_10g \
-L low_latency_phy_1pll \
-L low_latency_phy_combo \
-L tse_tbi \
-L reconfig_8x1g10g \
-L reconfig_c1lt \
-L reconfig_TestSet \
-L pll_xgmii

#LIST_LIB = \
-L work -L uvm_vip \
-L phy_1g10g_reset_controller -L phy_1g_10g -L reconfig_8x1g10g \
-L altera_ver  -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver \
-L stratixv_ver -L stratixv_hssi_ver
#-L stratixv_pcie_hip_ver \
#-L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L stratixv -L stratixv_hssi -L stratixv_pcie_hip

#-L unisims_ver -L secureip -L unimacro_ver -L xilinxcorelib_ver

# TODO: needed?
# Add `defines, only applied if re-compiled i.e. pre-vopt
ifneq ($(ACD_MM_BYTE_WIDTH),)
PLUS_DEFINE+=+define+ACD_MM_BYTE_WIDTH=$(ACD_MM_BYTE_WIDTH)
endif

# Additional vlog compilation parameters e.g. +incdirs+<path> -L <lib>
VER_PARAMS = \
$(LIST_LIB) \
$(PLUS_DEFINE) \
+incdir+${ACD_VERIF_DIR}/acd_uvm/src \
+incdir+src \
+incdir+src/env \
+incdir+src/sub_env \
+incdir+src/sub_env/clipper_inp_env \
+incdir+src/predictors \
+incdir+src/test \
+incdir+src/seq \
+incdir+src/sub_env_seq \
+incdir+src/converters \
+incdir+src/reg_by_hand \
+incdir+src/reg

# Module dependencies
DEPEND = \
${ACD_BASIC_DIR}/pkg \
${ACD_DESIGN_DIR}/clipper/src \
${ACD_VERIF_DIR}/common_verif \
${ACD_VERIF_DIR}/acd_uvm \
${ACD_VERIF_DIR}/acd_mm_uvm_vip \
${ACD_VERIF_DIR}/thi_uvm_vip \
${ACD_VERIF_DIR}/stream_uvm_vip \
${ACD_VERIF_DIR}/protocol \
${ACD_VERIF_DIR}/class_action \
${ACD_VERIF_DIR}/insect_uvm_vip \
${ACD_VERIF_DIR}/pkt_key_uvc \
${ACD_CORE_DIR}/classifier2/sim/src \
${ACD_CORE_DIR}/extract2/sim \
${ACD_VERIF_DIR}/ethernet_uvm_vip \
${ACD_VERIF_DIR}/mac_uvc \
${ACD_VERIF_DIR}/platform_uvc \
${ACD_CORE_DIR}/nwl_rldram3_ctrl/models/memory/micron \
${ACD_CORE_DIR}/nwl_rldram3_ctrl

#################################################
# Compilation / Optimization
#################################################
include ${MAKE_RUN}

# TODO: temporarily suppressing following errors:
# ** Error (suppressible): src/xm_reg/xgmac_stats.vhd(198): (vopt-1130) Port "sclr" of entity "scfifo" is not in the component being instantiated.
# ** Error (suppressible): phy_1g10g_rom.vhd(107): (vopt-1130) Port "wren_a" of entity "altsyncram" is not in the component being instantiated.
VOPT_SUP = -suppress 1130

# VOPT parameters
VOPT_PARAMS = \
-work "$(SIM_LIB)" \
-modelsimini $(SIM_INI) \
$(LIST_LIB) \
$(VOPT_SUP)

DO_MEM_LOAD=\
"mem load -format hex -filltype value -filldata 'h3FC /top/dut/inst_clipper_core/acd_core_inst/u_vid_index_table/gen_table(0)/inst_bram_rw_rw_ndx_table/bram_model_inst/mem_array_ty;" \
"mem load -format hex -filltype value -filldata 'h3FC /top/dut/inst_clipper_core/acd_core_inst/u_vid_index_table/gen_table(1)/inst_bram_rw_rw_ndx_table/bram_model_inst/v_memdual;" \
"mem load -format hex -filltype value -filldata 'h3FC /top/dut/inst_clipper_core/acd_core_inst/u_vid_index_table/gen_table(2)/inst_bram_rw_rw_ndx_table/bram_model_inst/v_memdual;" \
"mem load -format hex -filltype value -filldata 'h3FC /top/dut/inst_clipper_core/acd_core_inst/u_vid_index_table/gen_table(3)/inst_bram_rw_rw_ndx_table/bram_model_inst/v_memdual;" \
"mem load -format hex -filltype value -filldata 'h1FFC /top/dut/inst_clipper_core/acd_core_inst/u_vid_index_table/gen_table(4)/inst_bram_rw_rw_ndx_table/bram_model_inst/v_memdual;" \
"mem load -format hex -filltype value -filldata 'h1FFC /top/dut/inst_clipper_core/acd_core_inst/u_vid_index_table/gen_table(5)/inst_bram_rw_rw_ndx_table/bram_model_inst/v_memdual;" \
"mem load -format hex -filltype value -filldata 'hFFC /top/dut/inst_clipper_core/acd_core_inst/u_vid_index_table/gen_table(6)/inst_bram_rw_rw_ndx_table/bram_model_inst/v_memdual;" \
"mem load -format hex -filltype value -filldata 'hFFC /top/dut/inst_clipper_core/acd_core_inst/u_vid_index_table/gen_table(7)/inst_bram_rw_rw_ndx_table/bram_model_inst/v_memdual;" \
"mem load -format hex -filltype value -filldata 'h3FC /top/dut/inst_clipper_core/acd_core_inst/u_vid_index_table/gen_table(8)/inst_bram_rw_rw_ndx_table/bram_model_inst/v_memdual;" \
"mem load -format hex -filltype value -filldata 'h3FC /top/dut/inst_clipper_core/acd_core_inst/u_vid_index_table/gen_table(9)/inst_bram_rw_rw_ndx_table/bram_model_inst/v_memdual;" \
"mem load -format hex -filltype value -filldata 'h3FC /top/dut/inst_clipper_core/acd_core_inst/u_vid_index_table/gen_table(10)/inst_bram_rw_rw_ndx_table/bram_model_inst/v_memdual;" \
"mem load -format hex -filltype value -filldata 'h3FC /top/dut/inst_clipper_core/acd_core_inst/u_vid_index_table/gen_table(11)/inst_bram_rw_rw_ndx_table/bram_model_inst/v_memdual;"
sim:     DOINIT += $(DO_MEM_LOAD)
sim_phy: DOINIT += $(DO_MEM_LOAD)
sim_beh: DOINIT += $(DO_MEM_LOAD)

# Optimization where TB float parameters are not "baked-in",
# allowing the use of vsim -G <parameter>=<override> or SIM_ARGS="-G ..."
#+floatparameters+G_USE_PHY+G_USE_RGMII+G_USE_BEH_RAM+G_USE_I2C+G_SYNTHESIS
.dummy_vopt: compile_all .dummy_ramfiles $(SIM_COMP_TSTAMP)
	vopt +acc -o $(SIM_TOP)_vopt $(SIM_TOP) $(VOPT_PARAMS)
	touch .dummy_vopt


.dummy_phy_vopt: compile_all .dummy_ramfiles $(SIM_COMP_TSTAMP)
	vopt +acc -o $(SIM_TOP)_phy_vopt $(SIM_TOP) $(VOPT_PARAMS) -G G_USE_PHY=1
	touch .dummy_phy_vopt

.dummy_beh_vopt: compile_all .dummy_ramfiles $(SIM_COMP_TSTAMP)
	vopt +acc -o $(SIM_TOP)_beh_vopt $(SIM_TOP) $(VOPT_PARAMS) -G G_USE_BEH_RAM=1
	touch .dummy_beh_vopt

# rld3_x36_<ms/sl>_1_sim_13 (Quartus 13) or rld3_x36_<ms/sl>_1_sim (Quartus 15)
.dummy_ramfiles:
	cp -f ${ACD_CORE_DIR}/nwl_rldram3_ctrl/phy/rld3_x36_master_1/rld3_x36_ms_1_sim/rld3_x36_ms_1/*.hex .
	cp -f ${ACD_CORE_DIR}/nwl_rldram3_ctrl/phy/rld3_x36_slave_1/rld3_x36_sl_1_sim/rld3_x36_sl_1/*.hex .
	cp -f ${ACD_CORE_DIR}/nwl_rldram3_ctrl/phy/rld3_x36_master/rld3_x36_ms_sim/rld3_x36_ms/*.hex .
	cp -f ${ACD_CORE_DIR}/clipper_phy_if/src/phy_1g10g.mif .
	touch .dummy_ramfiles

#################################################
# Simulation
#################################################

# Defautl test name
TEST_NAME  ?= sanity_test

# Simulation settings
TIMEUNIT   ?= ps
SOLVER_REV ?= 10.4a

TEST_NAME_LOG  = $(TEST_NAME)_svseed$(SV_SEED)

# VSIM parameters
VSIM_PARAMS = \
$(VSIM_PARAMS_BASE) \
$(LIST_LIB) \
-t $(TIMEUNIT) \
-solverev $(SOLVER_REV) \
-simstats

# Ensure simluation output directory
simlogs:
	mkdir -p $(SIMLOGS)

# Sim targets
.PHONY: sim sim_novopt

# Override TB parameter as needed e.g.:
# SIM_ARGS="-G G_USE_BEH_RAM=0 -G G_SYNTHESIS=1"
sim: .dummy_vopt .dummy_ramfiles simlogs dofile
	$(VSIM) $(VSIM_PARAMS) $(WORK).$(SIM_TOP)_vopt

sim_phy: .dummy_phy_vopt .dummy_ramfiles simlogs dofile
	$(VSIM) $(VSIM_PARAMS) $(WORK).$(SIM_TOP)_phy_vopt

sim_beh: .dummy_beh_vopt .dummy_ramfiles simlogs dofile
	$(VSIM) $(VSIM_PARAMS) $(WORK).$(SIM_TOP)_beh_vopt

sim_novopt: .dummy_ver .dummy_ramfiles simlogs dofile $(SIM_COMP_TSTAMP)
	$(VSIM) $(VSIM_PARAMS) $(WORK).$(SIM_TOP) -novopt


#################################################
# MISC
#################################################
# Register generation paths
REG_XML_SRC    = ${ACD_DESIGN_DIR}/clipper/doc/regdefs/clipper_top.xml
REG_UVM_DEST   = src/reg/
REG_XML_INCDIR = "${ACD_CORE_DIR}/clipper_phy_if/doc/regdefs/,${ACD_CORE_DIR}/pktgen_ats/doc/regdefs/,${ACD_CORE_DIR}/timebase2/doc/regdefs/"

include ${MAKE_RUN}_sim_uvm

.PHONY: gen_uvmreg hack_uvmreg
gen_uvmreg: uvmreg hack_uvmreg

hack_uvmreg:
	@echo "----------------------------------------------"
	@echo "Hacking regmodel to reuse acd_core packages..."
	@echo "----------------------------------------------"
	@echo "classifier2: regmodel compiled @ modular level."
	@rm -f src/reg/classifiers_regs.svh
	@find ./src/reg -type f -name 'classifiers_p[0-9]_*regs.svh' -delete
	@find ./src/reg -type f -name 'classifiers_p10_*regs.svh'    -delete
	@find ./src/reg -type f -name 'classifiers_p11_*regs.svh'    -delete
	@find ./src/reg -type f -name 'classifiers_p12_*regs.svh'    -delete
	@sed -i 's/action_index_uni10g/cos_actions/'                           src/reg/cos_actions_uni10g_regs.svh
	@sed -i 's/action_index_uni1g/cos_actions/'                            src/reg/cos_actions_uni1g_regs.svh
	@sed -i 's/action_index_nni10g/cos_actions/'                           src/reg/cos_actions_nni10g_regs.svh
	@sed -i 's/`include \"classifiers_p[[:digit:]]_pe_regs.svh\"//'        src/reg/clipper_top.sv
	@sed -i 's/`include \"classifiers_p[[:digit:]]_rule_info_regs.svh\"//' src/reg/clipper_top.sv
	@sed -i 's/`include \"classifiers_p[[:digit:]]_globals_regs.svh\"//'   src/reg/clipper_top.sv
	@sed -i 's/`include \"classifiers_p[[:digit:]]_regs.svh\"//'           src/reg/clipper_top.sv
	@sed -i 's/`include \"classifiers_p10_pe_regs.svh\"//'                 src/reg/clipper_top.sv
	@sed -i 's/`include \"classifiers_p11_pe_regs.svh\"//'                 src/reg/clipper_top.sv
	@sed -i 's/`include \"classifiers_p12_pe_regs.svh\"//'                 src/reg/clipper_top.sv
	@sed -i 's/`include \"classifiers_p10_rule_info_regs.svh\"//'          src/reg/clipper_top.sv
	@sed -i 's/`include \"classifiers_p11_rule_info_regs.svh\"//'          src/reg/clipper_top.sv
	@sed -i 's/`include \"classifiers_p12_rule_info_regs.svh\"//'          src/reg/clipper_top.sv
	@sed -i 's/`include \"classifiers_p10_globals_regs.svh\"//'            src/reg/clipper_top.sv
	@sed -i 's/`include \"classifiers_p11_globals_regs.svh\"//'            src/reg/clipper_top.sv
	@sed -i 's/`include \"classifiers_p12_globals_regs.svh\"//'            src/reg/clipper_top.sv
	@sed -i 's/`include \"classifiers_p10_regs.svh\"//'                    src/reg/clipper_top.sv
	@sed -i 's/`include \"classifiers_p11_regs.svh\"//'                    src/reg/clipper_top.sv
	@sed -i 's/`include \"classifiers_p12_regs.svh\"//'                    src/reg/clipper_top.sv
	@sed -i 's/`include \"action_index_uni1g_regs.svh\"//'                 src/reg/clipper_top.sv
	@sed -i 's/`include \"action_index_uni10g_regs.svh\"//'                src/reg/clipper_top.sv
	@sed -i 's/`include \"action_index_nni10g_regs.svh\"/`include \"cos_actions_regs.svh\"/' src/reg/clipper_top.sv
	@sed -i '/^$$/d' src/reg/clipper_top.sv
	@echo "----------------------------------------------"

help::
	@echo "----------------------------"
	@echo "TESTBENCH SIMULATION TARGETS"
	@echo "----------------------------"
	@echo "sim         : simulation after vopt optimization"
	@echo "sim_beh     : same as: sim SIM_ARGS=\"-G G_USE_BEH_RAM=1\""
	@echo "sim_phy     : same as: sim SIM_ARGS=\"-G G_USE_PHY=1\""
	@echo "sim_novopt  : skip all optimizations"
	@echo "----------------------------"
	@echo "TESTBENCH OVERRIDABLE PARAMETERS (e.g. SIM_ARGS=\"-G G_USE_PHY=1\")"
	@echo "----------------------------"
	@echo "-G G_USE_PHY=<0|1>"
	@echo "-G G_USE_RGMII=<0|1>"
	@echo "-G G_USE_BEH_RAM=<0|1>"
	@echo "-G G_USE_I2C=<0|1>"
	@echo "-G G_SYNTHESIS=<0|1>"
	@echo "----------------------------"
	@echo "TESTBENCH COMPILATION ARGS (applied only if recompiled i.e. pre-vopt)"
	@echo "----------------------------"
	@echo "ACD_MM_BYTE_WIDTH=<int>"
	@echo "----------------------------"
	@echo "TESTBENCH PLUSARGS (use with SIM_ARGS=)"
	@echo "----------------------------"
	@echo "+PORT_SPEED=<port_id>,<speed>,<port_id>,<speed>..."
	@echo "    por_id : 0=CPU, 1-8=Iterfaces, 9=MGMT"
	@echo "    speed  : 0=10G, 1=1G, 2=100M, 3=10M"
	@echo "+THI_ENA=<0|1>"
	@echo "+SFP_LOOPBACK_ENA=<port_id>,<0|1>,<port_id>,<0|1>"
	@echo "+REG_COV_ENA=<0|1>"
	@echo "+UVM_REG_PATH=<UVM_FRONTDOOR|UVM_BACKDOOR|UVM_DEFAULT_PATH>"
	@echo "+SIZE_MIN=<int>"
	@echo "+SIZE_MAX=<int>"
	@echo "+STIM_CNT_TIME_US=<int>"
	@echo "+NB_FLOW=<int>"
	@echo "+RATE=<real>"
	@echo "+RATE_CTRL=<0|l>"
# TODO: review adn add desired options in test_base
	@echo "+INP_BP_ENA=<bit>"
	@echo "+INP_BP_DUTY_LO=<int>"
	@echo "+INP_BP_DUTY_HI=<int>"
	@echo "+INP_BP_MODE=<\"READY\"|\"NREADY\"|\"DUTYCYCLE\"|\"RAND\">"
