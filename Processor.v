module Processor (input clk);

wire [1:0] alu_op, ALUSrc;
wire beq, bne, jump, regDst, MemRead, MemtoReg, ALUOp, MemWrite, RegWrite, reset;
wire [3:0] Opcode;



Datapath_Unit du(
	.clk(clk),
   .jump(jump),
   .beq(beq),
   .MemRead(MemRead),
   .MemWrite(MemWrite),
   .ALUSrc(ALUSrc),
   .regDst(regDst),
   .MemtoReg(MemtoReg),
   .RegWrite(RegWrite),
   .bne(bne),
   .alu_op(alu_op),
   .Opcode(Opcode),
	.ALUOp(ALUOp),
	.reset(reset)
 );
 
 Control_Unit cu(
	.Opcode(Opcode),
   .regDst(regDst),
   .MemtoReg(MemtoReg),
   .ALUOp(alu_op),
   .jump(jump),
   .bne(bne),
   .beq(beq),
   .MemRead(MemRead),
   .MemWrite(MemWrite),
   .ALUSrc(ALUSrc),
   .RegWrite(RegWrite),
	.alu_op(ALUOp)
 );
 
 
endmodule


