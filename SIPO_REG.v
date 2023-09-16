`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2023 09:10:00 PM
// Design Name: 
// Module Name: SIPO_REG
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


module PIPO_REG(
    input clk,
    input clear,
    input [3:0] din,
    output reg [3:0] dout
    );
    always@(posedge clk)
    begin
    if(clear)
    dout <= 4'b0000;
    else
    dout <= din;
    end
endmodule

module testbench;
reg clk,clear;
reg [3:0] din;
wire [3:0] dout;

PIPO_REG dut(clk,clear,din,dout);
initial
begin
$monitor("clk=%b clear=%b din=%b dout=%b",clk,clear,din,dout);

#100 din[0]=0; din[1]=0; din[2]=0; din[3]=0;
#200 din[0]=0; din[1]=0; din[2]=0; din[3]=1;
#300 din[0]=0; din[1]=0; din[2]=1; din[3]=0;
#400 din[0]=0; din[1]=0; din[2]=1; din[3]=1;
#500 din[0]=0; din[1]=1; din[2]=0; din[3]=0;
#600 din[0]=0; din[1]=1; din[2]=0; din[3]=1;
end
endmodule