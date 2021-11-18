`timescale 1ns / 1ps


module led_sim();
    wire clk;
    wire clk_sec;
    reg [8:1] user_input;
    wire [7:0] display_onoff;
    wire [0:6] display0;
    wire [0:6] display1;
    reg mode1;
    wire input_finish;

    clock clock(clk);
    //sec_divider sec_divider(clk, clk_sec);
    entry entry(clk, user_input, display_onoff, display0, display1, mode1,input_finish);

    initial begin
        mode1=0;
        user_input = 0;
        #5;
        mode1=1;
    end

    always @(posedge clk) begin
        if (user_input == 0) user_input = 8'b00000001;
        user_input <<= 1;
    end
endmodule
