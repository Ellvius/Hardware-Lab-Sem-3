///    	ALU 8-bit TESTBENCH     ///

module ALU_8bit_tb;
reg [7:0]a,b;
reg [1:0]op;
wire [7:0]res;
wire bc;

ALU_8bit uut(a,b,op,res,bc);

integer i, j, k;

initial begin

	$monitor("a=%d	| b=%d | op=%b | result=%d | bs = %b\n", a, b, op, res, bc);
	
	for( i=0; i<100; i=i+1)begin
		for(j=0;j<100; j=j+1)begin
			for(k=0; k<4; k=k+1)begin
			a=i;
			b=j;
			op=k;
			#10;
			end
		end
	end

	 $finish();
end

endmodule
