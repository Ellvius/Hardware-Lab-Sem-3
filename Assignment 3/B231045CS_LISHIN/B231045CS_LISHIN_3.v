module Updown_synchronous_counter #(parameter bit = 8)(clk, rst, up_down, count);
// input output specification
input clk, rst, up_down;
output reg [bit-1:0]count;

always @(posedge clk or posedge rst) begin
	if(rst) begin
		count <= 0;
	end
	
	else begin
		if(up_down) begin
			count <= count + 1;		// incrementor
		end
		
		else begin
			count <= count - 1;		// decrementor
		end
	end
end

endmodule
