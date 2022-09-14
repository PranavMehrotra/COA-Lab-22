////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: accumulator_synthesis.v
// /___/   /\     Timestamp: Wed Aug 24 14:26:21 2022
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim accumulator.ngc accumulator_synthesis.v 
// Device	: xc7a100t-3-csg324
// Input file	: accumulator.ngc
// Output file	: F:\ISE Project\Accumulator\netgen\synthesis\accumulator_synthesis.v
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
  wire in_3_IBUF_0;
  wire in_2_IBUF_1;
  wire in_1_IBUF_2;
  wire in_0_IBUF_3;
  wire clk_BUFGP_4;
  wire rst_IBUF_5;
  wire \add/c_out3 ;
  wire [4 : 0] \mod/out ;
  wire [4 : 0] dff_in;
  FDR   \mod/out_4  (
    .C(clk_BUFGP_4),
    .D(dff_in[4]),
    .R(rst_IBUF_5),
    .Q(\mod/out [4])
  );
  FDR   \mod/out_3  (
    .C(clk_BUFGP_4),
    .D(dff_in[3]),
    .R(rst_IBUF_5),
    .Q(\mod/out [3])
  );
  FDR   \mod/out_2  (
    .C(clk_BUFGP_4),
    .D(dff_in[2]),
    .R(rst_IBUF_5),
    .Q(\mod/out [2])
  );
  FDR   \mod/out_1  (
    .C(clk_BUFGP_4),
    .D(dff_in[1]),
    .R(rst_IBUF_5),
    .Q(\mod/out [1])
  );
  FDR   \mod/out_0  (
    .C(clk_BUFGP_4),
    .D(dff_in[0]),
    .R(rst_IBUF_5),
    .Q(\mod/out [0])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \add/addr1/Mxor_out_xo<0>1  (
    .I0(\mod/out [0]),
    .I1(in_0_IBUF_3),
    .O(dff_in[0])
  );
  LUT4 #(
    .INIT ( 16'h366C ))
  \add/addr5/g11_xo<0>1  (
    .I0(in_3_IBUF_0),
    .I1(\mod/out [4]),
    .I2(\mod/out [3]),
    .I3(\add/c_out3 ),
    .O(dff_in[4])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \add/addr4/g11_xo<0>1  (
    .I0(in_3_IBUF_0),
    .I1(\mod/out [3]),
    .I2(\add/c_out3 ),
    .O(dff_in[3])
  );
  LUT4 #(
    .INIT ( 16'h8778 ))
  \add/addr2/g11_xo<0>1  (
    .I0(\mod/out [0]),
    .I1(in_0_IBUF_3),
    .I2(\mod/out [1]),
    .I3(in_1_IBUF_2),
    .O(dff_in[1])
  );
  LUT6 #(
    .INIT ( 64'hFEE0F880FCC0F000 ))
  \add/addr3/cout1  (
    .I0(in_0_IBUF_3),
    .I1(in_1_IBUF_2),
    .I2(in_2_IBUF_1),
    .I3(\mod/out [2]),
    .I4(\mod/out [1]),
    .I5(\mod/out [0]),
    .O(\add/c_out3 )
  );
  LUT6 #(
    .INIT ( 64'hE11E8778C33C0FF0 ))
  \add/addr3/g11_xo<0>1  (
    .I0(in_0_IBUF_3),
    .I1(in_1_IBUF_2),
    .I2(in_2_IBUF_1),
    .I3(\mod/out [2]),
    .I4(\mod/out [1]),
    .I5(\mod/out [0]),
    .O(dff_in[2])
  );
  IBUF   in_3_IBUF (
    .I(in[3]),
    .O(in_3_IBUF_0)
  );
  IBUF   in_2_IBUF (
    .I(in[2]),
    .O(in_2_IBUF_1)
  );
  IBUF   in_1_IBUF (
    .I(in[1]),
    .O(in_1_IBUF_2)
  );
  IBUF   in_0_IBUF (
    .I(in[0]),
    .O(in_0_IBUF_3)
  );
  IBUF   rst_IBUF (
    .I(rst),
    .O(rst_IBUF_5)
  );
  OBUF   acc_4_OBUF (
    .I(\mod/out [4]),
    .O(acc[4])
  );
  OBUF   acc_3_OBUF (
    .I(\mod/out [3]),
    .O(acc[3])
  );
  OBUF   acc_2_OBUF (
    .I(\mod/out [2]),
    .O(acc[2])
  );
  OBUF   acc_1_OBUF (
    .I(\mod/out [1]),
    .O(acc[1])
  );
  OBUF   acc_0_OBUF (
    .I(\mod/out [0]),
    .O(acc[0])
  );
  BUFGP   clk_BUFGP (
    .I(clk),
    .O(clk_BUFGP_4)
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

