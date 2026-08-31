`timescale 1ns/1ps

module rs_flip_flop_tb;

reg r;
reg s;
reg clk;
reg areset;
wire q;

rs_flip_flop dut (
    .r(r),
    .s(s),
    .clk(clk),
    .areset(areset),
    .q(q)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, rs_flip_flop_tb);
end

initial begin
    clk = 0;
    areset = 1;
    r = 0;
    s = 0;

    #10;
    areset = 0;
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

    #20;
    $finish;
end

endmodule
