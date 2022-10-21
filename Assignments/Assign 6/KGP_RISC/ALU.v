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

	wire [31:0] complementOut, adderOut, shifterOut, andOut, xorOut,muxOut,diffOut;

	mux_32_3X1 mux(.a0(b),.a1(shamt),.a2(offset),.select(ALUsource),.out(muxOut));
	
	shiftunit shif();
	
	
	assign complementOut = (~a) + 1;
   assign andOut = a & muxOut;
   assign xorOut = a ^ muxOut;

	always @(*) begin
        if (ALUop == 3'b000) begin
            result = adderOut;
        end else if (ALUop == 3'b001) begin
            result = complementOut;
        end else if (ALUop == 3'b010) begin
            result = andOut;
        end else if (ALUop == 3'b011) begin
            result = xorOut;
        end else if (ALUop == 3'b111) begin
            result = diffOut;
        end else begin
            result = shifterOut;
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
