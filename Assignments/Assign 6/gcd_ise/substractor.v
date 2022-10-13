`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2020 06:22:48
// Design Name: 
// Module Name: substractor
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module substractor #(parameter WIDTH =32)(
input[WIDTH-1:0] in1,
input[WIDTH-1:0] in2,
output[WIDTH-1:0] result,
output comp);
reg[WIDTH-1:0] diff;
assign result=in1-in2;
assign comp=(in1>=in2)?1:0;
endmodule
