module BCD_counter_tb;
// Input Output declaration
reg clk, rst;
wire [3:0]count;

// Instantiate the module
BCD_counter uut(clk, rst, count);

always #5 clk = ~clk;			// clk signal generation

initial begin
	// Initialize the values
	clk = 0;
	rst = 1;
	
	//remove reset
	#10 rst = 0;
	
	#250 $finish;
end

initial begin
	$monitor("Time = %t, reset = %b, count = %d", $time, rst, count);
end

endmodule

