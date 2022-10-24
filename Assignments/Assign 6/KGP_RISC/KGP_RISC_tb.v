`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:25:43 10/24/2022
// Design Name:   KGP_RISC
// Module Name:   D:/KGP Semesters/SEM 5/COA LAB/COA-Lab-22/Assignments/Assign 6/KGP_RISC/KGP_RISC_tb.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: KGP_RISC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module KGP_RISC_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [31:0] instruction;

	// Outputs
	wire [31:0] result;

	// Instantiate the Unit Under Test (UUT)
	KGP_RISC uut (
		.clk(clk), 
		.rst(rst), 
		.instruction(instruction), 
		.result(result)
	);
	always #20 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		instruction = 32'd0;
		#60
		rst=0;
		instruction = 32'b00001000001000110000000000000111;
		#10
		instruction = 32'd0;
		// Wait 100 ns for global reset to finish
		#150;
      instruction = 32'b00001000011000110000000000000100;
		// Add stimulus here

	end
      
endmodule

