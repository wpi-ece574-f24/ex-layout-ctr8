all: syn

#		TIMINGPATH=/opt/skywater/libraries/sky130_fd_sc_hd/latest/timing \
#		TIMINGLIB=sky130_fd_sc_hd__ss_100C_1v60.lib \

syn:
	BASENAME=ctr8 \
		CLOCKPERIOD=2 \
		TIMINGPATH=/opt/cadence/libraries/gsclib045_all_v4.7/gsclib045/timing \
		TIMINGLIB=slow_vdd1v0_basicCells.lib \
		VERILOG='../rtl/ctr8.sv' \
		genus -f genus_script.tcl

clean:
	rm -rf outputs reports genus.log* genus.cmd* *~ fv

