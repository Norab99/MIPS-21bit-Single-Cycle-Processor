`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:01:24 03/21/2021 
// Design Name: 
// Module Name:    ALUCtrrl 
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
module ALUCtrrl(
     input [2:0] func,
    input [4:0] op,
    output reg[2:0] ALUop
    );
	 always @*
	 
	 casex (op)
	 5'b00000: case(func) // Rtype.
	 3'b010:  ALUop=3'b000; //ADD
	 3'b011:  ALUop=3'b010; // And
	 3'b001:  ALUop=3'b001;// Sub
	 default: ALUop=3'b111;
	 endcase
	 5'b11000: ALUop=3'b011; // ORi
	 5'b10010: ALUop=3'b100; //SLTi
	 5'b00100: ALUop=3'b000; //ADDi
	 5'b01000: ALUop=3'b000; //lw
	 5'b01100: ALUop=3'b000; //sw
	 5'b01111: ALUop=3'b001; //beq
	 5'b00111: ALUop=3'b000; //j
	 default:  ALUop=4'b000;
	 endcase

endmodule
