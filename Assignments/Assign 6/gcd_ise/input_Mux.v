`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.07.2018 16:57:57
// Design Name: 
// Module Name: input_Mux
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module  input_Mux #(parameter WIDTH =32)(in1,in2,in3,in4,sel1,sel2,sel3,out1,out2,clk);
input [WIDTH-1:0] in1,in2,in3,in4;
output reg[WIDTH-1:0] out1,out2;
input sel1,sel2,sel3,clk;

always @(*)
    begin
        case({sel1,sel2,sel3})
            3'd1:
                begin
                    out2<=in4;
                end
            3'd2:
                begin
                    out1<=in3;
                end
            3'd3:
                begin
                    out1<= in3;
                    out2<=in4;
                end
            3'd4:
                begin
                    out1<= in1;
                    out2<=in2;
                end
            default:
                begin
                    out1<= 0;
                    out2<=0;
                end
        endcase        
    end
endmodule
