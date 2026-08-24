module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cout1;

    wire [15:0] sum1,sum2,sum3;
    add16 a1(a[15:0], b[15:0],1'b0,sum1,cout1);
    add16 a2(a[31:16], b[31:16],1'b0, sum2, 1'b1);
    add16 a3(a[31:16], b[31:16],1'b1, sum3, 1'b1);
    always @(*) begin
            case(cout1)
                1'b0 : sum={sum2,sum1};
                1'b1 :sum={sum3,sum1}; 
                
                endcase
            
        end
   
    
endmodule
