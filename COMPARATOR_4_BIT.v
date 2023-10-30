`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2023 09:57:35 PM
// Design Name: 
// Module Name: COMPARATOR_4_BIT
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

module mux4X1(
input in0,in1,in2,in3,s1,s0,
output out
);
assign out= s1 ? (s0 ? in3 : in2) : (s0 ? in1 : in0);
endmodule

module COMPARATOR_4_BIT(
input a,b,
output greater,lesser,equal
);
mux4X1 mux1(1'b0,1'b1,1'b0,1'b0,a,b,lesser);
mux4X1 mux2(1'b1,1'b0,1'b0,1'b1,a,b,equal);
mux4X1 mux3(1'b0,1'b0,1'b1,1'b0,a,b,greater);
endmodule


module comparator_4bit_tb;
  parameter DATA_WIDTH = 4;
  reg [DATA_WIDTH-1:0] data_A;
  reg [DATA_WIDTH-1:0] data_B;
  reg [1:0] select;
  wire result;
  comparator_4bit uut (
    .data_A(data_A),
    .data_B(data_B),
    .select(select),
    .result(result)
  );
  initial begin
    data_A = 4'b0101;
    data_B = 4'b1010;
    select = 2'b00;
    #10; 
    $display("Test case 1: data_A = %b, data_B = %b, select = %b, result = %b", data_A, data_B, select, result);
    data_A = 4'b1111;
    data_B = 4'b1111;
    select = 2'b01;
    #10; 
    $display("Test case 2: data_A = %b, data_B = %b, select = %b, result = %b", data_A, data_B, select, result);
    $finish;
  end
endmodule


