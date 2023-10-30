/******************************************************************
* Description
*	This is an 32-bit arithetic logic unit that can execute the next set of operations:
*		add

* This ALU is written by using behavioral description.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	16/08/2021
******************************************************************/

module ALU 
(
	input [3:0] ALU_Operation_i,
	input signed [31:0] A_i,
	input signed [31:0] B_i,
	output reg Zero_o,
	output reg [31:0] ALU_Result_o
);

localparam ADD = 4'b00_00;
localparam SUB = 4'b00_01; 
localparam AND = 4'b00_10;
localparam OR  = 4'b00_11;
localparam XOR = 4'b01_00;
localparam SLL = 4'b01_01;
localparam SRL = 4'b01_10;
localparam LUI = 4'b01_11;
localparam BEQ = 4'b10_00;
localparam BNE = 4'b10_01;
	
   always @ (A_i or B_i or ALU_Operation_i)
     begin
		case (ALU_Operation_i)
			ADD: ALU_Result_o = A_i + B_i;
			SUB: ALU_Result_o = A_i - B_i;
			AND: ALU_Result_o = A_i & B_i;
			OR : ALU_Result_o = A_i | B_i;
			XOR: ALU_Result_o = A_i ^ B_i;
			SLL: ALU_Result_o = A_i << B_i;
			SRL: ALU_Result_o = A_i >> B_i;
			LUI: ALU_Result_o = B_i << 12;
			BEQ: ALU_Result_o = (A_i == B_i)? 1'b0 : 1'b1;
			BNE: ALU_Result_o = (A_i != B_i)? 1'b0 : 1'b1;
		
		default:
			ALU_Result_o = 0;
		endcase // case(control)
		
		Zero_o = (ALU_Result_o == 0) ? 1'b1 : 1'b0;
		
     end // always @ (A or B or control)
endmodule // ALU