`timescale 1ns / 1ps

module mux2 #(parameter WIDTH = 8)(
    input [WIDTH-1:0] D0,
	 input [WIDTH-1:0] D1,
    output [WIDTH-1:0] Y,
    input   Select
    );
	assign Y =Select?D1:D0;
endmodule
