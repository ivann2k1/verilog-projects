`timescale 1ns/1ps

module top_module_tb;

    reg [31:0] a;
    reg [31:0] b;
    wire [31:0] sum;

    top_module dut (
        .a(a),
        .b(b),
        .sum(sum)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, top_module_tb);
        a = 32'd5;
        b = 32'd3;
        #10;
        a = 32'd10;
        b = 32'd20;
        #10;
        a = 32'h0000FFFF;
        b = 32'h00000001;
        #10;
        $finish;
    end

endmodule
