`timescale 1ns / 1ps

module RegFile(
    input [3:0] ra,
	 input [3:0] rb,
    input [3:0] rw,
	 input clk, RegWr,
	 input [20:0] BusW,
	 output [20:0] BusA,
	 output [20:0] BusB
	 );
    reg [20:0] rf[20:0];
	 always @(posedge clk)
		if (RegWr) rf[rw] <= BusW;	
  assign BusA = (ra != 0) ? rf[ra] : 0;
  assign BusB = (rb != 0) ? rf[rb] : 0;

	endmodule
