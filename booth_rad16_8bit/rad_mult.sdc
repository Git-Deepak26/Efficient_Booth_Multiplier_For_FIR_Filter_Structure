# ####################################################################

#  Created by Genus(TM) Synthesis Solution 21.14-s082_1 on Wed Aug 06 12:20:40 IST 2025

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design Radix_16_8b_cppg

set_clock_gating_check -setup 0.0 
set_wire_load_mode "enclosed"
set_dont_use true [get_lib_cells tsl18fs120_scl_ss/slbhb2]
set_dont_use true [get_lib_cells tsl18fs120_scl_ss/slbhb1]
set_dont_use true [get_lib_cells tsl18fs120_scl_ss/slbhb4]
