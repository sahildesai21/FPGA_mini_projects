`timescale 1ns / 1ps
// sequential synchronous circuit
// 64 x 8 RAM 
module ram(
    input clk,rst,
    input write,        //write = 0 : Read , write = 1: wirte the data.
    input [7:0] din,
    input [5:0] addr,    /* here the addre [5:0] so that we have enough space to access the memorary i.e 64 in binary 
                            and addr to access the location of the memorary to store or read data    */
    output [7:0] dout     //not delcare reg because here we are not direct assigning the output 
    );
    
reg [7:0] temp;         // temporary variable to store the output
reg [7:0] mem [63:0];                  // decalring the memory 
integer i = 0;


always @ (posedge clk) begin
if (rst == 1'b1)
    begin
    begin
    for (i = 0 ; i < 64 ; i = i+1)  // here we can't use i++ cuz it doesn't support, it can be used in system verilog.       
    mem[i] <= 8'h00;                // clear all memory.    
    end 
    temp <= 8'h00;
    end
else
    begin 
    if (write == 1'b1)
        mem[addr] <= din;    //write 
    else
        temp <= mem[addr];   //read
    end
end

assign dout = temp ;      //connecting 
endmodule
