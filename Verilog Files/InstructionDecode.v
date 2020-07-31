`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:26:46 10/21/2019 
// Design Name: 
// Module Name:    InstructionDecode 
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
module InstructionDecode(
	  input [31:0] instr,
	  output [3:0] OpCode,
	  output [3:0] FnCode,
	  output [4:0] reg1,
	  output [4:0] reg2,
	  output [5:0] shamt,
	  output [15:0] immediate
    );
	 
	
	assign OpCode = instr[31:28];
	assign FnCode = instr[3:0];
	assign flag = instr[27];
	assign immediate = instr[22:7];
	assign reg1 = instr[27:23];
	assign reg2 = instr[22:18];
	assign shamt = instr[17:12];
	

endmodule
