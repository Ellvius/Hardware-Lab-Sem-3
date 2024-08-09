
// Testbench for 8-bit subtractor
module subtractor_8bit_tb;
reg [7:0]a,b;
wire [7:0]dif;
wire borrow;

subtractor_8bit uut(a,b,dif,borrow);
integer i, j;

initial begin
$monitor("Time: %0t | a = %d | b = %d | difference = %d | borrow = %b", $time, a, b, dif, borrow);
    
    for (i = 0; i < 256; i = i + 1) begin
        for (j = 0; j < 256; j = j + 1) begin
            a = i;
            b = j;
            #10; 
        end
    end
$finish();
end

endmodule