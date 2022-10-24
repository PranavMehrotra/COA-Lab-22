`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:42:20 10/22/2022 
// Design Name: 
// Module Name:    control_unit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module control_unit(
	input [5:0] opcode,
	input [5:0] funccode,
    output [1:0] reg_dest,
    output reg_write,
    output [2:0] ALUop,
    output [1:0] ALUsource,
    output mem_write,
    output [1:0] mem_to_reg,
    output [2:0] branch
);
    always @(opcode or funccode) begin
        if(opcode[5]==1)begin
            if(opcode[4]==1)begin
                ALUop = 3'b000;
                ALUsource = 2'b00;
                reg_write = 1'b0;
                reg_dest = 2'b10;
                mem_to_reg = 2'b10;
                mem_write = 1'b0;
                branch = opcode[2:0];
            end
            else begin
                ALUop = 3'b000;
                ALUsource = 2'b00;
                reg_write = 1'b1;
                reg_dest = 2'b00;
                mem_to_reg = 2'b00;
                mem_write = 1'b0;
                branch = opcode[2:0];
            end
        end
        else if(opcode == 6'b000010) begin
            ALUop = 3'b000;
            ALUsource = 2'b10;
            reg_write = 1'b0;
            reg_dest = 2'b00;
            mem_to_reg = 2'b00;
            mem_write = 1'b0;
            branch = 3'b000;
        end
        else if(opcode == 6'b000011) begin
            ALUop = 3'b001;
            ALUsource = 2'b10;
            reg_write = 1'b0;
            reg_dest = 2'b00;
            mem_to_reg = 2'b00;
            mem_write = 1'b0;
            branch = 3'b000;
        end
        else if(opcode == 6'b000110) begin
            ALUop = 3'b000;
            ALUsource = 2'b10;
            reg_write = 1'b0;
            reg_dest = 2'b00;
            mem_to_reg = 2'b01;
            mem_write = 1'b0;
            branch = 3'b000;
        end
        else if(opcode == 6'b010110) begin
            ALUop = 3'b000;
            ALUsource = 2'b10;
            reg_write = 1'b1;
            reg_dest = 2'b00;
            mem_to_reg = 2'b00;
            mem_write = 1'b1;
            branch = 3'b000;
        end
        else begin
            ALUop = funccode[5:3];
            ALUsource = opcode[1:0];
            reg_write = 1'b0;
            reg_dest = opcode[3:2];
            mem_to_reg = opcode[3:2];
            mem_write = opcode[4];
            branch = funccode[2:0];
        end

    end


endmodule
