/*
   Assignment No. - 7
   KGP-RISC
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Ashutosh Kumar Singh (19CS30008) & Vanshita Garg (19CS10064)
*/

`timescale 1ns / 1ps

// Testbench for the jump control module
module jump_control_tb;
    // Inputs
    reg sign, carry, zero;
    reg [5:0] opcode;
    
    // Outputs
    wire validJump;

    // Instantiate the unit under test
    jump_control JC (
        .opcode(opcode),
        .sign(sign),
        .carry(carry),
        .zero(zero),
        .validJump(validJump)
    );

    initial begin
        // Monitor the changes
        $monitor("opcode = %b, zero = %b, sign = %b, carry = %b, validJump = %b", opcode, zero, sign, carry, validJump);

        // Provide the stimulus
        opcode = 6'b000111; zero = 1'b0; sign = 1'b1; carry = 1'b0;
        #5 opcode = 6'b000111; zero = 1'b0; sign = 1'b0; carry = 1'b0;
        #5 opcode = 6'b001000; zero = 1'b1; sign = 1'b0; carry = 1'b0;
        #5 opcode = 6'b001010;
        #5 opcode = 6'b001101; zero = 1'b0; sign = 1'b0; carry = 1'b1;
        #5 opcode = 6'b001101; zero = 1'b0; sign = 1'b0; carry = 1'b1;
        #5 opcode = 6'b001110; zero = 1'b0; sign = 1'b0; carry = 1'b1;

        #5 $finish;
    end
endmodule