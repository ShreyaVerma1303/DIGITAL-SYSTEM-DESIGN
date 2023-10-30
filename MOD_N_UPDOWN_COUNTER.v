module mod_n_updown_counter (
    input wire clk,
    input wire reset,
    input wire up,
    input wire down,
    output reg [3:0] count // Assuming 4-bit counter
);

parameter N = 8; // Set N to the desired modulo value (e.g., 8)

always @(posedge clk or posedge reset)
begin
    if (reset)
        count <= 4'b0000; // Reset the counter to 0
    else if (up && !down && count < N - 1)
        count <= count + 1; // Count up
    else if (down && !up && count > 0)
        count <= count - 1; // Count down
end

endmodule


