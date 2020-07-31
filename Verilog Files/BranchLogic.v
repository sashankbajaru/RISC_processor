`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:41:54 10/28/2019 
// Design Name: 
// Module Name:    BranchLogic 
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
//////////////////////////////////////////////////////////////////////////////////`timescale 1ns / 1ps
`default_nettype none

//////////////////////////////////////////////////////////////////////////////////

// The module for deciding the branching
//outputs the offset and whether a branch has to be taken
module BranchLogic(
	input wire [3:0] opcode,
	input wire [3:0] FnCode,
	input wire [15:0] offset_in,
	input wire [31:0] rs_value,
	input wire zflag_ff,input wire oflag_ff,
	input wire cflag_ff,
	input wire sflag_ff,                                                                                                 
	input wire clk,
	output reg [15:0] offset_out,
	input wire rst,
	output reg branch
    );
	
	wire zflag, oflag, cflag, sflag;
	DFlipFlop zFlagFF (.clk(clk),.rst(rst),.in(zflag_ff),.out(zflag)),
				 oFlagFF (.clk(clk),.rst(rst),.in(oflag_ff),.out(oflag)),
				 cFlagFF (.clk(clk),.rst(rst),.in(cflag_ff),.out(cflag)),
				 sFlagFF (.clk(clk),.rst(rst),.in(sflag_ff),.out(sflag)); // Dflipflops to preserve the flags for accurate branching

	
//	always@(posedge clk or posedge rst)
	always @(opcode or offset_in or rs_value or zflag or oflag or cflag or sflag or rst)
	begin
		if(rst)
		begin
			offset_out = 0;//reset signal
			branch = 0;
		end
		else
		begin
			branch = 1;
			case({opcode,FnCode})
				8'b01100000: begin 						// unconditional jump
					offset_out = offset_in;
				end
				8'b01100001: begin 						// jump to register value
					offset_out = rs_value[15:0];
				end
				8'b01110000: begin 						// branch on zero
					if(zflag)
						offset_out = offset_in;
					else begin 						// branch condition fails
						branch = 0;
						offset_out = 0;
					end
				end
				8'b01110001: begin 						// branch on not zero
					if(!zflag)
						offset_out = offset_in;
					else begin 						// branch condition fails
						branch = 0;
						offset_out = 0;
					end
				end
				8'b01110010: begin							// branch on carry flag
					if(cflag)
						offset_out = offset_in;
					else begin 						// branch condition fails
						branch = 0;
						offset_out = 0;
					end
				end
				8'b01110011: begin 						// branch on not carry
					if(!cflag)
						offset_out = offset_in;
					else begin						// branch condition fails
						branch = 0;
						offset_out = 0;
					end
				end
				8'b01110100: begin 						// branch on sign flag, i.e negative number
					if(sflag)
						offset_out = offset_in; 	
					else begin						// branch condition fails
						branch = 0;
						offset_out = 0;
					end
				end
				8'b01110101: begin 						// branch on not sign, i.e non negative number
					if(!sflag)
						offset_out = offset_in;
					else begin 						// branch condition fails
						branch = 0;
						offset_out = 0;
					end
				end
				8'b01110110: begin 						// branch on overflow
					if(oflag)
						offset_out = offset_in;
					else begin 						// branch condition fails
						branch = 0;
						offset_out = 0;
					end
				end
				8'b01110111: begin 						// branch on not overflow
					if(!oflag)
						offset_out = offset_in;
					else begin 						// branch condition fails
						branch = 0;
						offset_out = 0;
					end
				end
				8'b10000000: begin 						// function call
					offset_out = offset_in;
				end
				8'b10000001: begin 						// return - jump to (ra)
					offset_out = rs_value[15:0];
				end
				default: begin 					// default vaule - no branch and 0 offset
					branch = 0;
					offset_out = 0;
				end
			endcase
		end
	end
endmodule