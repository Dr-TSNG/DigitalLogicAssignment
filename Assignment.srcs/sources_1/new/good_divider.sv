`timescale 1ns / 1ps


module good_divider(
    input clk_in,
    output reg clk_out
    );
    
    parameter DIV = 100;
    parameter T = DIV / 2 - 1;

    reg [30:0] cnt;

    initial begin
        cnt = 0;
        clk_out = 0;
    end

    always @(posedge clk_in) begin
        if (cnt == T) begin
            cnt <= 0;
            clk_out <= ~clk_out;
        end
        else cnt <= cnt + 1;
    end
endmodule
