`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:53:18 10/27/2022
// Design Name:   branch_mechanism
// Module Name:   D:/KGP Semesters/SEM 5/COA LAB/COA-Lab-22/Assignments/Assign 6/KGP_RISC/branch_mechanism_tb.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: branch_mechanism
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module branch_mechanism_tb;

	// Inputs
	reg [31:0] rsOut;
	reg carry;
	reg zero;
	reg sign;
	reg [31:0] pda;
	reg [31:0] offset;
	reg [31:0] instr4;
	reg [2:0] branch;

	// Outputs
	wire [31:0] nextInstr;

	// Instantiate the Unit Under Test (UUT)
	branch_mechanism uut (
		.rsOut(rsOut), 
		.carry(carry), 
		.zero(zero), 
		.sign(sign), 
		.pda(pda), 
		.offset(offset), 
		.instr4(instr4), 
		.branch(branch), 
		.nextInstr(nextInstr)
	);

	initial begin
		// Initialize Inputs
		rsOut = 0;
		carry = 0;
		zero = 0;
		sign = 0;
		pda = 0;
		offset = 0;
		instr4 = 0;
		branch = 0;

		// Wait 100 ns for global reset to finish
		#20
		branch = 3'b011;
		zero = 1'b0;
		sign = 1'b1;
		instr4 = 32'b00000000000000110000000000000101;
		offset = 32'b00000000000000000000100010000000;
      #20
		branch = 3'b000;
		// Add stimulus here

	end
      
endmodule

