
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name control -dir "/home/li3939108/Xilinx/control_2/planAhead_run_1" -part xc3s500epq208-5
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property top main $srcset
set_param project.paUcfFile  "main.ucf"
set hdlfile [add_files [list {ipcore_dir/blk_mem_gen_v4_3.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {keyboard.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {dis_state.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {dis_ram.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {bin2bcd.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {main.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
add_files "main.ucf" -fileset [get_property constrset [current_run]]
add_files -norecurse { {/home/li3939108/Xilinx/control_2} {ipcore_dir} }
add_files "ipcore_dir/chipscope_vio.ncf" "ipcore_dir/fifo_dis.ncf" "ipcore_dir/shift_ram_display.ncf" "ipcore_dir/blk_mem_gen_v4_3.ncf" "ipcore_dir/fifo.ncf" -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500epq208-5
