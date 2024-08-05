///    	ALU 8-bit TESTBENCH     ///

module ALU_8bit_tb;
reg [7:0]a,b;
reg [1:0]op;
wire [7:0]res;

ALU_8bit uut(a,b,op,res);

initial begin
// Test case 1: Addition (op = 2'b00)
    a = 8'd15;
    b = 8'd10;
    op = 2'b00;
    #10;
    
    // Test case 2: Subtraction (op = 2'b01)
    a = 8'd20;
    b = 8'd5;
    op = 2'b01;
    #10;
    
    // Test case 3: Bitwise XOR (op = 2'b10)
    a = 8'b10101010;
    b = 8'b11001100;
    op = 2'b10;
    #10;
    
    // Test case 4: Left Shift (op = 2'b11)
    a = 8'b00001111;
    b = 8'd0; 
    op = 2'b11;
    #10;
	 
	 $finish();
end

endmodule
