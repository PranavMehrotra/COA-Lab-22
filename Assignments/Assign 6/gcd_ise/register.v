`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.02.2020 20:04:08
// Design Name: 
// Module Name: register
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


module register#(parameter WIDTH =32)(in,out,con,clk,reset);
input[WIDTH-1:0] in;
input con,clk,reset;
output[WIDTH-1:0] out;
reg [WIDTH-1:0] out_reg;
always @(posedge clk)
    begin
        if(con)
            out_reg<=in;
        else
            out_reg<=out_reg;
    end
assign out=out_reg;
endmodule