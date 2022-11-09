/*
   Assignment No. - 7
   KGP-RISC
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Ashutosh Kumar Singh (19CS30008) & Vanshita Garg (19CS10064)
*/

`timescale 1ns / 1ps

// A 2x1 mux with 1-bit output
module mux_1b_2_1 (
    input a0, 
    input a1, 
    input sel, 
    output out
);
    
    assign out = (sel) ? a1 : a0;

endmodule
