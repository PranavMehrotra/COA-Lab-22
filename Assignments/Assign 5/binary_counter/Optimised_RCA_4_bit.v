`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:29:13 09/14/2022 
// Design Name: 
// Module Name:    Optimised_RCA_4_bit 
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
module Optimised_RCA_4_bit(input[3:0] in1, input cin, input rst, output [3:0] sum);
wire carry[3:0];
half_adder h1(in1[0], cin, sum[0], carry[0]);
half_adder h2(in1[1], carry[0], sum[1], carry[1]);
half_adder h3(in1[2], carry[1], sum[2], carry[2]);
half_adder h4(in1[3], carry[2], sum[3], carry[3]);
and a0(sum[0],sum[0],!rst);
and a1(sum[1],sum[1],!rst);
and a2(sum[2],sum[2],!rst);
and a3(sum[3],sum[3],!rst);
endmodule
