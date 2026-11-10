`timescale 1ns/1ps

module alu_tb;

  reg clk;
  reg reset;
  reg [3:0] a;
  reg [3:0] b;
  reg [2:0] operation;

  wire [3:0] out;
  wire overflow;

  alu dut(
    .clk(clk),
    .reset(reset),
    .a(a),
    .b(b),
    .operation(operation),
    .out(out),
    .overflow(overflow)
  );

  always #5 clk = ~clk;

  initial begin

    clk = 0;
    reset = 1;
    a = 0;
    b = 0;
    operation = 0;

    $dumpfile("dumpfile.vcd");
    $dumpvars(0, alu_tb);

    #12;
    reset = 0;

    // ADD
    #10;
    a = 4'd3;
    b = 4'd4;
    operation = 3'b000;

    #10;
    a = 4'd10;
    b = 4'd8;
    operation = 3'b000;

    // SUB
    #10;
    a = 4'd9;
    b = 4'd3;
    operation = 3'b001;

    #10;
    a = 4'd3;
    b = 4'd5;
    operation = 3'b001;

    // MUL
    #10;
    a = 4'd2;
    b = 4'd3;
    operation = 3'b010;

    #10;
    a = 4'd5;
    b = 4'd4;
    operation = 3'b010;

    // DIV
    #10;
    a = 4'd12;
    b = 4'd3;
    operation = 3'b011;

    #10;
    a = 4'd7;
    b = 4'd0;
    operation = 3'b011;

    // XOR
    #10;
    a = 4'b1010;
    b = 4'b1100;
    operation = 3'b100;

    // AND
    #10;
    a = 4'b1010;
    b = 4'b1100;
    operation = 3'b101;

    // OR
    #10;
    a = 4'b1010;
    b = 4'b1100;
    operation = 3'b110;

    // NAND
    #10;
    a = 4'b1010;
    b = 4'b1100;
    operation = 3'b111;

    #10;
    reset = 1;

    #10;
    $finish;

  end

endmodule
