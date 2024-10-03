module BCD_counter (clk, rst, count);
// Input output declaration
input clk, rst;
output reg[3:0]count;

always @(posedge clk or posedge rst) begin
	if(rst) begin
		count <= 0;
	end
	
	else if (count == 9) begin
		count <= 0;						// reset count to 0 when it exceeds 9
	end				
	
	else begin
		count <= count + 1;
	end
end
endmodule

