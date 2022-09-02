`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:56:20 08/30/2022 
// Design Name: 
// Module Name:    CLA_16_bit_LCU 
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
module CLA_16_bit_LCU(input[15:0] in1, input[15:0] in2, input cin, output[15:0] out, output cout, output P, output G);
wire[3:0] p,g;
wire[2:0] c;

Look_Ahead_Carry_Unit l1(.g(g),.p(p),.cin(cin),.carry(c),.carry_out(cout),.P(P),.G(G));

CLA_4_bit_augmented a0(.in1(in1[3:0]),.in2(in2[3:0]),.cin(cin),.out(out[3:0]),.P(p[0]),.G(g[0]));
CLA_4_bit_augmented a1(.in1(in1[7:4]),.in2(in2[7:4]),.cin(c[0]),.out(out[7:4]),.P(p[1]),.G(g[1]));
CLA_4_bit_augmented a2(.in1(in1[11:8]),.in2(in2[11:8]),.cin(c[1]),.out(out[11:8]),.P(p[2]),.G(g[2]));
CLA_4_bit_augmented a3(.in1(in1[15:12]),.in2(in2[15:12]),.cin(c[2]),.out(out[15:12]),.P(p[3]),.G(g[3]));


endmodule
