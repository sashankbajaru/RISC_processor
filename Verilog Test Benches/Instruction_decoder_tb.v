`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:37:59 10/21/2019 
// Design Name: 
// Module Name:    instr_decoder_tb
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

module instr_decoder_tb;

	// Inputs
	reg [31:0] instr;

	// Outputs
	wire [3:0] OpCode;
	wire [3:0] FnCode;
	wire [4:0] reg1;
	wire [4:0] reg2;
	wire [5:0] shamt;
	wire [15:0] immediate;

	// Instantiate the Unit Under Test (UUT)
	InstructionDecode uut (
		.instr(instr), 
		.OpCode(OpCode),
		.FnCode(FnCode),	
		.reg1(reg1), 
		.reg2(reg2), 
		.shamt(shamt),  
		.immediate(immediate)
	);

	initial begin
		// Initialize Inputs
		instr = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

		#10 instr = 32'h00000000;
		#10 instr = 32'h01013b06;
		#10 instr = 32'h01013b06;
		#10 instr = 32'h01013b06;
		#10 instr = 32'h0013b067;
		
		#10 instr = 32'ha1013b06;
		#10 instr = 32'h11013b06;
		#10 instr = 32'h81013b06;
		#10 instr = 32'h1013b067;
		#10 instr = 32'h81013b06;

	end
      
endmodule

