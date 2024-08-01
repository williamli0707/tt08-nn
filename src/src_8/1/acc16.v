
// you should probably reset the acc beforehand 

module acc16( // based off acc_ctrl16 // 16 cycles through MAC, each cycle taking 3 clock cycles.
sum, clk, rst, din, b
    );
    
    output reg [23:0] sum; // 24 bit output
    input [19:0] din; // 20 bit input for mac
    input [7:0] b; // bias
    input clk, rst; // clock and reset

    wire [3:0] state; // for whatever state we get from acc_ctrl16
    wire [23:0] b_ext; // 24 bit acc (to accumulate) and b_ext (extended bias)
    reg [23:0] acc;

    acc_ctrl16 instCtrl(state, clk, rst); // ctrl instantiation

    assign b_ext = {{16{b[7]}},b}; //Sign extension because b needs to add to 24 bit


    always @(state or posedge rst) begin
        if (rst) begin
            acc <= 24'd0;  // Reset accumulator to 0
            sum <= 24'd0;  // Reset output sum to 0
        end 
        else if (state == 4'd1) begin
            acc <= acc + din + b_ext; // add bias and input data on s2 instead of s1 just because in case
        end else if (state == 4'd15) begin
            acc <= acc + din; // Accumulate input data // accumulate one more time
            sum <= acc;    // Output the accumulated sum when in state s16
            acc <= 24'd0;  // Reset accumulator for the next cycle
        end else begin
            acc <= acc + din; // Accumulate input data
        end
    end

 endmodule