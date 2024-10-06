if {![info exists ::env(VERILOG)] } {
    puts "Error: missing VERILOG"
    exit(0)
}
set vfileset [getenv VERILOG]

if {![info exists ::env(LEF)] } {
    puts "Error: missing LEF"
    exit(0)
}
set lef [getenv LEF]

if {![info exists ::env(BASENAME)] } {
    set basename "default"
} else {
    set basename [getenv BASENAME]
}

set_db max_cpus_per_server 1 
file delete -force synthDb
gui_hide
set bloc ${basename}
set_db init_power_nets "VDD"
set_db init_ground_nets "VSS"

read_mmmc "viewDefinition.tcl"

read_physical -lef $lef

read_hdl -language sv $vfileset

elaborate $bloc

init_design

set_db auto_ungroup none

file mkdir reports

check_timing_intent
check_timing_intent -verbose > reports/${basename}_check_timing_intent.rpt

syn_generic
syn_map
syn_opt

file mkdir syndb

set finalDb ./syndb/final
file mkdir $finalDb
write_design -encounter -basename $finalDb

report_timing > reports/${basename}_report_timing.rpt
report_power  > reports/${basename}_report_power.rpt
report_area   > reports/${basename}_report_area.rpt
report_qor    > reports/${basename}_report_qor.rpt

file mkdir synout
set synout synout

set outputnetlist     ${synout}/${basename}_netlist.v
set outputconstraints ${synout}/${basename}_constraints.sdc
set outputdelays      ${synout}/${basename}_delays.sdf

write_hdl > $outputnetlist
write_sdc -view func_default > $outputconstraints
write_sdf -timescale ns -nonegchecks -recrem split -edges check_edge  -setuphold split > $outputdelays


exit
