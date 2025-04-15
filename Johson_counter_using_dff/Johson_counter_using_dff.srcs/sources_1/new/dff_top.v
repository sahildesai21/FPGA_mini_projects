`timescale 1ns / 1ps

module dff_top(
    input clk,d,
    output reg q,qb
    );

always @ (posedge clk) 
begin 
q = (d == 1'b0)? 0:1;
qb = ~q;
end

endmodule

//////////////////////////////////////////////////////////////////////////////////

module johson_counter (
    input clk,
    output q1,q2,q3,q4,qb1,qb2,qb3,qb4
    );

dff_top d1 (clk,qb4,q1,qb1);
dff_top d2 (clk,q1,q2,qb2);
dff_top d3 (clk,q2,q3,qb3);
dff_top d4 (clk,q3,q4,qb4);

endmodule