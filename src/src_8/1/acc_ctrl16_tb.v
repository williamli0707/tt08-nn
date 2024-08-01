module acc_ctrl16_tb;

    // Inputs
    reg clk;
    reg rst;
    wire [3:0] state;

    // Instantiate the Unit Under Test (UUT)
    acc_ctrl16 uut (
        .state(state),
        .clk(clk),
        .rst(rst)
    );

    // Clock generation
    always #5 clk = ~clk; // 10 ns period

    initial begin
        $dumpfile("acc_ctrl16_tb.vcd");
        $dumpvars(0, acc_ctrl16_tb);
        // Initialize Inputs
        clk = 0;
        rst = 1;

        // Wait 20 ns for global reset to finish
        #20;
        rst = 0;

        #102;
        rst = 1;

        #102;
        rst = 0;

        // Wait enough cycles to observe the behavior
        #2000;

        // Add any additional tests here if necessary

        // Finish simulation
        $finish;
    end

    // Monitor the signals
    initial begin
        $monitor("At time %t, clk = %b, rst = %b, state = %d", $time, clk, rst, state);
    end

endmodule
