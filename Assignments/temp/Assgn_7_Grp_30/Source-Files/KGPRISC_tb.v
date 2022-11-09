/*
   Assignment No. - 7
   KGP-RISC
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Ashutosh Kumar Singh (19CS30008) & Vanshita Garg (19CS10064)
*/

`timescale 1ns / 1ps

// Testbench for the KGPRISC top module
module KGPRISC_tb;

	// Inputs
	reg clk;
	reg rst;
	// Instantiate the Unit Under Test (UUT)
	KGPRISC uut (
		.clk(clk), 
		.rst(rst)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
        #5 rst = 0;
		
   
       #2905 
        $display ("Content in register 19: %d", uut.DP.registerFile.registerBank[19]);
        if (uut.DP.registerFile.registerBank[19] == -1) begin
            $display("Element not found.");
        end else begin
            $display("Element found at index: %d", uut.DP.registerFile.registerBank[19]);
        end
        $finish;
        
        
    end
    
//    always @ (*) begin
//            if (uut.DP.registerFile.registerBank[16] == 1) begin 
//                $finish;
//               end
//        end
    
    always begin
        #10 clk = ~clk;
    end
      
endmodule

