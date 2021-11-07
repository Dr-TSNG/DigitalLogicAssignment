`timescale 1ns / 1ps


module entry(
    input clk,
    input [8:1] user_input,
    output [7:0] display_onoff,
    output [0:6] display0,
    output [0:6] display1
    );
    wire [0:6] display;
    wire [7:0] led_onoff;
    wire [3:0] led_values [0:7];

    wire input_en, input_mode, input_finish;
    wire [7:0] input_led_onoff;
    wire [3:0] input_led_values [0:7];
    wire [13:0] user_code;

    led_manager led_manager(clk, led_onoff, led_values, display_onoff, display);
    lock_input lock_input(clk, user_input, input_en, input_mode, input_finish, user_code, input_led_onoff, input_led_values);

    assign display0 = display;
    assign display1 = display;
    assign led_onoff = (input_en ? input_led_onoff : 0);
    assign led_values[0] = (input_en ? input_led_values[0] : 0);
    assign led_values[1] = (input_en ? input_led_values[1] : 0);
    assign led_values[2] = (input_en ? input_led_values[2] : 0);
    assign led_values[3] = (input_en ? input_led_values[3] : 0);
    assign led_values[4] = (input_en ? input_led_values[4] : 0);
    assign led_values[5] = (input_en ? input_led_values[5] : 0);
    assign led_values[6] = (input_en ? input_led_values[6] : 0);
    assign led_values[7] = (input_en ? input_led_values[7] : 0);

    // led_test led_test(clk, led_onoff, led_values);
    input_test input_test(clk, input_en, input_mode);
endmodule
