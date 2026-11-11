
`timescale 1ns/1ps

module fifo_tb;

  reg clk;
  reg reset;
  reg [7:0] data_in;
  reg rd_enable;
  reg wr_enable;

  wire [7:0] data_out;
  wire full;
  wire empty;

  fifo dut(
    .clk(clk),
    .reset(reset),
    .data_in(data_in),
    .data_out(data_out),
    .full(full),
    .empty(empty),
    .rd_enable(rd_enable),
    .wr_enable(wr_enable)
  );

  always #5 clk = ~clk;

  initial begin

    clk = 0;
    reset = 1;
    data_in = 0;
    rd_enable = 0;
    wr_enable = 0;

    $dumpfile("dumpfile.vcd");
    $dumpvars(0, fifo_tb);


    #12;
    reset = 0;

    #10;
    wr_enable = 1;
    data_in = 8'd10;

    #10;
    data_in = 8'd20;

    #10;
    data_in = 8'd30;

    #10;
    data_in = 8'd40;

    #10;
    data_in = 8'd50;

    #10;
    data_in = 8'd60;

    #10;
    data_in = 8'd70;

    #10;
    data_in = 8'd80;

    #10;
    data_in = 8'd90;

    #10;
    wr_enable = 0;
    rd_enable = 1;

    #10;
    #10;
    #10;
    #10;
    #10;
    #10;
    #10;
    #10;


    #10;
    rd_enable = 0;

    #10;
    wr_enable = 1;
    rd_enable = 1;
    data_in = 8'd100;

    #10;
    data_in = 8'd110;

    #10;
    data_in = 8'd120;

    #10;
    wr_enable = 0;
    rd_enable = 0;
    reset = 1;

    #10;
    reset = 0;

    #20;
    $finish;

  end

endmodule
