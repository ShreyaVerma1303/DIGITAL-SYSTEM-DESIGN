`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2023 09:20:23 AM
// Design Name: 
// Module Name: SUBTRACTOR_8_BIT
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


module SUBTRACTOR_8_BIT(
    input [7:0] a,
    input [7:0] b,
    output reg [7:0] result
    );
    
    reg neg_b;
    always@(a or b)
    begin
    neg_b = ~ b + 1;
    result = a + neg_b;
    end
endmodule

module testbench;
reg [7:0] a,b;
wire [7:0] result;
SUBTRACTOR_8_BIT dut(a,b,result);

initial 
begin
$monitor("a=%b b=%b result=%b",a,b,result);
#100 a[0]=1; a[1]=0; a[2]=1; a[3]=0; a[4]=1; a[5]=0; a[6]=1; a[7]=0;
     b[0]=1; b[1]=1; b[2]=0; b[3]=1; b[4]=0; b[5]=1; b[6]=1; b[7]=1;
#300 a[0]=0; a[1]=0; a[2]=0; a[3]=1; a[4]=1; a[5]=0; a[6]=1; a[7]=0;
     b[0]=1; b[1]=1; b[2]=1; b[3]=0; b[4]=1; b[5]=1; b[6]=1; b[7]=1;
     end
     endmodule