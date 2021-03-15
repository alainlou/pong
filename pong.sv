module pong
(
    input FPGA_CLK,
    output VGA_HSYNC,
    output VGA_VSYNC,
    output VGA_R,
    output VGA_G,
    output VGA_B
);

    wire vga_clk;
    wire w_hsync, w_vsync;
    wire show_ball, show_paddle1;

    reg [9:0] row_counter;
    reg [9:0] col_counter;

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

    ball ball_inst
    (
        .clk(FPGA_CLK),
        .row(row_counter),
        .col(col_counter),
        .ball_present(show_ball)
    );

    paddle paddle1_inst
    (
        .clk(FPGA_CLK),
        .row(row_counter),
        .col(col_counter),
        .paddle_present(show_paddle1)
    );

    assign VGA_HSYNC = w_hsync;
    assign VGA_VSYNC = w_vsync;

    assign {VGA_R, VGA_G, VGA_B} = {3{show_ball || show_paddle1}};

endmodule
