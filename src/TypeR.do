onerror {resume}
quietly virtual function -install /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY -env /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY { &{/RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[6], /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[5], /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[4], /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[3], /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[2], /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[1], /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[0] }} Opcode
quietly virtual function -install /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY -env /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY { &{/RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[11], /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[10], /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[9], /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[8], /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[7] }} Rd
quietly virtual function -install /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY -env /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY { &{/RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[14], /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[13], /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[12] }} Funct3
quietly virtual function -install /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY -env /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY { &{/RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[19], /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[18], /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[17], /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[16], /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[15] }} Rs
quietly virtual function -install /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY -env /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY { &{/RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[31], /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[30], /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[29], /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[28], /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[27], /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[26], /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[25], /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[24], /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[23], /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[22], /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[21], /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[20] }} Imm
quietly virtual function -install /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY -env /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY { &{/RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[24], /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[23], /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[22], /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[21], /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[20] }} Rs2
quietly virtual function -install /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY -env /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY { &{/RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[31], /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[30], /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[29], /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[28], /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[27], /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[26], /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[25] }} Funct7
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Top level signals}
add wave -noupdate -color Yellow /RISC_V_Single_Cycle_TB/clk_tb
add wave -noupdate /RISC_V_Single_Cycle_TB/reset_tb
add wave -noupdate -divider {Inst Format}
add wave -noupdate -radix hexadecimal -childformat {{(6) -radix hexadecimal} {(5) -radix hexadecimal} {(4) -radix hexadecimal} {(3) -radix hexadecimal} {(2) -radix hexadecimal} {(1) -radix hexadecimal} {(0) -radix hexadecimal}} -subitemconfig {{/RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[6]} {-radix hexadecimal} {/RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[5]} {-radix hexadecimal} {/RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[4]} {-radix hexadecimal} {/RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[3]} {-radix hexadecimal} {/RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[2]} {-radix hexadecimal} {/RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[1]} {-radix hexadecimal} {/RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o[0]} {-radix hexadecimal}} /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Opcode
add wave -noupdate -radix decimal /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Rd
add wave -noupdate /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Funct3
add wave -noupdate -label Rs1 -radix decimal /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Rs
add wave -noupdate -radix decimal /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Rs2
add wave -noupdate /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Funct7
add wave -noupdate -divider {ALU signals}
add wave -noupdate -radix decimal /RISC_V_Single_Cycle_TB/DUV/ALU_UNIT/A_i
add wave -noupdate -radix decimal /RISC_V_Single_Cycle_TB/DUV/ALU_UNIT/B_i
add wave -noupdate -radix decimal /RISC_V_Single_Cycle_TB/DUV/ALU_UNIT/ALU_Result_o
add wave -noupdate /RISC_V_Single_Cycle_TB/DUV/ALU_UNIT/Zero_o
add wave -noupdate -divider {Reg file}
add wave -noupdate -radix decimal /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Read_Data_1_o
add wave -noupdate -radix decimal /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Read_Data_2_o
add wave -noupdate -radix decimal /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Read_Register_1_i
add wave -noupdate -radix decimal /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Read_Register_2_i
add wave -noupdate -radix decimal /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Write_Data_i
add wave -noupdate -radix decimal /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Write_Register_i
add wave -noupdate -divider {Reg t1}
add wave -noupdate -radix decimal /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t1/DataInput
add wave -noupdate -radix decimal /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t1/DataOutput
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2 ps} 1} {{Cursor 3} {6 ps} 1}
quietly wave cursor active 2
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {28 ps}
