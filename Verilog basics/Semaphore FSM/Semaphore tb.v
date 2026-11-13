
`timescale 1ns/1ps

module semaphore_tb;

    reg clk_tb;
    reg in_tb;
    reg areset_tb;

    semaphore_fsm semaphore_dut(
        .clk(clk_tb),
        .in(in_tb),
        .areset(areset_tb)
    );
    initial begin
        clk_tb = 0;
        forever #5 clk_tb = ~clk_tb;
    end
    initial begin

        $dumpfile("dump.vcd");
        $dumpvars(0, semaphore_tb);

        areset_tb = 1;
        in_tb = 0;

        #10;
        areset_tb = 0;

        #10;
        in_tb = 1;

        #10;
        in_tb = 1;

        #10;
        in_tb = 0;

        #10;
        in_tb = 1;

        #20;
        $finish;
    end

endmodule
