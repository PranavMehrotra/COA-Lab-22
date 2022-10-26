`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:30:50 10/27/2022 
// Design Name: 
// Module Name:    branch_checker 
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
module branch_checker(
	input [2:0] branch,
	input carry,
	input zero,
	input sign,
	output reg jump
    );
	 always @(*) begin
	 if (branch == 3'b001) begin
		jump = 1;
	 end
	 else if (branch == 3'b010) begin
		jump = 1;
	 end
	 else if (branch == 3'b011) begin
		if(sign && !zero)begin
			jump = 1;
		end
		else begin
			jump = 0;
		end
	 end
	 else if (branch == 3'b100) begin
		if(zero)begin
			jump = 1;
		end
		else begin
			jump = 0;
		end
	 end
	 else if (branch == 3'b101) begin
		if(!zero)begin
			jump = 1;
		end
		else begin
			jump = 0;
		end
	 end
	 else if (branch == 3'b110) begin
		if(carry)begin
			jump = 1;
		end
		else begin
			jump = 0;
		end
	 end
	 else if (branch == 3'b111) begin
		if(!carry)begin
			jump = 1;
		end
		else begin
			jump = 0;
		end
	 end
	 else begin
		jump = 0;
	 end
	 
	 
	 end


endmodule
