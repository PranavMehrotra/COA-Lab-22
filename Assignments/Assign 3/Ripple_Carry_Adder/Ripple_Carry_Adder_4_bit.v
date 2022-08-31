`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:56:06 08/31/2022 
// Design Name: 
// Module Name:    Ripple_Carry_Adder_4_bit 
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
module Ripple_Carry_Adder_4_bit(input[3:0] in1,input[3:0] in2, input cin, output [3:0] sum, output cout);
wire carry[2:0];
full_adder f1(in1[0], in2[0], cin, sum[0], carry[0]);
full_adder f2(in1[1], in2[1], carry[0], sum[1], carry[1]);
full_adder f3(in1[2], in2[2], carry[1], sum[2], carry[2]);
full_adder f4(in1[3], in2[3], carry[2], sum[3], cout);

endmodule
