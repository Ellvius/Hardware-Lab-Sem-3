
// Testbench for 8-bit subtractor
module subtractor_8bit_tb;
reg [7:0]a,b;
wire [7:0]dif;
wire borrow;

subtractor_8bit uut(a,b,dif,borrow);

initial begin
a = 70; b = 55;
#10
a = 100; b = 60;
#10
a = 19; b = 0;
#10
a = 100; b = 99;
#10
$finish();
end

endmodule