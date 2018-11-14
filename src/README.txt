./

        # Macro helper
        clipper_macros.sv

        # Package
        clipper_pkg.sv : WAIT ON INP

        # Test list
        clipper_test_pkg.sv : VID loading, TCs

                # DUT Interfaces
                clipper_if

                          # RAM Interface
                          clipper_ram_top_int_if.sv
                          mem_subsys_if.sv -> ?

                          # Misc IOs
                          clipper_misc_io_if.sv

                          # SFP
                          sfp_ctrl_if.sv

                          # TB controls
                          clipper_ctrl_if.sv


                # 
                env/

                # 
                sub_env/

                #
                seq

                #
                sub_env_seq

                #
                converters

                #
                predictors

                # RAM -> ?
                ram/
                  clipper_ram_top_beh.sv
                  clipper_ram_top_wrp.sv

                # The DUT instance
                tb/

                # Test
                test/
