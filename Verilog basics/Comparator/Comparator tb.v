`timescale 1ns/1ps

module comparator_tb;
  reg [3:0] a;
  reg [3:0] b;
  wire greather;
  wire less;
  wire equal;
  
  comparator dut(
    .a(a),
    .b(b),
    .greather(greather),
    .less(less),
    .equal(equal)
  );
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,comparator_tb);
    a=4'b1001;
    b=4'b1000;
    #10;
    a=4'b0001;
    b=4'b0001; 
    #20;
    a=4'b0000;
    b=4'b1111;
    #10;
    $finish;
  end
endmodule
