module adder24( // 16 sums of 20 bit integers (for acc_ctrl16 which accumulates MAC 16 times)
    sum,a,b
    );
    output signed [21:0]sum;
    input signed [19:0] a;
    input signed [23:0] b;
    assign sum= a+b;
endmodule
