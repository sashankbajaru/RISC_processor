`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:27:33 10/29/2019 
// Design Name: 
// Module Name:    unsigned_mult 
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
module unsigned_mult(
		input [31:0] x,
		input [31:0] y,
		output [63:0] prod
    );
	 
	wire [2047:0] temp;
	assign temp[63:0] = x[0] ? y : 0;
	
	genvar i;
	
	generate
		
		for(i=1;i<32;i=i+1) begin : gen_blk_identifier
			assign temp[64*(i+1)-1:64*i] = temp[64*i-1:64*(i-1)] + (x[i] ? y<<i : 0);
		end
		
	endgenerate
	
	assign prod[63:0] = temp[2047:1984];

endmodule
