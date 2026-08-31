module rs_flip_flop(
  
  input r,
  input s,
  input clk,
  output reg q
  
  
);
  always@(posedge clk)begin
    
    if({r,s}==2'b11) begin
      $display("Forbidden state");
      q<=1'bx;
    end
    else begin
      q<=s|(~r&q); 
      
    end
    
  end
endmodule
