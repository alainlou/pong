module num_to_svnseg(
    input [3:0] in,
    output [6:0] out);

    reg [6:0] hex_encoding = 0;

    always @(*) begin
        case (in)
            4'h0: hex_encoding <= 7'h7E;
            4'h1: hex_encoding <= 7'h30;
            4'h2: hex_encoding <= 7'h6D;
            4'h3: hex_encoding <= 7'h79;
            4'h4: hex_encoding <= 7'h33;
            4'h5: hex_encoding <= 7'h5B;
            4'h6: hex_encoding <= 7'h5F;
            4'h7: hex_encoding <= 7'h70;
            4'h8: hex_encoding <= 7'h7F;
            4'h9: hex_encoding <= 7'h7B;
            4'hA: hex_encoding <= 7'h77;
            4'hB: hex_encoding <= 7'h1F;
            4'hC: hex_encoding <= 7'h4E;
            4'hD: hex_encoding <= 7'h3D;
            4'hE: hex_encoding <= 7'h4F;
            4'hF: hex_encoding <= 7'h47;
        endcase
    end

    assign out = ~hex_encoding;

endmodule
