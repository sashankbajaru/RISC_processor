`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:21:28 11/06/2019 
// Design Name: 
// Module Name:    Mux_2x1_32bit 
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
module Mux_2x1_32bit(input wire [31:0] a, input wire [31:0] b, input wire select, output reg[31:0] out);
	always @(*)
	begin 
		if(select)
			out = b;
		else out = a;
	end
endmodule