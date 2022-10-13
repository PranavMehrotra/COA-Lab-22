`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.07.2018 18:57:45
// Design Name: 
// Module Name: lShift
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


module lShift #(parameter WIDTH =32)(
input[WIDTH-1:0] in,
output[WIDTH-1:0] out);

assign out=in<<1;

endmodule
