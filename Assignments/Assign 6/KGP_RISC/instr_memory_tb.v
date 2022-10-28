`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:46:15 10/28/2022
// Design Name:   instr_memory_bram
// Module Name:   D:/KGP Semesters/SEM 5/COA LAB/COA-Lab-22/Assignments/Assign 6/KGP_RISC/instr_memory_tb.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: instr_memory_bram
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module instr_memory_tb;

	// Inputs
	reg clka;
	reg [31:0] addra;

	// Outputs
	wire [31:0] douta;

	// Instantiate the Unit Under Test (UUT)
	instr_memory_bram uut (
		.clka(clka), 
		.addra(addra), 
		.douta(douta)
	);
	always #10 clka = ~clka;
	initial begin
		// Initialize Inputs
		clka = 0;
		// Wait 100 ns for global reset to finish
		addra = 32'd1;
		#20
		addra = 32'd7;
		#20
		addra = 32'd3;
        
		// Add stimulus here

	end
      
endmodule

