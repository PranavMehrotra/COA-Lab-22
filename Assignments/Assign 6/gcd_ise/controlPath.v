`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.07.2018 11:31:19
// Design Name: 
// Module Name: controlPath
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


module controlPath(
output reg ld_in1_in2,
output reg update_Xr,
output reg update_Yr,
output reg update_Counter,
output reg incr_dec,
output reg ld_Xr,
output reg ld_Yr,
output reg ld_Xr_aftr_subs,
output reg ld_Yr_aftr_subs,
output reg lShift,
output reg count,
output reg[2:0] state,

input cnt_zero,
input[3:0] in,
input clk,
input reset,
input done);
reg[2:0] next_state;

localparam S0 = 3'd0; 
localparam S1 = 3'd1;
localparam S2 = 3'd2;
localparam S3 = 3'd3;
localparam S4 = 3'd4;
localparam S5 = 3'd5;
always @(state or in)
    begin
        if(!in[0])
            next_state <=S5;
        else if(in[0] && in[3]==0 && in[2]==0)
            next_state <= S1;
        else if(in[0] && in[3]==1 && in[2]==0)
            next_state <= S2;
        else if(in[0] && in[3]==0 && in[2]==1)
            next_state <= S3;
        else if(in[0] && in[3]==1 && in[2]==1)
            next_state <= S4;
        else if(state == S5)
            next_state <= S5;
        else
            next_state <= S0;
        if(state == S5)
            next_state <= S5;
    end

always @(state or in or done or cnt_zero)
    begin
        case(state)
            S0:
                begin
                    ld_in1_in2<=1;
                    update_Xr<=0;
                    update_Yr<=0;
                    ld_Xr<=1;
                    ld_Yr<=1;
                    ld_Xr_aftr_subs<=0;
                    ld_Yr_aftr_subs<=0;
                    lShift<=0;
                end
            S1:
                begin
                    ld_in1_in2<=0;
                    update_Xr<=1;
                    update_Yr<=1;
                    update_Counter<=1;
                    incr_dec<=1;
                    ld_Xr<=1;
                    ld_Yr<=1;
                    ld_Xr_aftr_subs<=0;
                    ld_Yr_aftr_subs<=0;
                    lShift<=0;
                end
            S2:
                begin
                    ld_in1_in2<=0;
                    update_Xr<=0;
                    update_Yr<=1;
                    update_Counter<=0;
                    incr_dec<=0;
                    ld_Xr<=0;
                    ld_Yr<=1;
                    ld_Xr_aftr_subs<=0;
                    ld_Yr_aftr_subs<=0;
                    lShift<=0;
                end
            S3:
                begin
                    ld_in1_in2<=0;
                    update_Xr<=1;
                    update_Yr<=0;
                    update_Counter<=0;
                    incr_dec<=0;
                    ld_Xr<=1;
                    ld_Yr<=0;
                    ld_Xr_aftr_subs<=0;
                    ld_Yr_aftr_subs<=0;
                    lShift<=0;
                end
            S4:
                begin
                    if(in[1]==1)
                        begin
                            ld_in1_in2<=0;
                            update_Xr<=1;
                            update_Yr<=0;
                            update_Counter<=0;
                            incr_dec<=0;
                            ld_Xr<=1;
                            ld_Yr<=0;
                            ld_Xr_aftr_subs<=1;
                            ld_Yr_aftr_subs<=0;
                            lShift<=0;
                        end
                    else if(in[1]==0)
                        begin
                            ld_in1_in2<=0;
                            update_Xr<=0;
                            update_Yr<=1;
                            update_Counter<=0;
                            incr_dec<=0;
                            ld_Xr<=0;
                            ld_Yr<=1;
                            ld_Xr_aftr_subs<=0;
                            ld_Yr_aftr_subs<=1;
                            lShift<=0;
                        end
                end 
            S5:
                begin
                    if(cnt_zero==1)
                        begin
                            ld_in1_in2<=0;
                            update_Xr<=0;
                            update_Yr<=0;
                            update_Counter<=0;
                            incr_dec<=0;
                            ld_Xr<=0;
                            ld_Yr<=0;
                            ld_Xr_aftr_subs<=0;
                            ld_Yr_aftr_subs<=0;
                            lShift<=1;
                        end
                     else if(cnt_zero==0  && done ==0)
                        begin
                            ld_in1_in2<=0;
                            update_Xr<=1;
                            update_Yr<=0;
                            update_Counter<=1;
                            incr_dec<=0;
                            ld_Xr<=1;
                            ld_Yr<=0;
                            ld_Xr_aftr_subs<=0;
                            ld_Yr_aftr_subs<=0;
                            lShift<=1;
                        end
                     else
                        begin
                            ld_in1_in2<=0;
                            update_Xr<=0;
                            update_Yr<=0;
                            update_Counter<=0;
                            incr_dec<=0;
                            ld_Xr<=0;
                            ld_Yr<=0;
                            ld_Xr_aftr_subs<=0;
                            ld_Yr_aftr_subs<=0;
                            lShift<=1;
                        end
                end 
        endcase
end
always @(posedge clk)
    begin
        if(reset)
            state<=S0;
        else
            state<=next_state;
    end
endmodule
