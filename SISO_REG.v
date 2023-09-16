`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2023 08:50:18 PM
// Design Name: 
// Module Name: SISO_REG
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


module SISO_REG(
    input clk,
    input si,
    input clear,
    output so
    );
    reg [3:0] tmp;
    always@(posedge clk)
    begin
    if(clear)
    tmp <=4'b0000;
    else
    tmp <= tmp >>1;
    tmp[3] <= si;
    end
    assign so = tmp;
endmodule
