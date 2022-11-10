`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:41:02 11/10/2022 
// Design Name: 
// Module Name:    mux_2X1 
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
module mux_2X1(
	input [10:0] a0,
	input [4:0] a1,
	input select,
	output reg [10:0] out
	);
	
	always @(*) begin
        case (select)
            1'b0 : out = a0;
            1'b1 : out = {{6'b0},a1};
            default : out = a0;
        endcase
    end

endmodule
