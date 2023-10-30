module priority_encoder (
  input wire [3:0] inputs,
  output reg [1:0] out
);

assign out[0] = ~|inputs;
assign out[1] = |inputs;

endmodule

module testbench;
  reg [3:0] inputs;
  wire [1:0] out;

  priority_encoder uut (
    .inputs(inputs),
    .out(out)
  );

  initial begin
    inputs = 4'b0000;
    #10 inputs = 4'b0001;
    #10 inputs = 4'b0010;
    #10 inputs = 4'b0100;
    #10 inputs = 4'b1000;

    $finish;
  end

  always begin
    $display("Inputs: %b, Out: %b", inputs, out);
  end

endmodule

