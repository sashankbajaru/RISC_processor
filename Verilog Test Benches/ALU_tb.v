`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:37:59 10/21/2019 
// Design Name: 
// Module Name:    ALU_tb
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
module ALU_tb;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;
	reg [3:0] control;

	// Outputs
	wire [31:0] result_1;
	wire[31:0] result_2;
	wire zero_flag;
	wire carry_flag;
	wire sign_flag;
	wire overflow_flag;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.a(a), 
		.b(b), 
		.control(control), 
		.result_1(result_1),
		.result_2(result_2),
		.zero_flag(zero_flag), 
		.carry_flag(carry_flag), 
		.sign_flag(sign_flag), 
		.overflow_flag(overflow_flag)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		control = 0;

		// Wait 100 ns for global reset to finish
		#100;
      
		// Add stimulus here

		#10;
		control = 0;
		a = 20;
		b = 10;

		#20;
		a = 32'h7fffffff;
		b = 32'h7fffffff;
		#20;
		a = 32'hffffffff;
		b = 32'hffffffff;

		#20;
		control = 3;
		a = 32'hffa47a78;
		b = 32'h0faeff12;
		
		#20;
		control = 4;
		a = 32'hffaaaa78;
		b = 32'h03a33f12;
	
		#20;
		control = 6;
		a = 32'h00a11a78;
		b = 32'h03aeff36;
	
		#20;
		control = 7;
		a = 32'h0faaaa78;
		b = 32'h03faeff14;	
	end
      
endmodule

