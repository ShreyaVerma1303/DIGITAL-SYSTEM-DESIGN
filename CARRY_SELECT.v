`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2023 05:40:44 PM
// Design Name: 
// Module Name: CARRY_SELECT
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
module FULL_ADDER(
    input a,
    input b,
    input cin,
    output reg S,cout
    );
    always@(a or b or cin)
    begin
    S = a^b^cin;
    cout = a&b | b&cin | cin&a;
    end
    endmodule
    
    module mux(
    input a,b,
    input S,
    output reg y
    );
    always@(a,b,S)
    begin
    y = S&a | S&b;
    end
    endmodule
  
module CARRY_SELECT(
    input [3:0] x,
    input [3:0] y,
    input carry,
    output [3:0] s,
    output cout
    );
    wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16;
    FULL_ADDER fa0(x[0],y[0],1'b0,w1,w2);
    FULL_ADDER fa1(x[1],y[1],w2,w3,w4);
    FULL_ADDER fa2(x[2],y[2],w4,w5,w6);
    FULL_ADDER fa3(x[3],y[3],w6,w7,w8);
    FULL_ADDER fa4(x[0],y[0],1'b1,w9,w10);
    FULL_ADDER fa5(x[1],y[1],w10,w11,w12);
    FULL_ADDER fa6(x[2],y[2],w12,w13,w14);
    FULL_ADDER fa7(x[3],y[3],w14,w15,w16);
    mux mu0(w1,w9,carry,s[0]);
    mux mu1(w3,w11,carry,s[1]);
    mux mu2(w5,w13,carry,s[2]);
    mux mu3(w7,w15,carry,s[3]);
    mux mu4(w8,w16,carry,cout);
endmodule

module testbench;
reg [3:0]x,y;
reg carry;
wire [3:0] s;

    CARRY_SELECT dut(x,y,carry,s);
    initial
    begin
    $monitor("x=%b y=%b carry=%b s=%b",x,y,carry,s);
     carry = 1;
     carry = ~carry;
    #100 x[0]=0; x[1]=1; x[2]=1; x[3]=0;
         y[0]=1; y[1]=0; y[2]=1; y[3]=1;
    #200 x[0]=1; x[1]=0; x[2]=1; x[3]=0;
         y[0]=1; y[1]=1; y[2]=0; y[3]=1;
    #300 x[0]=0; x[1]=1; x[2]=0; x[3]=0;
         y[0]=1; y[1]=1; y[2]=0; y[3]=1;
         end
         endmodule
