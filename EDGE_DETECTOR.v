`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2023 08:38:18 AM
// Design Name: 
// Module Name: EDGE_DETECTOR
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


module EDGE_DETECTOR(
    input data,
    input clk,
    output edge_detect
    );
    reg data_d;
    always@(posedge clk)
    begin
    data_d <= data;
    end
    assign edge_detect= data & ~data_d;
endmodule

module testbench;
reg data,clk;
wire edge_detect;
    EDGE_DETECTOR dut(data,clk,edge_detect);
    initial
    begin
    $monitor("data=%b clk=%b edge_detect=%b",data,clk,edge_detect);
    end
     always
      begin
      #50   clk = ~clk;
      
    
          
        end
    endmodule
