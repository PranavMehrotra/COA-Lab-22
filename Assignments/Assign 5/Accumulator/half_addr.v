`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:38:05 01/15/2021 
// Design Name: 
// Module Name:    half_addr 
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
module half_addr(input in1,input in2,output out,output cout);
xor g1(out,in1,in2);
and g2(cout,in1,in2);
endmodule
