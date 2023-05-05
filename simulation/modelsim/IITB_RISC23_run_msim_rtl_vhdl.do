transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {D:/Hazardless_Testbox/EE_309_Project/mux2to1.vhd}
vcom -93 -work work {D:/Hazardless_Testbox/EE_309_Project/Stage4_Exec.vhdl}
vcom -93 -work work {D:/Hazardless_Testbox/EE_309_Project/instr_mem.vhdl}
vcom -93 -work work {D:/Hazardless_Testbox/EE_309_Project/data_mem.vhdl}
vcom -93 -work work {D:/Hazardless_Testbox/EE_309_Project/ALU_2.vhdl}
vcom -93 -work work {D:/Hazardless_Testbox/EE_309_Project/Flags.vhd}
vcom -93 -work work {D:/Hazardless_Testbox/EE_309_Project/regfile.vhdl}
vcom -93 -work work {D:/Hazardless_Testbox/EE_309_Project/Write_Back.vhd}
vcom -93 -work work {D:/Hazardless_Testbox/EE_309_Project/Register_Read.vhd}
vcom -93 -work work {D:/Hazardless_Testbox/EE_309_Project/RefAdd.vhd}
vcom -93 -work work {D:/Hazardless_Testbox/EE_309_Project/MEM_STAGE.vhd}
vcom -93 -work work {D:/Hazardless_Testbox/EE_309_Project/Complementor.vhd}
vcom -93 -work work {D:/Hazardless_Testbox/EE_309_Project/main.vhd}
vcom -93 -work work {D:/Hazardless_Testbox/EE_309_Project/Stage2_WithoutHazards.vhd}
vcom -93 -work work {D:/Hazardless_Testbox/EE_309_Project/pipe_reg.vhd}
vcom -93 -work work {D:/Hazardless_Testbox/EE_309_Project/mux3to1.vhd}

