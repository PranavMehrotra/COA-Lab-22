`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:59:18 08/30/2022 
// Design Name: 
// Module Name:    CLA_16_bit_ripple 
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
module CLA_16_bit_ripple(input[15:0] in1, input[15:0] in2, input cin, output[15:0] out, output cout);
wire[3:0] c;

CLA_4_bit a0(.in1(in1[3:0]),.in2(in2[3:0]),.cin(cin),.out(out[3:0]),.cout(c[0]));
CLA_4_bit a1(.in1(in1[7:4]),.in2(in2[7:4]),.cin(c[0]),.out(out[7:4]),.cout(c[1]));
CLA_4_bit a2(.in1(in1[11:8]),.in2(in2[11:8]),.cin(c[1]),.out(out[11:8]),.cout(c[2]));
CLA_4_bit a3(.in1(in1[15:12]),.in2(in2[15:12]),.cin(c[2]),.out(out[15:12]),.cout(cout));

endmodule
