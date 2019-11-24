# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7z020clg400-2

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir D:/FPGA/vivadoproject/PL_part/PL_part.cache/wt [current_project]
set_property parent.project_path D:/FPGA/vivadoproject/PL_part/PL_part.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo d:/FPGA/vivadoproject/PL_part/PL_part.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
add_files D:/FPGA/vivadoproject/PL_part/rom_1024.coe
read_verilog -library xil_defaultlib {
  D:/FPGA/vivadoproject/PL_part/PL_part.srcs/sources_1/new/chinal1_to_fft.v
  D:/FPGA/vivadoproject/PL_part/PL_part.srcs/sources_1/new/chinal2_to_fft.v
  D:/FPGA/vivadoproject/PL_part/PL_part.srcs/sources_1/new/fft_multiper_ifft.v
  D:/FPGA/vivadoproject/PL_part/PL_part.srcs/sources_1/new/ifft1.v
  D:/FPGA/vivadoproject/PL_part/PL_part.srcs/sources_1/imports/new/rom0.v
  D:/FPGA/vivadoproject/PL_part/PL_part.srcs/sources_1/new/pl_top.v
}
read_ip -quiet D:/FPGA/vivadoproject/PL_part/PL_part.srcs/sources_1/ip/dist_mem_gen_0/dist_mem_gen_0.xci
set_property used_in_implementation false [get_files -all d:/FPGA/vivadoproject/PL_part/PL_part.srcs/sources_1/ip/dist_mem_gen_0/dist_mem_gen_0_ooc.xdc]

read_ip -quiet D:/FPGA/vivadoproject/PL_part/PL_part.srcs/sources_1/ip/xfft_0/xfft_0.xci
set_property used_in_implementation false [get_files -all d:/FPGA/vivadoproject/PL_part/PL_part.srcs/sources_1/ip/xfft_0/xfft_0_ooc.xdc]

read_ip -quiet D:/FPGA/vivadoproject/PL_part/PL_part.srcs/sources_1/ip/Ifft_1/Ifft_1.xci
set_property used_in_implementation false [get_files -all d:/FPGA/vivadoproject/PL_part/PL_part.srcs/sources_1/ip/Ifft_1/Ifft_1_ooc.xdc]

read_ip -quiet D:/FPGA/vivadoproject/PL_part/PL_part.srcs/sources_1/ip/cmpy_0/cmpy_0.xci
set_property used_in_implementation false [get_files -all d:/FPGA/vivadoproject/PL_part/PL_part.srcs/sources_1/ip/cmpy_0/cmpy_0_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc D:/FPGA/vivadoproject/PL_part/PL_part.srcs/constrs_1/new/pl.xdc
set_property used_in_implementation false [get_files D:/FPGA/vivadoproject/PL_part/PL_part.srcs/constrs_1/new/pl.xdc]


synth_design -top pl_top -part xc7z020clg400-2


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef pl_top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file pl_top_utilization_synth.rpt -pb pl_top_utilization_synth.pb"
