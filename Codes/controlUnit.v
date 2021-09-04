`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:23:26 04/07/2021 
// Design Name: 
// Module Name:    controlUnit 
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
module controlUnit(
   input [4:0] opCode,
	input [2:0] funct,
	output RegDst,  RegWrite, ExtOp, ALUSrc,  Beq, Bne,J,  MemWrite,  MemtoReg,
	output [2:0] ALUop
    );

 ALUCtrrl a1( funct, opCode,ALUop);
 
 mainCtrl a2( opCode,  RegDst,  RegWrite, ExtOp, ALUSrc,  Beq, Bne, J,  MemWrite,  MemtoReg);
 
endmodule
