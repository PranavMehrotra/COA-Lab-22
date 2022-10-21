`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:08:09 10/21/2022 
// Design Name: 
// Module Name:    mux_32_3X1 
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
module mux_32_3X1(
    input [31:0] a0, 
    input [31:0] a1, 
    input [31:0] a2, 
    input [1:0] select, 
    output reg [31:0] out
	 );
	 
	always @(*) begin
        case (sel)
            2'b00 : out = a0;
            2'b01 : out = a1;
            2'b10 : out = a2;
            default : out = a0;
        endcase
    end

endmodule
