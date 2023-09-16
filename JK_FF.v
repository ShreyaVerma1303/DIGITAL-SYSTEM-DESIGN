`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2023 09:47:44 PM
// Design Name: 
// Module Name: JK_FF
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


module JK_FF(
    input j,
    input k,
    input clk,
    output reg q,
    output q_bar
    );
    assign q_bar=~q;
    always@(posedge clk)
    begin
    case({j,k})
    2'b00: q<=q;
    2'b01: q<=0;
    2'b10: q<=1;
    2'b11: q<=~q;
    endcase
    end
endmodule

module master_slave(
    input s,r,clk,
    output qn,qn_bar
    );
    wire mq;
    wire mq_bar;
    wire mclk;
    assign mclk=~clk;
    JK_FF master(s,r,clk,mq,mq_bar);
    JK_FF slave(mq,mq_bar,mclk,qn,qn_bar);
   endmodule    
