`timescale 1ns / 1ps


module input_test(
    input clk,
    output reg input_en,
    output reg input_mode
    );
    wire clk_sec;
    reg [4:0] weit;
    sec_divider sec_divider(clk, clk_sec);

    initial begin
        input_en = 0;
        input_mode = 0;
        weit = 0;
    end

    always @(posedge clk_sec) begin
        if (weit == 0) begin
            input_en = ~input_en;
            weit = 20;
        end
        weit = weit - 1;
    end
endmodule
