module ALU (
input [15:0] a, b,
input [2:0] control,
output reg [15:0] result,
output zero
);

	always @(*) begin
		case (control)
		3'b000: result <= a + b; // add
		3'b001: result <= a - b; // sub
		3'b010: result <= ~a; // not
		3'b011: result <= a<<b; // bitwise shift left
		3'b100: result <= a>>b; // bitwise shift right
		3'b101: result <= a & b; // and
		3'b110: result <= a | b; // or
		3'b111: result <= (a<b) ? 16'b1:16'b0; // Checking what's greater
				  
		default:result <= a + b; // add is the default operation
		endcase
	 end
	 
	 assign zero = (result==16'b0);
 endmodule
 