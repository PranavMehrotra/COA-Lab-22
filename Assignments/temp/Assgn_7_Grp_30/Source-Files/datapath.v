/*
   Assignment No. - 7
   KGP-RISC
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Ashutosh Kumar Singh (19CS30008) & Vanshita Garg (19CS10064)
*/

`timescale 1ns / 1ps

// The datapath module
module datapath (
    input [1:0] regDst,
    input regWrite,
    input memRead,
    input memWrite,
    input [1:0] memToReg,
    input ALUsrc,
    input [4:0] ALUop,
    input ALUsel,
    input branch,
    input jumpAddr,
    input lblSel,
    input clk,
    input rst,
    output [5:0] opcode,
    output [4:0] func
);
    parameter ra = 5'b11111;    // Register ra

    wire enable;
    wire carry, zero, sign, validJump, lastCarry;
    wire [31:0] nextInstrAddr, instruction, writeData, readData1, instrAddr, result, nextPC, readData2, SE1out, b, dataMemReadData;
    wire [25:0] label0;
    wire [15:0] label1, imm;
    wire [4:0] rs, rt, shamt, writeReg;
    wire [31:0] offset;
    
    assign enable = memRead | memWrite;         // Enable signal for the data memory module
    assign offset = nextInstrAddr >>> 2'b10;    // Read address for the instruction memory module
    
    // Instantiating a DFF to store the carry flag value
    dff DFF (
        .clk(clk),
        .rst(rst),
        .d(carry),
        .q(lastCarry)
    );
    
    // Instantiating the program counter module
    program_counter PC (
        .nextInstrAddr(nextInstrAddr),
        .clk(clk),
        .rst(rst),
        .instrAddr(instrAddr)
    );

    // Instantiating the instruction memory module
    bram_instr_mem instructionMemory (
        .clka(clk),
        .ena(1'b1),
        .addra(offset[9:0]),
        .douta(instruction)
    );

    // Instantiating the instruction decoder module
    instruction_decode instructionDecoder (
        .instruction(instruction),
        .opcode(opcode),
        .func(func),
        .label0(label0),
        .label1(label1),
        .rs(rs),
        .rt(rt),
        .shamt(shamt),
        .imm(imm)
    );

    // Mux to select the register to which data is to be written
    mux_5b_3_1 MUX1 (
        .a0(rs),
        .a1(rt),
        .a2(ra),
        .sel(regDst),
        .out(writeReg)
    );

    // Instantiating the register file module
    register_file registerFile (
        .rs(rs),
        .rt(rt),
        .regWrite(regWrite),
        .writeReg(writeReg),
        .writeData(writeData),
        .clk(clk),
        .rst(rst),
        .readData1(readData1),
        .readData2(readData2)
    );

    // Instantiating the sign extend module
    immediate_sign_extend SE1 (
        .opcode(opcode),
        .func(func),
        .instr(imm),
        .extendImm(SE1out)
    );

    // Mux to choose the second input of the ALU
    mux_32b_2_1 MUX2 (
        .a0(readData2),
        .a1(SE1out),
        .sel(ALUsrc), 
        .out(b)
    );

    // Instantiating the ALU module
    ALU ALU1 (
        .a(readData1),
        .b(b),
        .ALUsel(ALUsel),
        .ALUop(ALUop),
        .carry(carry),
        .zero(zero), 
        .sign(sign),
        .result(result)
    );

    // Instantiating the jump control module
    jump_control JC (
        .opcode(opcode),
        .sign(sign),
        .carry(lastCarry),
        .zero(zero),
        .validJump(validJump)
    );

    // Instantiating the PC increment module
    PC_increment PCInc (
        .instrAddr(instrAddr),
        .nextPC(nextPC)
    );

    // Instantiating the branch unit module
    branch_unit branchUnit (
        .nextPC(nextPC),
        .label0(label0),
        .label1(label1),
        .rsAddr(readData1),
        .lblSel(lblSel),
        .jumpAddr(jumpAddr),
        .branch(branch),
        .validJump(validJump),
        .nextAddr(nextInstrAddr)
    );

    // Instantiating the data memory module
    bram_data_mem dataMemory (
        .clka(~clk),
        .ena(enable),
        .wea(memWrite),
        .addra(result[9:0] >>> 2'b10),
        .dina(readData2),
        .douta(dataMemReadData)
    );

    // Mux to select the data to be written to the data memory
    mux_32b_3_1 MUX3 (
        .a0(nextPC),
        .a1(dataMemReadData),
        .a2(result),
        .sel(memToReg),
        .out(writeData)
    );

endmodule