module adder #(parameter IN_WIDTH = 1, parameter OUT_WIDTH = 1)
(
    output signed [OUT_WIDTH-1:0] out,
    input signed [IN_WIDTH-1:0] a,b
);

assign out = a+b;
    
endmodule