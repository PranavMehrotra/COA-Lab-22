`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:53:29 08/25/2022 
// Design Name: 
// Module Name:    Ripple_Carry_Adder_32bit 
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
module Ripple_Carry_Adder_32bit(input[31:0] in1,input[31:0] in2, input cin, output [31:0] sum, output cout);
wire carry;
Ripple_Carry_Adder_16bit r1(in1[15:0],in2[15:0],cin,sum[15:0],carry);
Ripple_Carry_Adder_16bit r2(in1[31:16],in2[31:16],carry,sum[31:16],cout);

endmodule

