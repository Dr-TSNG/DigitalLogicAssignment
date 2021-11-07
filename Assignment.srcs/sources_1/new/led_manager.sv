`timescale 1ns / 1ps

module led_manager(
    input clk,
    input [7:0] onoff,              /* Driver */
    input [3:0] values [0:7],       /* Driver */
    output reg [7:0] display_onoff, /* Hardware */
    output reg [0:6] display        /* Hardware */
    );
    parameter N = 19;
    reg [N-1:0] regN;

    initial regN = 0;

    always @(posedge clk) begin
        case (values[regN[N-1: N-3]])
            4'd00:display = 7'b1111110;
            4'd01:display = 7'b0110000;
            4'd02:display = 7'b1101101;
            4'd03:display = 7'b1111001;
            4'd04:display = 7'b0110011;
            4'd05:display = 7'b1011011;
            4'd06:display = 7'b1011111;
            4'd07:display = 7'b1110000;
            4'd08:display = 7'b1111111;
            4'd09:display = 7'b1111011;
            4'd10:display = 7'b1100111; // P
            4'd11:display = 7'b1001110; // C
            4'd12:display = 7'b0001110; // L
            4'd13:display = 7'b0001000; // _
            default: display = 0;
        endcase

        display_onoff = 0;
        display_onoff[regN[N-1:N-3]] = onoff[regN[N-1:N-3]];
        regN = regN + 1;
    end
endmodule
