`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:45:35 10/23/2019 
// Design Name: 
// Module Name:    ALU 
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
module ALU(input wire [31:0] a, input wire [31:0] b, input wire [3:0] control, output reg [31:0] result_1,output reg[31:0] result_2,output reg zero_flag,
				output reg carry_flag, output reg sign_flag, output reg overflow_flag);

	reg signed[31:0] a1;
	reg signed[31:0] b1;
	wire[31:0] sum_result;
	wire[63:0]  prod_result_s,prod_result_u;
	wire cout_sum;
	wire[31:0] shift_outR, shift_outL;
	HybridAdder I1(a,b,1'b0,sum_result,cout_sum);
	signed_mult M1(a,b,prod_result_s);
	unsigned_mult M2(a,b,prod_result_u);
	barrel_shifter B1(a,b,1'b1,shift_outR);
	barrel_shifter B2(a,b,1'b0,shift_outL);
	always @(a or b or control)
	begin
		carry_flag = 0;// Setting all flags to zero initially
		zero_flag = 0;
		sign_flag =0;
		overflow_flag = 0;
		a1 = a; 
		b1 = b;
		case(control)
			4'b0000: {carry_flag,result_1} = a+b;//Addition. And addition is the only operation with the chance of generating a carry
			4'b0001: result_1 = ~b+1; //Compliment
			4'b0010: result_1 = a&b; //And operation
			4'b0011: result_1 = a^b; //Or operation
			4'b0100: result_1 = shift_outL; //Left shift
			4'b0101: result_1 = shift_outR; //Right shift
			4'b0110: result_1 = a>>>b; // Sign preserve right shift
			4'b0111: result_1 = a; // Bypass the ALU. Operation important for branching
			4'b1000: result_1 = b; // Bypass the ALU. Operation important for branching
			4'b1001: result_1 = a + b[15:0]; 	// Add LSB side half word for calculating memory offset
			4'b1010: {result_1,result_2} = prod_result_u;  //multiply two unsigned variables 
			4'b1011: {result_1,result_2} = prod_result_s; //multiply two signed variables
			default:  result_1 = 32'd0; // Default does nothing
		endcase
		zero_flag = (result_1 == 32'd0)?1:0;// If result_1 is zero the set zero flag
		sign_flag = result_1[31]; // the sign flag is the sign bit of the result_1
		overflow_flag = carry_flag^(result_1[31]^(a[31]^b[31])); // the overflow flag
	end	

endmodule