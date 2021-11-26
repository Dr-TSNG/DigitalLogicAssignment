`timescale 1ns / 1ps

module TimeStopper(
    input en,
    input clk, //时钟信号，板上自带，自动产生
    output reg [4:0] count
    );

ClockDevider temp(clk,divclk); //分频，clk变成慢信号divclk
initial
begin
    count=5'd0;
end

always @(posedge divclk)
    begin
    if(!en)
        count=5'd0;
    if(en && count!=5'd16)
        begin
            count = count + 4'd1;
        end
    end
endmodule
