`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:14:42 10/27/2022 
// Design Name: 
// Module Name:    branch_mechanism 
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
module branch_mechanism(
	input [31:0] rsOut,
	input carry,
	input zero,
	input sign,
	input jump,
	input [31:0] pda,
	input [31:0] offset,
	input [12:0] instr4,
	input [2:0] branch,
	output reg [12:0] nextInstr
    );
	//wire jump;
	// wire [12:0] tem;
	//branch_checker check(.branch(branch),.carry(carry),.sign(sign),.zero(zero),.jump(jump));
	//mux_12_3X1 mux3X1(.a0(pda),.a1(rsOut),.a2(instr4),.select(branch),.out(tem));
	//mux_12_2X1 mux2X1(.a0(tem),.a1(offset),.select(jump),.out(nextInstr));
	always @(*) begin
		if(branch == 3'b001)begin
			//nextInstr = {{1{instr4[31:28]}},{1{pda[27:0]}}};
			nextInstr = pda;
		end
		else if(branch == 3'b010) begin
			nextInstr = rsOut;
		end
		else if(jump) begin
			nextInstr = offset;
		end
		else begin
			nextInstr = instr4;
		end
	end
	


endmodule
