module add16(
    input [15:0] a,
    input [15:0] b,
    input cin,
    output [15:0] sum,
    output cout
);

    assign {cout, sum} = a + b + cin;

endmodule


module top_module( 
    input [31:0] a, 
    input [31:0] b, 
    output reg [31:0] sum 
); 

    wire cout1;
    wire cout2;
    wire cout3;

    wire [15:0] sum1;
    wire [15:0] sum2;
    wire [15:0] sum3;

    add16 a1(
        a[15:0],
        b[15:0],
        1'b0,
        sum1,
        cout1
    );

    add16 a2(
        a[31:16],
        b[31:16],
        1'b0,
        sum2,
        cout2
    );

    add16 a3(
        a[31:16],
        b[31:16],
        1'b1,
        sum3,
        cout3
    );

    always @(*) begin
        if (cout1 == 1'b0)
            sum = {sum2, sum1};
        else
            sum = {sum3, sum1};
    end

endmodule
