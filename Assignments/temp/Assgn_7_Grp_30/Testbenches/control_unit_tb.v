/*
   Assignment No. - 7
   KGP-RISC
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Ashutosh Kumar Singh (19CS30008) & Vanshita Garg (19CS10064)
*/

`timescale 1ns / 1ps

// Testbench for the Control Unit module
module control_unit_tb;
    // Inputs
    reg [5:0] opcode;
    reg [4:0] func;

    // Outputs
    wire [1:0] regDst;
    wire regWrite;
    wire memRead;
    wire memWrite;
    wire [1:0] memToReg;
    wire ALUsrc;
    wire [4:0] ALUop;
    wire ALUsel;
    wire branch;
    wire jumpAddr;
    wire lblSel;

    // Instantiate the unit under test
    control_unit CU (
        .opcode(opcode),
        .func(func),
        .regDst(regDst),
        .regWrite(regWrite),
        .memRead(memRead),
        .memWrite(memWrite),
        .memToReg(memToReg),
        .ALUsrc(ALUsrc),
        .ALUop(ALUop),
        .ALUsel(ALUsel),
        .branch(branch),
        .jumpAddr(jumpAddr),
        .lblSel(lblSel)
    );

    initial begin
        // Monitor the changes
        $monitor("regDest = %b, regWrite = %b, memRead = %b, memWrite = %b, memToReg = %b, ALUsrc = %b, ALUop = %b, ALUsel = %b, branch = %b, jumpAddr = %b, lblsel = %b",
                regDst, regWrite, memRead, memWrite, memToReg, ALUsrc, ALUop, ALUsel, branch, jumpAddr, lblSel);  

        // Stimulus to verify the working of the Control Unit
        opcode = 6'b000000; func = 5'b00000;
        #5 opcode = 6'b000001; func = 5'b00000;
        #5 opcode = 6'b000010; func = 5'b00000;
        #5 opcode = 6'b000011;
        #5 opcode = 6'b000101;
        #5 opcode = 6'b000111;

        #5 $finish;
    end
endmodule
