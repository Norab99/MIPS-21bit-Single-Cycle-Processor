`timescale 1ns / 1ps

module NextPC(
    input [15:0] Imm16,
    input [18:0] incPC,
    input J, Beq, zero, Bne,
    output [18:0] TargetAddress,
    output PCSrc
    );
	 
	 assign PCSrc = (Beq & zero)|J|(~zero & Bne) ;
	
	wire [7:0] imm8 = Imm16[7:0]; 
	wire [18:0] imm8Ext = {{11{imm8[7]}}, imm8}; 
	wire [18:0] branchAddress;
	
   adder #(19) ad1(
    incPC,
    imm8Ext,
    branchAddress
    );

	 mux2 #(19) mux1(
    branchAddress,
	 {incPC[18:16],Imm16},
    TargetAddress,
    J
    );

endmodule
