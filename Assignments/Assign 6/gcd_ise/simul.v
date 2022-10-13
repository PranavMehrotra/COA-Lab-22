`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:02:07 09/16/2022
// Design Name:   gcd
// Module Name:   H:/Siddhartha/TA/gcd_ise/simul.v
// Project Name:  gcd_ise
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: gcd
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module simul;
parameter WIDTH=32;
wire done;
wire[WIDTH-1:0] out;
reg[WIDTH-1:0] in1,in2;
reg clk,reset;
gcd #(.WIDTH(WIDTH)) g1(in1,in2,clk,reset,out,done);
initial 
begin
clk<=1'b0;
reset<=1'b1;
end
initial
begin
in1<=32'd64;
in2<=32'd212;
#30 reset<=1'b0;
end
always
#10 clk=~clk;
endmodule


