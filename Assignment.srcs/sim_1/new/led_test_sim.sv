`timescale 1ns / 1ps


module led_test_sim();
    reg en;
    wire clk;
    reg [7:0] ledtemp;
    reg [3:0] count;
    
    initial
    begin
        en=1;
    end
    
    clock clock(clk);
    Light light(en,clk,ledtemp,count);
endmodule
