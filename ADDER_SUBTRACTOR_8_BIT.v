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

module ADDER_SUBTRACTOR_8_BIT;
reg [7:0] a, b;
wire [7:0] result;
wire ovf1;
BCD_Adder uut(
    .a(a),
    .b(b),
    .result(result),
    .ovf1(ovf1)
);
initial begin
    $display("Testing 8 bit Adder Subtractor");
    
  
    a = 4'b0101;
    b = 4'b0011;
    #10 $display("a = %b, b = %b, result = %b, ovf1 = %b", a, b,result, ovf1);
   
    A = 4'b1001;
    B = 4'b1001;
    #10 $display("a = %b, b = %b, result = %b, ovf1 = %b", a, b,result, ovf1);
 
    a = 4'b0000;
    b = 4'b0000;
    #10 $display("a = %b, b = %b, result = %b, ovf1 = %b", a, b,result, ovf1);
    
    $finish;
end
endmodule
