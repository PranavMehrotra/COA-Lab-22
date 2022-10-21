`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:32:12 10/20/2022 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
	input signed [31:0] a, 
	input signed [31:0] b,
	input [31:0] shamt,
	input [31:0] offset,
	input [1:0] ALUsource, 
	input [2:0] ALUop, 
	output reg carry, 
	output reg zero, 
	output reg sign, 
	output reg [31:0] result
);

	wire [31:0] adderOut, shiftOut, diffOut, muxOut;
	wire temp_carry;
	mux_32_3X1 mux(.a0(b),.a1(shamt),.a2(offset),.select(ALUsource),.out(muxOut));
    adderunit add(.a(a),.b(muxOut),.cin(0),.out(adderOut),.cout(temp_carry));
	shiftunit shift(.in(a),.shamt(shamt),.select(ALUop[1:0]),.result(shiftOut));
	diffunit diff(.a(a),.b(muxOut),.result(diffOut));
	always @(*) begin
        if (ALUop == 3'b000) begin
			carry = temp_carry;
            result = adderOut;
        end else if (ALUop == 3'b001) begin
    	    result = (~a) + 1;
        end else if (ALUop == 3'b010) begin
            result = a & muxOut;
        end else if (ALUop == 3'b011) begin
            result = a ^ muxOut;
        end else if (ALUop == 3'b111) begin
            result = diffOut;
        end else begin
	        result = shiftOut;
        end
    end


	// Updates flags when result changes
    always @(result) begin
        if (result) begin
            zero = 1'b0;
        end else begin
            zero = 1'b1;
        end
        sign = result[31];
    end

endmodule
