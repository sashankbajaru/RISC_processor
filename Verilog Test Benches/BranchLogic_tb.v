`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:37:59 10/21/2019 
// Design Name: 
// Module Name:    BranchLogic_tb
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
module BranchLogic_tb;

	// Inputs
	reg [3:0] opcode;
	reg [3:0] FnCode;
	reg [15:0] offset_in;
	reg [31:0] rs_value;
	reg zflag_ff;
	reg oflag_ff;
	reg cflag_ff;
	reg sflag_ff;
	reg clk;
	reg rst;

	// Outputs
	wire [15:0] offset_out;
	wire branch;

	// Instantiate the Unit Under Test (UUT)
	BranchLogic uut (
		.opcode(opcode), 
		.FnCode(FnCode),
		.offset_in(offset_in), 
		.rs_value(rs_value), 
		.zflag_ff(zflag_ff), 
		.oflag_ff(oflag_ff), 
		.cflag_ff(cflag_ff), 
		.sflag_ff(sflag_ff), 
		.clk(clk), 
		.offset_out(offset_out), 
		.rst(rst), 
		.branch(branch)
	);

	initial begin
		// Initialize Inputs
		opcode = 0;
		FnCode = 0;
		offset_in = 0;
		rs_value = 0;
		zflag_ff = 0;
		oflag_ff = 0;
		cflag_ff = 0;
		sflag_ff = 0;
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		rst = 1;
		#10 rst = 0;

		#10;
		//Unconditional Jump
		opcode = 4'b0110;
		FnCode = 4'b0000;
		offset_in = 4;
		rs_value = -32;
		zflag_ff = 0;
		oflag_ff = 0;
		cflag_ff = 0;
		sflag_ff = 0;

		#10;
		//Zero flag branch
		opcode = 4'b0111;
		FnCode = 4'b0000;
		offset_in = 10;
		rs_value = -32;
		zflag_ff = 1;
		oflag_ff = 0;
		cflag_ff = 0;
		sflag_ff = 0;

		#10;
		//Sign flag branch
		opcode = 4'b0111;
		FnCode = 4'b0100;
		offset_in = 5;
		rs_value = -32;
		zflag_ff = 0;
		oflag_ff = 0;
		cflag_ff = 0;
		sflag_ff = 1;

		#10;
		//Sign flag no branch
		opcode = 4'b0111;
		FnCode = 4'b0100;
		offset_in = 6;
		rs_value = -32;
		zflag_ff = 0;
		oflag_ff = 0;
		cflag_ff = 0;
		sflag_ff = 0;

		#10;
		//Carry flag branch
		opcode = 4'b0111;
		FnCode = 4'b0010;
		offset_in = 8;
		rs_value = -32;
		zflag_ff = 0;
		oflag_ff = 0;
		cflag_ff = 1;
		sflag_ff = 0;

		
		#10;
		//Not Carry branch
		opcode = 4'b0111;
		FnCode = 4'b0011;
		offset_in = 8;
		rs_value = -32;
		zflag_ff = 0;
		oflag_ff = 0;
		cflag_ff = 0;
		sflag_ff = 0;

	end


endmodule

