
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name KGP_RISC -dir "D:/KGP Semesters/SEM 5/COA LAB/COA-Lab-22/Assignments/Assign 6/KGP_RISC/planAhead_run_3" -part xc7a100tcsg324-1
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/KGP Semesters/SEM 5/COA LAB/COA-Lab-22/Assignments/Assign 6/KGP_RISC/KGP_RISC.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/KGP Semesters/SEM 5/COA LAB/COA-Lab-22/Assignments/Assign 6/KGP_RISC} {ipcore_dir} }
add_files [list {ipcore_dir/data_memory_bram.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/instr_memory_bram.ncf}] -fileset [get_property constrset [current_run]]
set_property target_constrs_file "timing.ucf" [current_fileset -constrset]
add_files [list {timing.ucf}] -fileset [get_property constrset [current_run]]
link_design
