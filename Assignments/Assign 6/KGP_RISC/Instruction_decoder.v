`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:32:30 10/22/2022 
// Design Name: 
// Module Name:    Instruction_decoder 
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
module Instruction_decoder(
	input [31:0] instruction,
   output [5:0] opcode,
   output [5:0] funccode,
   output [25:0] pda,
	output [4:0] rs,
	output [4:0] rt,
	output [4:0] shamt,
	output [15:0] imm
);

	assign opcode = instruction[31:26];
	assign funccode = instruction[5:0];
	assign pda = instruction[25:0];
	assign rs = instruction[25:21];         
    assign rt = instruction[20:16];         
    assign shamt = instruction[10:6];      
    assign imm = instruction[15:0];

endmodule
