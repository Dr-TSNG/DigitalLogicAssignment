`timescale 1ns / 1ps


module lock_input(
    input clk,
    input [8:1] user_input,
    input en,
    input mode, // 0 is set, 1 is check
    output reg finish,
    output reg [13:0] user_code,
    output [7:0] led_onoff,
    output [3:0] led_values [0:7]
    );
    reg sec10_en;
    wire clk_sec;
    wire [3:0] sec10_rest;
    reg [2:0] stage;
    reg [8:1] input_trigger;
    reg [7:0] led_onoff_inner;
    reg [3:0] led_values_inner [0:3];
    
    generate
        for (genvar i = 0; i < 4; i++) begin
            assign led_onoff[i] = en ? led_onoff_inner[i] : 1'bz;
            assign led_values[i] = en ? led_values_inner[i] : 4'bzzzz;
        end
        assign led_onoff[7] = en ? led_onoff_inner[7] : 1'bz;
        assign led_values[7] = en ? sec10_rest : 4'bzzzz;
    endgenerate
    
    sec_divider sec_divider(clk, clk_sec);
    sec10 sec10(clk_sec, sec10_en, sec10_rest);

    always @(posedge clk) begin
        if (!en) begin
            sec10_en = 0;
            finish = 0;
            stage = 0;
            led_onoff_inner = 0;
            for (int i = 0; i < 8; i++)
                input_trigger[i] = 1;
        end else begin
            sec10_en = mode;
            led_onoff_inner[7] = mode;
            led_values_inner[7] = sec10_rest;
            if (sec10_rest == 0 || stage == 4) finish = 1;
            if (finish) begin
                if (stage != 4) user_code = 0000;
                led_onoff_inner[stage] = 0;
            end else begin
                led_onoff_inner[stage] = 1;
                led_values_inner[stage] = 4'd13;
                for (int i = 1; i <= 8; i++) begin
                    if (~user_input[i]) begin
                        input_trigger[i] = 0;
                    end else if (~input_trigger[i]) begin
                        input_trigger[i] = 1;
                        led_values_inner[stage] = i;
                        user_code = user_code * 10 + i;
                        stage = stage + 1;
                    end
                end
            end
        end
    end
endmodule
