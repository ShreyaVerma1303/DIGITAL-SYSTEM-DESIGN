`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2023 08:45:44 PM
// Design Name: 
// Module Name: MOORE_FSM
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


module MOORE_FSM(
    input din,
    input clk,
    input rst,
    output reg y
    );
    reg [2:0] cst,nst;
    localparam s0=3'b000,
               s1=3'b001,
               s2=3'b010,
               s3=3'b100,
               s4=3'b101;
    always@(cst or din)
    begin 
    case(cst)
    s0 : if(din==1'b1)
        begin
        nst = s1;
        y=1'b0;
        end
      else nst = cst;
      s1 : if(din==1'b0)
              begin
              nst = s2;
              y=1'b0;
              end
      else 
      begin
      nst = cst;
      y=1'b0;
      end
       s2 : if(din==1'b1)
                   begin
                   nst = s3;
                   y=1'b0;
                   end
           else 
           begin
           nst = s0;
           y=1'b0;
           end
        s3 : if(din==1'b0)
                        begin
                        nst = s4;
                        y=1'b0;
                        end
                else 
                begin
                nst = s1;
                y=1'b0;
                end
         s4 : if(din==1'b0)
                             begin
                             nst = s1;
                             y=1'b1;
                             end
                     else 
                     begin
                     nst = s3;
                     y=1'b1;
                     end
          default: nst=s0;
          endcase
          end
          always@(posedge clk)
          begin
          if(rst)
          cst<=s0;
          else
          cst<=nst;
          end
endmodule


module testbench;
reg din,clk,rst;
wire y;
    MOORE_FSM dut(din,clk,rst,y);
    initial
    begin
    $monitor("din=%b clk=%b rst=%b y=%b",din,clk,rst,y);
    end
     always
      begin
      #50   clk = ~clk;
      
    
          
        end
    endmodule

