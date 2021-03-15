module ball
(
    input clk,
    input [$clog2(ACTIVE_ROWS)-1:0] row,
    input [$clog2(ACTIVE_COLS)-1:0] col,
    output ball_present
);

    parameter CLKS_PER_MOVE = 250_000;
    parameter ACTIVE_ROWS = 480, ACTIVE_COLS = 640;
    parameter SIDE_LEN = 16;

    enum {UP_RIGHT, DOWN_RIGHT, DOWN_LEFT, UP_LEFT} dir;

    reg [$clog2(CLKS_PER_MOVE)-1:0] counter = 0;
    reg [$clog2(ACTIVE_COLS)-1:0] x_pos = ACTIVE_COLS/2 - SIDE_LEN/2;
    reg [$clog2(ACTIVE_ROWS)-1:0] y_pos = ACTIVE_ROWS/2 - SIDE_LEN/2;

    always @(posedge clk) begin
        if (counter == CLKS_PER_MOVE) begin
            counter = 0;

            // update direction if necessary
            if (y_pos == 0)
                dir = dir == UP_RIGHT ? DOWN_RIGHT : DOWN_LEFT;
            else if (y_pos == ACTIVE_ROWS-SIDE_LEN/2)
                dir = dir == DOWN_RIGHT ? UP_RIGHT : UP_LEFT;
            if (x_pos == 0)
                dir = dir == UP_LEFT ? UP_RIGHT : DOWN_RIGHT;
            else if (x_pos == ACTIVE_COLS-SIDE_LEN/2)
                dir = dir == UP_RIGHT ? UP_LEFT : DOWN_LEFT;

            // update position
            x_pos = (dir == UP_RIGHT || dir == DOWN_RIGHT) ? x_pos + 1 : x_pos - 1;
            y_pos = (dir == UP_LEFT || dir == UP_RIGHT) ? y_pos - 1: y_pos + 1;
        end else
            counter = counter + 1;
    end

    assign ball_present = row >= y_pos && row < y_pos+SIDE_LEN && col >= x_pos && col < x_pos+SIDE_LEN;

endmodule

