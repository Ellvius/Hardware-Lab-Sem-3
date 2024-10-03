module Custom_register_tb;
reg clk,rst,read_op;
reg [15:0] write_port_1,write_port_2;
wire [15:0] read_port_1;

Custom_register uut(clk,rst,read_op,write_port_1,write_port_2,read_port_1);

// Clock generation
always #5 clk = ~clk;  


initial begin
  // Initialize inputs
  clk = 0;
  rst = 1;       
  read_op = 0;
  write_port_1 = 16'hAAAA;
  write_port_2 = 16'h5555;

  
  #10;
  rst = 0;        // Deactivate reset

  // Test write to write_port_1
  
  read_op = 0;         // Write operation
  #10;            

  // Test read
  read_op = 1;         // Read operation
  #10;

  // Test write to write_port_2 (alternating due to flag)
  read_op = 0;
  #10;

  // Test read again
  read_op = 1;
  #15;
  
  $finish;
end

initial begin
  $monitor("Time: %0d, rst: %b, read_op: %b, write_port_1: %h, write_port_2: %h, read_port_1: %h", 
            $time, rst, read_op, write_port_1, write_port_2, read_port_1);
end

endmodule
