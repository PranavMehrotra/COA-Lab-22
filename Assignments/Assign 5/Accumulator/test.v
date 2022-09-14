`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:56:55 01/14/2021
// Design Name:   accumulator
// Module Name:   C:/Siddhartha/Hardware Security Course/Accumulator/test.v
// Project Name:  Accumulator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: accumulator
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;
reg clk,rst;
reg [3:0] in;
wire [4:0] acc; 
accumulator accmod(.in(in), .clk(clk), .rst(rst), .acc(acc));
initial
    begin
        clk<=1'd0;
        rst<=1'd1;
    end

always #10 clk=~clk;

initial
    begin
        in<=4'd0;
        #100 rst<=1'd0;
        #10 in<=4'd3;
        #20 in<=4'd4;
    end

endmodule
