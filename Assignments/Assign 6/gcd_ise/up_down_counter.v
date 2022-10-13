`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.02.2020 04:20:44
// Design Name: 
// Module Name: up_down_counter
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


module up_down_counter #(parameter WIDTH =32)(
input update_counter,
input inc_dec,
output cnt_zero,
output reg[WIDTH-1:0] out,
input clk,
input reset);
always @(posedge clk)
    begin
        if(reset)
            out<=0;
        else if(update_counter==1 && inc_dec==1)
            begin
                out<=out+1;
            end
        else if(update_counter==1 && inc_dec==0)
            begin
                out<=out-1;
            end
        else
            out<=out;
    end
assign cnt_zero= (out==0)?1:0;
endmodule