`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:31:27 10/22/2022 
// Design Name: 
// Module Name:    dff 
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
module dff(
	input clk,
	input rst,
	input in,
	output reg out
);
	always @(posedge clk or posedge rst) begin
        if (rst)
            out <= 1'b0;
        else
            out <= in;
    end

endmodule
