`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:09:32 09/14/2022
// Design Name:   counter
// Module Name:   D:/saransh/binary_counter/countertest.v
// Project Name:  binary_counter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module countertest;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [3:0] out;
	

	// Instantiate the Unit Under Test (UUT)
	counter uut (
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
		$monitor("clk = %d, rst = %d, out = %d ", clk,rst,out);
		#20   rst <= 0;  
		#150   rst <= 1;  
		#50   rst <= 0; 
		
        
		// Add stimulus here

	end
      
endmodule

