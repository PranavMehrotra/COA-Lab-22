`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:37:23 01/15/2021 
// Design Name: 
// Module Name:    adder_struct 
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
module adder_struct(input[4:0] in1,input[4:0] in2,output [4:0] out);
wire c_out1,c_out2,c_out3,c_out4;
half_addr addr1(.in1(in1[0]),.in2(in2[0]),.out(out[0]),.cout(c_out1));
full_addr addr2(.in1(in1[1]),.in2(in2[1]),.cin(c_out1),.out(out[1]),.cout(c_out2));
full_addr addr3(.in1(in1[2]),.in2(in2[2]),.cin(c_out2),.out(out[2]),.cout(c_out3));
full_addr addr4(.in1(in1[3]),.in2(in2[3]),.cin(c_out3),.out(out[3]),.cout(c_out4));
full_addr addr5(.in1(in1[4]),.in2(in2[4]),.cin(c_out4),.out(out[4]),.cout());
endmodule

