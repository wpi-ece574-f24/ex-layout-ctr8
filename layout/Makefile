syn:
	BASENAME=ctr8 \
	CLOCKPERIOD=2 \
	TIMINGPATH=/opt/cadence/libraries/gsclib045_all_v4.7/gsclib045/timing \
	TIMINGLIB=slow_vdd1v0_basicCells.lib \
	VERILOG='../rtl/ctr8.sv' \
	LEF='/opt/cadence/libraries/gsclib045_all_v4.7/gsclib045/lef/gsclib045_tech.lef /opt/cadence/libraries/gsclib045_all_v4.7/gsclib045/lef/gsclib045_macro.lef /opt/cadence/libraries/giolib045_v3.5/lef/giolib045.lef' \
	QRC='/opt/cadence/libraries/gsclib045_all_v4.7/gsclib045/qrc/qx/gpdk045.tch' \
	genus -f run_genus.tcl

layout:
	innovus -stylus -files run_innovus.tcl

clean:
	rm -rf reports syndb synout *~ innovus.cmd* innovus.log* genus.cmd* genus.log* RPT out synthDb fv rc_model.bin *.rpt qrc*.log
