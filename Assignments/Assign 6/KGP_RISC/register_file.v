`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:48:37 10/21/2022 
// Design Name: 
// Module Name:    register_file 
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
module register_file(
	input [4:0] rs,
	input [4:0] rt,
	input [1:0] reg_dest,
	input [31:0] writeData,
	input reg_write,
	input clk,
    input rst,
    output reg [31:0] rs_out,
    output reg [31:0] rt_out
    );
    parameter ra = 5'b11111;
	 wire [4:0] muxOut;
	 mux_32_3X1 mux(.a0(rs),.a1(rt),.a2(ra),.select(reg_dest),.out(muxOut));
	reg signed [31:0] registers [31:0];
	integer i;
	always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < 32; i = i + 1)
                registers[i] <= 32'd0;
        end else if (!reg_write) begin
            registers[muxOut] <= writeData;
        end
		  else begin
			registers[muxOut] <= registers[muxOut];
			end
    end
	always @(*) begin
        rs_out <= registers[rs];
        rt_out <= registers[rt];
   end

endmodule
