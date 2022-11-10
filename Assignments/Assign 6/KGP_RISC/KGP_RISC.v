`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:22:41 10/22/2022 
// Design Name: 
// Module Name:    KGP_RISC 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module KGP_RISC(
	input clk,
	input rst,
    output [31:0] result,
	 input button,
	 input [4:0] array,
	 output signed [12:0] out
);
	wire [5:0] opcode;
    wire [5:0] funccode;
    wire [1:0] reg_dest;
    wire reg_write;
    wire mem_write;
    wire [1:0] mem_to_reg;
    wire [1:0] ALUsource;
    wire [2:0] ALUop;
    wire [2:0] branch;
	 wire clk_out;
	 clock_divider a0(clk,rst,clk_out); 
	control_unit Control(
	 .opcode(opcode),
	 .funccode(funccode),
    .reg_dest(reg_dest),
    .reg_write(reg_write),
    .ALUop(ALUop),
    .ALUsource(ALUsource),
    .mem_write(mem_write),
    .mem_to_reg(mem_to_reg),
    .branch(branch)
	);
	data_path Data(
  	 .opcode(opcode),
	 .funccode(funccode),
    .reg_dest(reg_dest),
    .reg_write(reg_write),
    .ALUop(ALUop),
    .ALUsource(ALUsource),
    .mem_write(mem_write),
    .mem_to_reg(mem_to_reg),
    .branch(branch),
	 .clk(clk_out),
	 .rst(rst),
     .result(result),
	  .button(button),
	  .array(array),
	  .out(out)
	);

endmodule
