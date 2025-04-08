// 4 signal traffic light ; Green , Yellow , Blue , Red 
`timescale 1ns / 1ps

module main(
    input clk,reset,
    output reg [3:0]state 
    );
// constants for case ,but it is not the form of binary counting, yeah though it is binary no. here we are using *one-hot encoding*  
    parameter RED = 4'b0001, GREEN = 4'b0010, YELLOW = 4'b0100, BLUE = 4'b1000;       
    
    always @ (posedge clk, posedge reset)
    begin
    if (reset == 1)
    state <= RED;
    else 
    case(state)
    RED : state <=  GREEN;       // current state : state <= Next State
    GREEN : state <= YELLOW;
    YELLOW : state <= BLUE;
    BLUE : state <= RED;
    endcase
    end
endmodule
