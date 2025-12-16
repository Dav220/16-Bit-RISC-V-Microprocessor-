module Control_Unit(
input [3:0] Opcode,
output reg [1:0] ALUOp, ALUSrc,
output reg beq, bne, jump, regDst, MemRead, MemtoReg, alu_op, MemWrite, RegWrite);

always@(*) begin
	case(Opcode)
	4'b0000: //Load Word 
	begin
		beq = 1'b0;
		bne = 1'b0;
		jump = 1'b0;
		regDst = 1'b0;
		MemRead = 1'b1;
		MemtoReg = 1'b1;
		ALUOp = 2'b01;
		MemWrite = 1'b0;
		ALUSrc = 2'b01;
		RegWrite = 1'b1;
	end
	
	4'b0001: // Store Word
	begin
		beq = 1'b0;
		bne = 1'b0;
		jump = 1'b0;
		regDst = 1'b0;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		ALUOp = 2'b01;
		MemWrite = 1'b1;
		ALUSrc = 2'b01;
		RegWrite = 1'b0;
	end
	
	4'b0010: // ADD
	begin
		beq = 1'b0;
		bne = 1'b0;
		jump = 1'b0;
		regDst = 1'b1;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		ALUOp = 2'b00;
		MemWrite = 1'b0;
		ALUSrc = 2'b00;
		RegWrite = 1'b1;
	end
	
	4'b0011: // ADDI
	begin
		beq = 1'b0;
		bne = 1'b0;
		jump = 1'b0;
		regDst = 1'b0;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		ALUOp = 2'b00;
		MemWrite = 1'b0;
		ALUSrc = 2'b10;
		RegWrite = 1'b1;
	end
	
	4'b0100: // SUB
	begin
		beq = 1'b0;
		bne = 1'b0;
		jump = 1'b0;
		regDst = 1'b1;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		ALUOp = 2'b00;
		MemWrite = 1'b0;
		ALUSrc = 2'b00;
		RegWrite = 1'b1;
	end
	
	4'b0101: // NOT
	begin
		beq = 1'b0;
		bne = 1'b0;
		jump = 1'b0;
		regDst = 1'b1;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		ALUOp = 2'b00;
		MemWrite = 1'b0;
		ALUSrc = 2'b00;
		RegWrite = 1'b1;
	end
	
	4'b0110: // SHIFT LEFT
	begin
		beq = 1'b0;
		bne = 1'b0;
		jump = 1'b0;
		regDst = 1'b1;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		ALUOp = 2'b00;
		MemWrite = 1'b0;
		ALUSrc = 2'b00;
		RegWrite = 1'b1;
	end
	
	4'b0111: // SHIFT RIGHT
	begin
		beq = 1'b0;
		bne = 1'b0;
		jump = 1'b0;
		regDst = 1'b1;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		ALUOp = 2'b00;
		MemWrite = 1'b0;
		ALUSrc = 2'b00;
		RegWrite = 1'b1;
	end
	
//	4'b0111: // SHIFT LEFT
//	begin
//		beq = 1'b0;
//		bne = 1'b0;
//		jump = 1'b0;
//		regDst = 1'b1;
//		MemRead = 1'b0;
//		MemtoReg = 1'b0;
//		ALUOp = 2'b00;
//		MemWrite = 1'b0;
//		ALUSrc = 2'b00;
//		RegWrite = 1'b1;
//	end
	
	4'b1000: // AND
	begin
		beq = 1'b0;
		bne = 1'b0;
		jump = 1'b0;
		regDst = 1'b1;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		ALUOp = 2'b00;
		MemWrite = 1'b0;
		ALUSrc = 2'b00;
		RegWrite = 1'b1;
	end
	
	4'b1001: // OR
	begin
		beq = 1'b0;
		bne = 1'b0;
		jump = 1'b0;
		regDst = 1'b1;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		ALUOp = 2'b00;
		MemWrite = 1'b0;
		ALUSrc = 2'b00;
		RegWrite = 1'b1;
	end
	
	4'b1010: // BEQ
	begin
		beq = 1'b1;
		bne = 1'b0;
		jump = 1'b0;
		regDst = 1'b0;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		ALUOp = 2'b10;
		MemWrite = 1'b0;
		ALUSrc = 2'b00;
		RegWrite = 1'b0;
	end
	
	4'b1011: // BNE
	begin
		beq = 1'b0;
		bne = 1'b1;
		jump = 1'b0;
		regDst = 1'b0;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		ALUOp = 2'b10;
		MemWrite = 1'b0;
		ALUSrc = 2'b00;
		RegWrite = 1'b0;
	end
	
	4'b1100: // JUMP
	begin
		beq = 1'b0;
		bne = 1'b0;
		jump = 1'b1;
		regDst = 1'b0;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		ALUOp = 2'b00;
		MemWrite = 1'b0;
		ALUSrc = 2'b00;
		RegWrite = 1'b0;
	end
	
	default: 
	begin
		beq = 1'b0;
		bne = 1'b0;
		jump = 1'b0;
		regDst = 1'b1;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		ALUOp = 2'b00;
		MemWrite = 1'b0;
		ALUSrc = 2'b00;
		RegWrite = 1'b0;
	end
	
endcase
end

endmodule
	
	
		
		
	