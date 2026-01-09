#set_attribute init_lib_search_path /home/priyank/Desktop/ECG_Chip2/lib

#set_attribute init_hdl_search_path /home/c2s-pa1/POSIT_MULTIPLIER_SYNTHESIS/adder

set_attribute init_hdl_search_path /home/c2s-pa1/deepak_ec_junior_latest/Radix_16_64_bit/Radix_16_8b_cppg

set_attribute library {/tools/sclpdk_new/SCLPDK_V3.0_KIT/scl180/stdcell/fs120/4M1IL/liberty/lib_flow_ss/tsl18fs120_scl_ss.lib /tools/sclpdk_new/SCLPDK_V3.0_KIT/scl180/iopad/cio150/4M1L/liberty/tsl18cio150_max.lib /tools/sclpdk_new/SCLPDK_V3.0_KIT/scl180/stdcell/fs120/4M1IL/liberty/lib_flow_ff/tsl18fs120_scl_ff.lib /tools/sclpdk_new/SCLPDK_V3.0_KIT/scl180/iopad/cio150/4M1L/liberty/tsl18cio150_min.lib /tools/sclpdk_new/SCLPDK_V3.0_KIT/scl180/memory/dpram/4M1L/DP_SRAM_rd3_1024x8/rd3_1024x8_ss_1p62v_125c.lib /tools/sclpdk_new/SCLPDK_V3.0_KIT/scl180/memory/dpram/4M1L/DP_SRAM_rd3_1024x8/rd3_1024x8_ff_1p98v_m40c.lib}

set_attribute information_level 7 /

read_hdl {Radix_16_8b_cppg.v}

elaborate Radix_16_8b_cppg

#read_sdc /home/c2s-pa1/CHIP_TEENA_FINAL/constraints/constraints_top.sdc

syn_generic

set_attribute syn_map_effort medium 

syn_map

set_attribute syn_opt_effort medium

syn_opt

write_hdl > rad_mult.v
write_sdc > rad_mult.sdc
write_sdf -nonegchecks -edges check_edge -timescale ns -recrem split > delays.sdf
#write_scandef > test_top_chip_scanDEF.scandef
#write_do_lec -golden_design test_top_chip_intermediate.v -revised_design ecg_rpeak_top_chip_wrapper_m.v -logfile  intermediate2final.lec.log intermediate2final.lec.do

##write_do_lec -golden_design fv_map -revised_design ${_OUTPUTS_PATH}/${DESIGN}_incremental.v -logfile  ${_LOG_PATH}/intermediate2final.lec.log > ${_OUTPUTS_PATH}/intermediate2final.lec.do

report gates >> gates.rpt
report qor >> qor.rpt
report area >> area.rpt
report timing >> timing.rpt
report power >> power.rpt
puts "============================"
puts "Synthesis Finished ........."
puts "============================"


