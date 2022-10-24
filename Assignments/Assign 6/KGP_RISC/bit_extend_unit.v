`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:10:51 10/22/2022 
// Design Name: 
// Module Name:    bit_extend_unit 
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
module bit_extend_unit(
	input [4:0] shamt,
	input [15:0] offset,
	input [25:0] pda,
	output [31:0] shamtOut,
	output [31:0] offsetOut,
	output [31:0] pdaOut
    );
	wire [31:0] t1,t2;
	always @(*) begin
	shamtOut = {{27{1'b0}}, shamt};
	t1 = {{16{offset[15]}}, offset};
	t2 = {{6{pda[25]}}, pda};
	offsetOut = t1 << 2;
	pdaOut = t2 << 2;
    end

endmodule
