`timescale 1ns / 1ps


module CLA_4_bit(input[3:0] in1,input[3:0] in2,input cin,output[3:0] out,output cout);
wire c[3:0];
wire g[3:0],p[3:0];
assign g = in1 & in2;
assign p = in1 ^ in2;
assign c[1] <= g[0] | (p[0] & cin);
assign c[2] <= g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin);
assign c[3] <= g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin);
assign cout <= g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & cin);
assign c[0] <= cin;
assign out <= (p ^ c);

endmodule
