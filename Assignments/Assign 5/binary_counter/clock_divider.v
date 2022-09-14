`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:49:45 09/14/2022 
// Design Name: 
// Module Name:    clock_divider 
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
module clock_divider(input wire clock_in,output reg clock_out = 0);
	integer counter = 0;
	always @(posedge clock_in) begin
		if(counter >=5000000 || clock_out==1) begin
			counter <= 0;
			clock_out <= ~clock_out;
			end
		else
			counter <= counter + 1; 
	end
endmodule
