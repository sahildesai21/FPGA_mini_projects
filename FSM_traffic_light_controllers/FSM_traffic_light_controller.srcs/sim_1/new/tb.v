// 4 signal traffic light ; Green , Yellow , Blue , Red 
`timescale 1ns / 1ps

module tb;

reg clk, reset;
wire [3:0] state;

main DUT (.clk(clk), .reset(reset), .state(state));

// Clock generation
initial begin 
  clk = 0;
  forever #5 clk = ~clk;
end

// Stimulus
initial begin
  reset = 0;
  #10 reset = 1;
  #10 reset = 0;
  #150;
  reset = 1;
  #10 reset = 0;
  #150;
end

// Finish after some time
initial begin 
  #400;
  $finish;
end

// Monitor output
initial begin
  $monitor("Time = %0dns | Reset = %b | State = %b", $time, reset, state);
end

endmodule
