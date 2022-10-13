`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.07.2018 18:49:20
// Design Name: 
// Module Name: complementer
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


module complementer #(parameter WIDTH =32)(
input[WIDTH-1:0] in1,
input[WIDTH-1:0] in2,
output[WIDTH-1:0] out);

assign out=(in1-in2);
endmodule
