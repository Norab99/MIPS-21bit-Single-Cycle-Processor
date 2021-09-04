`timescale 1ns / 1ps
module DataMem #(parameter WIDTH=21, ADDR_BITS=6)(
    input wire [ADDR_BITS-1:0] Address,
    input wire [WIDTH-1:0] DataIn,
    output wire [WIDTH-1:0] DataOut,
    input wire clk,
    input wire MemWrite
    );
	 
	 reg [WIDTH-1:0] DM [(2**ADDR_BITS)-1:0];
	 always @ (posedge clk)
	 if (MemWrite)
	 DM[Address] <= DataIn;
	 assign DataOut = DM[Address];
endmodule
