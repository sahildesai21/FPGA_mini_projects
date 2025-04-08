/*
For Simulation:
digits - hexadecimal
0      -    FC 
1      -    60       
2      -    DA
3      -    F2
4      -    66
5      -    B6
6      -    BE
7      -    E0
8      -    FE
9      -    F6

given the Input "num" as Constant value in binary you get the result/output 
"sev_out" in hexadecimal which is corresponds to seven segment numbers.
*/
`timescale 1ns / 1ps
// a combinational circuit design; binary to seven segment
module top(
    input [3:0] num,
    output [6:0] sev_out
    );

/*
 temporary variable for 8 bit value. 
 so when we connect temp value with sev_out we will be only considering the 7 bit value. 
*/    
reg [7:0] temp = 0;     

always @ (*) begin 

case(num)
4'b0000 : temp = 8'hFC;     // the last bit i.e 8th bit is the filling bit.
4'b0001 : temp = 8'h60;
4'b0010 : temp = 8'hDA;
4'b0011 : temp = 8'hF2;
4'b0100 : temp = 8'h66;
4'b0101 : temp = 8'hB6;
4'b0110 : temp = 8'hBE;
4'b0111 : temp = 8'hE0;
4'b1000 : temp = 8'hFE;
4'b1001 : temp = 8'hF6;
default : temp = 8'h00;
endcase

end

assign sev_out = temp[7:1];     //Connecting MSB seven bit.

endmodule
