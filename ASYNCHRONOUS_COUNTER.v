module async_down_counter_4bit (
    input wire clk,
    input wire reset,
    output reg [3:0] count
);

always @(posedge clk or posedge reset)
begin
    if (reset)
        count <= 4'b1111; // Reset the counter to 1111
    else
        count <= count - 1; // Decrement the counter by 1
end
endmodule
module testbench;
    reg clk;
    reg reset;
    wire [3:0] count;
    async_down_counter_4bit counter (
        .clk(clk),
        .reset(reset),
        .count(count)
    );
    always begin
        #5 clk = ~clk; // Toggle the clock every 5 time units
    end
    initial begin
        reset = 1;
        #10 reset = 0; // Deassert reset after 10 time units
    end
    initial begin
        $dumpfile("counter.vcd");
        $dumpvars(0, testbench);
        $display("Time\tCount");
        $monitor("%d\t%b", $time, count);
        #30 $finish;
    end
endmodule


module testbench;
 reg clk;
    reg reset;
    wire [3:0] count;

    async_down_counter_4bit counter (
        .clk(clk),
        .reset(reset),
        .count(count)
    );
    always begin
        #5 clk = ~clk; 
    end
    initial begin
        reset = 1;
        #10 reset = 0; 
    end
    initial begin
        $dumpfile("counter.vcd");
        $dumpvars(0, testbench);
        $display("Time\tCount");
        $monitor("%d\t%b", $time, count);
        #30 $finish;
    end

endmodule


