`timescale 1ns/1ps

module jk_tb;

  reg clk;
  reg j;
  reg k;
  reg reset;
  wire q;

  jk_ff dut(
    .clk(clk),
    .j(j),
    .k(k),
    .reset(reset),
    .q(q)
  );

  always #5 clk = ~clk;

  initial begin

    clk   = 0;
    j     = 0;
    k     = 0;
    reset = 1;

    $dumpfile("dumpfile.vcd");
    $dumpvars(0, jk_tb);

    #12;
    reset = 0;
    #10;
    j = 0;
    k = 0;
    #10;
    j = 0;
    k = 1;
    #10;
    j = 1;
    k = 0;
    #20;
    j = 1;
    k = 1;

    #20;
    reset = 1;

    #10;
    $finish;

  end

endmodule
