module acc_ctrl16_tb;

    // Inputs
    reg clk;
    reg rst;

    // Outputs
    wire en;
    wire sel;

    // Instantiate the Unit Under Test (UUT)
    acc_ctrl16 uut (
        .en(en),
        .sel(sel),
        .clk(clk),
        .rst(rst)
    );

    // Clock generation
    always #5 clk = ~clk; // 10 ns period

    initial begin
        $dumpfile("acc_ctrl16_tb.vcd");
        $dumpvars(0,acc_ctrl16_tb);
        // Initialize Inputs
        clk = 0;
        rst = 1;

        // Wait 20 ns for global reset to finish
        #20;
        rst = 0;

        // Wait enough cycles to observe the behavior
        #2000;

        // Add any additional tests here if necessary

        // Finish simulation
        $finish;
    end

    // Monitor the signals
    initial begin
        $monitor("At time %t, clk = %b, rst = %b, en = %b, sel = %b, c_state = %d", $time, clk, rst, en, sel, uut.c_state);
    end

endmodule
