`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:39:35 10/21/2022 
// Design Name: 
// Module Name:    diffunit 
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


module diffunit(input signed [31:0] a, input signed [31:0] b, output reg [5:0] out, output reg diff_zero);
	wire [31:0] tem,tem2,tem3,tem4,result;
	assign tem = a^b;
	assign tem2 = (tem - 1);
	assign tem3 = ~tem2;
	assign tem4 = (tem & tem3);
	assign result = tem4;
	always @(*) begin
		diff_zero = 0;
	     if (tem == 0) begin
            diff_zero = 1;
            out = 0;
		  end else if (result == 32'b01) begin
            out = 6'b000000;
        end else if (result == 32'b010) begin
            out = 6'b000001;
        end else if (result == 32'b0100) begin
            out = 6'b000010;
	     end else if (result == 32'b01000) begin
            out = 6'b000011;
        end else if (result == 32'b010000) begin
            out = 6'b000100;
        end else if (result == 32'b0100000) begin
            out = 6'b000101;
        end else if (result == 32'b01000000) begin
            out = 6'b000110;
		  end else if (result == 32'b010000000) begin
            out = 6'b000111;
        end else if (result == 32'b0100000000) begin
            out = 6'b001000;
        end else if (result == 32'b01000000000) begin
            out = 6'b001001;
        end else if (result == 32'b010000000000) begin
            out = 6'b001010;
        end else if (result == 32'b0100000000000) begin
            out = 6'b001011;
        end else if (result == 32'b01000000000000) begin
            out = 6'b001100;
        end else if (result == 32'b010000000000000) begin
            out = 6'b001101;
        end else if (result == 32'b0100000000000000) begin
            out = 6'b001110;		
        end else if (result == 32'b01000000000000000) begin
            out = 6'b001111;
        end else if (result == 32'b010000000000000000) begin
            out = 6'b010000;
        end else if (result == 32'b0100000000000000000) begin
            out = 6'b010001;
        end else if (result == 32'b01000000000000000000) begin
            out = 6'b010010;
        end else if (result == 32'b010000000000000000000) begin
            out = 6'b010011;
        end else if (result == 32'b0100000000000000000000) begin
            out = 6'b010100;
        end else if (result == 32'b01000000000000000000000) begin
            out = 6'b010101;
        end else if (result == 32'b010000000000000000000000) begin
            out = 6'b010110;
        end else if (result == 32'b0100000000000000000000000) begin
            out = 6'b010111;
        end else if (result == 32'b01000000000000000000000000) begin
            out = 6'b011000;
        end else if (result == 32'b010000000000000000000000000) begin
            out = 6'b011001;
        end else if (result == 32'b0100000000000000000000000000) begin
            out = 6'b011010;
        end else if (result == 32'b01000000000000000000000000000) begin
            out = 6'b011011;
        end else if (result == 32'b010000000000000000000000000000) begin
            out = 6'b011100;
        end else if (result == 32'b0100000000000000000000000000000) begin
            out = 6'b011101;
        end else if (result == 32'b01000000000000000000000000000000) begin
            out = 6'b011110;
        end else if (result == 32'b10000000000000000000000000000000) begin
            out = 6'b011111;
		  end
	end
endmodule
