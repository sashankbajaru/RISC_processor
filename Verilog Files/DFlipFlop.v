`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:51:33 10/28/2019 
// Design Name: 
// Module Name:    DFlipFlop 
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
module DFlipFlop( input wire clk, input wire rst, output reg out, input wire in);
	always @(posedge clk  or posedge rst)
	begin
		if(rst)
		 out <= 0; // reset condition
		else
			out <= in;
	end
endmodule