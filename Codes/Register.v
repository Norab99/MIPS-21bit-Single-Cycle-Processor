`timescale 1ns / 1ps

module Register #(parameter n = 21)(
    input [n-1:0] DataIn,
    output reg [n-1:0] DataOut,
    input reset,
    input clk
    );
	always @(posedge clk, posedge reset)
	 if (reset)
	 DataOut <= 0;
    else 
    DataOut <= DataIn; 
endmodule
