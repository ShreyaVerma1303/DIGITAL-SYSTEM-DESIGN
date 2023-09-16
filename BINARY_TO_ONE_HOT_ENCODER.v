`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/03/2023 09:43:54 PM
// Design Name: 
// Module Name: BINARY_TO_ONE_HOT_ENCODER
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


module BINARY_TO_ONE_HOT_ENCODER(
    input [2:0] bin_i,
    output [7:0] one_hot_o
    );
    parameter bin_w=4;
    parameter one_hot_w=16;
    input [1:0] bin_i;
    output reg [1:0] one_hot_o;
    
    assign one_hot_o = (1<<bin_i);
endmodule

module testbench;
reg [1:0] bin_i;
wire [1:0] one_hot_o;

BINARY_TO_ONE_HOT_ENCODER dut(bin_i,one_hot_o);

initial
begin
$monitor("bin_i=%b one_hot_o=%b",bin_i,one_hot_o);

#100 bin_i[0]=0; bin_i[1]=0;
#200 bin_i[0]=0; bin_i[1]=1;
#300 bin_i[0]=1; bin_i[1]=0;
#400 bin_i[0]=1; bin_i[1]=1;

end
endmodule