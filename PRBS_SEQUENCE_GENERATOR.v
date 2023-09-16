module PRBS_SEQUENCE_GENERATOR(
input clk,rst,
output rand
);

reg [3:0] temp;
always@(posedge rst)
begin
temp <= 4'hf;
end
always@(posedge clk)
begin
if (~rst)
begin
temp <= {temp[0]^temp[1],temp[3],temp[2],temp[1]};
end
end
assign rand = temp[0];
endmodule

// Testbench for a 4-bit PRBS Generator

module tb_PRBS_SEQUENCE_GENERATOR;
  reg clk;
  reg rst;
  wire rand; // 4-bit PRBS output

  // Instantiate the PRBS Generator module
  PRBS_SEQUENCE_GENERATOR uut (
    .clk(clk),
    .rst(rst),
    .rand(rand)
  );

  // Clock generation
  always begin
    #5 clk = ~clk; // Toggle the clock every 5 time units
  end

  // Reset generation
  initial begin
    rst = 1; // Apply reset
    #10 rst = 0; // Release reset after 10 time units
  end

  // Monitor PRBS output and display
  initial begin
    $display("Time\tPRBS Output");
    $monitor("%d\t%b", $time, rand);
    #100; // Simulate for some time (adjust as needed)
    $finish; // End simulation
  end

endmodule
