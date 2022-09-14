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
module counter (input clk,      // Declare input port for the clock to allow counter to count up  
                input rst,              // Declare input port for the reset to allow the counter to be reset to 0 when required  
                output reg[3:0] out);    // Declare 4-bit output port to get the counter values  
  
  //wire clk_out;
  // This always block will be triggered at the rising edge of clk (0->1)  
  // Once inside this block, it checks if the reset is 0, then change out to zero   
  // If reset is 1, then the design should be allowed to count up, so increment the counter    

  clock_divider a0(clk,clk_out);  
  always @ (posedge clk_out) begin 
	 if (!rst)  
		out <= 0;  
	 else
		out <= out + 1;  
  end
  	  
endmodule

