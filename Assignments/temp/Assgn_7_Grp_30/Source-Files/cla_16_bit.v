/*
   Assignment No. - 7
   KGP-RISC
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Ashutosh Kumar Singh (19CS30008) & Vanshita Garg (19CS10064)
*/

`timescale 1ns / 1ps

// 16-bit carry look-ahead adder module using the look-ahead carry unit
module cla_16_bit(
    input [15:0] a, 
    input [15:0] b, 
    input c_in, 
    input [15:0] sum, 
    output c_out
);
   
    parameter k = 1'b1;
    wire [3:0] p, g, c;

    // Instantiate 4 4-bit carry look-ahead adders
    // We leave the c_out port empty as they are not required in this case
    cla_4_bit cla1(.a(a[3:0]), .b(b[3:0]), .c_in(c_in), .sum(sum[3:0]), .c_out(), .P(p[0]), .G(g[0]));
    cla_4_bit cla2(.a(a[7:4]), .b(b[7:4]), .c_in(c[1]), .sum(sum[7:4]), .c_out(), .P(p[1]), .G(g[1]));
    cla_4_bit cla3(.a(a[11:8]), .b(b[11:8]), .c_in(c[2]), .sum(sum[11:8]), .c_out(), .P(p[2]), .G(g[2]));
    cla_4_bit cla4(.a(a[15:12]), .b(b[15:12]), .c_in(c[3]), .sum(sum[15:12]), .c_out(), .P(p[3]), .G(g[3]));

    // Instantiate the look-ahead carry unit
    lookahead_carry_unit lcu(.p(p), .g(g), .c_in(c_in), .c(c), .c_out(c_out));
endmodule
