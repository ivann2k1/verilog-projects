module rs_flip_flop_tb;

    reg r;
    reg s;
    reg clk;
    wire q;

    rs_flip_flop dut (
        .r(r),
        .s(s),
        .clk(clk),
        .q(q)
    );

    always #5 clk = ~clk;

    initial begin
      $dumpfile("dump.vcd");
      $dumpvars(0,rs_flip_flop_tb);
        clk = 0;
        r = 0;
        s = 0;

        #10;
        r = 0;
        s = 1;

        #10;
        r = 1;
        s = 1;

        #10;
        r = 1;
        s = 0;

        #10;
        r = 0;
        s = 0;

        #10;
        r = 0;
        s = 0;

        #10;
        $finish;
    end

endmodule
