module Vending_machine(
    input wire clk,
    input wire rst,
    input wire [3:0] denomination,
    output reg water_dispensed,
    output reg [3:0] change
);

// States declarations
    parameter IDLE = 3'b000,
              FIVE = 3'b001,
              TEN = 3'b010,
              FIFTEEN = 3'b011,
				  TWENTY = 3'b100;

// Registers used for variable values declaration    
    reg [2:0] current_state, next_state;    
    

// Sequential State transition    
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            current_state <= IDLE;
        end else begin
            current_state <= next_state;
        end
    end 
	 
// Next state logic and output logic
	always@(*) begin
		water_dispensed = 0;
		change = 0;
		
		case(current_state)
				IDLE: begin
					if(denomination == 5)
						next_state = FIVE;
					else if(denomination == 10)
						next_state = TEN;
				end
				
				FIVE: begin
					if(denomination == 5)
						next_state = TEN;
					else if(denomination == 10);
						next_state = TWENTY;
				end
				
				TEN:begin
					if(denomination == 5)
						next_state = FIFTEEN;
					else if (denomination == 10);
						next_state = TWENTY;
				end
				
				FIFTEEN:begin
					water_dispensed = 1;
					if(denomination == 5)
						next_state = FIVE;
					else if(denomination == 10)
						next_state = TEN;
				end
				
				TWENTY:begin
					water_dispensed = 1;
					change = 5;
					if(denomination == 5)
						next_state = FIVE;
					else if(denomination == 10)
						next_state = TEN;
				end
		endcase
	end
endmodule
