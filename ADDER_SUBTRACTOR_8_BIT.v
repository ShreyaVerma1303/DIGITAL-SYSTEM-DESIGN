`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2023 06:17:46 PM
// Design Name: 
// Module Name: ADDER_SUBTRACTOR_8_BIT
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


module ADDER_SUBTRACTOR_8_BIT(
    input [7:0] a,
    input [7:0] b,
    input mode,
    output reg [7:0] result,
    output reg ovfl
    );
    wire [7:0] a,b;
    wire mode;
    reg [7:0] neg_b;
    always@(a or b or mode)
    begin
    if(mode==0)
    begin
    result = a+b;
    ovfl = (a[7] & b[7] & ~result[7]) | (~a[7] & ~b[7] & result[7]);
    end
    else
    begin
    neg_b = ~b+1;
    result = a + neg_b;
    ovfl = (a[7] & neg_b[7] & ~result[7]) | (~a[7] & ~neg_b[7] & result[7]);
    end
    
endmodule
