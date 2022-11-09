/*
   Assignment No. - 7
   KGP-RISC
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Ashutosh Kumar Singh (19CS30008) & Vanshita Garg (19CS10064)
*/

`timescale 1ns / 1ps

// This simple module is used to add 4 to the program counter value
module PC_increment (
    input [31:0] instrAddr,
    output [31:0] nextPC
);

    assign nextPC = instrAddr + 32'b00000000000000000000000000000100;
    
endmodule