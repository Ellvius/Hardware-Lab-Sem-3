module adder_8bit_tb;
reg [7:0]a,b;
wire [7:0]sum;
wire carry;

adder_8bit uut(a,b,sum,carry);

integer i,j;

initial begin

    $monitor("Time: %0t | a = %d | b = %d | sum = %d | carry = %b", $time, a, b, sum, carry);
    
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
