`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
/*
Assignment No - 7
Semester - Autumn 2018
Group - 3
Members:
  G Rahul KrantiKiran - 16CS10018
  Sai Saketh Aluru - 16CS30030
*/
//////////////////////////////////////////////////////////////////////////////////

// the control unit module
//This takes as input the opcode and opcode ext and instructs all other modules

module ControlUnit(input wire[3:0] opcode, input wire [3:0] FnCode,
		input wire clk, input wire rst,
		output reg [3:0] alu_control,
		output reg Branch,regWrite,MemWrite,MemRead,ALU_src,reg_data,const_src,reg_to_pc, regWrite_select
	);

	always@(opcode or FnCode or rst)
	begin
		if(rst) // setting all flags to zero
		begin
			alu_control <= 0;
			Branch <= 0;
			regWrite <= 0;
			MemWrite <= 0;
			MemRead <= 0;
			ALU_src <= 0;
			const_src <= 0;
			reg_data <= 0;
			reg_to_pc <= 0;
			regWrite_select <= 0;
		end
		else
		begin
			case(opcode)
				4'd0: 								//Opcode: 0000
					begin
						case(FnCode)
							4'd0:						// Add
								begin
									alu_control <= 0;
									Branch <= 0;
									regWrite <= 1;
									MemWrite <= 0;
									MemRead <= 0;
									const_src <= 0;
									ALU_src <= 0;
									reg_data <= 1;
									reg_to_pc <= 0;
									regWrite_select <= 0;
								end
							4'd1: 						// Multiply unsigned
								begin
									alu_control <= 10;
									Branch <= 0;
									regWrite <= 1;
									MemWrite <= 0;
									const_src <= 0;
									MemRead <= 0;
									ALU_src <= 0;
									reg_data <= 1;
									reg_to_pc <= 0;
									regWrite_select <= 0;
								end	
							4'd2: 						// Multiply signed
								begin
									alu_control <= 11;
									Branch <= 0;
									regWrite <= 1;
									MemWrite <= 0;
									const_src <= 0;
									MemRead <= 0;
									ALU_src <= 0;
									reg_data <= 1;
									reg_to_pc <= 0;
									regWrite_select <= 0;
								end	
									
							4'd3: 						// Complement
								begin
									alu_control <= 1;
									Branch <= 0;
									regWrite <= 1;
									MemWrite <= 0;
									const_src <= 0;
									MemRead <= 0;
									ALU_src <= 0;
									reg_data <= 1;
									reg_to_pc <= 0;
									regWrite_select <= 0;
								end
							4'd4: 						// Add Immediate
								begin
									alu_control <= 0;
									Branch <= 0;
									regWrite <= 1;
									MemWrite <= 0;
									const_src <= 0;
									regWrite_select <= 0;
									MemRead <= 0;
									ALU_src <= 1;
									reg_data <= 1;
									reg_to_pc <= 0;
								end
							4'd5: 						// Complement Immediate
								begin
									alu_control <= 1;
									Branch <= 0;
									regWrite <= 1;
									MemRead <= 0;
									MemWrite <= 0;
									regWrite_select <= 0;
									const_src <= 0;
									ALU_src <= 1;
									reg_to_pc <= 0;
									reg_data <= 1;
								end
							default: 
								begin
								end
						endcase
					end
				4'd1: 						        //Opcode=1
					begin
						case(FnCode)
							4'd0:                 //and
								begin
									alu_control <= 2;
									Branch <= 0;
									regWrite_select <= 0;
									regWrite <= 1;
									const_src <= 0;
									MemWrite <= 0;
									MemRead <= 0;
									ALU_src <= 0;
									reg_data <= 1;
									reg_to_pc <= 0;
								end
							4'd1:						//Xor
								begin
									alu_control <= 3;
									Branch <= 0;
									const_src <= 0;
									regWrite <= 1;
									MemWrite <= 0;
									MemRead <= 0;
									regWrite_select <= 0;
									ALU_src <= 0;
									reg_data <= 1;
									reg_to_pc <= 0;
								end
							default:
								begin
								end
						endcase
					end	
				4'd2: 						        //Opcode=2
					begin
						case(FnCode)
							4'd0:                 //shift left logical
								begin
									alu_control <= 4;
									Branch <= 0;
									regWrite <= 1;
									MemWrite <= 0;
									MemRead <= 0;
									regWrite_select <= 0;
									const_src <= 1;
									ALU_src <= 1;
									reg_data <= 1;
									reg_to_pc <= 0;
								end
							4'd1:						//shift right logical
								begin
									alu_control <= 5;
									Branch <= 0;
									regWrite <= 1;
									MemWrite <= 0;
									MemRead <= 0;
									const_src <= 1;
									ALU_src <= 1;
									regWrite_select <= 0;
									reg_data <= 1;
									reg_to_pc <= 0;
								end
							4'd2:					//Shift Right Arithmetic
								begin
									alu_control <= 6;
									Branch <= 0;
									regWrite <= 1;
									MemWrite <= 0;
									const_src <= 1;
									MemRead <= 0;
									ALU_src <= 1;
									regWrite_select <= 0;
									reg_data <= 1;
									reg_to_pc <= 0;
								end
							default:
								begin
								end
						endcase
					end
				4'd3: 						        //Opcode=3///////////////
					begin
						case(FnCode)
							4'd0:                 //shift left logical variable
								begin
									alu_control <= 4;
									Branch <= 0;
									regWrite <= 1;
									const_src <= 0;
									regWrite_select <= 0;
									MemWrite <= 0;
									MemRead <= 0;
									ALU_src <= 0;
									reg_data <= 1;
									reg_to_pc <= 0;
								end
							4'd1:						//shift right variable
								begin
									alu_control <= 5;
									Branch <= 0;
									regWrite <= 1;
									MemWrite <= 0;
									const_src <= 0;
									MemRead <= 0;
									ALU_src <= 0;
									reg_data <= 1;
									regWrite_select <= 0;
									reg_to_pc <= 0;
								end
							4'd2:					//Shift Right Arithmetic
								begin
									alu_control <= 6;
									Branch <= 0;
									regWrite <= 1;
									MemWrite <= 0;
									const_src <= 1;
									MemRead <= 0;
									ALU_src <= 1;
									regWrite_select <= 0;
									reg_data <= 1;
									reg_to_pc <= 0;
								end
							default:
								begin
								end
						endcase
					end
				4'd4: 						        // Load Word
					begin
						alu_control <= 9;
						Branch <= 0;
						regWrite <= 1;
						MemWrite <= 0;
						const_src <= 0;
						regWrite_select <= 1;
						MemRead <= 1;
						ALU_src <= 1;
						reg_data <= 0;
						reg_to_pc <= 0;
					end
				4'd5: 						        // Store Word
					begin
						alu_control <= 9;
						Branch <= 0;
						regWrite <= 0;
						const_src <= 0;
						MemWrite <= 1;
						MemRead <= 0;
						regWrite_select <= 1;
						ALU_src <= 1;
						reg_data <= 0;
						reg_to_pc <= 0;
					end
				4'd6: 						        //Opcode 6 (Branch Instructions-1)
					begin
						case(FnCode)
							4'd0:                 //Unconditional Branch
								begin
									alu_control <= 8;
									Branch <= 1;
									regWrite <= 0;
									regWrite_select <= 0;
									const_src <= 0;
									MemWrite <= 0;
									MemRead <= 0;
									ALU_src <= 1;
									reg_to_pc <= 0;
									reg_data <= 0;
								end
							4'd1:						//Branch Register
								begin
									alu_control <= 7;
									Branch <= 1;
									regWrite <= 0;
									const_src <= 0;
									regWrite_select <= 0;
									MemWrite <= 0;
									MemRead <= 0;
									ALU_src <= 0;
									reg_to_pc <= 0;
									reg_data <= 0;
								end
							default:
								begin
								end
						endcase
					end
				4'd7: 						        //Opcode 7(Branch Instructions-2)
					begin
						case(FnCode)
							4'd0:                 //Branch on zero
								begin
									alu_control <= 8;
									Branch <= 1;
									regWrite <= 0;
									const_src <= 0;
									regWrite_select <= 0;
									MemWrite <= 0;
									MemRead <= 0;
									ALU_src <= 1;
									reg_to_pc <= 0;
									reg_data <= 0;
								end
							4'd1:						//Branch on no zero
								begin
									alu_control <= 8;
									Branch <= 1;
									regWrite <= 0;
									const_src <= 0;
									regWrite_select <= 0;
									MemWrite <= 0;
									MemRead <= 0;
									ALU_src <= 1;
									reg_to_pc <= 0;
									reg_data <= 0;
								end
							4'd2:						//Branch on Carry
								begin
									alu_control <= 8;
									Branch <= 1;
									regWrite <= 0;
									regWrite_select <= 0;
									const_src <= 0;
									MemWrite <= 0;
									MemRead <= 0;
									ALU_src <= 1;
									reg_data <= 0;
									reg_to_pc <= 0;
								end
							4'd3:						//Branch on Not Carry
								begin
									alu_control <= 8;
									Branch <= 1;
									regWrite <= 0;
									regWrite_select <= 0;
									const_src <= 0;
									MemWrite <= 0;
									MemRead <= 0;
									ALU_src <= 1;
									reg_to_pc <= 0;
									reg_data <= 0;
								end
							4'd4:						//Branch on Sign
								begin
									alu_control <= 8;
									Branch <= 1;
									regWrite <= 0;
									const_src <= 0;
									regWrite_select <= 0;
									MemWrite <= 0;
									MemRead <= 0;
									ALU_src <= 1;
									reg_to_pc <= 0;
									reg_data <= 0;
								end	
							4'd5:						//Branch on Not Sign
								begin
									alu_control <= 8;
									regWrite_select <= 0;
									Branch <= 1;
									regWrite <= 0;
									const_src <= 0;
									MemWrite <= 0;
									MemRead <= 0;
									ALU_src <= 1;
									reg_to_pc <= 0;
									reg_data <= 0;
								end
							4'd6:						//Branch on Overflow
								begin
									alu_control <= 8;
									Branch <= 1;
									regWrite <= 0;
									const_src <= 0;
									regWrite_select <= 0;
									MemWrite <= 0;
									MemRead <= 0;
									reg_to_pc <= 0;
									ALU_src <= 1;
									reg_data <= 0;
								end
							4'd7:						//Branch on No Overflow
								begin
									alu_control <= 8;
									Branch <= 1;
									regWrite <= 0;
									const_src <= 0;
									reg_to_pc <= 0;
									regWrite_select <= 0;
									MemWrite <= 0;
									MemRead <= 0;
									ALU_src <= 1;
									reg_data <= 0;
								end	
							default:
								begin
								end
						endcase
					end
				4'd8:
					begin
						case(FnCode)
							4'd0:  						        // Function call
							  begin
								alu_control <= 0;
								const_src <= 0;
								Branch <= 1;
								regWrite <= 1;
								regWrite_select <= 0;
								MemWrite <= 0;
								MemRead <= 0;
								ALU_src <= 1;
								reg_to_pc <= 1;
								reg_data <= 0;
							end
							4'd1: 
							  begin 						        // Return 
								alu_control <= 7;
								Branch <= 1;
								regWrite <= 0;
								const_src <= 0;
								regWrite_select <= 0;
								MemWrite <= 0;
								MemRead <= 0;
								ALU_src <= 0;
								reg_to_pc <= 1;
								reg_data <= 0;
							end
						endcase	
					end	
			endcase
		end
	end
endmodule