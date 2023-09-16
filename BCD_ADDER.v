
module BCD_Adder(
    input [3:0] A,
    input [3:0] B,
    output reg [3:0] Sum,
    output reg CarryOut
);

always @(*) begin
    Sum = A + B;
    if (Sum >= 10) begin
        Sum = Sum - 10;
        CarryOut = 1;
    end else begin
        CarryOut = 0;
    end
end

endmodule


module BCD_Adder_Testbench;
reg [3:0] A, B;
wire [3:0] Sum;
wire CarryOut;
BCD_Adder uut(
    .A(A),
    .B(B),
    .Sum(Sum),
    .CarryOut(CarryOut)
);
initial begin
    $display("Testing BCD Adder");
    
  
    A = 4'b0101;
    B = 4'b0011;
    #10 $display("A = %b, B = %b, Sum = %b, CarryOut = %b", A, B, Sum, CarryOut);
   
    A = 4'b1001;
    B = 4'b1001;
    #10 $display("A = %b, B = %b, Sum = %b, CarryOut = %b", A, B, Sum, CarryOut);
 
    A = 4'b0000;
    B = 4'b0000;
    #10 $display("A = %b, B = %b, Sum = %b, CarryOut = %b", A, B, Sum, CarryOut);
    
    $finish;
end
endmodule
