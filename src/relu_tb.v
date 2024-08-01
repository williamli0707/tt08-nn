module tb_relu;

    // Parameters
    localparam IN_WIDTH = 16;  // Example input width

    // Inputs
    reg signed [IN_WIDTH-1:0] in;

    // Outputs
    wire signed [7:0] out;

    // Instantiate the Unit Under Test (UUT)
    relu #(
        .IN_WIDTH(IN_WIDTH)
    ) uut (
        .in(in),
        .out(out)
    );

    // Test procedure
    initial begin
        // Initialize inputs
        in = 0;

        // Wait for global reset
        #10;

        // Apply test cases
        // Test case 1: Input within the valid range
        in = 16'd8;  // Expected output: 8
        #10;
        $display("Input: %d, Expected Output: %d, Actual Output: %d", in, 8, out);

        // Test case 2: Input equal to the maximum positive value for 8-bit signed
        in = 16'd130;  // Expected output: 127
        #10;
        $display("Input: %d, Expected Output: %d, Actual Output: %d", in, 127, out);

        // Test case 3: Input equal to the minimum negative value for 8-bit signed
        in = -16'd130;  // Expected output: -128
        #10;
        $display("Input: %d, Expected Output: %d, Actual Output: %d", in, -128, out);

        // Test case 4: Input at zero
        in = 16'd0;  // Expected output: 0
        #10;
        $display("Input: %d, Expected Output: %d, Actual Output: %d", in, 0, out);

        // Test case 5: Input within the negative range
        in = -16'd8;  // Expected output: -8
        #10;
        $display("Input: %d, Expected Output: %d, Actual Output: %d", in, -8, out);

        // Finish simulation
        $finish;
    end

endmodule
