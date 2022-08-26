`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:09:50 08/26/2022
// Design Name:   Ripple_Carry_Adder_8bit
// Module Name:   D:/KGP Semesters/SEM 5/COA LAB/Assignments/Assign 3/Ripple_Carry_Adder/Ripple_Carry_Adder_8bit_tb.v
// Project Name:  Ripple_Carry_Adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Ripple_Carry_Adder_8bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Ripple_Carry_Adder_8bit_tb;

	// Inputs
	reg [7:0] in1;
	reg [7:0] in2;
	reg cin;

	// Outputs
	wire [7:0] sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	Ripple_Carry_Adder_8bit uut (
		.in1(in1), 
		.in2(in2), 
		.cin(cin), 
		.sum(sum), 
		.cout(cout)
	);

	initial begin
		// Initialize Inputs
		in1 = 8'd3;
		in2 = 8'd7;
		cin = 0;
		$monitor ("in1 = %d, in2 = %d, cin = %d, sum = %d, cout = %d", in1, in2, cin, sum, cout);
		// Wait 100 ns for global reset to finish
		#100;
      // Add stimulus here
		in1 = 8'd33; in2 = 8'd15; cin = 0;
		#100;
      in1 = 8'd26; in2 = 8'd89; cin = 1;
		#100;
      in1 = 8'd235; in2 = 8'd20; cin = 0;
		#100;
      in1 = 8'd235; in2 = 8'd20; cin = 1;
		#100;
      in1 = 8'd235; in2 = 8'd21; cin = 1;
		

	end
      
endmodule

