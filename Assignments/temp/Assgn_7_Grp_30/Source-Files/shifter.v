/*
   Assignment No. - 7
   KGP-RISC
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Ashutosh Kumar Singh (19CS30008) & Vanshita Garg (19CS10064)
*/

`timescale 1ns / 1ps

// Module to implement shift operations for the ALU
module shifter(
    input signed [31:0] in, 
    input [31:0] shamt, 
    input dir, 
    input aorl,
    output reg [31:0] out
);
    // aorl = 0 indicates logical shift and aorl = 1 indicates arithmetic shift
    // dir = 0 indicates right shift and dir = 1 indicates left shift
    always @(*) begin
        if (aorl) begin
            if (!dir) begin
                out = in >>> shamt;     // Arithmetic right shift
            end else begin
                out = in;
            end
        end else begin
            if (!dir) begin
                out = in >> shamt;      // Logical right shift
            end else begin
                out = in << shamt;      // Left shift
            end
        end
    end

endmodule
