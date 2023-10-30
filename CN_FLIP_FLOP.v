module CN_FlipFlop (
  input wire clk,
  input wire reset,
  input wire d,
  output wire q
);

wire mux_sel;
reg q_reg;

assign mux_sel = (d != q_reg);

always @(posedge clk, posedge reset) begin
  if (reset) begin
    q_reg <= 1'b0;
  end else begin
    if (mux_sel) begin
      q_reg <= d;
    end
  end
end

assign q = q_reg;

endmodule

module testbench;
  reg clk;
  reg reset;
  reg d;
  wire q;
  CN_FlipFlop uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q) );
  always begin
    #5 clk = ~clk;
  end
  initial begin
    clk = 0;
    reset = 0;
    d = 0;
    #10 reset = 1;
    #10 reset = 0;
    #10 d = 1;
    #10 d = 0;
    #10 d = 1;
    #10 d = 1;
    #10 d = 0;
    $finish;
  end
  always @(posedge clk) begin
    $display("Q = %b", q);
  end
endmodule

