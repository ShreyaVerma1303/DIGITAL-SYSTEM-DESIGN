module frequency_divider_odd (
  input wire clk,
  output wire clk_out
);

reg [2:0] counter;

always @(posedge clk) begin
  if (counter == 3'b100) begin
    counter <= 3'b000;
//    clk_out <= ~clk_out;
  end else begin
    counter <= counter + 1;
  end
end

endmodule

module testbench;
  reg clk;
  wire clk_out;

  frequency_divider_odd uut (
    .clk(clk),
    .clk_out(clk_out)
  );

  always begin
    #5 clk = ~clk;
  end

  initial begin
    clk = 0;

    #100;
    $finish;
  end

  always @(posedge clk_out) begin
    $display("Clock Out toggled at time %t", $realtime);
  end

endmodule

