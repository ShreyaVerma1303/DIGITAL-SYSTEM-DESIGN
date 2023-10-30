`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2023 10:17:32 PM
// Design Name: 
// Module Name: SHIFT_ROTATE
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


module SHIFT_ROTATE(
    input wire [7:0] a,
    input wire [2:0] opcode,
    output reg [7:0] result
    );
    
    
    parameter sra_op = 3'b000,
    srl_op = 3'b001,
    sla_op = 3'b010,
    sll_op = 3'b011,
    ror_op = 3'b100,
    rol_op = 3'b101;
    
    always@(a or opcode)
    begin
    case(opcode)
    sra_op : result = {a[7], a[7], a[6], a[5], a[4], a[3], a[2], a[1]};
    srl_op : result = a>>1;
    sla_op : result = {a[6], a[5], a[4], a[3], a[2], a[1], a[0], 1'b0};
    sll_op : result = a<<1;
    ror_op : result = {a[0], a[7], a[6], a[5], a[4], a[3], a[2], a[1]};
    rol_op : result = {a[6], a[5], a[4], a[3], a[2], a[1], a[0], a[7]};
    default : result = 0;
    endcase
    end
endmodule

module SHIFT_ROTATE_tb;
  reg [3:0] data_in;
  reg [1:0] shift_type; 
  wire [3:0] data_out;
  SHIFT_ROTATE uut (
    .data_in(data_in),
    .shift_type(shift_type),
    .data_out(data_out)
  );
  initial begin
    data_in = 4'b1100;
    shift_type = 2'b00;
    #10;
    $display("Logical Right Shift: data_in = %b, data_out = %b", data_in, data_out);
    
    data_in = 4'b1101;
    shift_type = 2'b01;
    #10;
    $display("Arithmetic Right Shift: data_in = %b, data_out = %b", data_in, data_out);
    data_in = 4'b1100;
    shift_type = 2'b10;
    #10;
    $display("Rotate Left: data_in = %b, data_out = %b", data_in, data_out);
    $finish;
  end

endmodule

