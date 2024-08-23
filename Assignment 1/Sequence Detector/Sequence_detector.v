//Verilog code to detect 1101 sequence
module Sequence_detector(
	input wire clk,
   input wire rst,
   input wire data_in,
   output reg sequence_detected
);

// States declaration

	parameter IDLE = 3'b000,
				 STATE1 = 3'b001,
				 STATE2 = 3'b010,
				 STATE3 = 3'b011,
				 STATE4 = 3'b100;
			 
// Registers used for variable values declaration	
	reg [2:0] current_state, next_state;
	
	
// Sequential State transition	
	always@(posedge clk or posedge rst) begin
		if(rst)
			current_state <= IDLE;
			
		else
			current_state <= next_state;
	
	end
	
	
// Next state logic and output logic
	always@(current_state, data_in) begin
	
		sequence_detected = 0;
		
		case(current_state)
			IDLE: begin
				if(data_in)
					next_state = STATE1;
				else
					next_state = IDLE;
			end
			
			STATE1: begin
				if(data_in)
					next_state = STATE2;
				else
					next_state = IDLE;
			end
			
			STATE2: begin
				if(data_in)
					next_state = STATE2;
				else
					next_state = STATE3;
			end
			
			STATE3: begin
				if(data_in)
					next_state = STATE4;
				else 
					next_state = IDLE;
			end
			
			STATE4: begin
				sequence_detected = 1;	// Sequence 1101 is detected
				if(data_in)
					next_state = STATE2;
				else
					next_state = IDLE;
			end
			
			default: 
				next_state = IDLE;
			
		endcase
	end


endmodule
