module ball
    (
    input clk,
    input [9:0] row,
    input [9:0] col,
    output ball_present
    );

    parameter CLKS_PER_MOVE=250_000;

    enum {UP_RIGHT, DOWN_RIGHT, DOWN_LEFT, UP_LEFT} dir;

    reg [$clog2(CLKS_PER_MOVE)-1:0] counter;
    reg [9:0] x_pos=312, y_pos=232;

    always @(posedge clk) begin
        if (counter == CLKS_PER_MOVE) begin
            counter = 0;

            // update direction if necessary
            if (y_pos == 0)
                dir = dir == UP_RIGHT ? DOWN_RIGHT : DOWN_LEFT;
            else if (y_pos == 472)
                dir = dir == DOWN_RIGHT ? UP_RIGHT : UP_LEFT;
            if (x_pos == 0)
                dir = dir == UP_LEFT ? UP_RIGHT : DOWN_RIGHT;
            else if (x_pos == 632)
                dir = dir == UP_RIGHT ? UP_LEFT : DOWN_LEFT;

            // update position
            x_pos = (dir == UP_RIGHT || dir == DOWN_RIGHT) ? x_pos + 1 : x_pos - 1;
            y_pos = (dir == UP_LEFT || dir == UP_RIGHT) ? y_pos - 1: y_pos + 1;
        end else
            counter = counter + 1;
    end

    assign ball_present = row >= y_pos && row < y_pos+16 && col >= x_pos && col < x_pos+16;

endmodule

