`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:01:27 11/09/2022 
// Design Name: 
// Module Name:    output_array 
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
module output_array(
	input [10:0] array,
	input rst,
	output reg [5:0] index
    );
	wire button;
	assign button = (array==0)?0:1;
	wire [31:0] result;
	
	always @(posedge button or posedge rst) begin
		if(rst) begin
			index = 6'd0;
		end
		else if (array == 11'b01) begin
            index = 6'b000000;
        end else if (array == 11'b010) begin
            index = 6'b000001;
        end else if (array == 11'b0100) begin
            index = 6'b000010;
	     end else if (array == 11'b01000) begin
            index = 6'b000011;
        end else if (array == 11'b010000) begin
            index = 6'b000100;
        end else if (array == 11'b0100000) begin
            index = 6'b000101;
        end else if (array == 11'b01000000) begin
            index = 6'b000110;
		  end else if (array == 11'b010000000) begin
            index = 6'b000111;
        end else if (array == 11'b0100000000) begin
            index = 6'b001000;
        end else if (array == 11'b01000000000) begin
            index = 6'b001001;
        end else if (array == 11'b010000000000) begin
            index = 6'b001010;
        end else begin
			index = 6'd0;
		  end
	end

endmodule
