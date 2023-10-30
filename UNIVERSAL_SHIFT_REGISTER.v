module universal_shift_register (
  input wire clk,
  input wire reset,
  input wire shift_left,
  input wire shift_right,
  input wire shift_enable,
  input wire data_in,
  output wire [7:0] data_out
);

reg [7:0] shift_register;

always @(posedge clk or posedge reset) begin
  if (reset) begin
    shift_register <= 8'b00000000;
  end else if (shift_enable) begin
    if (shift_left) begin
      shift_register <= {shift_register[6:0], data_in};
    end else if (shift_right) begin
      shift_register <= {data_in, shift_register[7:1]};
    end
  end
end

assign data_out = shift_register;

endmodule

module testbench;
  reg clk;
  reg reset;
  reg shift_left;
  reg shift_right;
  reg shift_enable;
  reg data_in;
  wire [7:0] data_out;
  universal_shift_register uut (.clk(clk),.reset(reset),
    .shift_left(shift_left),
    .shift_right(shift_right),
    .shift_enable(shift_enable),
    .data_in(data_in),
    .data_out(data_out));
  always begin
    #5 clk = ~clk;
  end
  initial begin
    clk = 0;
    reset = 0;
    shift_left = 0;
    shift_right = 0;
    shift_enable = 1;
    data_in = 8'b11011011;
    #10 reset = 1;
    #10 reset = 0;
    #10 shift_left = 1;
    #10 shift_right = 0;
    data_in = 8'b00110010;
    #10 shift_left = 0;
    shift_right = 1;
    data_in = 8'b10101010;
    $finish;
  end
  always @(posedge clk) begin
    $display("Data Out: %b", data_out);
  end
endmodule


