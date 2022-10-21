`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:52:04 10/21/2022 
// Design Name: 
// Module Name:    CLA_4_bit_augmented 
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
module CLA_4_bit_augmented(input[3:0] in1,input[3:0] in2,input cin,output[3:0] out,output P, output G);
wire[3:0] g,p,c;
assign g = in1 & in2;
assign p = in1 ^ in2;
assign c[1] = g[0] | (p[0] & cin);
assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin);
assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin);
assign c[0] = cin;
assign out = (p ^ c);
assign P = (p[0] & p[1] & p[2] & p[3]);
assign G = (g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]));

endmodule
