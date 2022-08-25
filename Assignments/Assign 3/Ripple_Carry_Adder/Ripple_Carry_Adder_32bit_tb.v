`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:46:44 08/26/2022
// Design Name:   Ripple_Carry_Adder_32bit
// Module Name:   D:/KGP Semesters/SEM 5/COA LAB/Assignments/Assign 3/Ripple_Carry_Adder/Ripple_Carry_Adder_32bit_tb.v
// Project Name:  Ripple_Carry_Adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Ripple_Carry_Adder_32bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Ripple_Carry_Adder_32bit_tb;

	// Inputs
	reg [31:0] in1;
	reg [31:0] in2;
	reg cin;

	// Outputs
	wire [31:0] sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	Ripple_Carry_Adder_32bit uut (
		.in1(in1), 
		.in2(in2), 
		.cin(cin), 
		.sum(sum), 
		.cout(cout)
	);

	initial begin
		// Initialize Inputs
		in1 = 32'd53742381;
		in2 = 32'd78236893;
		cin = 0;
		$monitor ("in1 = %d, in2 = %d, cin = %d, sum = %d, cout = %d", in1, in2, cin, sum, cout);
		// Wait 100 ns for global reset to finish
		#100;
      in1 = 32'd53742381; in2 = 32'd7823689; cin = 1;
		#100;
		in1 = 32'd4294963215; in2 = 32'd4081; cin = 0;
		#100;
		in1 = 32'd4294963215; in2 = 32'd4081; cin = 1;
		#100;
		in1 = 32'd4294963215; in2 = 32'd4086; cin = 1;
	end
      
endmodule

