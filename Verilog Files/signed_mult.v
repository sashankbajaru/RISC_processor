`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:25:44 10/29/2019 
// Design Name: 
// Module Name:    signed_mult 
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
module signed_mult(
    input [31:0] x,
    input [31:0] y,
    output reg [63:0] prod
    );
	 // product = p1-p2-p3+p4 (combinational 2's complement multiplier)	 
	 reg [63:0] p1, p2, p3, p4 ;
	 
	 reg [63:0] temp1, temp2 ;
	 
	 always @* begin
	 
		p1 = (x[31]&y[31])<<62;	
		
		if( x[31] ) begin
			p2 = y[30:0]<<31;
		end
		else begin
			p2 = 0;
		end
		
	   if( y[31] ) begin
			p3 = x[30:0]<<31;
		end
		else begin
			p3 = 0;
		end
		
		p4 = x[30:0]*y[30:0];
		
		temp1 = p2+p3;
		
		temp2 = p1-temp1;
		
		prod = p4+temp2; 
		
	 end
 
endmodule

