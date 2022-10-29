`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:20:51 10/29/2022
// Design Name:   diffunit
// Module Name:   C:/Users/Saransh Sharma/OneDrive/Documents/GitHub/COA-Lab-22/Assignments/Assign 6/KGP_RISC/diff_tb.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: diffunit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module diff_tb;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;

	// Outputs
	wire [5:0] out;
	wire diff_zero;

	// Instantiate the Unit Under Test (UUT)
	diffunit uut (
		.a(a), 
		.b(b), 
		.out(out), 
		.diff_zero(diff_zero)
	);

	initial begin
		// Initialize Inputs
		a = 31'b101000000;
		b = 31'b011000000;
		

		// Wait 100 ns for global reset to finish
		#100;
        a = 32'b10000000000000000000000000000000;
		  b = 32'b0;
		// Add stimulus here
		#20;
        a = 1;
		  b = 2;
		
	end
      
endmodule

