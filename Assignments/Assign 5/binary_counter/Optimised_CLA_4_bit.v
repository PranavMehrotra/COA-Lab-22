`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:56:49 09/14/2022 
// Design Name: 
// Module Name:    Optimised_CLA_4_bit 
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
module Optimised_CLA_4_bit(input[3:0] in1,input cin,output[3:0] out);
wire[3:0] c,p,g;
assign p = in1;
assign c[1] = (p[0] & cin);
assign c[2] = (p[1] & p[0] & cin);
assign c[3] = (p[2] & p[1] & p[0] & cin);
// assign cout = (p[3] & p[2] & p[1] & p[0] & cin);
assign c[0] = cin;
assign out = (p ^ c);

endmodule
