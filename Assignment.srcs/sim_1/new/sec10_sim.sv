`timescale 1ns / 1ps


module sec10_sim();
    wire clk;
    wire clk_sec;
    wire [3:0] num;
    reg en;

    clock clock(clk);
    sec_divider sec_divider(clk, clk_sec);
    sec10 sec10(clk_sec, en, num);

    initial en = 0;

    always @(negedge num[0]) begin
        if (num == 0) en = 0;
    end

    always #200 en = 1;
endmodule
