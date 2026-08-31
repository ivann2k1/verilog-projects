module jk_ff(
    input clk,
    input j,
    input k,
    input reset,
    output reg q
);

  always @(posedge clk or posedge reset) begin
    if (reset)
      q <= 0;
    else
      q <= (j & ~q) | (~k & q);
  end

endmodule
