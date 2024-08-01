module acc16_tb;

    // Inputs
    reg [19:0] din;
    reg [7:0] b;
    reg clk;
    reg rst;

    // Outputs
    wire [23:0] sum;

    // Instantiate the Unit Under Test (UUT)
    acc16 uut (
        .sum(sum),
        .din(din),
        .b(b),
        .clk(clk),
        .rst(rst)
    );

    // Clock generation
    always #5 clk = ~clk; // 10 ns period

    // Initialize Inputs
    initial begin
        $dumpfile("acc16_tb.vcd");
        $dumpvars(0, acc16_tb);

        // Initialize Inputs
        clk = 0;
        rst = 1;
        din = 20'd0;
        b = 8'd0;

        // Wait 30 ns for global reset to finish
        #30;
        rst = 0;

        // Apply test cases
        // Each test case corresponds to a different state every 3 clock cycles

        #25
        // Test case 1: State 0
        din = 20'd1;  b = 8'd1;  // Add 1 with bias 1
        #30;  // Wait enough cycles for state transition

        // Test case 2: State 1
        din = 20'd2;  
        #30;  // Wait enough cycles for state transition

        // Test case 3: State 2
        din = 20'd3; 
        #30;  // Wait enough cycles for state transition

        // Test case 4: State 3
        din = 20'd4;  
        #30;  // Wait enough cycles for state transition

        // Test case 5: State 4
        din = 20'd5;
        #30;  // Wait enough cycles for state transition

        // Test case 6: State 5
        din = 20'd6;
        #30;  // Wait enough cycles for state transition

        // Test case 7: State 6
        din = 20'd7;
        #30;  // Wait enough cycles for state transition

        // Test case 8: State 7
        din = 20'd8;
        #30;  // Wait enough cycles for state transition

        // Test case 9: State 8
        din = 20'd9;
        #30;  // Wait enough cycles for state transition

        // Test case 10: State 9
        din = 20'd10; 
        #30;  // Wait enough cycles for state transition

        // Test case 11: State 10
        din = 20'd11; 
        #30;  // Wait enough cycles for state transition

        // Test case 12: State 11
        din = 20'd12; 
        #30;  // Wait enough cycles for state transition

        // Test case 13: State 12
        din = 20'd13;
        #30;  // Wait enough cycles for state transition

        // Test case 14: State 13
        din = 20'd14;
        #30;  // Wait enough cycles for state transition

        // Test case 15: State 14
        din = 20'd15; 
        #30;  // Wait enough cycles for state transition

        // Test case 16: State 15
        din = 20'd16; 
        #30;  // Wait enough cycles for state transition

        // Finish simulation
        $finish;
    end

    // Monitor the signals and display expected outputs
    initial begin
        $monitor("At time %t, clk = %b, rst = %b, din = %d, b = %d, sum = %d",
                 $time, clk, rst, din, b, sum);
    end

endmodule
