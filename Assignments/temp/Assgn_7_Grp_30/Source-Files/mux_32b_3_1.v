/*
   Assignment No. - 7
   KGP-RISC
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Ashutosh Kumar Singh (19CS30008) & Vanshita Garg (19CS10064)
*/

`timescale 1ns / 1ps

// A 3x1 mux with 32-bit output
module mux_32b_3_1 (
    input [31:0] a0, 
    input [31:0] a1, 
    input [31:0] a2, 
    input [1:0] sel, 
    output reg [31:0] out
);

    always @(*) begin
        case (sel)
            2'b00 : out = a0;
            2'b01 : out = a1;
            2'b10 : out = a2;
            default : out = a2;
        endcase
    end
    
endmodule
