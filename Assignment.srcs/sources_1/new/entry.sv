`timescale 1ns / 1ps


module entry(
    input clk,
    input [8:1] user_input,
    output [7:0] display_onoff,
    output [0:6] display0,
    output [0:6] display1,
    input mode1,
    input mode2,
    output reg[7:0] ledtemp
    );
    
    wire [0:6] display;
    wire status,input_finish;
    
    wire [7:0] led_onoff,led_onoff1,led_onoff2;
    wire [3:0] led_values [0:7];
    wire [3:0] led_values1 [0:7];
    wire [3:0] led_values2 [0:7];

    wire input_mode, input_en;
    wire [13:0] user_code;

    led_manager led_manager(clk, led_onoff, led_values, display_onoff, display);
    lock_input lock_input(clk, user_input,input_en, input_mode, input_finish, user_code, led_onoff1, led_values1);
    operate operate(clk,mode1,mode2,input_en,input_mode,input_finish,user_code,led_onoff2,led_values2,ledtemp,status);

    assign display0 = display;
    assign display1 = display;
    assign led_onoff = status ? led_onoff2 : led_onoff1;
    assign led_values = status ? led_values2 : led_values1;

    // led_test led_test(clk, led_onoff, led_values);
    //input_test input_test(clk, input_en, input_mode);
endmodule
