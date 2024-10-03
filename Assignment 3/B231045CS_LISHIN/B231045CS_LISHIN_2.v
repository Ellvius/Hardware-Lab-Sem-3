module Custom_register(clk,rst, read_op, write_port_1, write_port_2, read_port_1);
input clk, rst, read_op;
input [15:0] write_port_1, write_port_2;
output reg [15:0] read_port_1;

reg [15:0] temp; 		// temporary register to store the write port data
reg fl;					// flag to alternate the write ports

always @(posedge clk or posedge rst) begin
	if(rst) begin
		temp <= 0;
		read_port_1 <= 'bx;
		fl <= 1'b1;
	end
	
	else if (read_op) begin
		read_port_1 <= temp;
	end
	
	else begin
		read_port_1 <= 'bx;
		
		if(fl) begin
			temp <= write_port_1;
		end
		else begin
			temp <= write_port_2;
		end
		
		fl <= ~fl;
	end
end

endmodule
