module d_flip_flop(
    input D, clk, rst,
    output reg Q,
    output Qbar
);

    initial begin
        Q = 1'b0;
    end

    always @(posedge clk or posedge rst) begin
        if (rst)
            Q <= 1'b0;
        else
            Q <= D;
    end

    assign Qbar = ~Q;

endmodule