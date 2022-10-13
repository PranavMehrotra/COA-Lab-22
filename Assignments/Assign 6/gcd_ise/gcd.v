`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.08.2018 14:10:05
// Design Name: 
// Module Name: gcd
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


module gcd
#(parameter WIDTH =32) // Bit width
(
input[WIDTH-1:0] in1,
input[WIDTH-1:0] in2,
input clk,
input reset,
output reg[WIDTH-1:0] out,
output reg done
    );
wire[WIDTH-1:0] Xr,Yr;
wire Xr_eq_Yr_temp,Xr_cmp_Yr_temp;
wire[WIDTH-1:0] tempCount;
wire[WIDTH-1:0] out1,out2,sub_out,out_ma,out_mb,out_mc,out_ma_rShift,out_mb_rShift,out_ma_lShift;
wire[WIDTH-1:0] comp_out;
wire[3:0] in;
wire[WIDTH-1:0] temp_Xr,temp_Yr;
wire ld_in1_in2,update_Xr,update_Yr,update_Counter,incr_dec,ld_Xr,ld_Yr,ld_Xr_aftr_subs,ld_Yr_aftr_subs,l_Shift,cnt_zero,Xr0,Yr0,Xr_eq_Yr,Xr_cmp_Yr;
wire [WIDTH-1:0] out_count;
wire [2:0] state;

assign Xr0=(ld_Xr)?out1[0]:Xr[0];
assign Yr0=(ld_Yr)?out2[0]:Yr[0];
assign temp_Xr=(ld_Xr)?out1:Xr;
assign temp_Yr=(ld_Yr)?out2:Yr;
assign Xr_eq_Yr=(temp_Xr!=temp_Yr)?1:0;
assign in={Xr0,Yr0,Xr_cmp_Yr,Xr_eq_Yr};
input_Mux #(.WIDTH(WIDTH)) int_mux(
.in1(in1),
.in2(in2),
.in3(out_mc),
.in4(out_mb_rShift),
.sel1(ld_in1_in2),
.sel2(update_Xr),
.sel3(update_Yr),
.out1(out1),
.out2(out2),
.clk(clk));


register #(.WIDTH(WIDTH)) XrReg(.in(out1),.out(Xr),.con(ld_Xr),.clk(clk),.reset(reset));

register #(.WIDTH(WIDTH)) YrReg(.in(out2),.out(Yr),.con(ld_Yr),.clk(clk),.reset(reset));

substractor #(.WIDTH(WIDTH)) s1(
.in1(Xr),
.in2(Yr),
.result(sub_out),
.comp(Xr_cmp_Yr));


complementer #(.WIDTH(WIDTH)) c1(
.in1(Yr),
.in2(Xr),
.out(comp_out));

Mux #(.WIDTH(WIDTH)) ma(
.in1(Xr),
.in2(sub_out),
.sel(ld_Xr_aftr_subs),
.out(out_ma));

Mux #(.WIDTH(WIDTH)) mb(
.in1(Yr),
.in2(comp_out),
.sel(ld_Yr_aftr_subs),
.out(out_mb));

rShift #(.WIDTH(WIDTH)) rShift1(
.in(out_ma),
.out(out_ma_rShift));

rShift #(.WIDTH(WIDTH)) rShift2(
.in(out_mb),
.out(out_mb_rShift));

lShift #(.WIDTH(WIDTH)) lShift1(
.in(out_ma),
.out(out_ma_lShift));

Mux #(.WIDTH(WIDTH)) mc(
.in1(out_ma_rShift),
.in2(out_ma_lShift),
.sel(l_Shift),
.out(out_mc));

up_down_counter #(.WIDTH(WIDTH)) upc(
.update_counter(update_Counter),
.inc_dec(incr_dec),
.cnt_zero(cnt_zero),
.reset(reset),
.clk(clk),
.out(out_count));


always @(posedge clk)
    begin
        if(reset)
            begin
                done<=0;
                out<=0;
            end
        if(cnt_zero==1'b1 && state==3'd5)
            begin
                out<=Xr;
                done<=1;
            end 
    end

controlPath cntrlPath(
.ld_in1_in2(ld_in1_in2),
.update_Xr(update_Xr),
.update_Yr(update_Yr),
.update_Counter(update_Counter),
.incr_dec(incr_dec),
.ld_Xr(ld_Xr),
.ld_Yr(ld_Yr),
.ld_Xr_aftr_subs(ld_Xr_aftr_subs),
.ld_Yr_aftr_subs(ld_Yr_aftr_subs),
.lShift(l_Shift),
.cnt_zero(cnt_zero),
.in(in),
.clk(clk),
.reset(reset),
.done(done),
.state(state));

endmodule
