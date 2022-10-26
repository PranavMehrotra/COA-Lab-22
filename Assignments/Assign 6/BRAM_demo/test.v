`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:26:05 10/27/2021
// Design Name:   top_mod
// Module Name:   C:/Siddhartha/TA/BRAM_demo/test.v
// Project Name:  BRAM_demo
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top_mod
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg clk;
	reg ena;
	reg wea;
	reg [3:0] addra;
	reg [15:0] dina;

	// Outputs
	wire [15:0] douta;

	// Instantiate the Unit Under Test (UUT)
	top_mod uut (
		.clk(clk), 
		.ena(ena), 
		.wea(wea), 
		.addra(addra), 
		.dina(dina), 
		.douta(douta)
	);

	initial 
		begin
			clk <= 0;
		end
	always #10 clk=~clk;

	initial 
		begin
			ena <= 1'b1;
			wea <= 1'b0;
			addra <= 4'd1;
			dina <= 16'd0;
			#70
			ena <= 1'b1;
			wea <= 1'b1;
			addra <= 4'd10;
			dina <= 16'd333;
		end
      
endmodule

