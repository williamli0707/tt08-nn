module relu #(
    parameter IN_WIDTH = 1
) (
    output reg signed [7:0] out,
    input signed [IN_WIDTH-1:0] in
);

always @(*) begin
    if (in >= 128) begin
        out = 8'd127;  // Output clamped to 127, as 128 is out of 8-bit signed range
    end else if (in <= -128) begin
        out = -8'd128;  // Output clamped to -128, which is the minimum for 8-bit signed
    end else begin
        out = in[7:0];  // Truncate input to 8-bit output
    end
end

endmodule