`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2023 06:57:35 PM
// Design Name: 
// Module Name: N_BIT_COMPARATOR
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


module N_BIT_COMPARATOR(
    input [1:0]a,
    input [1:0] b,
    output L,
    output G,
    output E
    );
   parameter n=32;
    /*input [1:0]a,b;
    output L,G,E;*/
    reg L=0, G=0, E=0;
    always@(a,b)
    begin
    if(a>b)
    begin
    L=0; E=0; G=1;
    end
    else if (a<b)
    begin
    L=1; E=0; G=0;
    end
    else
    begin
    L=0; E=1; G=0;
    end
    end
endmodule

/*module testbench;
reg [1:0] a,b;
wire L,E,G;
N_BIT_COMPARATOR dut(a,b,L,E,G);
initial
begin
$monitor("a=%b b=%b L=%b E=%b G=%b",a,b,L,E,G);
#100 a[0]=0; a[1]=0;
     b[0]=0; b[1]=0;
#200 a[0]=0; a[1]=1;
     b[0]=0; b[1]=1;
#300 a[0]=1; a[1]=0;
     b[0]=1; b[1]=0;
#400 a[0]=1; a[1]=1;
     b[0]=1; b[1]=1;
#500 a[0]=0; a[1]=0;
     b[0]=0; b[1]=0;
#600 a[0]=0; a[1]=1;
     b[0]=0; b[1]=1;
     end
     endmodule*/