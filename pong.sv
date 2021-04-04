module pong
(
    input FPGA_CLK,
    input RESET,
    input KEY1,
    input KEY2,
    input KEY3,
    input KEY4,
    output VGA_HSYNC,
    output VGA_VSYNC,
    output VGA_R,
    output VGA_G,
    output VGA_B,
    output SVNSEG_DIG1,
    output SVNSEG_DIG2,
    output SVNSEG_DIG3,
    output SVNSEG_DIG4,
    output SVNSEG_SEG0,
    output SVNSEG_SEG1,
    output SVNSEG_SEG2,
    output SVNSEG_SEG3,
    output SVNSEG_SEG4,
    output SVNSEG_SEG5,
    output SVNSEG_SEG6,
    output SVNSEG_SEG7
);

    parameter TOTAL_ROWS = 525, ACTIVE_ROWS = 480;
    parameter TOTAL_COLS = 800, ACTIVE_COLS = 640;

    reg [$clog2(TOTAL_ROWS):0] row_counter;
    reg [$clog2(TOTAL_COLS):0] col_counter;

    pll pll_inst
    (
        .inclk0(FPGA_CLK),
        .c0(vga_clk)
    );

    sync_pulse_gen pulse_gen_inst
    (
        .clk(vga_clk),
        .HSync(w_hsync),
        .VSync(w_vsync),
        .row(row_counter),
        .col(col_counter)
    );

    reg [3:0] score1, score2;
    wire reset = !RESET;
    wire [$clog2(ACTIVE_COLS)-1:0] pos1;
    wire [$clog2(ACTIVE_COLS)-1:0] pos2;
    ball ball_inst
    (
        .clk(FPGA_CLK),
        .start(reset),
        .row(row_counter),
        .col(col_counter),
        .pos1(pos1),
        .pos2(pos2),
        .ball_present(show_ball),
        .score1(score1),
        .score2(score2)
    );

    wire p1_up = !KEY1;
    wire p1_down = !KEY2;
    paddle paddle1_inst
    (
        .clk(FPGA_CLK),
        .up(p1_up),
        .down(p1_down),
        .row(row_counter),
        .col(col_counter),
        .paddle_present(show_paddle1),
        .pos(pos1)
    );
    defparam paddle1_inst.IS_LEFT_PADDLE = 1'b1;

    wire p2_up = !KEY3;
    wire p2_down = !KEY4;
    paddle paddle2_inst
    (
        .clk(FPGA_CLK),
        .up(p2_up),
        .down(p2_down),
        .row(row_counter),
        .col(col_counter),
        .paddle_present(show_paddle2),
        .pos(pos2)
    );
    defparam paddle2_inst.IS_LEFT_PADDLE = 1'b0;

    assign border = row_counter < 3 || row_counter >= ACTIVE_ROWS-3;
    assign VGA_HSYNC = w_hsync;
    assign VGA_VSYNC = w_vsync;
    assign {VGA_R, VGA_G, VGA_B} =
        {3
            {(show_ball || show_paddle1 || show_paddle2 || border)
             && row_counter < ACTIVE_ROWS && col_counter < ACTIVE_COLS}
        };

    svnseg_controller controller_inst
    (
        .clk(FPGA_CLK),
        .num3(4'h0),
        .num2(score1),
        .num1(4'h0),
        .num0(score2),
        .dig1(SVNSEG_DIG1),
        .dig2(SVNSEG_DIG2),
        .dig3(SVNSEG_DIG3),
        .dig4(SVNSEG_DIG4),
        .seg0(SVNSEG_SEG0),
        .seg1(SVNSEG_SEG1),
        .seg2(SVNSEG_SEG2),
        .seg3(SVNSEG_SEG3),
        .seg4(SVNSEG_SEG4),
        .seg5(SVNSEG_SEG5),
        .seg6(SVNSEG_SEG6),
        .seg7(SVNSEG_SEG7)
    );

endmodule
