module clock_buffer (
  input wire clk_in,
  output wire clk_out
);

assign clk_out = clk_in;

endmodule

module testbench;
  reg clk_in;
  wire clk_out;

  clock_buffer uut (
    .clk_in(clk_in),
    .clk_out(clk_out)
  );

  initial begin
    clk_in = 0;
    #5 clk_in = 1;
    #5 clk_in = 0;
    #5 clk_in = 1;
    #5 clk_in = 0;
    $finish;
  end

  always begin
    #2 clk_in = ~clk_in;
  end
endmodule
