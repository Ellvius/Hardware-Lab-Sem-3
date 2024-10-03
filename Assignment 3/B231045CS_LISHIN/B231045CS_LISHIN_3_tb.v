module Updown_synchronous_counter_tb #(parameter bit = 8);
reg clk, rst, up_down;
wire [bit-1:0]count;

// Module instantiation
Updown_synchronous_counter uut(clk, rst, up_down, count);

always #5 clk = ~clk;

initial begin
	// Initialize inputs
	clk = 0;
	rst = 1;
	up_down = 0;
	
	// Apply reset
	#10 rst = 0;
	
	// Count up 
	up_down = 1;
	#100 				// 10 clk cycles
	
	// Count down
	up_down = 0;
	#100
	
	// Finish
	$finish;
	
end

initial begin
	$monitor("Time = %t, reset = %b, Updown = %b, Count = %d", $time, rst, up_down, count);
end

endmodule
