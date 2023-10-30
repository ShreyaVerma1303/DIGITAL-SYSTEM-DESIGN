module universal_binary_counter (
  input wire clk,
  input wire reset,
  input wire count_up,
  output reg [3:0] count
);

always @(posedge clk or posedge reset) begin
  if (reset) begin
    count <= 4'b0000;
  end else begin
    if (count_up) begin
      if (count == 4'b1111) begin
        count <= 4'b0000;
      end else begin
        count <= count + 1;
      end
    end else begin
      if (count == 4'b0000) begin
        count <= 4'b1111;
      end else begin
        count <= count - 1;
      end
    end
  end
end

endmodule

module testbench;
  reg clk;
  reg reset;
  reg count_up;
  wire [3:0] count;

  universal_binary_counter uut (
    .clk(clk),
    .reset(reset),
    .count_up(count_up),
    .count(count)
  );
  always begin
    #5 clk = ~clk;
  end

  initial begin
    clk = 0;
    reset = 0;
    count_up = 1;
    #10 reset = 1;
    #10 reset = 0;
    count_up = 0;
    #10;
    count_up = 1;
    #10;
    count_up = 0;
    #10;
    count_up = 1;
    $finish;
  end
  always @(posedge clk) begin
    $display("Count: %b", count);
  end
endmodule

