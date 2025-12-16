module Datapath_Unit (
input clk, beq, bne, jump, regDst, MemRead, MemtoReg, ALUOp, MemWrite, RegWrite, reset,
input [1:0] alu_op, ALUSrc,
output [3:0] Opcode);

	// Instruction Fetch Unit
	reg [15:0] pc;
	wire [15:0] instruction, pc_next;
	// Registers and register file data
	wire [2:0] readReg1, readReg2, writeReg, reg_Dest;
	wire [15:0] writeRegData, outputRegData1, outputRegData2;
	wire [15:0] readData2;
	
	// Immediate generator
	wire [15:0] ImmGen;
	wire [5:0] ImmVal;
	integer IMem_length = 15;
	
	//ALU
	wire [2:0] ALUCntrl;
	wire [15:0] ALU_Result;
	wire zero_flag;
	
	//Jump and Branch Instructions
	wire [12:0] jump_value;
	wire beq_control, bne_control;
	
	// Memory Data
	wire [15:0] read_Mem_Data;
	
	initial begin
		pc = 16'd0;
	end
	
	always@(posedge clk) begin
		pc <= pc_next;
	end
	
	// Read registers
	assign readReg1 = instruction[11:9];
	assign readReg2 = instruction[8:6];
	
	
	// Instruction Memory
	Instruction_Memory Im(.pc(pc), .instruction_out(instruction), .reset(reset), .clk(clk));
	
	// Assigning the destination register
	assign writeReg = (regDst==1'b1) ? instruction[5:3] : /* (instruction[15:12] == 4'b000) ? readReg1: */ readReg2;
	
	assign jump_value = (jump==1'b1) ? {instruction[11:0],1'b0} : 13'b0; // Might have to revisit
	
	//Immedieate generator and value
	assign ImmVal = instruction[5:0];
	assign ImmGen = {{10{instruction[5]}},instruction[5:0]};
	
	
	// General registers
	Register_File rf(
		.readReg1(readReg1), .readReg2(readReg2), .writeReg(writeReg),
		.writeData(writeRegData), .regWrite_en(RegWrite),
		.clk(clk), .outputData1(outputRegData1), .outputData2(outputRegData2));
		
	
	// Setting up the ALU
	ALUControl ALU_controller(
		.ALUop(alu_op), 
		.Opcode(instruction[15:12]),
		.control(ALUCntrl));
	
	assign readData2 = (ALUSrc == 2'b01) ? ImmGen : (ALUSrc == 2'b10) ? {{10{ImmVal[5]}},ImmVal} : outputRegData2;
		
	ALU alu_unit( .a(outputRegData1), .b(readData2), .control(ALUCntrl), .result(ALU_Result), .zero(zero_flag));
	
	// Getitng next instruction
	assign beq_control = (beq & zero_flag);
	assign bne_control = (bne & ~zero_flag);
	
	assign pc_next = (beq_control == 1'b1 || bne_control == 1'b1) ? pc + {ImmGen[14:0],1'b0} : (jump) ? pc + { {3{jump_value[12]}},jump_value} : pc + 2'b10;
	
	
		Data_Memory DM (
		.clk(clk), 
		.addr(ALU_Result), 
		.write_data(outputRegData2), 
		.mem_Write(MemWrite), 
		.mem_Read(MemRead),
		.read_data(read_Mem_Data));
		
	//Writing from Memory
	assign writeRegData = (MemtoReg == 1'b1) ? read_Mem_Data : ALU_Result;
	// Control unit output
	assign Opcode = instruction[15:12];
	
endmodule
	
		
	
	
	
	
	

	


