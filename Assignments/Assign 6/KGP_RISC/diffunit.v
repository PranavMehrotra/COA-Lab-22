`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:39:35 10/21/2022 
// Design Name: 
// Module Name:    diffunit 
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
module diffunit(input signed [31:0] a, input signed [31:0] b, output [31:0] result);
	wire [31:0] tem,tem2,tem3,tem4;
	assign tem = a^b;
	assign tem2 = (tem - 1);
	assign tem3 = ~tem2;
	assign tem4 = (tem & tem3);
	assign result = tem4;
endmodule
