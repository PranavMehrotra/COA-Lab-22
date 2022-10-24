`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:30:39 10/22/2022 
// Design Name: 
// Module Name:    data_path 
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
module data_path(
	output [5:0] opcode,
	output [5:0] funccode,
   input [1:0] reg_dest,
   input reg_write,
   input [2:0] ALUop,
   input [1:0] ALUsource,
   input mem_write,
   input [1:0] mem_to_reg,
   input [2:0] branch,
	input clk,
	input rst,
	input [31:0] instruction,
	output signed [31:0] result
    );
	
	wire [31:0] offset,shamt,pda,rsOut,rtOut,memRead,nextPC,mem_reg_out;
	wire [25:0] pdain;
	wire [15:0] offsetin;
	wire carry, zero, sign, prevCarry;
	wire [4:0] rs,rt,shamtin;
	
	mux_32_3X1 mem_reg_mux(
	.a0(result),
	.a1(memRead),
	.a2(nextPC),
	.select(mem_to_reg),
	.out(mem_reg_out)
	);
	Instruction_decoder decoder(
	.instruction(instruction),
	.opcode(opcode),
	.funccode(funccode),
	.pda(pdain),
	.rs(rs),
	.rt(rt),
	.shamt(shamtin),
	.imm(offsetin)
	);
	bit_extend_unit extender(
	.shamt(shamtin),
	.offset(offsetin),
	.pda(pdain),
	.shamtOut(shamt),
	.offsetOut(offset),
	.pdaOut(pda)
	);
	register_file reg_store(
	.rs(rs),
	.rt(rt),
	.reg_dest(reg_dest),
	.writeData(mem_reg_out),
	.reg_write(reg_write),
	.clk(clk),
	.rst(rst),
	.rs_out(rsOut),
	.rt_out(rtOut)
	);
	ALU alu(
	.a(rsOut),	
	.b(rtOut),
	.shamt(shamt),	
	.offset(offset),
	.ALUsource(ALUsource),
	.ALUop(ALUop),
	.carry(carry),
	.zero(zero),
	.sign(sign),
	.result(result)	
	);
	dff DFF (
        .clk(clk),
        .rst(rst),
        .in(carry),
        .out(prevCarry)
    );
	
	
	
	
	
	
	
	

endmodule
