`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:07:09 04/08/2021
// Design Name:   MIPS
// Module Name:   C:/Users/Nora/Downloads/Project/ISE/TestMIPS.v
// Project Name:  singleCycleMIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MIPS
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestMIPS;

	// Inputs
	reg clock;
	reg reset;

	// Outputs
	wire [18:0] PC;
	wire [20:0] instr;
	wire [20:0] destRegData;

	// Instantiate the Unit Under Test (UUT)
	MIPS uut (
		.clock(clock), 
		.reset(reset), 
		.PC(PC), 
		.instr(instr), 
		.destRegData(destRegData)
	);
	
	reg [2**8-1:0]instruction_txt;
initial begin
$timeformat(-9,0,"ns",5);
clock = 1;
reset = 1;
#10 reset = 0;
end
 always #5 clock = ~clock;
always @(*)
case (instr)
 //Test1 instructions
 21'h040809:instruction_txt = "addi $8, $0, 9";
 21'h040909:instruction_txt = "addi $9, $0, 9";
 21'h0F8901:instruction_txt = "beg $8, $9, L1";
 
 21'h040D09:instruction_txt = "addi $13, $0, 9";
 21'h049A07:instruction_txt = "L1: addi $10, $9, 7";
 21'h0089B3:instruction_txt = "and $11, $8, $9";
 
 21'h070008:instruction_txt = "j L2";
 21'h04090A:instruction_txt = "addi $9, $0, 10";
 21'h12AA02:instruction_txt = "L2: slti $10, $10, 2";
 
 21'h040D0A:instruction_txt = "addi $13, $0, 10";
 21'h00D8D2:instruction_txt = "add $13, $13, $8";
 21'h0CAD00:instruction_txt = "sw $13, 0($10)";
 
 21'h18D903:instruction_txt = "ori $9, $13, 3";
 21'h08A800:instruction_txt = "lw $8, 0($10)";
 21'h0098D1:instruction_txt = "sub $13, $9, $8";
 
default: instruction_txt = "unknown instruction ";
endcase
integer i;
always begin
for(i = 1 ; i <= 13 ; i = i + 1) begin //Test1
if (i == 1)
$display("Time \tPC\t\tinstruction destRegData\t");
#10;
$display("%5t \t%2d\t%30s\t%4d\tTest %2d.", $realtime, PC, 
instruction_txt, destRegData, i);
end
$finish;
end
      
endmodule

