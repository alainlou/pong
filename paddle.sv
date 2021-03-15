module paddle
(
    input clk,
    input [$clog2(ACTIVE_ROWS)-1:0] row,
    input [$clog2(ACTIVE_COLS)-1:0] col,
    output paddle_present
);

    parameter CLKS_PER_MOVE = 250_000;
    parameter ACTIVE_ROWS = 480, ACTIVE_COLS = 640;
    parameter WIDTH = 16, HEIGHT = 64;

    reg [$clog2(CLKS_PER_MOVE)-1:0] counter = 0;
    reg [$clog2(ACTIVE_COLS)-1:0] x_pos = WIDTH * 3/2;
    reg [$clog2(ACTIVE_ROWS)-1:0] y_pos = ACTIVE_ROWS/2 - HEIGHT/2;

    assign paddle_present = row >= y_pos && row < y_pos+HEIGHT && col >= x_pos && col < x_pos+WIDTH;

endmodule
