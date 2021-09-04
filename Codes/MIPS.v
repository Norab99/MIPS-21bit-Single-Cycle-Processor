`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:27:37 04/07/2021 
// Design Name: 
// Module Name:    MIPS 
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
module MIPS(
input clock,
input reset,
output [18:0] PC,
output [20:0]instr,
output [20:0]destRegData
);
//output of datapath and input to control unit
//output of AlUCtrl
//complete here

wire [4:0] opCode;
wire [2:0] funct;
wire regDest, regWrite, extOp, ALUSrc, Beq,Bne,J, memWrite, mem2Reg;
wire [2:0] ALUOpr;

controlUnit cu1(
    opCode,
	 funct,
    regDest, regWrite, extOp, ALUSrc, Beq,Bne,
    J, memWrite, mem2Reg,
	 ALUOpr
    );
	 
dataPath dp1(
    regDest, regWrite, extOp, ALUSrc, Beq,Bne,
    J, memWrite, mem2Reg, 
    ALUOpr, 
    opCode, 
    funct, 
    reset,
    clock,
    PC,
    instr,
    destRegData
    );

endmodule
