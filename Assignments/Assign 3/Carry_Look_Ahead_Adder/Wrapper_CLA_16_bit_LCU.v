`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:10:16 08/31/2022 
// Design Name: 
// Module Name:    Wrapper_CLA_16_bit_LCU 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Wrapper_CLA_16_bit_LCU(input clk, input rst, input[15:0] in1, input[15:0] in2, input cin, output reg [15:0] out, output reg cout, output reg P, output reg G);
reg[15:0] in1_reg,in2_reg;
wire[15:0] out_reg;
reg cin_reg;
wire cout_reg,P_reg,G_reg;
always @(posedge clk)
	begin
		if(rst)
			begin
				in1_reg <= 16'd0;
				in2_reg <= 16'd0;
				cin_reg <= 0;
				cout <= 0;
				P <= 0;
				G <= 0;
				out <= 16'd0;
			end
		else
			begin
				in1_reg <= in1;
				in2_reg <= in2;
				cin_reg <= cin;
				cout <= cout_reg;
				P <= P_reg;
				G <= G_reg;
				out <= out_reg;
			end
	end
	
	CLA_16_bit_LCU cla1(in1_reg,in2_reg,cin_reg,out_reg,cout_reg,P_reg,G_reg);

endmodule
