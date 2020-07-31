`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:02:56 10/29/2019 
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
module HybridAdder(input [31:0] a,input [31:0] b,input c_in, output[31:0] sum, output c_out);
	
	wire c[7:0];
	
	assign c[0] = c_in;
	CarryLookAheadAdder C1(a[3:0],b[3:0],c[0],sum[3:0],c[1]);
	CarryLookAheadAdder C2(a[7:4],b[7:4],c[1],sum[7:4],c[2]);
	CarryLookAheadAdder C3(a[11:8],b[11:8],c[2],sum[11:8],c[3]);
	CarryLookAheadAdder C4(a[15:12],b[15:12],c[3],sum[15:12],c[4]);
	CarryLookAheadAdder C5(a[19:16],b[19:16],c[4],sum[19:16],c[5]);
	CarryLookAheadAdder C6(a[23:20],b[23:20],c[5],sum[23:20],c[6]);
	CarryLookAheadAdder C7(a[27:24],b[27:24],c[6],sum[27:24],c[7]);
	CarryLookAheadAdder C8(a[31:28],b[31:28],c[7],sum[31:28],c_out);

endmodule
