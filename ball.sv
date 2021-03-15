module ball
    (
    input clk,
    input [9:0] row,
    input [9:0] col,
    output ball_present
    );

    parameter CLKS_PER_MOVE=2_500_000;

    enum {UP_RIGHT, DOWN_RIGHT, DOWN_LEFT, UP_LEFT} dir;

    reg [$clog2(CLKS_PER_MOVE)-1:0] counter;
    reg [9:0] x_pos=312, y_pos=232;

    always @(posedge clk) begin
        if (counter == 2_500_000)
            counter <= 0;
        else
            counter <= counter + 1;
    end

    assign ball_present = row >= y_pos && row < y_pos+16 && col >= x_pos && col < x_pos+16;

endmodule

