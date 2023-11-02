/******************************************************************
* Description
*	This is control unit for the RISC-V Microprocessor. The control unit is 
*	in charge of generation of the control signals. Its only input 
*	corresponds to opcode from the instruction bus.
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	16/08/2021
******************************************************************/
module Control
(
	input [6:0]OP_i,
	
	
	output Branch_o,
	output Mem_Read_o,
	output Mem_to_Reg_o,
	output Mem_Write_o,
	output ALU_Src_o,
	output Reg_Write_o,
	output [2:0]ALU_Op_o,
	output Jal_o,
	output Jalr_o
	
);

localparam R_Type 		= 7'b0110011;
localparam I_Type_Logic = 7'b0010011;
localparam U_Type			= 7'b0110111;
localparam B_Type			= 7'b1100011;
localparam S_Type       = 7'b0100011;
localparam I_Type_Load  = 7'b0000011;
localparam J_Type       = 7'b1101111;
localparam I_Type_Jump  = 7'b1100111;

reg [10:0] control_values;

always@(OP_i) begin
	case(OP_i)//                           9876_54_3_210
		R_Type: 			control_values = 11'b00001_00_0_000;
		I_Type_Logic:  control_values	= 11'b00001_00_1_001;
		U_Type:			control_values = 11'b00001_00_1_010;
		B_Type:			control_values = 11'b00100_00_0_011;
		S_Type:			control_values = 11'b00000_01_1_100;
		I_Type_Load:	control_values = 11'b00011_10_1_101;
		J_Type:			control_values = 11'b01101_00_1_110;
	   I_Type_Jump:	control_values = 11'b11101_00_1_111;
		
		
		default:
			control_values= 11'b00000_00_0_000;
		endcase
end	

assign Jalr_o = control_values[10];

assign Jal_o = control_values[9];

assign Branch_o = control_values[8];

assign Mem_to_Reg_o = control_values[7];

assign Reg_Write_o = control_values[6];

assign Mem_Read_o = control_values[5];

assign Mem_Write_o = control_values[4];

assign ALU_Src_o = control_values[3];

assign ALU_Op_o = control_values[2:0];	

endmodule


