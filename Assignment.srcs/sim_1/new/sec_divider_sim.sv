`timescale 1ns / 1ps


module sec_divider_sim();
    wire clk;
    wire clk_sec;

    clock clock(clk);
    sec_divider sec_divider(clk, clk_sec);
endmodule
