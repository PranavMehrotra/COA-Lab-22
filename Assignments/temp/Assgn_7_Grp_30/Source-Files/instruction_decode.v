/*
   Assignment No. - 7
   KGP-RISC
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Ashutosh Kumar Singh (19CS30008) & Vanshita Garg (19CS10064)
*/

`timescale 1ns / 1ps

// The module to slice the 32-bit instructuion into separate fields to decode the instruction
module instruction_decode (
    input [31:0] instruction,
    output [5:0] opcode,
    output [4:0] func,
    output [25:0] label0,
    output [15:0] label1,
    output [4:0] rs,
    output [4:0] rt,
    output [4:0] shamt,
    output [15:0] imm
);

    assign opcode = instruction[31:26];     // Opcode
    assign func = instruction[4:0];         // Function code
    assign label0 = instruction[25:0];      // Jump address for 26-bit addresses
    assign label1 = instruction[15:0];      // Jump address for 16-bit addresses
    assign rs = instruction[25:21];         // Register rs
    assign rt = instruction[20:16];         // Register rt
    assign shamt = instruction[15:11];      // Shift amount
    assign imm = instruction[15:0];         // Immediate value
    
endmodule