`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:05:02 08/30/2022
// Design Name:   CLA_4_bit_augmented
// Module Name:   D:/KGP Semesters/SEM 5/COA LAB/COA-Lab-22/Assignments/Assign 3/Carry_Look_Ahead_Adder/CLA_4_bit_augmented_tb.v
// Project Name:  Carry_Look_Ahead_Adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CLA_4_bit_augmented
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CLA_4_bit_augmented_tb;

	// Inputs
	reg [3:0] in1;
	reg [3:0] in2;
	reg cin;

	// Outputs
	wire [3:0] out;
	wire P;
	wire G;

	// Instantiate the Unit Under Test (UUT)
	CLA_4_bit_augmented uut (
		.in1(in1), 
		.in2(in2), 
		.cin(cin), 
		.out(out), 
		.P(P), 
		.G(G)
	);

	initial begin
		// Initialize Inputs
		in1 = 4'd1;
		in2 = 4'd2;
		cin = 0;
		$monitor ("in1 = %d, in2 = %d, cin = %d, out = %d, P = %d, G = %d", in1, in2, cin, out, P, G);
		// Wait 100 ns for global reset to finish
		#100;
		in1 = 4'd5; in2 = 4'd6; cin = 0;
		#100
		in1 = 4'd7; in2 = 4'd5; cin = 1;
		#100
		in1 = 4'd10; in2 = 4'd5; cin = 0;  
		#100
		in1 = 4'd7; in2 = 4'd9; cin = 1; 
		// Add stimulus here

	end
      
endmodule

