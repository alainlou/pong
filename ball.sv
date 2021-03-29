module ball
(
    input clk,
    input [$clog2(ACTIVE_ROWS)-1:0] row,
    input [$clog2(ACTIVE_COLS)-1:0] col,
    input [$clog2(ACTIVE_ROWS)-1:0] pos1,
    input [$clog2(ACTIVE_ROWS)-1:0] pos2,
    output ball_present
);

    parameter CLKS_PER_MOVE = 5000_000;
    parameter ACTIVE_ROWS = 480, ACTIVE_COLS = 640;
    parameter SIDE_LEN = 16;
    parameter PADDLE_WIDTH = 16, PADDLE_HEIGHT=64;
    parameter PADDLE_OFFSET = PADDLE_WIDTH/2;

    enum {UP_RIGHT, DOWN_RIGHT, DOWN_LEFT, UP_LEFT} dir;

    reg [$clog2(CLKS_PER_MOVE)-1:0] counter = 0;
    reg [$clog2(ACTIVE_COLS)-1:0] x_pos = ACTIVE_COLS/2 - SIDE_LEN/2;
    reg [$clog2(ACTIVE_ROWS)-1:0] y_pos = ACTIVE_ROWS/2 - SIDE_LEN/2;

    always @(posedge clk) begin
        if (counter == CLKS_PER_MOVE) begin
            counter = 0;

            // update direction if necessary
            if (y_pos == 5)
                dir = dir == UP_RIGHT ? DOWN_RIGHT : DOWN_LEFT;
            else if (y_pos >= ACTIVE_ROWS-SIDE_LEN-3)
                dir = dir == DOWN_RIGHT ? UP_RIGHT : UP_LEFT;
            if (x_pos == PADDLE_WIDTH + PADDLE_OFFSET && y_pos >= pos1 && y_pos < pos1 + PADDLE_HEIGHT)
                dir = dir == UP_LEFT ? UP_RIGHT : DOWN_RIGHT;
            else if (x_pos == ACTIVE_COLS - 1 - SIDE_LEN - PADDLE_WIDTH - PADDLE_OFFSET
                     && y_pos >= pos2 && y_pos < pos2 + PADDLE_HEIGHT)
                dir = dir == UP_RIGHT ? UP_LEFT : DOWN_LEFT;

            // update position
            x_pos = (dir == UP_RIGHT || dir == DOWN_RIGHT) ? x_pos + 1 : x_pos - 1;
            y_pos = (dir == UP_LEFT || dir == UP_RIGHT) ? y_pos - 1: y_pos + 1;
        end else
            counter = counter + 1;
    end

    assign ball_present = row >= y_pos && row < y_pos+SIDE_LEN && col >= x_pos && col < x_pos+SIDE_LEN;

endmodule

