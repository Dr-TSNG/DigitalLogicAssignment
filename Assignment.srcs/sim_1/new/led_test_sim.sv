`timescale 1ns / 1ps


module led_test_sim();
    wire clk;
    wire led_onoff [0:7];
    wire [3:0] led_values [0:7];

    clock clock(clk);
    led_test led_test(clk, led_onoff, led_values);
endmodule
