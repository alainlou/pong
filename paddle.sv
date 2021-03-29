module paddle
(
    input clk,
    input up,
    input down,
    input [$clog2(ACTIVE_ROWS)-1:0] row,
    input [$clog2(ACTIVE_COLS)-1:0] col,
    output [$clog2(ACTIVE_COLS)-1:0] pos,
    output paddle_present
);

    parameter CLKS_PER_MOVE = 250_000;
    parameter ACTIVE_ROWS = 480, ACTIVE_COLS = 640;
    parameter WIDTH = 16, HEIGHT = 64;
    parameter IS_LEFT_PADDLE = 1'b1;

    reg [$clog2(CLKS_PER_MOVE)-1:0] counter = 0;
    reg [$clog2(ACTIVE_COLS)-1:0] x_pos = IS_LEFT_PADDLE ? WIDTH * 1/2 : ACTIVE_COLS - 1 - (WIDTH * 3/2);
    reg [$clog2(ACTIVE_ROWS)-1:0] y_pos = ACTIVE_ROWS/2 - HEIGHT/2;

    always @(posedge clk) begin
        if (counter == CLKS_PER_MOVE) begin
            counter <= 0;

            // update position if necessary
            if (up && !down && y_pos > 3)
                y_pos <= y_pos - 1;
            else if (down && !up && y_pos < ACTIVE_ROWS-HEIGHT-3)
                y_pos <= y_pos + 1;
        end
        else
            counter <= counter + 1;
    end

    assign paddle_present = row >= y_pos && row < y_pos+HEIGHT && col >= x_pos && col < x_pos+WIDTH;
    assign pos = y_pos;

endmodule
