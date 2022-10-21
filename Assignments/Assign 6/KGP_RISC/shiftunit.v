`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:13:23 10/21/2022 
// Design Name: 
// Module Name:    shiftunit 
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
module shiftunit(
    input signed [31:0] in, 
    input [31:0] shamt, 
    input [1:0] select,
    output reg [31:0] result
);
	always @(*) begin
		if (select = 2'b00){
			result = 
		
		}



	end

	




endmodule
