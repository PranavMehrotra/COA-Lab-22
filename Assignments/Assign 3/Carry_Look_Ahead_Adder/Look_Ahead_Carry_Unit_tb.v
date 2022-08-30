`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:10:29 08/30/2022
// Design Name:   Look_Ahead_Carry_Unit
// Module Name:   D:/KGP Semesters/SEM 5/COA LAB/COA-Lab-22/Assignments/Assign 3/Carry_Look_Ahead_Adder/Look_Ahead_Carry_Unit_tb.v
// Project Name:  Carry_Look_Ahead_Adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Look_Ahead_Carry_Unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Look_Ahead_Carry_Unit_tb;

	// Inputs
	reg [3:0] g;
	reg [3:0] p;
	reg cin;

	// Outputs
	wire [3:0] carry;
	wire P;
	wire G;

	// Instantiate the Unit Under Test (UUT)
	Look_Ahead_Carry_Unit uut (
		.g(g), 
		.p(p), 
		.cin(cin), 
		.carry(carry), 
		.P(P), 
		.G(G)
	);

	initial begin
		// Initialize Inputs
		g = 4'b1001;
		p = 4'b0010;
		cin = 0;

		$monitor ("g = %b, p = %b, cin = %d, carry = %b, P = %d, G = %d", g, p, cin, carry, P, G);
		// Wait 100 ns for global reset to finish
		#100;
      g = 4'b0101; p = 4'b0100; cin = 0;
		#100;
      g = 4'b1011; p = 4'b1100; cin = 0;
		#100;
      g = 4'b0000; p = 4'b1111; cin = 1;
		#100;
      g = 4'b1111; p = 4'b0001; cin = 1;
		// Add stimulus here

	end
      
endmodule

