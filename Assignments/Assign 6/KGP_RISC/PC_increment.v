`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:43:16 11/09/2022 
// Design Name: 
// Module Name:    PC_increment 
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
module PC_increment(
	input [12:0] instr,
	output [12:0] nextinstr
    );
	assign nextinstr = instr + 1;

endmodule
