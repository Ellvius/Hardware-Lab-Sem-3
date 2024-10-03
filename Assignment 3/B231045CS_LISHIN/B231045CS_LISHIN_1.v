module SIPO #(parameter bitsize=4)(clk,rst,rl,in,out);
input clk,rst,rl,in;
output reg [bitsize-1:0]out;  // parallel output
reg [bitsize-1:0]temp;

initial temp='b0;

always@(posedge clk) begin
	if(rst) begin
		temp <= 'b0;
		out <= 'b0;
	end
	
	else if (rl) begin  //!rl indicates left shift
		out <= {temp[bitsize-2:0],in};
		temp <= {temp[bitsize-2:0],in};
	end
	
	else begin  //rl indicates right shift
		out <= {in,temp[bitsize-1:1]};
		temp <= {in,temp[bitsize-1:1]};
	end
end

endmodule
