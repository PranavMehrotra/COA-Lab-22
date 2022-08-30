`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:58:15 08/30/2022
// Design Name:   CLA_16_bit_ripple
// Module Name:   D:/KGP Semesters/SEM 5/COA LAB/COA-Lab-22/Assignments/Assign 3/Carry_Look_Ahead_Adder/CLA_16_bit_ripple_tb.v
// Project Name:  Carry_Look_Ahead_Adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CLA_16_bit_ripple
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CLA_16_bit_ripple_tb;

	// Inputs
	reg [15:0] in1;
	reg [15:0] in2;
	reg cin;

	// Outputs
	wire [15:0] out;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	CLA_16_bit_ripple uut (
		.in1(in1), 
		.in2(in2), 
		.cin(cin), 
		.out(out), 
		.cout(cout)
	);

	initial begin
		// Initialize Inputs
		in1 = 16'd16731;
		in2 = 16'd8945;
		cin = 0;
		$monitor ("in1 = %d, in2 = %d, cin = %d, out = %d, cout = %d", in1, in2, cin, out, cout);
		// Wait 100 ns for global reset to finish
		#100;
      in1 = 16'd16731; in2 = 16'd8945; cin = 1;
		#100;
		in1 = 16'd33892; in2 = 16'd31643; cin = 0;
		#100;
		in1 = 16'd33892; in2 = 16'd31643; cin = 1;
		#100;
		in1 = 16'd33892; in2 = 16'd31647; cin = 1;
        
		// Add stimulus here

	end
      
endmodule

