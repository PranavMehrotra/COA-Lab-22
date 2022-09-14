////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: accumulator_translate.v
// /___/   /\     Timestamp: Wed Aug 24 14:28:21 2022
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/translate -ofmt verilog -sim accumulator.ngd accumulator_translate.v 
// Device	: 7a100tcsg324-3
// Input file	: accumulator.ngd
// Output file	: F:\ISE Project\Accumulator\netgen\translate\accumulator_translate.v
// # of Modules	: 1
// Design Name	: accumulator
// Xilinx        : C:\Xilinx\14.7\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module accumulator (
  clk, rst, in, acc
);
  input clk;
  input rst;
  input [3 : 0] in;
  output [4 : 0] acc;
  wire in_3_IBUF_3;
  wire in_2_IBUF_4;
  wire in_1_IBUF_5;
  wire in_0_IBUF_6;
  wire clk_BUFGP;
  wire rst_IBUF_8;
  wire \add/c_out3 ;
  wire \clk_BUFGP/IBUFG_2 ;
  wire VCC;
  wire GND;
  wire [4 : 0] \mod/out ;
  wire [4 : 0] dff_in;
  X_SFF #(
    .INIT ( 1'b0 ))
  \mod/out_4  (
    .CLK(clk_BUFGP),
    .I(dff_in[4]),
    .SRST(rst_IBUF_8),
    .O(\mod/out [4]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  \mod/out_3  (
    .CLK(clk_BUFGP),
    .I(dff_in[3]),
    .SRST(rst_IBUF_8),
    .O(\mod/out [3]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  \mod/out_2  (
    .CLK(clk_BUFGP),
    .I(dff_in[2]),
    .SRST(rst_IBUF_8),
    .O(\mod/out [2]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  \mod/out_1  (
    .CLK(clk_BUFGP),
    .I(dff_in[1]),
    .SRST(rst_IBUF_8),
    .O(\mod/out [1]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  \mod/out_0  (
    .CLK(clk_BUFGP),
    .I(dff_in[0]),
    .SRST(rst_IBUF_8),
    .O(\mod/out [0]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_LUT2 #(
    .INIT ( 4'h6 ))
  \add/addr1/Mxor_out_xo<0>1  (
    .ADR0(\mod/out [0]),
    .ADR1(in_0_IBUF_6),
    .O(dff_in[0])
  );
  X_LUT4 #(
    .INIT ( 16'h366C ))
  \add/addr5/g11_xo<0>1  (
    .ADR0(in_3_IBUF_3),
    .ADR1(\mod/out [4]),
    .ADR2(\mod/out [3]),
    .ADR3(\add/c_out3 ),
    .O(dff_in[4])
  );
  X_LUT3 #(
    .INIT ( 8'h96 ))
  \add/addr4/g11_xo<0>1  (
    .ADR0(in_3_IBUF_3),
    .ADR1(\mod/out [3]),
    .ADR2(\add/c_out3 ),
    .O(dff_in[3])
  );
  X_LUT4 #(
    .INIT ( 16'h8778 ))
  \add/addr2/g11_xo<0>1  (
    .ADR0(\mod/out [0]),
    .ADR1(in_0_IBUF_6),
    .ADR2(\mod/out [1]),
    .ADR3(in_1_IBUF_5),
    .O(dff_in[1])
  );
  X_LUT6 #(
    .INIT ( 64'hFEE0F880FCC0F000 ))
  \add/addr3/cout1  (
    .ADR0(in_0_IBUF_6),
    .ADR1(in_1_IBUF_5),
    .ADR2(in_2_IBUF_4),
    .ADR3(\mod/out [2]),
    .ADR4(\mod/out [1]),
    .ADR5(\mod/out [0]),
    .O(\add/c_out3 )
  );
  X_LUT6 #(
    .INIT ( 64'hE11E8778C33C0FF0 ))
  \add/addr3/g11_xo<0>1  (
    .ADR0(in_0_IBUF_6),
    .ADR1(in_1_IBUF_5),
    .ADR2(in_2_IBUF_4),
    .ADR3(\mod/out [2]),
    .ADR4(\mod/out [1]),
    .ADR5(\mod/out [0]),
    .O(dff_in[2])
  );
  X_BUF   in_3_IBUF (
    .I(in[3]),
    .O(in_3_IBUF_3)
  );
  X_BUF   in_2_IBUF (
    .I(in[2]),
    .O(in_2_IBUF_4)
  );
  X_BUF   in_1_IBUF (
    .I(in[1]),
    .O(in_1_IBUF_5)
  );
  X_BUF   in_0_IBUF (
    .I(in[0]),
    .O(in_0_IBUF_6)
  );
  X_BUF   rst_IBUF (
    .I(rst),
    .O(rst_IBUF_8)
  );
  X_IPAD   clk_25 (
    .PAD(clk)
  );
  X_IPAD   \in<3>  (
    .PAD(in[3])
  );
  X_IPAD   \in<2>  (
    .PAD(in[2])
  );
  X_IPAD   \in<1>  (
    .PAD(in[1])
  );
  X_IPAD   \in<0>  (
    .PAD(in[0])
  );
  X_IPAD   rst_30 (
    .PAD(rst)
  );
  X_OPAD   \acc<4>  (
    .PAD(acc[4])
  );
  X_OPAD   \acc<3>  (
    .PAD(acc[3])
  );
  X_OPAD   \acc<2>  (
    .PAD(acc[2])
  );
  X_OPAD   \acc<1>  (
    .PAD(acc[1])
  );
  X_OPAD   \acc<0>  (
    .PAD(acc[0])
  );
  X_CKBUF   \clk_BUFGP/BUFG  (
    .I(\clk_BUFGP/IBUFG_2 ),
    .O(clk_BUFGP)
  );
  X_CKBUF   \clk_BUFGP/IBUFG  (
    .I(clk),
    .O(\clk_BUFGP/IBUFG_2 )
  );
  X_OBUF   acc_4_OBUF (
    .I(\mod/out [4]),
    .O(acc[4])
  );
  X_OBUF   acc_3_OBUF (
    .I(\mod/out [3]),
    .O(acc[3])
  );
  X_OBUF   acc_2_OBUF (
    .I(\mod/out [2]),
    .O(acc[2])
  );
  X_OBUF   acc_1_OBUF (
    .I(\mod/out [1]),
    .O(acc[1])
  );
  X_OBUF   acc_0_OBUF (
    .I(\mod/out [0]),
    .O(acc[0])
  );
  X_ONE   NlwBlock_accumulator_VCC (
    .O(VCC)
  );
  X_ZERO   NlwBlock_accumulator_GND (
    .O(GND)
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

