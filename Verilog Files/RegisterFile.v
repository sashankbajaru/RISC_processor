`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:37:59 10/21/2019 
// Design Name: 
// Module Name:    RegisterFile 
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
module RegisterBank(input wire clk,input wire rst,input wire regWriteEnable, input wire [31:0] regWriteData,
						  input wire [4:0] regAddr_1, output wire [31:0] regReadData_1,
						  input wire [4:0] regAddr_2, output wire [31:0] regReadData_2, input wire[4:0] regWriteAddr);
	
	reg [31:0] regArray [31:0];
	integer i; 
	assign regReadData_1 = regArray[regAddr_1]; // data output
	assign regReadData_2 = regArray[regAddr_2]; //data output

	always @ (posedge clk or posedge rst)
	begin
		if(rst)
		begin
			for(i=0;i<32;i=i+1)//Initialising all the registers to zero upon reset
				regArray[i] <= 32'd0;
				
		end
		else
		begin
			if(regWriteEnable) 
			begin
				regArray[regWriteAddr] <= regWriteData;
			end
		end
	end
	

endmodule