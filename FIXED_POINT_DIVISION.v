`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2023 08:43:49 PM
// Design Name: 
// Module Name: FIXED_POINT_DIVISION
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


module FIXED_POINT_DIVISION(
    input [7:0] a,
    input [3:0] b,
    input start,
    output reg [7:0] result
    );
    wire[3:0] b_bar;
    reg [3:0] b_neg;
    
    reg [3:0] count;
    assign b_bar=~b;
    always@(b_bar)
    b_neg=b_bar+1;
    always@(posedge start)
    begin
    result=a;
    count=4'b0000;
    if((a!=0) &&  (b!=0))
    while (count)
    begin
    result=result<<1;
    result={(result[7:4] + b), result[3:1],1'b0};
    count=count-1;
    end
    else
    begin
    result={result[7:1],1'b1};
    count=count-1;
    end
    end
    
endmodule

/*module testbench;
reg [7:0]a;
reg [3:0]b;
reg start;
wire [7:0] result;

    FIXED_POINT_DIVISION dut(a,b,start,result);
    initial
    begin
    $monitor("a=%b b=%b start=%b result=%b",a,b,start,result);
   
    #100 a[0]=0; a[1]=1; a[2]=1; a[3]=0; a[4]=1; a[5]=0; a[6]=1; a[7]=1;
         b[0]=1; b[1]=0; b[2]=1; b[3]=1;
    #200 a[0]=1; a[1]=0; a[2]=1; a[3]=0; a[4]=0; a[5]=1; a[6]=0; a[7]=0;
         b[0]=1; b[1]=1; b[2]=0; b[3]=1; 
    #300 a[0]=0; a[1]=1; a[2]=0; a[3]=0; a[4]=1; a[5]=1; a[6]=1; a[7]=1;
         b[0]=1; b[1]=1; b[2]=0; b[3]=1;
         end
         endmodule*/
