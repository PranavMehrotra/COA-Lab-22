`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:02:37 08/26/2022
// Design Name:   full_adder
// Module Name:   D:/KGP Semesters/SEM 5/COA LAB/Assignments/Assign 3/Ripple_Carry_Adder/full_adder_tb.v
// Project Name:  Ripple_Carry_Adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: full_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module full_adder_tb;

	// Inputs
	reg in1;
	reg in2;
	reg cin;

	// Outputs
	wire out;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	full_adder uut (
		.in1(in1), 
		.in2(in2), 
		.cin(cin), 
		.out(out), 
		.cout(cout)
	);

	initial begin
		// Initialize Inputs
		in1 = 0;
		in2 = 0;
		cin = 0;
		$monitor ("in1 = %d, in2 = %d, cin = %d, out = %d, cout = %d", in1, in2, cin, out, cout);
		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here
		in1 = 0; in2 = 0; cin = 1;
		#100;
		in1 = 0; in2 = 1; cin = 0;
		#100;
		in1 = 0; in2 = 1; cin = 1;
		#100;
		in1 = 1; in2 = 0; cin = 0;
		#100;
		in1 = 1; in2 = 0; cin = 1;
		#100;
		in1 = 1; in2 = 1; cin = 0;
		#100;
		in1 = 1; in2 = 1; cin = 1;

	end
      
endmodule

