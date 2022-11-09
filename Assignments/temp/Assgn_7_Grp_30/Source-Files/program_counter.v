/*
   Assignment No. - 7
   KGP-RISC
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Ashutosh Kumar Singh (19CS30008) & Vanshita Garg (19CS10064)
*/

`timescale 1ns / 1ps

// This module controls the updation of the program counter at every clock edge
module program_counter (
    input [31:0] nextInstrAddr,
    input clk, 
    input rst,
    output reg [31:0] instrAddr
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            instrAddr <= -32'd4;
        end else begin
            instrAddr <= nextInstrAddr;     // Update the program counter
        end
    end

endmodule

