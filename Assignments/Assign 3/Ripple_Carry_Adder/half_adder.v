`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:40:49 08/25/2022 
// Design Name: 
// Module Name:    half_adder 
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
module half_adder(input in1,input in2,output out,output cout);
xor g1(out,in1,in2);
and g2(cout,in1,in2);
endmodule
