module rs_flip_flop (
    input r,
    input s,
    input clk,
    input areset,
    output reg q
);

always @(posedge clk or posedge areset) begin
    if ({r, s} == 2'b11) begin
        $display("FORBIDDEN STATE");
        q <= 1'bx;
    end else if (areset) begin
        q <= 1'b0;
    end else begin
        q <= s | (~r & q);
    end
end

endmodule
