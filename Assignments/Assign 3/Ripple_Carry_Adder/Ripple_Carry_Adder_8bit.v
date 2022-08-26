`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:47:11 08/25/2022 
// Design Name: 
// Module Name:    Ripple_Carry_Adder_8bit 
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
module Ripple_Carry_Adder_8bit(input[7:0] in1,input[7:0] in2, input cin, output [7:0] sum, output cout);
wire carry[6:0];
full_adder f1(in1[0], in2[0], cin, sum[0], carry[0]);
full_adder f2(in1[1], in2[1], carry[0], sum[1], carry[1]);
full_adder f3(in1[2], in2[2], carry[1], sum[2], carry[2]);
full_adder f4(in1[3], in2[3], carry[2], sum[3], carry[3]);
full_adder f5(in1[4], in2[4], carry[3], sum[4], carry[4]);
full_adder f6(in1[5], in2[5], carry[4], sum[5], carry[5]);
full_adder f7(in1[6], in2[6], carry[5], sum[6], carry[6]);
full_adder f8(in1[7], in2[7], carry[6], sum[7], cout);

endmodule
