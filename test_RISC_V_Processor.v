
`timescale 1ns / 1ps

module test_RISC_V_Processor;

 // Inputs
 reg clk;

 // Instantiate the Unit Under Test (UUT)
 Processor uut (
  .clk(clk)
 );

 initial begin
       // Initialize Inputs
       clk = 0;


       // Wait for global reset to finish
       #10;
      
       // Run simulation for enough time to see instructions execute
       #200;
      
       $stop;
   end
  
   // Clock generator
   always #5 clk = ~clk;

endmodule

