module dual_port_ram (
  input wire [9:0] address_a,
  input wire [9:0] address_b,
  input wire write_enable_a,
  input wire write_enable_b,
  input wire [7:0] data_a,
  input wire [7:0] data_b,
  input wire clock,
  output reg [7:0] q_a,
  output reg [7:0] q_b
);

reg [7:0] mem [0:1023];

always @(posedge clock) begin
  if (write_enable_a) begin
    mem[address_a] <= data_a;
  end

  if (write_enable_b) begin
    mem[address_b] <= data_b;
  end

  q_a <= mem[address_a];
  q_b <= mem[address_b];
end

endmodule

module testbench;
  reg [9:0] address_a;
  reg [9:0] address_b;
  reg write_enable_a;
  reg write_enable_b;
  reg [7:0] data_a;
  reg [7:0] data_b;
  reg clock;
  wire [7:0] q_a;
  wire [7:0] q_b;

  dual_port_ram uut (
    .address_a(address_a),
    .address_b(address_b),
    .write_enable_a(write_enable_a),
    .write_enable_b(write_enable_b),
    .data_a(data_a),
    .data_b(data_b),
    .clock(clock),
    .q_a(q_a),
    .q_b(q_b)
  );

  always begin
    #5 clock = ~clock;
  end

  initial begin
    address_a = 0;
    address_b = 1;
    write_enable_a = 1;
    data_a = 8'b11001100;
    write_enable_b = 0;
    data_b = 8'b00110011;

    #10 address_a = 2;
    write_enable_a = 0;
    data_a = 8'b11111111;

    #10 address_b = 3;
    write_enable_b = 1;
    data_b = 8'b01010101;

    #10 address_a = 4;
    write_enable_a = 1;
    data_a = 8'b10101010;
    write_enable_b = 1;
    data_b = 8'b01010101;

    $finish;
  end

  always @(posedge clock) begin
    $display("q_a = %h, q_b = %h", q_a, q_b);
  end

endmodule
