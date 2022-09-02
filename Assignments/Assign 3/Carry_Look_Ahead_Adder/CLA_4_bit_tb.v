`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:49:26 08/30/2022
// Design Name:   CLA_4_bit
// Module Name:   D:/KGP Semesters/SEM 5/COA LAB/COA-Lab-22/Assignments/Assign 3/Carry_Look_Ahead_Adder/CLA_4_bit_tb.v
// Project Name:  Carry_Look_Ahead_Adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CLA_4_bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CLA_4_bit_tb;

	// Inputs
	reg [3:0] in1;
	reg [3:0] in2;
	reg cin;

	// Outputs
	wire [3:0] out;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	CLA_4_bit uut (
		.in1(in1), 
		.in2(in2), 
		.cin(cin), 
		.out(out), 
		.cout(cout)
	);

	initial begin
		// Initialize Inputs
		in1 = 4'd1;
		in2 = 4'd2;
		cin = 0;
		$monitor ("in1 = %d, in2 = %d, cin = %d, out = %d, cout = %d", in1, in2, cin, out, cout);
		// Wait 100 ns for global reset to finish
		#100;
		in1 = 4'd5; in2 = 4'd6; cin = 0;
		#100
		in1 = 4'd7; in2 = 4'd5; cin = 1;
		#100
		in1 = 4'd7; in2 = 4'd7; cin = 1;  
		#100
		in1 = 4'd7; in2 = 4'd9; cin = 1;  
		// Add stimulus here

	end
      
endmodule

