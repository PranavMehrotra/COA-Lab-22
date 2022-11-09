/*
   Assignment No. - 7
   KGP-RISC
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Ashutosh Kumar Singh (19CS30008) & Vanshita Garg (19CS10064)
*/

`timescale 1ns / 1ps

// 4-bit carry look-ahead adder module which computes block propagate and generate for the next level of hierarchy
module cla_4_bit(
    input [3:0] a,
    input [3:0] b, 
    input c_in, 
    input [3:0] sum, 
    output c_out, P, G
);

    wire [3:0] p, g;        // propagate and generate bits 
    wire [3:0] c;           // carry bits

    assign p = a ^ b;       // assign values to propagate bits
    assign g = a & b;       // assign values to generate bits

    // compute the carry bits
    assign c[0] = c_in;
    assign c[1] = g[0] | (p[0] & c_in);
    assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c_in);
    assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & c_in);

    // compute the sum
    assign sum = p ^ c;

    // compute block propagate and generate for the next level
    assign P = p[3] & p[2] & p[1] & p[0];
    assign G = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]);
    
    // assign c_out
    assign c_out = G + (P & c_in);
endmodule

