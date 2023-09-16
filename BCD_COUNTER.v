`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2023 05:44:06 PM
// Design Name: 
// Module Name: BCD_COUNTER
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


/*module BCD_COUNTER(
    input Clk,
    input Clear,
    output [3:0] Count
    );
      reg [3:0] t;
      always@(posedge Clk)
      begin
      if(Clear)
      t <= 4'b0000;
      Count <= 4'b0000;
      end
      else
      begin
      t <= t+1;
      if(t==4'b1001)
      begin
      t <= 4'b0000;
      end
      Count <=t;
      end
      end
endmodule*/

module bcd_counter(
  input wire clk,        // Clock input
  input wire rst,        // Reset input
  output wire [3:0] bcd // 4-bit BCD output
);

reg [3:0] count;         // 4-bit counter

always @(posedge clk or posedge rst) begin
  if (rst) begin
    count <= 4'b0000;   // Reset the counter to 0
  end else begin
    // Increment the counter
    if (count == 4'b1001) begin
      count <= 4'b0000; // Reset to 0 when it reaches 9 (BCD)
    end else begin
      count <= count + 1;
    end
  end
end

assign bcd = count;     // Output BCD

endmodule

