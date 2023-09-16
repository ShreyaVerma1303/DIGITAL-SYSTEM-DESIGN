`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/01/2023 09:30:47 PM
// Design Name: 
// Module Name: Clock_divider
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

module Clock_Divider(
    input Clk,
    input Rst,
    output reg [3:0] Count,
    output reg D2,D4,D8,D16
    );
    always@(posedge Clk)
    begin 
    if (Rst==0)
    Count=4'b0000;
    else
    Count=Count+1;
    D2=Count[0];
    D4=Count[1];
    D8=Count[2];
    D16=Count[3];
    end
    
endmodule

module testbench;
reg Clk,Rst;
wire [3:0] Count;
wire D2,D4,D8,D16;

Clock_Divider dut(Clk,Rst,Count,D2,D4,D8,D16);
initial
begin
$monitor("Clk=%b Rst=%b Count=%b D2=%b D4=%b D8=%b D16=%b",Clk,Rst,Count,D2,D4,D8,D16);
end
 always
  begin
  #50   Clk = ~Clk;
  end
initial 
begin
      #100 Rst = 1;
      #100 Rst = 0;
       
      
      $finish;
    end
endmodule
