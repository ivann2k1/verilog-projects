module semaphore_fsm(
input clk,
input areset,
input in
);

parameter red=2'b00;
parameter yellow=2'b01;
parameter green=2'b10;
parameter yellow_to_red=2'b11;
reg [1:0]state,next_state;

always@(*)begin
case(state)
 red:
  if(in)
   next_state=yellow;
  else
    next_state=red;
   yellow:
  if(in)
   next_state=green;
  else
    next_state=yellow;
   green:
  if(in)
   next_state=yellow_to_red;
  else
    next_state=green;
   yellow_to_red:
  if(in)
   next_state=red;
  else
    next_state=yellow_to_red;
  default: next_state=red;
endcase
end

always@(posedge clk or posedge areset)begin
if(areset) 
state<=red;
else
state<=next_state;
end
endmodule
