`timescale 1ns / 1ps

module InstMem #(parameter WIDTH=21, ADDR_BITS=6)(
    input wire [ADDR_BITS-1:0] Address,
    output wire [WIDTH-1:0] Instruction,
	 input wire clk, reset
    );
	 
	 reg [WIDTH-1:0] IM [(2**ADDR_BITS)-1:0];
	 always @(posedge clk)
	 if (reset) begin
	 $readmemh("asmCode/Test1.hex",IM);
	 end
	 assign Instruction = IM[Address];
endmodule
