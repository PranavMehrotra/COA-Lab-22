/*
   Assignment No. - 7
   KGP-RISC
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Ashutosh Kumar Singh (19CS30008) & Vanshita Garg (19CS10064)
*/

`timescale 1ns / 1ps

// The register file where we have 32 32-bit registers
module register_file (
    input [4:0] rs,
    input [4:0] rt,
    input regWrite,
    input [4:0] writeReg,
    input [31:0] writeData,
    input clk,
    input rst,
    output reg [31:0] readData1,
    output reg [31:0] readData2
);

    reg signed [31:0] registerBank [31:0];
    integer i;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < 32; i = i + 1)
                registerBank[i] <= 32'b00000000000000000000000000000000;    // Initialize the register file with all zeroes
        end else if (regWrite) begin
            registerBank[writeReg] <= writeData;    // Write the data to the register file at the posedge of the clock
        end 
    end

    always @(*) begin
        // Read the data from the appropriate registers
        readData1 = registerBank[rs];
        readData2 = registerBank[rt];
    end

endmodule
