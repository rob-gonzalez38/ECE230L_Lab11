module t_flip_flop(
    input T, clk, rst,
    output Q, Qbar
);

    wire d_in;
    wire q_int;
    wire qbar_int;

    assign d_in = T ^ q_int;

    d_flip_flop dff_t (
        .D(d_in),
        .clk(clk),
        .rst(rst),
        .Q(q_int),
        .Qbar(qbar_int)
    );

    assign Q = q_int;
    assign Qbar = qbar_int;

endmodule