`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:40:31 10/21/2022 
// Design Name: 
// Module Name:    program_counter 
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
module program_counter(
	input [31:0] next_addr,
	input clk,
	input rst,
	output reg [31:0] addr,
	output reg [31:0] addr2
);
	always @(posedge clk or posedge rst) begin
        if (rst) begin
            addr <= 32'd0;
				addr2 <= 32'd0;
        end else begin
            addr <= next_addr;
				addr2 <= next_addr + 4;
        end
    end


endmodule
