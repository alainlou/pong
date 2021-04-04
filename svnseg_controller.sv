module svnseg_controller(
    input clk,
    input [3:0] num3,
    input [3:0] num2,
    input [3:0] num1,
    input [3:0] num0,
    output dig1,
    output dig2,
    output dig3,
    output dig4,
    output seg0,
    output seg1,
    output seg2,
    output seg3,
    output seg4,
    output seg5,
    output seg6,
    output seg7);

    reg [11:0] counter;
    reg edited_clk;

    always @(posedge clk) begin
        if (counter == 0)
            edited_clk <= !edited_clk;

        counter <= counter + 1;
    end

    reg [1:0] state;
    reg [3:0] digit_select;
    reg [6:0] curr_output;

    wire [6:0] svn3, svn2, svn1, svn0;

    num_to_svnseg decode3(
        .in(num3),
        .out(svn3));

    num_to_svnseg decode2(
        .in(num2),
        .out(svn2));

    num_to_svnseg decode1(
        .in(num1),
        .out(svn1));

    num_to_svnseg decode0(
        .in(num0),
        .out(svn0));

    always @(posedge edited_clk) begin
        case (state)
            2'b00: begin
                digit_select <= 4'b1110;
                curr_output <= svn0;
                state <= 2'b01;
            end
            2'b01: begin
                digit_select <= 4'b1101;
                curr_output <= svn1;
                state <= 2'b10;
            end
            2'b10: begin
                digit_select <= 4'b1011;
                curr_output <= svn2;
                state <= 2'b11;
            end
            2'b11: begin
                digit_select <= 4'b0111;
                curr_output <= svn3;
                state <= 2'b00;
            end
        endcase
    end

    assign {dig4, dig3, dig2, dig1} = digit_select;
    assign {seg0, seg1, seg2, seg3, seg4, seg5, seg6, seg7} = {curr_output, digit_select != 4'b1101};

endmodule
