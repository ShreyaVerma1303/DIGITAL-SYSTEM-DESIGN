module JOHNSON_COUNTER(
    input [3:0] Width,
    input Clk,
    input Rst,
    output reg [3:0] Count
    );
  
    always@(posedge Clk)
    begin
    if(Rst)
    Count={~Count[0],Count[3:1]};
    else
    Count=4'b0001;
    end
endmodule


