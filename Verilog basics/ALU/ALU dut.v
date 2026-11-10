module alu(
    input clk,
    input reset,
    input [3:0] a,
    input [3:0] b,
    input [2:0] operation,
    output reg [3:0] out,
    output reg overflow
);

  always@(posedge clk)begin
    
    if(reset)begin
      out<=0;
      overflow<=0;
    end
    else begin
      overflow<=0;
      case(operation)
        3'b000: begin
          out<=a+b;
          overflow<=({1'b0,a}+{1'b0,b}>15);
        end
        3'b001: begin
          out<=a-b;
          overflow<=(a<b);
        end
      	3'b010:begin
          out<=a*b;
          overflow<=(a*b)>15;
        end
        3'b011: begin
          if(b!=1'b0)begin
            out<=a/b;
          end
          else begin
            out<=4'b0000;
            overflow<=1;
          end
          
        end
      	3'b100:begin
          out<=a^b;
        end
        3'b101:out<=a&b;
        3'b110:out<=a|b;
        3'b111:out<=~(a&b);
      endcase 
      
    end
    
  end

endmodule
