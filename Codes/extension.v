`timescale 1ns / 1ps

module extension #(parameter INSIZE = 8, OUTSIZE = 21) (
    input [INSIZE-1:0] in,
    input ExOp,
    output reg [OUTSIZE-1:0] out
    );
	 
	always @*
	if (ExOp)
	out = {{(OUTSIZE-INSIZE){in[INSIZE-1]}},in}; // sigend extension, take the las bir MSB and duplicate it
	else
	out = {{(OUTSIZE-INSIZE){1'b0}},in}; // zero ectension
   endmodule
