`timescale 1ns / 1ps


module clock(output reg clk);
    initial clk = 0;
    always #1 clk = ~clk;
endmodule
