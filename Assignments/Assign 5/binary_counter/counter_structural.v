`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:28:27 09/14/2022 
// Design Name: 
// Module Name:    counter_structural 
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
module counter_structural(input clk, input rst, output[3:0] out,output clk_out);
wire[3:0] dff_in;
wire[3:0] dff_out;
clock_divider a0(clk,clk_out);
assign in = out;
dff d1(.clk(clk),.rst(rst),.in(dff_in),.out(dff_out));
Optimised_CLA_4_bit c1(.in1(dff_out),.cin(clk_out),.out(dff_in));
assign out = dff_out;
endmodule
