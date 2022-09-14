`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:10:52 09/14/2022 
// Design Name: 
// Module Name:    dff 
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
module dff(input clk,input rst,input[3:0] in,output reg[3:0] out);
always@(posedge clk or posedge rst)
    begin
        if(rst)
            out<=4'd0;
        else
            out<=in;
    end
endmodule
