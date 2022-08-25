`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:56:44 08/25/2022 
// Design Name: 
// Module Name:    Ripple_Carry_Adder_64bit 
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
module Ripple_Carry_Adder_64bit(input[63:0] in1,input[63:0] in2, input cin, output [63:0] sum, output cout);
wire carry;
Ripple_Carry_Adder_32bit r1(in1[31:0],in2[31:0],cin,sum[31:0],carry);
Ripple_Carry_Adder_32bit r2(in1[63:32],in2[63:32],carry,sum[63:32],cout);

endmodule
