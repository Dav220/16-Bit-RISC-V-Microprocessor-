
module Instruction_Memory(
 input[15:0] pc, // Program Counter
 input reset, clk,
 output[15:0] instruction_out
);

 
 parameter col = 16;
 parameter row = 15;
 reg [15:0] Memory [14:0]; // The memory for Instructions. There would be 15 16 bit instructions with 
 wire [3:0] read_address = pc[4:1];
 
 initial begin
	Memory[0] = 16'b0;
	Memory[1] = 16'b0011010001000001; // ADDI R1, R2, 1 R1 has 1
	Memory[2] = 16'b0010_000_000_001_000; // ADD R1, R0, R0 R1 has 4
	Memory[3] = 16'b0000_001_100_000010; // LW R4, 2(R1) R4 is the destination, loading the word at Memory[R1+2]
	Memory[4] = 16'b0110_001_100_011_000; // SHIFT R1 by R4 LEFT, SET AT R3
	Memory[5] = 16'b0111_001_100_011_000; // SHIFT R1 by R4  RIGHT, SET AT R3
	Memory[6] = 16'b0001_001_010_000011; // Store R2, 3(R1) Store the value of R2 at memory address 
	Memory[7] = 16'b1010_001_010_000011; // BEQ R1, R2, PC + 3 (6)
	Memory[8] = 16'b1100000000000100; // JUMP 4 (8)
	Memory[9] = 16'b0;
	Memory[10] = 16'b0;
	Memory[11] = 16'b0;
	Memory[12] = 16'b0;
	Memory[13] = 16'b0;
	Memory[14] = 16'b0;
 end
 assign instruction_out = Memory[read_address]; //Might have to change
 
endmodule

