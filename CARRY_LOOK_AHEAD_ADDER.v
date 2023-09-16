`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2023 06:10:14 PM
// Design Name: 
// Module Name: CARRY_LOOK_AHEAD_ADDER
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


module CARRY_LOOK_AHEAD_ADDER(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output cout
    );
    and (g0,a[0],b[0]),
    (g1,a[1],b[1]),
    (g2,a[2],b[2]),
    (g3,a[3],b[3]);
    xor (p0,a[0],b[0]),
    (p1,a[1],b[1]),
    (p2,a[2],b[2]),
    (p3,a[3],b[3]);
    xor (sum[0],p0,cin),
        (sum[1],p1,c0),
        (sum[2],p2,c1),
        (sum[3],p3,c2);
        assign c0= g0 | (p0 & cin),
        c1= g1 | (p1 & g0) | (p1 & p0 & cin),
        c2= g2 | (p2 & g1) | (p2 & p1 & g0) | (p2 & p1 & p0 & cin),
        c3= g3 | (p3 & g2) | (p3 & p2 & g1) | (p3 & p2 & p1 & g0) | (p3 & p2 & p1 & p0 & cin);
        assign cout=c3;
    
endmodule

module testbench;
reg [3:0] a, b,cin;
wire [3:0] sum,cout;
CARRY_LOOK_AHEAD_ADDER dut(a,b,cin,sum,cout);

initial 
begin
$monitor("a=%b b=%b cin=%b sum=%b cout=%b",a,b,cin,sum,cout);
     cin=1;
#50 a[0]=0; a[1]=0; a[2]=0; a[3]=0;
     b[0]=0; b[1]=0; b[2]=0; b[3]=0;
#70 a[0]=0; a[1]=0; a[2]=0; a[3]=1;
     b[0]=0; b[1]=0; b[2]=0; b[3]=1;
#90 a[0]=0; a[1]=0; a[2]=1; a[3]=0;
     b[0]=0; b[1]=0; b[2]=1; b[3]=0;
#110 a[0]=0; a[1]=0; a[2]=1; a[3]=1;
     b[0]=0; b[1]=0; b[2]=1; b[3]=1;
#130 a[0]=0; a[1]=1; a[2]=0; a[3]=0;
     b[0]=0; b[1]=1; b[2]=0; b[3]=0;
#150 a[0]=0; a[1]=1; a[2]=0; a[3]=1;
     b[0]=0; b[1]=1; b[2]=0; b[3]=1;
#170 a[0]=0; a[1]=1; a[2]=1; a[3]=0;
     b[0]=0; b[1]=1; b[2]=1; b[3]=0;
#190 a[0]=0; a[1]=1; a[2]=1; a[3]=1;
     b[0]=0; b[1]=1; b[2]=1; b[3]=1;
#210 a[0]=1; a[1]=0; a[2]=0; a[3]=0;
     b[0]=1; b[1]=0; b[2]=0; b[3]=0;
     
     end
     endmodule