`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:40:09 10/30/2019 
// Design Name: 
// Module Name:    barrel_shifter 
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
module barrel_shifter(input [31:0] a, input [31:0] b,input dir,output reg[31:0] out);

	always @*
	begin
	  if(dir==0) 
	  begin
		  out = a<<b;
	  end
	  else out = a>>b;
	 end 
endmodule
