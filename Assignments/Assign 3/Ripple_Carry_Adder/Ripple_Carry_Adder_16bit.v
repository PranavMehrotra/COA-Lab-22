`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:50:58 08/25/2022 
// Design Name: 
// Module Name:    Ripple_Carry_Adder_16bit 
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
// Assignement No.: 3
// Semester: Autumn 2022
// Group No.: 65
// Member 1: Pranav Mehrotra (20CS10085)
// Member 2: Saransh Sharma (20CS30065)
//////////////////////////////////////////////////////////////////////////////////
module Ripple_Carry_Adder_16bit(input[15:0] in1,input[15:0] in2, input cin, output [15:0] sum, output cout);
wire carry;
Ripple_Carry_Adder_8bit r1(in1[7:0],in2[7:0],cin,sum[7:0],carry);
Ripple_Carry_Adder_8bit r2(in1[15:8],in2[15:8],carry,sum[15:8],cout);

endmodule
