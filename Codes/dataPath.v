`timescale 1ns / 1ps

module dataPath(

// Control Signals
//Main control signals
input regDest, regWrite, extOp, ALUSrc, Beq,Bne, J, memWrite, mem2Reg,

//ALU control signal
input [2:0] ALUOpr, //3bits
output [4:0] opCode, // 5bits
output [2:0] funct, // 3bits
input reset,//INPUT TO PC REGISTER
input clk ,

//for testing the code.
output [18:0] PC, //output of pc register
output [20:0] instr,//output of instMem
output [20:0]destRegData//output of WB mux
);

wire [18:0] pcNext, incPC, targetAddress;
wire [20:0] extImmediate, aluResult ;
wire [20:0] outRs1, outRs2,aluOprd2, dataOut;
wire [3:0] destReg;
wire PCSrc, Zero;

assign opCode = instr[20:16]; // 5-bit opcode
// ************ R and I types
wire [3:0] rs1 = instr[15:12];// 4-bit source register
wire [3:0] rs2 = instr[11:8];// 4-bit target register
// ************ R-Type
wire [3:0] rd = instr[7:4];// 4-bit destination register
wire shamt = instr[3];// 1-bit shift amount
assign funct = instr[2:0];// 3-bit function
// ************ I-Type
wire [7:0] immediate = instr[7:0];// 8-bit immediate
// ************ J-Type
wire [15:0] jumpAddress = instr[15:0];// 16-bit target address
assign incPC = PC+1'b1;//+1
//complete here also
mux2 #(19) m1(
    incPC,
	 targetAddress,
    pcNext,
    PCSrc
    );
	 
Register #(19) r1(
    pcNext,
    PC,
    reset,
    clk
    );
	 
InstMem #(21,6) im1(
    PC[5:0],
    instr,
	 clk,
	 reset
    );
	 
mux2 #(4) m2(
    rs2,
	 rd,
    destReg,
    regDest
    );
	 
RegFile rf1(
    rs1,
	 rs2,
    destReg,
	 clk, 
	 regWrite,
	 destRegData,
	 outRs1,
	 outRs2
	 );
	 
extension #(8,21) e1(
    immediate, 
    extOp,
    extImmediate
    );
	 
mux2 #(21) m3(
    outRs2,
	 extImmediate,
    aluOprd2,
    ALUSrc
    );
	 
ALU al1(
    outRs1,
    aluOprd2,
    aluResult,
    Zero,
    ALUOpr
    );
	 
DataMem #(21,6) dm1(
    aluResult[5:0], // take the the 6 LSB
    outRs2,
    dataOut,
    clk,
    memWrite
	 //  we cancled the memRead
    );
	 
mux2 #(21) m4(
    aluResult,
	 dataOut,
    destRegData,
    mem2Reg
    );
	 
NextPC NPC(
// all the red line are control signals.
    jumpAddress, 
	 incPC,
    J,
	 Beq, 
	 Zero,
	 Bne,
    targetAddress,
    PCSrc
    );

endmodule