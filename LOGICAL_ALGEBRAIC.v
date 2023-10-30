module fixed_priority_arbiter (
  input wire clk,
  input wire [1:0] request, // Input request lines
  output reg grant          // Output grant line
);

always @(posedge clk) begin
  case (request)
    2'b00: grant <= 1'b0;
    2'b01: grant <= 1'b0;
    2'b10: grant <= 1'b0;
    2'b11: grant <= 1'b1;
    default: grant <= 1'b0;
  endcase
end

endmodule

module testbench;
  reg clk;
  reg [1:0] request;
  wire grant;

  fixed_priority_arbiter uut (
    .clk(clk),
    .request(request),
    .grant(grant)
  );

  always begin
    #5 clk = ~clk;
  end

  initial begin
    clk = 0;
    request = 2'b00;

    #10 request = 2'b01;
    #10 request = 2'b10;
    #10 request = 2'b11;

    $finish;
  end

  always @(posedge clk) begin
    $display("Grant = %b", grant);
  end

endmodule


