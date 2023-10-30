`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2023 04:18:53 PM
// Design Name: 
// Module Name: BCD_TIMECOUNT
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
module BCD_TIMECOUNT (
    input wire clk,      
    input wire rst,      
    output wire [3:0] bcd_seconds,  
    output wire [3:0] bcd_minutes,  
    output wire [3:0] bcd_hours     
);
reg [3:0] seconds_reg = 4'b0000;  
reg [3:0] minutes_reg = 4'b0000;   
reg [3:0] hours_reg   = 4'b0000;   
reg [23:0] count = 0;              
always @(posedge clk or posedge rst) begin
    if (rst) begin
        seconds_reg <= 4'b0000;
        minutes_reg <= 4'b0000;
        hours_reg   <= 4'b0000;
        count <= 0;
    end else if (count == 1000000) begin
        seconds_reg <= seconds_reg + 1;
        count <= 0;
    end else if (seconds_reg == 10) begin
        
        seconds_reg <= 4'b0000;
        minutes_reg <= minutes_reg + 1;
    end else if (minutes_reg == 10) begin
      
        minutes_reg <= 4'b0000;
        hours_reg   <= hours_reg + 1;
    end else begin
      
        count <= count + 1;
    end
end
assign bcd_seconds = seconds_reg;
assign bcd_minutes = minutes_reg;
assign bcd_hours   = hours_reg;
endmodule


module testbench;

reg clk;
reg rst;
wire [3:0] bcd_seconds;
wire [3:0] bcd_minutes;
wire [3:0] bcd_hours;


BCD_TIMECOUNT uut (
    .clk(clk),
    .rst(rst),
    .bcd_seconds(bcd_seconds),
    .bcd_minutes(bcd_minutes),
    .bcd_hours(bcd_hours)
);


always begin
    #5 clk = ~clk;
end

initial begin
    clk = 0;
    rst = 1;
    #10 rst = 0; 
    #1000 $finish; 

end
always @(posedge clk) begin
    $display("Time: %d%d:%d%d:%d%d", bcd_hours, bcd_hours, bcd_minutes, bcd_minutes, bcd_seconds, bcd_seconds);
end

endmodule


