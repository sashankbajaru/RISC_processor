`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:37:59 10/21/2019 
// Design Name: 
// Module Name:    TopModule_tb
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
module TopModule_tb;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire instruction_bit;
	wire alu_result_bit;
	wire jump_offset_bit;
	wire pc_bit;

	// Instantiate the Unit Under Test (UUT)
	TopModule uut (
		.clk(clk), 
		.rst(rst), 
		.instruction_bit(instruction_bit), 
		.alu_result_bit(alu_result_bit), 
		.jump_offset_bit(jump_offset_bit), 
		.pc_bit(pc_bit)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		// this file has the required changes for post-route simulation but due to 
		// the misinformation of the clock port os Spartan3, only behavioral simulation was run
		// Wait 100 ps for global reset to finish
		#1;		
		// Add stimulus here
        
		// Add stimulus here
		rst = 1;
		#2 rst = 0;

	end
	always begin
		#1 clk = ~clk;
	end
	
      
endmodule

