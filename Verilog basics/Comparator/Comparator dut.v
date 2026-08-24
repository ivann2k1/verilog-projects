module comparator(
input reg[3:0]a,
  input reg[3:0]b,
output reg greather,
output reg less,
output reg equal  
);
  always@(*)begin
    if(a>b) begin
      greather =1;
      less=0;
      equal=0;
    end
    else if(a<b) begin
     greather =0;
     less=1;
     equal=0;
    end
    else begin
     greather =0;
     less=0;
     equal=1;
    end
  end
endmodule
