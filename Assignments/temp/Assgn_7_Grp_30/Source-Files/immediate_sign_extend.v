/*
   Assignment No. - 7
   KGP-RISC
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Ashutosh Kumar Singh (19CS30008) & Vanshita Garg (19CS10064)
*/
    
`timescale 1ns / 1ps

// Sign extend module for shift amount and immediate value
module immediate_sign_extend (
    input [5:0] opcode,
    input [4:0] func,       
    input [15:0] instr,
    output reg [31:0] extendImm
);
    always @(*) begin
        if (opcode == 6'b000010) begin                  // for shift amount
            extendImm = {{27{1'b0}}, instr[15:11]};
        end else begin                                  // for immediate value
            extendImm = {{16{instr[15]}}, instr};
        end
    end
endmodule