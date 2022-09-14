`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:05:08 09/14/2022
// Design Name:   counter_structural
// Module Name:   D:/KGP Semesters/SEM 5/COA LAB/COA-Lab-22/Assignments/Assign 5/binary_counter/counter_structural_tb.v
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
	wire clk_out;
	// Instantiate the Unit Under Test (UUT)
	counter_structural uut (
		.clk(clk), 
		.rst(rst), 
		.out(out),
		.clk_out(clk_out)
	);

	always #10 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk <= 0;
		rst <= 0;
		
		// Wait 100 ns for global reset to finish
		$monitor("clk = %d, rst = %d, out = %d , clk_out = %d", clk,rst,out,clk_out);
		#10   rst <= 1;
		#20   rst <= 0;
        
		// Add stimulus here

	end
      
endmodule

