`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/03/2023 08:57:02 PM
// Design Name: 
// Module Name: PARITY_GENERATOR
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


module PARITY_GENERATOR(
    input x,
    input y,
    input z,
    output result
    );
    assign result= x^y^z;
endmodule

module testbench;
reg x,y,z;
wire result;
 
 PARITY_GENERATOR dut(x,y,z,result);
 
 initial
 begin
 $monitor("x=%b y=%b z=%b result=%b",x,y,z,result);
 
  #100 x=0; y=0; z=0;
  #200 x=0; y=0; z=1;
  #300 x=0; y=1; z=0;
  #400 x=0; y=1; z=1;
  #500 x=1; y=0; z=0;
  #600 x=1; y=0; z=1;
  #700 x=1; y=1; z=0;
  #800 x=1; y=1; z=1;
 
 end
 endmodule
 
 