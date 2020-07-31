`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:50:21 10/23/2019 
// Design Name: 
// Module Name:    InstructionFetch 
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
module InstructionFetch(input wire [31:0] pc,output wire [31:0] instruction,input wire clk,input wire rst);
	wire [4:0] rom_address;
	assign rom_address = pc[6:2];
	
	blk_mem_gen_v7_3 E1 (.clka(clk),.wea(1'b0),.addra(rom_address),.dina(),.douta(instruction));
endmodule
 