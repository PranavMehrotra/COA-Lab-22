`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:25:43 10/24/2022
// Design Name:   KGP_RISC
// Module Name:   D:/KGP Semesters/SEM 5/COA LAB/COA-Lab-22/Assignments/Assign 6/KGP_RISC/KGP_RISC_tb.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: KGP_RISC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module KGP_RISC_tb;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [31:0] result;
	reg button;
	reg [4:0] array;
	wire [12:0] out;
	// Instantiate the Unit Under Test (UUT)
	KGP_RISC uut (
		.clk(clk), 
		.rst(rst), 
		.result(result),
		.button(button),
		.array(array),
		.out(out)
	);
	always #10 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		button = 0;
		//instruction = 32'd0;
		#5
		rst=0;
		end
		
		always @(*) begin
         if (uut.Data.reg_store.registers[16] == 1) begin 
			#200
			button = 1;
			array = 5'd3;
			#200
			array = 5'd1;
			#200
			button = 0;
			array = 5'd5;
			#200
			button = 1;
			#200
			button = 0;
			end
      end
		/*
		instruction = 32'b00001000001000110000000000000101;
		#20
		instruction = 32'b00001000010000110000000000000100;
		#20
		instruction = 32'b00000000001000100000000000100000;
		#20
		rst=1;
		instruction = 32'd0;
		#40
		rst=0;
		// Add immediate 5*4 to reg:1
		instruction = 32'b00001000001000110000000000110101;
		#20
		instruction = 32'b00001000010000110000000000100101;
		#20
		instruction = 32'b00000000001000100000000000111000;
		#20
		instruction = 32'd0;
		#20
		instruction = 32'b00001000001000110000000000000100;
		#20
		// SLL , Reg: 1 and 3 times left shift
		instruction = 32'b00000100001000000000000011100000;
		#20
		instruction = 32'b00000000001000010000000000001000;// edwd
		#20
		instruction = 32'b00000100001000000000000011110000;
		#20
		instruction = 32'd0;
		// Wait 100 ns for global reset to finish
		//#150;
      //instruction = 32'b00001000011000110000000000000100;
		// Add stimulus here
		*/
      
endmodule

