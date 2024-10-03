module SIPO_tb#(parameter bitsize=4);
  reg clk, rst, rl, in;
  wire [bitsize-1:0] out;

  SIPO uut (clk, rst, rl, in, out);

  always #5 clk = ~clk; 		// Generate clock signal

  initial begin
    // Apply reset
	 clk = 0;
    rst = 1;
    rl = 0;
    in = 0;
    #10;
    
    // Release reset
    rst = 0;

    rl = 1;
    
    // Shift in 4 bits: 1101
    in = 1; #10;
    in = 1; #10;
    in = 0; #10;
    in = 1; #10;
    
    // Observe output
    $display("Final Output: %b", out);
	 
	 rst = 1;
	 #10 rst = 0;
	 
	 rl = 0;
	 
	 // shift in 4 bits: 1110;
	 in = 0; #10;
    in = 1; #10;
    in = 1; #10;
    in = 1; #10; 
    
    // End simulation
    $finish;
  end

  // Monitor signals
  initial begin
    $monitor("Time: %0t | Reset: %b | rl: %b | in: %b | out: %b", $time, rst, rl, in, out);
  end

endmodule
