`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:37:59 10/21/2019 
// Design Name: 
// Module Name:    Control_unit_tb
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

module Control_unit_tb;

	// Inputs
	reg [3:0] opcode;
	reg [3:0] FnCode;
	reg clk;
	reg rst;

	// Outputs
	wire [3:0] alu_control;
	wire Branch;
	wire regWrite;
	wire MemWrite;
	wire MemRead;
	wire ALU_src;
	wire reg_data;
	wire const_src;

	// Instantiate the Unit Under Test (UUT)
	ControlUnit uut (
		.opcode(opcode), 
		.FnCode(FnCode), 
		.clk(clk), 
		.rst(rst), 
		.alu_control(alu_control), 
		.Branch(Branch), 
		.regWrite(regWrite), 
		.MemWrite(MemWrite), 
		.MemRead(MemRead), 
		.ALU_src(ALU_src), 
		.reg_data(reg_data), 
		.const_src(const_src)
	);

	initial begin
		// Initialize Inputs
		opcode = 0;
		FnCode = 0;
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
		#10 rst = 1;
		#10 rst = 0;
		
		#10;
		opcode = 0;
		FnCode = 0;
      
		#10;
		opcode = 0;
		FnCode = 3;
		
		#10;
		opcode = 3;
		opcode_ext = 0;
		
		#10;
		opcode = 4;
		opcode_ext = 0;
		
		#10;
		opcode = 7;
		opcode_ext = 0;
		// Add stimulus here

	end
	
	always begin
		#5 clk = ~clk;
	end      
endmodule

