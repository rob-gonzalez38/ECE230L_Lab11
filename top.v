module top(
    input btnC, btnU,
    output [6:0] led
);

//Ripple Counter - Use TFF
    wire rc_q0, rc_q1, rc_q2;
    wire rc_out0, rc_out1, rc_out2;

    //
    wire t0, t1, t2;

    assign t0 = 1'b1;
    assign t1 = rc_q0;
    assign t2 = rc_q0 & rc_q1;

    t_flip_flop tff0 (
        .T(t0),
        .clk(btnC),
        .rst(btnU),
        .Q(rc_q0),
        .Qbar(rc_out0)
    );

    t_flip_flop tff1 (
        .T(t1),
        .clk(btnC),
        .rst(btnU),
        .Q(rc_q1),
        .Qbar(rc_out1)
    );

    t_flip_flop tff2 (
        .T(t2),
        .clk(btnC),
        .rst(btnU),
        .Q(rc_q2),
        .Qbar(rc_out2)
    );

    assign led[0] = rc_q0;
    assign led[1] = rc_q1;
    assign led[2] = rc_q2;


//Modulo Counter

    //current state q
        wire q0, q1, q2;
        wire q0bar, q1bar, q2bar;

    //full_adder outputs q(t+1)
        wire s0, s1, s2;
        wire c1, c2, c3;

    //comparater output
        wire cval;

    //q(t+1) inputs for DFF 
        wire d0, d1, d2;

    //divider output 
        wire mod_out, mod_out_bar;
        wire d_out;

    //3-bit Counter (compute n+1), implement our full_adder
        full_adder fa0(
            .A(q0),
            .B(1'b1),
            .Cin(1'b0),
            .Y(s0),
            .Cout(c1)
        );

        full_adder fa1(
            .A(q1),
            .B(1'b0),
            .Cin(c1),
            .Y(s1),
            .Cout(c2)
        );

        full_adder fa2(
            .A(q2),
            .B(1'b0),
            .Cin(c2),
            .Y(s2),
            .Cout(c3)
        );

    //comparater counter
        assign cval = q2 & ~q1 & q0;

    //next-state logic
        assign d0 = cval ? 1'b0 : s0;
        assign d1 = cval ? 1'b0 : s1;
        assign d2 = cval ? 1'b0 : s2;

    //toggle logic
        assign d_out = cval ? ~mod_out : mod_out;

    //DFF
        d_flip_flop dff0(
            .D(d0),
            .clk(btnC),
            .rst(btnU),
            .Q(q0),
            .Qbar(q0bar)
        );

        d_flip_flop dff1(
            .D(d1),
            .clk(btnC),
            .rst(btnU),
            .Q(q1),
            .Qbar(q1bar)
        );

        d_flip_flop dff2(
            .D(d2),
            .clk(btnC),
            .rst(btnU),
            .Q(q2),
            .Qbar(q2bar)
        );

        d_flip_flop dff_out(
            .D(d_out),
            .clk(btnC),
            .rst(btnU),
            .Q(mod_out),
            .Qbar(mod_out_bar)
        );

    assign led[3] = q0;
    assign led[4] = q1;
    assign led[5] = q2;
    assign led[6] = mod_out;

endmodule

