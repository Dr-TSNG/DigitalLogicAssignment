`timescale 1ns / 1ps

module Light(
    input [2:0] en,
    input clk, //时钟信号，板上自带，自动产生
    output reg [7:0] ledtemp, //灯信号
    output reg [4:0] count
    );

ClockDevider temp(clk,divclk); //分频，clk变成慢信号divclk
initial
begin
    ledtemp=8'b0000_0001;
    count=5'd0;
end
//计数器运转函数
always @(posedge divclk)
    begin
    //led状态移位
    if(en==2'd0)
        begin
            ledtemp<=8'b0000_0001;
            count=5'd0;
        end
    if(en==2'd1 && count!=5'd16)
        begin
            count = count + 4'd1;
            if(ledtemp==8'b0000_0001)
                ledtemp<=8'b0000_0010;
            else if(ledtemp==8'b0000_0010)
                ledtemp<=8'b0000_0100;
            else if(ledtemp==8'b0000_0100)
                ledtemp<=8'b0000_1000;
            else if(ledtemp==8'b0000_1000)
                ledtemp<=8'b0001_0000;
            else if(ledtemp==8'b0001_0000)
                ledtemp<=8'b0010_0000;
            else if(ledtemp==8'b0010_0000)
                ledtemp<=8'b0100_0000;
            else if(ledtemp==8'b0100_0000)
                ledtemp<=8'b1000_0000;
            else if(ledtemp==8'b1000_0000)
                ledtemp<=8'b0000_0001;
         end
    if(en==2'd2 && count!=5'd16)
        begin
            count = count + 4'd1;
            ledtemp<=8'b1111_1111;
        end
    end
endmodule
