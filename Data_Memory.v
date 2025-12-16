

module Data_Memory(
 input clk,
 // address input, shared by read and write port
 input [15:0] addr,
 
 // write port
 input [15:0] write_data,
 input mem_Write,
 input mem_Read,
 // read port
 output [15:0] read_data
);

reg [15:0] memory [7:0];
integer fd;
wire [2:0] read_addr = addr[2:0];
initial
 begin
 memory[0] = 16'b10;
 memory[1] = 16'b1;
 memory[2] = 16'b10;
 memory[3] = 16'b1;
 memory[4] = 16'b10;
 memory[5] = 16'b1;
 memory[6] = 16'b10;
 memory[7] = 16'b1;
 
 end
 
 always @(posedge clk) begin
  if (mem_Write)
   memory[read_addr] <= write_data;
 end
 assign read_data = (mem_Read==1'b1) ? memory[read_addr]: 16'd0; 


endmodule
