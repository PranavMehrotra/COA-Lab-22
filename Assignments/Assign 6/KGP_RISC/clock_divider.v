`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:03:39 10/28/2022 
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
module clock_divider(input wire clock_in, input rst, output clock_out);
	reg[25:0] counter;
	always @(posedge clock_in or posedge rst) begin
		if(rst) begin
			counter <= 26'd0;
			end
		else begin
			counter <= counter + 26'b1;
			end
	end
	assign clock_out = counter[3];
endmodule
