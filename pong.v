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
    wire w_hsync;
    wire w_vsync;

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

    assign VGA_HSYNC = w_hsync;
    assign VGA_VSYNC = w_vsync;

    assign VGA_R = row_counter < 480 && col_counter < 640;
    assign VGA_G = row_counter < 480 && col_counter < 640;
    assign VGA_B = row_counter < 480 && col_counter < 640;

endmodule
