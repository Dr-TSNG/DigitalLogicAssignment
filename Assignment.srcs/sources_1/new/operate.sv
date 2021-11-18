`timescale 1ns / 1ps

module operate(
        input clk,
        input mode1,
        output reg input_en,
        output reg input_mode,
        input input_finish,
        input [13:0] user_code
    );
reg pre_input_mode;
initial begin
    pre_input_mode=0;
end
always @(posedge clk)
    begin
        if(mode1 && pre_input_mode != 1)
            begin
                pre_input_mode=1;
                input_mode=0;
                input_en=1;
            end
        else if(input_finish && pre_input_mode == 1)
            begin
                input_en=0;
                pre_input_mode=0;
            end
    end
endmodule
