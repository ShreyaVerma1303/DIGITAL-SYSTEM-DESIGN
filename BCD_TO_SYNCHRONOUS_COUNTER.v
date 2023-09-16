`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2023 09:40:45 PM
// Design Name: 
// Module Name: BCD_TO_SYNCHRONOUS_COUNTER
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


module BCD_TO_SYNCHRONOUS_COUNTER(
    input Clk,
    input Clear,
    output reg [3:0] Count
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
    Count =t;
    end
    end

endmodule
