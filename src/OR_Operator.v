/******************************************************************
Miriam Vasquez
******************************************************************/

module OR_Operator

(
	input Data0_i,
	input Data1_i,
	
	output Result_o
);

assign Result_o = Data1_i | Data0_i;


endmodule