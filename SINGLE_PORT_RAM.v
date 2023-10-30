module single_port_ram (
  input wire clk,
  input wire we, // Write enable signal
  input wire [7:0] addr, // Address for read and write operations
  input wire [7:0] data_in, // Data input for write operation
  output reg [7:0] data_out // Data output for read operation
);

reg [7:0] mem [0:255]; // 256x8-bit memory

always @(posedge clk) begin
  if (we) begin
    mem[addr] <= data_in;
  end
  data_out <= mem[addr];
end

endmodule

module testbench;
  reg clk;
  reg we;
  reg [7:0] addr;
  reg [7:0] data_in;
  wire [7:0] data_out;
  single_port_ram uut (
    .clk(clk),
    .we(we),
    .addr(addr),
    .data_in(data_in),
    .data_out(data_out)
  );
  always begin
    #5 clk = ~clk;
  end
  initial begin
    clk = 0;
    we = 1;
    addr = 8'b0000_0000;
    data_in = 8'b1101_0010;
    #10 we = 0;
    #10 addr = 8'b0010_1101;
    #10 data_in = 8'b1010_1100;
    $finish;
  end  always @(posedge clk) begin
    $display("Data Out: %h", data_out);
  end
endmodule

