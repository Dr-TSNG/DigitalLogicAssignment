`timescale 1ns / 1ps


module lock_input(
    input clk,
    input [8:1] user_input,
    input en,
    input mode, // 0 is set, 1 is check
    output reg finish,
    output reg [13:0] user_code,
    output reg [7:0] led_onoff,
    output reg [3:0] led_values [0:7]
    );
    reg clk_sec;
    reg sec10_en;
    reg [3:0] sec10_rest;
    reg [2:0] stage;
    reg [8:1] pre_input;
    
    sec_divider sec_divider(clk, clk_sec);
    sec10 sec10(clk_sec, sec10_en, sec10_rest);

    always @(posedge clk) begin
        if (!en) begin
            sec10_en = 0;
            finish = 0;
            stage = 0;
            led_onoff = 1;
        end else begin
            sec10_en = mode;
            if (sec10_rest == 0 || stage == 4) finish = 1;
            if (finish) begin
                if (stage != 4) user_code = 0000;
                led_onoff = 0;
            end else begin
                for (int i = 1; i <= 8; i++) begin
                    if (user_input[i] && !pre_input[i]) begin
                        led_values[stage] = i;
                        user_code = user_code * 10 + i;
                        stage = stage + 1;
                    end
                end
                led_onoff[stage] = 1;
                led_values[stage] = 4'd13;
            end
        end
        for (int i = 1; i <= 8; i++)
            pre_input[i] = user_input[i];
    end
endmodule
