module ALUControl(
input [1:0] ALUop,
input [3:0] Opcode,
output reg [2:0] control);

	wire [5:0] ALUCntrlSelector; // Might have to change
	assign ALUCntrlSelector = {ALUop,Opcode};
	always@(*) begin
			casex (ALUCntrlSelector)
			6'b10xxxx: control = 3'b001; // BEQ/BNE
			6'b01xxxx: control = 3'b000; // LOAD/STORE
			6'b000010: control = 3'b000; // ADD
			6'b000011: control = 3'b000; // ADDI
			6'b000100: control = 3'b001; // SUB
			6'b000101: control = 3'b010; // NOT
			6'b000110: control = 3'b011; // SHIFT LEFT
			6'b000111: control = 3'b100; // SHIFT RIGHT
			6'b001000: control = 3'b101; // AND
			6'b001001: control = 3'b110; // OR
			default: control = 3'b000; // ADD
			endcase
		end
endmodule
	