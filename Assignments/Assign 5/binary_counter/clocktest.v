`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:50:39 09/14/2022
// Design Name:   clock_divider
// Module Name:   D:/saransh/binary_counter/clocktest.v
// Project Name:  binary_counter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: clock_divider
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module clocktest;

	// Inputs
	reg clock_in;

	// Outputs
	wire clock_out;

	// Instantiate the Unit Under Test (UUT)
	clock_divider uut (
		.clock_in(clock_in), 
		.clock_out(clock_out)
	);

	initial begin
		// Initialize Inputs
		clock_in = 0;

		// Wait 100 ns for global reset to finish
		forever #10 clock_in = ~clock_in;
        
		// Add stimulus here

	end
      
endmodule

