`timescale 1ns / 1ps


module led_sim();
    wire clk;
    wire clk_sec;
    reg [8:1] user_input;
    wire [7:0] display_onoff;
    wire [0:6] display0;
    wire [0:6] display1;
    reg mode1;
    reg mode2;
    wire input_finish;
    wire [13:0] user_code;
    reg [2:0] pre_input_mode;
    reg [7:0] ledtemp;
    reg status;

    clock clock(clk);
    sec_divider sec_divider(clk, clk_sec);
    entry entry(clk, user_input, display_onoff, display0, display1, mode1, mode2, ledtemp);

    initial begin
        mode1=0;
        mode2=0;
        user_input = 0;
        #105;
        mode1=1;
        #1000000;
        mode1=0;
        #1000000;
        mode2=1;
        #1000000;
    end
    
    always @(posedge clk_sec) begin
        if(user_input==0) user_input=8'b0000_0001;
        user_input<<=1;
    end
endmodule
