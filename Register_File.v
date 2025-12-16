module Register_File(
input [2:0] readReg1, readReg2, writeReg, // registers to read from and write to
input [15:0] writeData, // data to write to the registers
input regWrite_en, clk, // Control variable to wrtie to a regsiter, clock input
output [15:0] outputData1, outputData2); // The register values read

reg [15:0] rf [7:0]; // 8 registers, all 16 bits long

assign outputData1 = rf[readReg1];
assign outputData2 = rf[readReg2];
integer i;
integer regfileLength = 8;

initial begin
	for (i = 0; i < 8; i = i + 1'd1) begin
		rf[i] <= 16'd0;
	end
end

always @(posedge clk) begin
	if (regWrite_en) begin
		rf[writeReg] <= writeData;
	end
	
end

endmodule


