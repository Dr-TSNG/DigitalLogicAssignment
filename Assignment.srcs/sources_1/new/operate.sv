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
        output reg [7:0] ledtemp
    );
reg [2:0] pre_input_mode;
reg [13:0] user_password;
reg [13:0] user_input;
reg light_en;
reg count;

integer i;

Light light(light_en,clk,ledtemp,count);

initial begin
    light_en=0;
    input_en=0;
    input_mode=0;
    pre_input_mode=2'd0;
    /*led_onoff[i] = 8'bzzzzzzzz;
    for(i=0;i<8;i++)
        begin
            led_values[i] = 4'bzzzz;
        end*/
end

always @(posedge clk)
    begin
        if(mode1 && pre_input_mode != 2'd1)
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
            end
        /*else if(mode2 && pre_input_mode != 2'd2)
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
                led_onoff = 8'bzzzzzz11;
                if(user_input==user_password)
                    begin
                        led_values[6] = 4'd00;
                        led_values[7] = 4'd10;
                        light_en=1;
                    end
                else 
                    begin
                        led_values[6] = 4'd11;
                        led_values[7] = 4'd12;
                        #2;
                        led_onoff = 8'b11111111;
                        for(i=0;i<8;i++)
                            led_values[i]=4'd08;
                        #3;
                        led_onoff[i] = 8'bzzzzzzzz;
                        for(i=0;i<8;i++)
                            begin
                                led_values[i] = 4'bzzzz;
                            end
                    end
            end
        else if(count==14)
            begin
                light_en=0;
            end*/
    end
endmodule
