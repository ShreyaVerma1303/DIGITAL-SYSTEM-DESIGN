`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2023 06:59:27 PM
// Design Name: 
// Module Name: MULTIPLYER
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


module MULTIPLYER(
    input [3:0] a,
    input [3:0] b,
    output [7:0] product
    );
    wire [3:0] m0;
    wire [4:0] m1;
    wire [5:0] m2;
    wire [6:0] m3;
    wire [7:0] s1,s2,s3;
    assign m0={4{a[0]}}&b[3:0];
    assign m1={4{a[1]}}&b[3:0];
    assign m2={4{a[2]}}&b[3:0];
    assign m3={4{a[3]}}&b[3:0];
    
    assign s1=m0+(m1<<1);
    assign s2=s1+(m2<<1);
    assign s3=s2+(m3<<1);
    assign product= s3;
endmodule

module testbench;
reg [3:0]a,b;
wire [7:0] product;

    MULTIPLYER dut(a,b,product);
    initial
    begin
    $monitor("a=%b b=%b product=%b",a,b,product);
    
    #100 a[0]=0; a[1]=1; a[2]=1; a[3]=0;
         b[0]=1; b[1]=0; b[2]=1; b[3]=1;
    #200 a[0]=1; a[1]=0; a[2]=1; a[3]=0;
         b[0]=1; b[1]=1; b[2]=0; b[3]=1;
    #300 a[0]=0; a[1]=1; a[2]=0; a[3]=0;
         b[0]=1; b[1]=1; b[2]=0; b[3]=1;
         end
         endmodule