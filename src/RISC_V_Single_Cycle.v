/******************************************************************
* Description
*	This is the top-level of a RISC-V Microprocessor that can execute the next set of instructions:
*		add
*		addi
* This processor is written Verilog-HDL. It is synthesizabled into hardware.
* Parameter MEMORY_DEPTH configures the program memory to allocate the program to
* be executed. If the size of the program changes, thus, MEMORY_DEPTH must change.
* This processor was made for computer organization class at ITESO.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	16/08/2021
******************************************************************/

module RISC_V_Single_Cycle
#(
	parameter PROGRAM_MEMORY_DEPTH = 64,
	parameter DATA_MEMORY_DEPTH = 256
)

(
	// Inputs
	input clk,
	input reset,

	output [31:0] alu_result
);
//******************************************************************/
//******************************************************************/

//******************************************************************/
//******************************************************************/
/* Signals to connect modules*/

/**Control**/

wire alu_src_w;
wire reg_write_w;
wire mem_to_reg_w;
wire mem_write_w;
wire mem_read_w;
wire [2:0] alu_op_w;
wire branch_w;
wire jal_w;

/** Program Counter**/
wire [31:0] pc_plus_4_w;
wire [31:0] pc_w;


/**Register File**/
wire [31:0] read_data_1_w;
wire [31:0] read_data_2_w;

/**Inmmediate Unit**/
wire [31:0] inmmediate_data_w;

/**ALU**/
wire [31:0] alu_result_w;
wire zero_w;

/**Multiplexer MUX_DATA_OR_IMM_FOR_ALU**/
wire [31:0] read_data_2_or_imm_w;

/**ALU Control**/
wire [3:0] alu_operation_w;

/**Instruction Bus**/	
wire [31:0] instruction_bus_w;

/**AND Branch**/	
wire and_result_w;

/**PC+IMM ADDER**/
wire [31:0] pc_plus_imm_result_w;

/**Multiplexer PC+4 OR +C+IMM**/
wire [31:0] PC_plus_4_or_PC_plus_imm_w;

/**Multiplexer MUX_ALU_RESULT_READ_DATA**/
wire [31:0] mux_alu_result_read_data_w;

/**DATA_MEMORY**/
wire [31:0]read_data_w;

/**OR**/
wire or_result_w;

/**Multiplexer MUX_PC_PLUS_4_OR_MUX_RESULT**/
wire [31:0] mux_pc_4_or_mux_result_w;


//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
Control
CONTROL_UNIT
(
	/****/
	.OP_i(instruction_bus_w[6:0]),
	/** outputus**/
	.ALU_Op_o(alu_op_w),
	.ALU_Src_o(alu_src_w),
	.Reg_Write_o(reg_write_w),
	.Mem_to_Reg_o(mem_to_reg_w),
	.Mem_Read_o(mem_read_w),
	.Mem_Write_o(mem_write_w),
	.Branch_o(branch_w),
	.Jal_o(jal_w)
);



Program_Memory
#(
	.MEMORY_DEPTH(PROGRAM_MEMORY_DEPTH)
)
PROGRAM_MEMORY
(
	.Address_i(pc_w),
	.Instruction_o(instruction_bus_w)
);

// Instancia del pC register
PC_Register
#(
	 .N(32)
)
PC_REGISTER
(
	 .clk(clk),
	 .reset(reset),
	 .Next_PC(PC_plus_4_or_PC_plus_imm_w),
	 .PC_Value(pc_w)
);

Adder_32_Bits
PC_PLUS_4
(
	.Data0(pc_w),
	.Data1(4),
	
	.Result(pc_plus_4_w)
);

Adder_32_Bits
PC_PLUS_IMM
(
	.Data0(pc_w),
	.Data1(inmmediate_data_w),
	
	.Result(pc_plus_imm_result_w)
);


//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/



Register_File
REGISTER_FILE_UNIT
(
	.clk(clk),
	.reset(reset),
	.Reg_Write_i(reg_write_w),
	.Write_Register_i(instruction_bus_w[11:7]),
	.Read_Register_1_i(instruction_bus_w[19:15]),
	.Read_Register_2_i(instruction_bus_w[24:20]),
	.Write_Data_i(mux_pc_4_or_mux_result_w),
	.Read_Data_1_o(read_data_1_w),
	.Read_Data_2_o(read_data_2_w)

);



Immediate_Unit
IMM_UNIT
(  .op_i(instruction_bus_w[6:0]),
   .Instruction_bus_i(instruction_bus_w),
   .Immediate_o(inmmediate_data_w)
);



Multiplexer_2_to_1
#(
	.NBits(32)
)
MUX_DATA_OR_IMM_FOR_ALU
(
	.Selector_i(alu_src_w),
	.Mux_Data_0_i(read_data_2_w),
	.Mux_Data_1_i(inmmediate_data_w),
	
	.Mux_Output_o(read_data_2_or_imm_w)

);



ALU_Control
ALU_CONTROL_UNIT
(
	.funct7_i(instruction_bus_w[30]),
	.ALU_Op_i(alu_op_w),
	.funct3_i(instruction_bus_w[14:12]),
	.ALU_Operation_o(alu_operation_w)

);



ALU
ALU_UNIT
(
	.ALU_Operation_i(alu_operation_w),
	.A_i(read_data_1_w),
	.B_i(read_data_2_or_imm_w),
	.ALU_Result_o(alu_result_w),
	.Zero_o(zero_w)
);

AND_Branch
AND_BRANCH_UNIT
(
	
	.Data0_i(branch_w),
	.Data1_i(zero_w),
	
	.Result_o(and_result_w)
);


Multiplexer_2_to_1
#(
	.NBits(32)
)
MUX_PC_4_OR_PC_IMM
(
	.Selector_i(or_result_w),
	.Mux_Data_0_i(pc_plus_4_w),
	.Mux_Data_1_i(pc_plus_imm_result_w),
	
	.Mux_Output_o(PC_plus_4_or_PC_plus_imm_w)

);

Data_Memory 
#(	
	.DATA_WIDTH(32),
	.MEMORY_DEPTH(DATA_MEMORY_DEPTH)

)
DATA_MEMORY_UNIT
(
	.clk(clk),
	.Mem_Write_i(mem_write_w),
	.Mem_Read_i(mem_read_w),
	.Write_Data_i(read_data_2_w),
	.Address_i(alu_result_w),

	.Read_Data_o(read_data_w)
);
	
Multiplexer_2_to_1
#(
	.NBits(32)
)
MUX_ALU_RESULT_READ_DATA
(
	.Selector_i(mem_to_reg_w),
	.Mux_Data_0_i(alu_result_w),
	.Mux_Data_1_i(read_data_w),
	
	.Mux_Output_o(mux_alu_result_read_data_w)

);

OR_Operator
OR_JUMP
(
	
	.Data0_i(jal_w),
	.Data1_i(and_result_w),
	
	.Result_o(or_result_w)
);

Multiplexer_2_to_1
#(
	.NBits(32)
)
MUX_PC_PLUS_4_OR_MUX_RESULT
(
	.Selector_i(jal_w),
	.Mux_Data_0_i(mux_alu_result_read_data_w),
	.Mux_Data_1_i(pc_plus_4_w),
	
	.Mux_Output_o(mux_pc_4_or_mux_result_w)

);
assign alu_result = alu_result_w;
endmodule

