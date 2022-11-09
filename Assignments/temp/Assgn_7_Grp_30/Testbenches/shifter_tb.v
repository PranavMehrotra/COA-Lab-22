/*
   Assignment No. - 7
   KGP-RISC
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Ashutosh Kumar Singh (19CS30008) & Vanshita Garg (19CS10064)
*/

`timescale 1ns / 1ps

// Testbench for shifter module
module shifter_tb;

	// Inputs 
    reg  dir, aorl;
    reg [31:0] shamt;
    reg [31:0] in;

    // Output
    wire [31:0] out;
    
    // Instantiate the unit under test
    shifter S1(.in(in), .shamt(shamt), .dir(dir), .out(out), .aorl(aorl));
    
    initial begin

        // Monitor the changes
        $monitor("time = %0d, shamt = %b, dir = %b, in = %b, out = %b, aorl = %b", $time, shamt, dir, in, out, aorl);
        
        // Specify input, direction and shift amount
        in = 4567; dir = 1'b1; shamt = 4; aorl = 0;

        // Change the shifting direction
        #5 dir = 1'b0; aorl = 1'b0;

        #5 dir = 1'b0; aorl = 1'b1;

        #5 dir = 1'b1; aorl = 1'b0; in = -64;

        #5 dir = 1'b0; aorl = 1'b0;

        #5 dir = 1'b0; aorl = 1'b1;
        
        #5 $finish;

    end
      
endmodule
