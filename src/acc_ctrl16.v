module acc_ctrl16( // 16 cycle control with 3 clock cycle delay
    en, sel, clk, rst
    );
    output en, sel;
    input clk, rst;

    reg [3:0] c_state, n_state; // 4-bit state to hold 16 states
    reg [1:0] cycle_count; // 2-bit counter to count up to 3

    parameter s1 = 4'd0;
    parameter s2 = 4'd1;
    parameter s3 = 4'd2;
    parameter s4 = 4'd3;
    parameter s5 = 4'd4;
    parameter s6 = 4'd5;
    parameter s7 = 4'd6;
    parameter s8 = 4'd7;
    parameter s9 = 4'd8;
    parameter s10 = 4'd9;
    parameter s11 = 4'd10;
    parameter s12 = 4'd11;
    parameter s13 = 4'd12;
    parameter s14 = 4'd13;
    parameter s15 = 4'd14;
    parameter s16 = 4'd15;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            c_state <= s1;
            cycle_count <= 2'b00;
        end else if (cycle_count == 2'd2) begin
            c_state <= n_state;
            cycle_count <= 2'b00;
        end else begin
            cycle_count <= cycle_count + 1;
        end
    end

    always @(*) begin
        case (c_state)
            s1: n_state = s2;
            s2: n_state = s3;
            s3: n_state = s4;
            s4: n_state = s5;
            s5: n_state = s6;
            s6: n_state = s7;
            s7: n_state = s8;
            s8: n_state = s9;
            s9: n_state = s10;
            s10: n_state = s11;
            s11: n_state = s12;
            s12: n_state = s13;
            s13: n_state = s14;
            s14: n_state = s15;
            s15: n_state = s16;
            s16: n_state = s1;
            default: n_state = s1;
        endcase
    end

    assign sel = (c_state == s1) ? 1'b1 : 1'b0; // when sel high add the bias
    assign en = (c_state == s16) ? 1'b1 : 1'b0; // when en high finish the ACC

endmodule