module gcd (
  input wire [15:0] a,
  input wire [15:0] b,
  output wire [15:0] result
);

always @* begin
  if (b == 0)
    result = a;
  else
    result = gcd(b, a % b);
end

endmodule

module testbench;
  reg [15:0] a;
  reg [15:0] b;
  wire [15:0] result;

  gcd uut (
    .a(a),
    .b(b),
    .result(result)
  );

  initial begin
    a = 48;
    b = 18;
    #10;
    $display("GCD(%d, %d) = %d", a, b, result);
    $finish;
  end
endmodule


