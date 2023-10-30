`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2023 10:10:50 PM
// Design Name: 
// Module Name: D_LATCH
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


module MUX(
    input a,
    input b,
    input s,
    output reg y
    );
    always@(a or b or s)
    begin
    y= (~s&a) | (s&b);
    end 
    endmodule
    module D_LATCH(
    input d,clk,
    output q
    );
    MUX mux1(.a(q),.b(d),.s(clk),.y(q));
    
endmodule



