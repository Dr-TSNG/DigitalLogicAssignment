`timescale 1ns / 1ps


module sec10(
    input clk_sec,
    input en,
    output reg [3:0] num
    );
    reg init;

    always @(posedge clk_sec) begin
        if (!en) init = 1;
        if (init) begin
            num = 4'd9;
            init = 0;
        end
        else if (num != 4'd0) num = num - 1;
    end
endmodule
