`timescale 1ns / 1ps

module operate(
        input clk,
        input mode1,
        input mode2,
        output reg input_en,
        output reg input_mode,
        input input_finish,
        input [13:0] user_code,
        output reg [7:0] led_onoff,
        output reg [3:0] led_values [0:7],
        output reg [7:0] ledtemp,
        output reg status
    );
reg mode1_en;
reg mode2_en;
reg [2:0] pre_input_mode;
reg [13:0] user_password;
reg [13:0] user_input;
reg [2:0] light_en;
wire [4:0] count;
wire [4:0] stopnum;

integer i;

Light light(light_en,clk,ledtemp,count);
good2_divider good2_divider(clk, clk_good2);

initial begin
    light_en=2'd0;
    input_en=0;
    input_mode=0;
    mode1_en=0;
    mode2_en=0;
    pre_input_mode=2'd0;
    led_onoff = 8'bzzzzzzzz;
    for(i=0;i<8;i++)
        begin
            led_values[i] = 4'bzzzz;
        end
    status=0;
end

always @(posedge clk_good2)
    begin
        mode1_en=mode1;
        mode2_en=mode2;
        if(mode1_en && pre_input_mode != 2'd1)
            begin
                pre_input_mode=2'd1;
                input_mode=0;
                input_en=1;
            end
        else if(input_finish && pre_input_mode == 2'd1)
            begin
                user_password=user_code;
                input_en=0;
                pre_input_mode=2'd0;
                mode1_en=0;
            end
        if(mode2_en && pre_input_mode != 2'd2)
            begin
                pre_input_mode=2'd2;
                input_mode=1;
                input_en=1;
            end
        else if(input_finish && pre_input_mode == 2'd2)
            begin
                user_input=user_code;
                input_en=0;
                pre_input_mode=2'd0;
                status=1;
                led_onoff[6] = 1;
                led_onoff[7] = 1;
                if(user_input==user_password)
                    begin
                        led_values[6] = 4'd00;
                        led_values[7] = 4'd10;
                        light_en=2'd1;
                    end
                else 
                    begin
                        led_values[6] = 4'd11;
                        led_values[7] = 4'd12;
                        light_en=2'd2;
                    end
            end
        else if(count==5'd16)
            begin
                light_en=0;
                status=0;
            end
    end
    
endmodule
