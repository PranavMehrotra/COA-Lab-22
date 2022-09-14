`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:49:58 09/13/2022 
// Design Name: 
// Module Name:    counter 
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
module counter (input clk,      			// Declare input port   
                input rst,              // Declare reset input port  
                output reg[3:0] out);    // Declare output counter  
  
  
  clock_divider a0(clk,rst,clk_out);  
  always @ (posedge clk_out or posedge rst) begin 
	 if (rst)  
		out <= 4'b0;  
	 else
		out <= out + 4'b1;  
  end
  	  
endmodule

