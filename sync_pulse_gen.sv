module sync_pulse_gen
    (
    input clk,
    output HSync,
    output VSync,
    output reg [$clog2(TOTAL_ROWS)-1:0] row,
    output reg [$clog2(TOTAL_COLS)-1:0] col
    );

    parameter TOTAL_ROWS = 525, ACTIVE_ROWS = 480, V_FRONT_PORCH = 10, V_BACK_PORCH = 33;
    parameter TOTAL_COLS = 800, ACTIVE_COLS = 640, H_FRONT_PORCH = 16, H_BACK_PORCH = 48;

    always @(posedge clk) begin
        if (col < TOTAL_COLS-1)
            col <= col + 1;
        else begin
            col <= 0;
            if (row < TOTAL_ROWS-1)
                row <= row + 1;
            else
                row <= 0;
        end
    end

    assign HSync = col < ACTIVE_COLS + H_FRONT_PORCH || col >= TOTAL_COLS - H_BACK_PORCH;
    assign VSync = row < ACTIVE_ROWS + V_FRONT_PORCH || row >= TOTAL_ROWS - V_BACK_PORCH;

endmodule
