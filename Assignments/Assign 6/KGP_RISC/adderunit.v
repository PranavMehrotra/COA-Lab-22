`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:53:28 10/21/2022 
// Design Name: 
// Module Name:    adderunit 
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
module adderunit(input signed [31:0] a, input signed [31:0] b, input cin, output [31:0] out, output cout);

wire [15:0] tem;
wire tem_cin;

CLA_16_bit_LCU c1(.in1(a[15:0]),.in2(b[15:0]),.cin(cin),.out(out[15:0]),.cout(tem_cin));
CLA_16_bit_LCU c2(.in1(a[31:16]),.in2(b[31:16]),.cin(tem_cin),.out(out[31:16]),.cout(cout));

endmodule
