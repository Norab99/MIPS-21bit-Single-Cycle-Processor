`timescale 1ns / 1ps

module ALU(
    input [20:0] A,
    input [20:0] B,
    output reg [20:0] AluResult,
    output Zero,
    input [2:0] AluControl
    );
	
	always @*
	case (AluControl)
 
   3'b000: AluResult = A + B;
   3'b001: AluResult = A - B;
   3'b010: AluResult = A & B;
   3'b011: AluResult = A | B;
   3'b100: AluResult = A << B;
	default: AluResult = 0;
	endcase
	assign Zero =(AluResult == 0);
	endmodule
