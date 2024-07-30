module mac_tb;

  // Declare testbench variables
  reg clk;
  reg [127:0] pixelsIn;
  reg [127:0] weightsIn;
  wire [19:0] sumOut;

  // Instantiate the MAC module
  mac uut (
    .sumOut(sumOut),
    .clk(clk),
    .pixelsIn(pixelsIn),
    .weightsIn(weightsIn)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10 time units period
  end

  // Stimulus block
  initial begin
    // Test case 1
    pixelsIn = 128'h00000000000000000000000000000056; // Example 8-bit signed integers extended
    weightsIn = 128'h00000000000000000000000000000032; // Example 8-bit signed integers extended
    @(posedge clk);
    #11;
    $display("Test case 1");
    $display("PixelsIn (hex): %h", pixelsIn);
    $display("WeightsIn (hex): %h", weightsIn);
    #11; // Wait another clock cycle to ensure output is stable
    $display("SumOut (binary): %b", sumOut);
    $display("Expected SumOut (binary): %b", 20'b00000001000011001100); // Update with correct binary result

    // Test case 2
    pixelsIn = 128'h00000000000000000000000000000012;
    weightsIn = 128'h00000000000000000000000000000034;
    @(posedge clk);
    #11;
    $display("Test case 2");
    $display("PixelsIn (hex): %h", pixelsIn);
    $display("WeightsIn (hex): %h", weightsIn);
    #11; // Wait another clock cycle to ensure output is stable
    $display("SumOut (binary): %b", sumOut);
    $display("Expected SumOut (binary): %b", 20'b00000000001110101000); // Update with correct binary result

    // Test case 3
    pixelsIn = 128'h00000000000000000000000000000052;
    weightsIn = 128'h00000000000000000000000000000013;
    @(posedge clk);
    #11;
    $display("Test case 3");
    $display("PixelsIn (hex): %h", pixelsIn);
    $display("WeightsIn (hex): %h", weightsIn);
    #11; // Wait another clock cycle to ensure output is stable
    $display("SumOut (binary): %b", sumOut);
    $display("Expected SumOut (binary): %b", 20'b00000000011000010110); // Update with correct binary result

    // Test case 4 (Both inputs are zero)
    pixelsIn = 128'h00000000000000000000000000000000;
    weightsIn = 128'h00000000000000000000000000000000;
    @(posedge clk);
    #11;
    $display("Test case 4");
    $display("PixelsIn (hex): %h", pixelsIn);
    $display("WeightsIn (hex): %h", weightsIn);
    #11; // Wait another clock cycle to ensure output is stable
    $display("SumOut (binary): %b", sumOut);
    $display("Expected SumOut (binary): %b", 20'b00000000000000000000); // Expected sum when both inputs are zero

    // Finish simulation
    $finish;
  end

endmodule