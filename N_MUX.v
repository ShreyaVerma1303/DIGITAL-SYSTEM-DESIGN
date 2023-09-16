`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2023 09:29:41 PM
// Design Name: 
// Module Name: N_MUX
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


module N_MUX(
    input [15:0] in,
    input clk,
    input [3:0] sel,
    output reg y
    );
   
    always@(in or sel)
    begin 
    case(sel)
    4'b0000 : y  = in[0];
    4'b0001 : y  = in[1];
    4'b0010 : y  = in[2];
    4'b0011 : y  = in[3];
    4'b0100 : y  = in[4];
    4'b0101 : y  = in[5];
    4'b0110 : y  = in[6];
    4'b0111 : y  = in[7];
    4'b1000 : y  = in[8];
    4'b1001 : y  = in[9];
    4'b1010 : y  = in[10];
    4'b1011 : y  = in[11];
    4'b1100 : y  = in[12];
    4'b1101 : y  = in[13];
    4'b1110 : y  = in[14];
    4'b1111 : y  = in[15];
    default : y  = 4'b0000;
    endcase
    end
endmodule



