`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2023 05:37:51 PM
// Design Name: 
// Module Name: 3_1_MUX
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


module MUX_3_1(
    input A,
    input B,
    input C,
    input [1:0] S,
    output reg Y
    );
    always@(A or B or C or S)
    begin
    if(S==2'b00)
    Y=A;
    else if (S==2'b01)
    Y=B;
    else if (S==2'b10)
    Y=C;
    else
    Y=C;
    end
endmodule

module tb_MUX_3_1;
    reg [2:0] A;
    reg [2:0] B;
    reg [2:0] C;
    reg [1:0] S;
    wire [2:0] Y;
    MUX_3_1 uut (
        .A(A),
        .B(B),
        .C(C),
        .S(S),
        .Y(Y));
    initial begin
        $display("Testing 3-to-1 Multiplexer");
        A = 3'b101;
        B = 3'b010;
        C = 3'b110;
        S = 2'b00;
        #10;
        if (Y !== A)
            $display("Test case 1 failed");
        A = 3'b101;
        B = 3'b010;
        C = 3'b110;
        S = 2'b01;
        #10;
        if (Y !== B)
            $display("Test case 2 failed");
        A = 3'b101;
        B = 3'b010;
        C = 3'b110;
        S = 2'b10;
        #10;
        if (Y !== C)
            $display("Test case 3 failed");
 $finish;
    end
endmodule

