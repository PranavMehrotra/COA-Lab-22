`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:37:26 10/27/2021 
// Design Name: 
// Module Name:    top_mod 
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
module top_mod(clk,ena,wea,addra,dina,douta);

input clk,ena,wea;
input[3:0] addra;
input[15:0] dina;
output[15:0] douta;

bram mod(
  .clka(clk),
  .ena(ena),
  .wea(wea),
  .addra(addra),
  .dina(dina),
  .douta(douta)
);

endmodule
