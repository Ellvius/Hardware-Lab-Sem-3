`timescale 1ns / 1ps 

module Dlatch_8bit_tb;

   reg [7:0] d;
   reg enable;
   reg reset;
   wire [7:0] result;

   Dlatch_8bit dlatch(d,enable,reset,result);

initial begin

	$monitor("Time=%0t | reset=%b | enable=%b | d=%b | q=%b", $time, reset, enable, d, result);
      d = 8'b00000000;
      enable = 0;
      reset = 0;

      #10 reset = 1;
      #10 reset = 0;

      #10 reset = 1;
      d = 8'b10101010;
      enable = 0;

      #10 enable = 1;
      #10 enable = 0;

      #10 d = 8'b11001100;

      #10 enable = 1;

      #10 reset = 0;
      #10 reset = 1;

      #20 $finish;
end

endmodule
