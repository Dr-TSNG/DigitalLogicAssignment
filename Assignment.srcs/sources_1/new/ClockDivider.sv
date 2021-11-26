`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/30 00:03:52
// Design Name: 
// Module Name: ClockDevider
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ClockDevider(
input clk1,
output reg clk2
    );
reg [28:0] count= 1'b0; //������
always @(posedge clk1) //��������Ч
    begin
        if(count==9999_9999)
            count <= 1'b0; //����
        else
            count <= count + 1'b1; //��������һ
        if(count <= 4999_9999)
            clk2=1'b1;
        else
            clk2=1'b0;  //�ߵ͵�ƽ�任
     end  
endmodule
