`timescale 1ns / 1ps


module led_test(
    input clk,
    output reg [7:0] onoff,
    output reg [3:0] values [0:7]
    );
    reg loop;
    reg [3:0] num;
    wire clk_sec;
    sec_divider sec_divider(clk, clk_sec);
    sec10 sec10(clk_sec, loop, num);

    initial begin
        loop = 0;
        onoff = 0;
        for (int i = 0; i < 8; i++)
            values[i] = 0;
    end

    always @(posedge clk_sec) begin
        if (loop == 0) loop = 1;
        else if (num == 0) loop = 0;
        onoff <<= 1;
        if (onoff == 0) onoff = 1;
        for (int i = 0; i < 8; i++)
            values[i] = num;
    end
endmodule
