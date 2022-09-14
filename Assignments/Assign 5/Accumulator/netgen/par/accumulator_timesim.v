////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: accumulator_timesim.v
// /___/   /\     Timestamp: Wed Aug 24 16:09:25 2022
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -s 3 -pcf accumulator.pcf -sdf_anno true -sdf_path netgen/par -insert_glbl true -insert_pp_buffers true -w -dir netgen/par -ofmt verilog -sim accumulator.ncd accumulator_timesim.v 
// Device	: 7a100tcsg324-3 (PRODUCTION 1.10 2013-10-13)
// Input file	: accumulator.ncd
// Output file	: F:\ISE Project\Accumulator\netgen\par\accumulator_timesim.v
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
  wire clk_BUFGP;
  wire in_1_IBUF_82;
  wire in_0_IBUF_84;
  wire rst_IBUF_85;
  wire \clk_BUFGP/IBUFG_86 ;
  wire in_2_IBUF_90;
  wire in_3_IBUF_91;
  wire \add/c_out3 ;
  wire \ProtoComp1.INTERMDISABLE_GND.0 ;
  wire \in<1>/ProtoComp1.INTERMDISABLE_GND.0 ;
  wire \in<3>/ProtoComp1.INTERMDISABLE_GND.0 ;
  wire \in<0>/ProtoComp1.INTERMDISABLE_GND.0 ;
  wire \clk/ProtoComp1.INTERMDISABLE_GND.0 ;
  wire \rst/ProtoComp1.INTERMDISABLE_GND.0 ;
  wire \mod/out<1>_pack_5 ;
  wire \NlwBufferSignal_acc_3_OBUF/I ;
  wire \NlwBufferSignal_acc_4_OBUF/I ;
  wire \NlwBufferSignal_acc_0_OBUF/I ;
  wire \NlwBufferSignal_acc_1_OBUF/I ;
  wire \NlwBufferSignal_acc_2_OBUF/I ;
  wire \NlwBufferSignal_clk_BUFGP/BUFG/IN ;
  wire \NlwBufferSignal_mod/out_4/CLK ;
  wire \NlwBufferSignal_mod/out_3/CLK ;
  wire \NlwBufferSignal_mod/out_2/CLK ;
  wire \NlwBufferSignal_mod/out_0/CLK ;
  wire \NlwBufferSignal_mod/out_1/CLK ;
  wire VCC;
  wire GND;
  wire [4 : 0] \mod/out ;
  wire [4 : 0] dff_in;
  initial $sdf_annotate("netgen/par/accumulator_timesim.sdf");
  X_OPAD #(
    .LOC ( "IOB_X0Y142" ))
  \acc<3>  (
    .PAD(acc[3])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y142" ))
  acc_3_OBUF (
    .I(\NlwBufferSignal_acc_3_OBUF/I ),
    .O(acc[3])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y141" ))
  \acc<4>  (
    .PAD(acc[4])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y141" ))
  acc_4_OBUF (
    .I(\NlwBufferSignal_acc_4_OBUF/I ),
    .O(acc[4])
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y147" ))
  \in<2>  (
    .PAD(in[2])
  );
  X_ZERO #(
    .LOC ( "IOB_X0Y147" ))
  \ProtoComp1.INTERMDISABLE_GND.3  (
    .O(\ProtoComp1.INTERMDISABLE_GND.0 )
  );
  X_IBUF_INTERMDISABLE_TPWRGT #(
    .LOC ( "IOB_X0Y147" ))
  in_2_IBUF (
    .IBUFDISABLE(1'b0),
    .INTERMDISABLE(\ProtoComp1.INTERMDISABLE_GND.0 ),
    .O(in_2_IBUF_90),
    .I(in[2]),
    .TPWRGT(1'b1)
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y145" ))
  \acc<0>  (
    .PAD(acc[0])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y145" ))
  acc_0_OBUF (
    .I(\NlwBufferSignal_acc_0_OBUF/I ),
    .O(acc[0])
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y148" ))
  \in<1>  (
    .PAD(in[1])
  );
  X_ZERO #(
    .LOC ( "IOB_X0Y148" ))
  \ProtoComp1.INTERMDISABLE_GND.2  (
    .O(\in<1>/ProtoComp1.INTERMDISABLE_GND.0 )
  );
  X_IBUF_INTERMDISABLE_TPWRGT #(
    .LOC ( "IOB_X0Y148" ))
  in_1_IBUF (
    .IBUFDISABLE(1'b0),
    .INTERMDISABLE(\in<1>/ProtoComp1.INTERMDISABLE_GND.0 ),
    .O(in_1_IBUF_82),
    .I(in[1]),
    .TPWRGT(1'b1)
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y146" ))
  \in<3>  (
    .PAD(in[3])
  );
  X_ZERO #(
    .LOC ( "IOB_X0Y146" ))
  \ProtoComp1.INTERMDISABLE_GND.4  (
    .O(\in<3>/ProtoComp1.INTERMDISABLE_GND.0 )
  );
  X_IBUF_INTERMDISABLE_TPWRGT #(
    .LOC ( "IOB_X0Y146" ))
  in_3_IBUF (
    .IBUFDISABLE(1'b0),
    .INTERMDISABLE(\in<3>/ProtoComp1.INTERMDISABLE_GND.0 ),
    .O(in_3_IBUF_91),
    .I(in[3]),
    .TPWRGT(1'b1)
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y144" ))
  \acc<1>  (
    .PAD(acc[1])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y144" ))
  acc_1_OBUF (
    .I(\NlwBufferSignal_acc_1_OBUF/I ),
    .O(acc[1])
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y149" ))
  \in<0>  (
    .PAD(in[0])
  );
  X_ZERO #(
    .LOC ( "IOB_X0Y149" ))
  \ProtoComp1.INTERMDISABLE_GND.1  (
    .O(\in<0>/ProtoComp1.INTERMDISABLE_GND.0 )
  );
  X_IBUF_INTERMDISABLE_TPWRGT #(
    .LOC ( "IOB_X0Y149" ))
  in_0_IBUF (
    .IBUFDISABLE(1'b0),
    .INTERMDISABLE(\in<0>/ProtoComp1.INTERMDISABLE_GND.0 ),
    .O(in_0_IBUF_84),
    .I(in[0]),
    .TPWRGT(1'b1)
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y143" ))
  \acc<2>  (
    .PAD(acc[2])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y143" ))
  acc_2_OBUF (
    .I(\NlwBufferSignal_acc_2_OBUF/I ),
    .O(acc[2])
  );
  X_IPAD #(
    .LOC ( "IOB_X1Y128" ))
  clk_4 (
    .PAD(clk)
  );
  X_ZERO #(
    .LOC ( "IOB_X1Y128" ))
  \ProtoComp1.INTERMDISABLE_GND  (
    .O(\clk/ProtoComp1.INTERMDISABLE_GND.0 )
  );
  X_IBUF_INTERMDISABLE_TPWRGT #(
    .LOC ( "IOB_X1Y128" ))
  \clk_BUFGP/IBUFG  (
    .IBUFDISABLE(1'b0),
    .INTERMDISABLE(\clk/ProtoComp1.INTERMDISABLE_GND.0 ),
    .O(\clk_BUFGP/IBUFG_86 ),
    .I(clk),
    .TPWRGT(1'b1)
  );
  X_IPAD #(
    .LOC ( "IOB_X0Y140" ))
  rst_39 (
    .PAD(rst)
  );
  X_ZERO #(
    .LOC ( "IOB_X0Y140" ))
  \ProtoComp1.INTERMDISABLE_GND.5  (
    .O(\rst/ProtoComp1.INTERMDISABLE_GND.0 )
  );
  X_IBUF_INTERMDISABLE_TPWRGT #(
    .LOC ( "IOB_X0Y140" ))
  rst_IBUF (
    .IBUFDISABLE(1'b0),
    .INTERMDISABLE(\rst/ProtoComp1.INTERMDISABLE_GND.0 ),
    .O(rst_IBUF_85),
    .I(rst),
    .TPWRGT(1'b1)
  );
  X_CKBUF #(
    .LOC ( "BUFGCTRL_X0Y31" ))
  \clk_BUFGP/BUFG  (
    .I(\NlwBufferSignal_clk_BUFGP/BUFG/IN ),
    .O(clk_BUFGP)
  );
  X_SFF #(
    .LOC ( "SLICE_X1Y144" ),
    .INIT ( 1'b0 ))
  \mod/out_4  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_mod/out_4/CLK ),
    .I(dff_in[4]),
    .O(\mod/out [4]),
    .SRST(rst_IBUF_85),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X1Y144" ),
    .INIT ( 64'h333366666666CCCC ))
  \add/addr5/g11_xo<0>1  (
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR0(in_3_IBUF_91),
    .ADR1(\mod/out [4]),
    .ADR5(\mod/out [3]),
    .ADR4(\add/c_out3 ),
    .O(dff_in[4])
  );
  X_LUT6 #(
    .LOC ( "SLICE_X1Y144" ),
    .INIT ( 64'hFEA8EE88EA80AA00 ))
  \add/addr3/cout1  (
    .ADR2(in_0_IBUF_84),
    .ADR1(in_1_IBUF_82),
    .ADR0(in_2_IBUF_90),
    .ADR3(\mod/out [2]),
    .ADR5(\mod/out [1]),
    .ADR4(\mod/out [0]),
    .O(\add/c_out3 )
  );
  X_BUF   \mod/out<3>/mod/out<3>_AMUX_Delay  (
    .I(\mod/out<1>_pack_5 ),
    .O(\mod/out [1])
  );
  X_SFF #(
    .LOC ( "SLICE_X0Y144" ),
    .INIT ( 1'b0 ))
  \mod/out_3  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_mod/out_3/CLK ),
    .I(dff_in[3]),
    .O(\mod/out [3]),
    .SRST(rst_IBUF_85),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X0Y144" ),
    .INIT ( 64'hCCCC33333333CCCC ))
  \add/addr4/g11_xo<0>1  (
    .ADR0(1'b1),
    .ADR3(1'b1),
    .ADR2(1'b1),
    .ADR4(\mod/out [3]),
    .ADR1(in_3_IBUF_91),
    .ADR5(\add/c_out3 ),
    .O(dff_in[3])
  );
  X_SFF #(
    .LOC ( "SLICE_X0Y144" ),
    .INIT ( 1'b0 ))
  \mod/out_2  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_mod/out_2/CLK ),
    .I(dff_in[2]),
    .O(\mod/out [2]),
    .SRST(rst_IBUF_85),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X0Y144" ),
    .INIT ( 64'hAA95556A95556AAA ))
  \add/addr3/g11_xo<0>1  (
    .ADR1(in_0_IBUF_84),
    .ADR3(in_1_IBUF_82),
    .ADR0(in_2_IBUF_90),
    .ADR4(\mod/out [2]),
    .ADR5(\mod/out [1]),
    .ADR2(\mod/out [0]),
    .O(dff_in[2])
  );
  X_SFF #(
    .LOC ( "SLICE_X0Y144" ),
    .INIT ( 1'b0 ))
  \mod/out_0  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_mod/out_0/CLK ),
    .I(dff_in[0]),
    .O(\mod/out [0]),
    .SRST(rst_IBUF_85),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X0Y144" ),
    .INIT ( 64'h3C3C3C3C3C3C3C3C ))
  \add/addr1/Mxor_out_xo<0>1  (
    .ADR0(1'b1),
    .ADR4(1'b1),
    .ADR3(1'b1),
    .ADR2(\mod/out [0]),
    .ADR1(in_0_IBUF_84),
    .ADR5(1'b1),
    .O(dff_in[0])
  );
  X_LUT5 #(
    .LOC ( "SLICE_X0Y144" ),
    .INIT ( 32'hC03F3FC0 ))
  \add/addr2/g11_xo<0>1  (
    .ADR0(1'b1),
    .ADR4(\mod/out [1]),
    .ADR3(in_1_IBUF_82),
    .ADR2(\mod/out [0]),
    .ADR1(in_0_IBUF_84),
    .O(dff_in[1])
  );
  X_SFF #(
    .LOC ( "SLICE_X0Y144" ),
    .INIT ( 1'b0 ))
  \mod/out_1  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_mod/out_1/CLK ),
    .I(dff_in[1]),
    .O(\mod/out<1>_pack_5 ),
    .SRST(rst_IBUF_85),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_BUF   \NlwBufferBlock_acc_3_OBUF/I  (
    .I(\mod/out [3]),
    .O(\NlwBufferSignal_acc_3_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_acc_4_OBUF/I  (
    .I(\mod/out [4]),
    .O(\NlwBufferSignal_acc_4_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_acc_0_OBUF/I  (
    .I(\mod/out [0]),
    .O(\NlwBufferSignal_acc_0_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_acc_1_OBUF/I  (
    .I(\mod/out [1]),
    .O(\NlwBufferSignal_acc_1_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_acc_2_OBUF/I  (
    .I(\mod/out [2]),
    .O(\NlwBufferSignal_acc_2_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_clk_BUFGP/BUFG/IN  (
    .I(\clk_BUFGP/IBUFG_86 ),
    .O(\NlwBufferSignal_clk_BUFGP/BUFG/IN )
  );
  X_BUF   \NlwBufferBlock_mod/out_4/CLK  (
    .I(clk_BUFGP),
    .O(\NlwBufferSignal_mod/out_4/CLK )
  );
  X_BUF   \NlwBufferBlock_mod/out_3/CLK  (
    .I(clk_BUFGP),
    .O(\NlwBufferSignal_mod/out_3/CLK )
  );
  X_BUF   \NlwBufferBlock_mod/out_2/CLK  (
    .I(clk_BUFGP),
    .O(\NlwBufferSignal_mod/out_2/CLK )
  );
  X_BUF   \NlwBufferBlock_mod/out_0/CLK  (
    .I(clk_BUFGP),
    .O(\NlwBufferSignal_mod/out_0/CLK )
  );
  X_BUF   \NlwBufferBlock_mod/out_1/CLK  (
    .I(clk_BUFGP),
    .O(\NlwBufferSignal_mod/out_1/CLK )
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

