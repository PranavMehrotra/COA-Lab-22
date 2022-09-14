`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:14:20 09/14/2022
// Design Name:   counter_structural
// Module Name:   D:/binary_counter/counter_structural_tb.v
// Project Name:  binary_counter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: counter_structural
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module counter_structural_tb;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [3:0] out;

	// Instantiate the Unit Under Test (UUT)
	counter_structural uut (
		.clk(clk), 
		.rst(rst), 
		.out(out)
	);

	always #10 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk <= 0;
		rst <= 0;
		
		// Wait 100 ns for global reset to finish
		$monitor("clk = %d, rst = %d, out = %d", clk,rst,out);
		#10   rst <= 1;
		#20   rst <= 0;
        
		// Add stimulus here

	end
      
endmodule

