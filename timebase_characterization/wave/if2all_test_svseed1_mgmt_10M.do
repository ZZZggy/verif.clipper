# Configure exit procedures
onfinish "exit";
onbreak "exit";

# Configure simulation
set SolveArrayResizeMax 20000;
set StdArithNoWarnings 1;
set NumericStdNoWarnings 1;

# Custom DOINIT directives (as defined in Makefile)
mem load -format hex -filltype value -filldata 'hFC /top/dut/inst_clipper2_core/inst_c2fsx_top/inst_vid_index_table/gen_table(0)/inst_bram_rw_rw_ndx_table/bram_model_inst/v_memdual; mem load -format hex -filltype value -filldata 'hFC /top/dut/inst_clipper2_core/inst_c2fsx_top/inst_vid_index_table/gen_table(1)/inst_bram_rw_rw_ndx_table/bram_model_inst/v_memdual; mem load -format hex -filltype value -filldata 'hFC /top/dut/inst_clipper2_core/inst_c2fsx_top/inst_vid_index_table/gen_table(2)/inst_bram_rw_rw_ndx_table/bram_model_inst/v_memdual; mem load -format hex -filltype value -filldata 'hFC /top/dut/inst_clipper2_core/inst_c2fsx_top/inst_vid_index_table/gen_table(3)/inst_bram_rw_rw_ndx_table/bram_model_inst/v_memdual; mem load -format hex -filltype value -filldata 'h3FC /top/dut/inst_clipper2_core/inst_c2fsx_top/inst_vid_index_table/gen_table(4)/inst_bram_rw_rw_ndx_table/bram_model_inst/v_memdual; mem load -format hex -filltype value -filldata 'h3FC /top/dut/inst_clipper2_core/inst_c2fsx_top/inst_vid_index_table/gen_table(5)/inst_bram_rw_rw_ndx_table/bram_model_inst/v_memdual;

# Signal logging configuration
log -r /*;

# Run and quit directives
run -a;quit -f;
