`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:50:03 10/21/2022 
// Design Name: 
// Module Name:    Look_Ahead_Carry_Unit 
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
module Look_Ahead_Carry_Unit(input[3:0] g,input[3:0] p,input cin,output[2:0] carry,output carry_out);
	assign carry[0] = g[0] | (p[0] & cin);
	assign carry[1] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin);
	assign carry[2] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin);
	assign carry_out = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & cin);

endmodule
