`timescale 1ns / 1ps

module tb_johnson_counter;

    // Clock signal
    reg clk = 0;

    // Wires to observe outputs
    wire q1, q2, q3, q4;
    wire qb1, qb2, qb3, qb4;

    // Instantiate the Design Under Test (DUT)
    johson_counter DUT (
        .clk(clk),
        .q1(q1), .q2(q2), .q3(q3), .q4(q4),
        .qb1(qb1), .qb2(qb2), .qb3(qb3), .qb4(qb4)
    );

    // Clock generator: toggles every 5ns -> 10ns clock period
    always #5 clk = ~clk;

    // Monitor outputs
    initial begin
        $display("Time | q4 q3 q2 q1");
        $monitor("%4t |  %b  %b  %b  %b", $time, q4, q3, q2, q1);
    end

    // Simulation time
    initial begin
        #100;  // Run simulation for 100ns
        $finish;
    end

endmodule
