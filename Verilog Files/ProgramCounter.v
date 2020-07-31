`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:42:37 10/22/2019 
// Design Name: 
// Module Name:    ProgramCounter 
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
module ProgramCounter(input wire clk,input wire [15:0] offset,input wire branch, output reg [31:0] pc,input wire rst);
	wire [31:0] pc_next, pc_non_jump, pc_jump;
	reg [22:0] clk1;
	
	always@(posedge clk)begin
		clk1 = clk1+1;
	end
	always @(posedge clk1[22] or posedge rst)
	begin
		if(rst)
		begin
			pc <= 32'd0; 		// reset condition
		end
		else
			pc <= pc_next; 	// set next value of pc
	end
	assign pc_non_jump = pc + 32'd4; 								// calculate pc for non-branching instructions
	assign pc_jump = pc + 32'd4 + {{16{offset[15]}},offset}; 	// calculate pc for branching instructions
	assign pc_next = (branch)? pc_jump: pc_non_jump; 			// Select next pc value
endmodule