`timescale 1ns / 1ps

module TimeStopper(
    input en,
    input clk, //ʱ���źţ������Դ����Զ�����
    output reg [4:0] count
    );

ClockDevider temp(clk,divclk); //��Ƶ��clk������ź�divclk
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
