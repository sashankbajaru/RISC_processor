`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:52:25 10/28/2019 
// Design Name: 
// Module Name:    CarryLookAheadAdder 
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

//carry look ahead adder for 4-bit inputs
module CarryLookAheadAdder(input [3:0] a,input [3:0] b,input c_in, output[3:0] sum, output c_out);
	
	wire G[3:0], P[3:0], carry[4:0];
	assign G[0] = a[0]&b[0];   //Carry Generate
	assign G[1] = a[1]&b[1];
	assign G[2] = a[2]&b[2];
	assign G[3] = a[3]&b[3];
	
	assign P[0] = a[0]^b[0];	  //Carry Propogate
	assign P[1] = a[1]^b[1];
	assign P[2] = a[2]^b[2];
	assign P[3] = a[3]^b[3];
	
	assign carry[0] = c_in;
	assign carry[1] = G[0]|(P[0]&c_in);
	assign carry[2] = G[1]|(P[1]&G[0])|(P[1]&P[0]&c_in);
	assign carry[3] = G[2]|(P[2]&G[1])|(P[2]&P[1]&G[0])|(P[2]&P[1]&P[0]&c_in);
	assign carry[4] = G[3]|(P[3]&G[2])|(P[3]&P[2]&G[1])|(P[3]&P[2]&P[1]&G[0])|(P[3]&P[2]&P[1]&P[0]&c_in);
	
	assign sum[0] = P[0]^carry[0];
	assign sum[1] = P[1]^carry[1];
	assign sum[2] = P[2]^carry[2];
	assign sum[3] = P[3]^carry[3];
	assign c_out = carry[4];

endmodule
