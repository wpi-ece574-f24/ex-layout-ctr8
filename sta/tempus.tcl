read_lib /opt/cadence/libraries/gsclib045_all_v4.7/gsclib045/timing/slow_vdd1v0_basicCells.lib

read_verilog ../syn/outputs/ctr8_netlist.v
set_top_module ctr8

read_sdc ../syn/outputs/ctr8_constraints.sdc
read_sdf ../syn/outputs/ctr8_delays.sdf

report_timing -late -max_paths 3 > late.rpt
report_timing -early -max_paths 3 > early.rpt

report_timing  -from [all_inputs] -to [all_outputs] -max_paths 16 -path_type summary  > allpaths.rpt
report_timing  -from [all_inputs] -to [all_registers] -max_paths 16 -path_type summary  >> allpaths.rpt
report_timing  -from [all_registers] -to [all_registers] -max_paths 16 -path_type summary >> allpaths.rpt
report_timing  -from [all_registers] -to [all_outputs] -max_paths 16 -path_type summary >> allpaths.rpt
exit
