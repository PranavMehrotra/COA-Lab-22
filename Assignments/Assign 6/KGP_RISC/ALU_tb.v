`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:09:50 10/21/2022
// Design Name:   ALU
// Module Name:   D:/KGP Semesters/SEM 5/COA LAB/COA-Lab-22/Assignments/Assign 6/KGP_RISC/ALU_tb.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_tb;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;
	reg [31:0] shamt;
	reg [31:0] offset;
	reg [1:0] ALUsource;
	reg [2:0] ALUop;

	// Outputs
	wire carry;
	wire zero;
	wire sign;
	wire [31:0] result;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.a(a), 
		.b(b), 
		.shamt(shamt), 
		.offset(offset), 
		.ALUsource(ALUsource), 
		.ALUop(ALUop), 
		.carry(carry), 
		.zero(zero), 
		.sign(sign), 
		.result(result)
	);

	initial begin
		// Initialize Inputs
		a = 32;
		b = 16;
		shamt = 2;
		offset = 10;
		ALUsource = 2'b00;
		ALUop = 3'b000;

		// Wait 100 ns for global reset to finish
		#100;
      ALUsource = 2'b10;
		ALUop = 3'b000;
		#100;
      ALUsource = 2'b00;
		ALUop = 3'b111;
		// Add stimulus here

	end
      
endmodule

