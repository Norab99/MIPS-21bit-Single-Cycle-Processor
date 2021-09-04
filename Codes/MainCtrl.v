`timescale 1ns / 1ps

module mainCtrl(
   input [4:0] Op,
    output  RegDst,
    output  RegWrite,
    output  ExtOp,
    output  ALUSrc,
    output  Beq,
	 output Bne,
	  output  J,
    output  MemWrite,
    output  MemtoReg
    );
	 
	 
	  reg [8:0] control;
	 always @ (*)
	 
	 casex(Op)
	 
	  5'b00000: control=9'b011x00000; // R-type
	  
	  5'b00100: control=9'b001110000; /// Addi
	  
	  5'b10010: control=9'b00111000; //SLTi
	  
	  5'b11000: control=9'b001010000; //ORi
	  
	  5'b01000: control=9'b001110001; //Lw
	  

	  5'b01100: control=9'b0x011001x; //Sw

	  
	  5'b01111: control=9'b0x0x0100x; //beq
	  
	  5'b00111: control=9'b0x0xx010x; // j
	  
	  default: control=9'b0000000000;
	  endcase
	  
assign Bne=control[8];
assign RegDst=control[7];
assign RegWrite= control[6];
assign ExtOp=control[5];
assign ALUSrc=control[4];
assign Beq=control[3];
assign J=control[2];
assign MemWrite=control[1];
assign MemtoReg=control[0];


endmodule
