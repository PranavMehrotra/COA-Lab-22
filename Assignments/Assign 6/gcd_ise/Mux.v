`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.07.2018 17:24:12
// Design Name: 
// Module Name: Mux
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


module Mux #(parameter WIDTH =32)(
input[WIDTH-1:0] in1,
input[WIDTH-1:0] in2,
input sel,
output[WIDTH-1:0] out
    );
    
assign out=(sel)?in2:in1;

endmodule
