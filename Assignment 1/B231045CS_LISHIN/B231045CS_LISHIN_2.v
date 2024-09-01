module Vending_machine(
    input wire clk,
    input wire rst,
    input wire [3:0] denomination,
    output reg water_dispensed,
    output reg [3:0] change
);

// States declarations
    parameter IDLE = 2'b00,
              ACCEPTING_COINS = 2'b01,
              DISPENSING_WATER = 2'b10,
              RETURNING_CHANGE = 2'b11;

// Registers used for state and total amount    
    reg [1:0] current_state, next_state;    
    reg [4:0] total;  // Use 5 bits to store values from 0 to 20

// Sequential State transition    
    always @(posedge clk or posedge rst) begin
        if (rst)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end    
    
// Next state logic and output logic
    always @(*) begin
        // default outputs
        water_dispensed = 0;
        change = 0;
        next_state = current_state; 
        
        case (current_state)
            IDLE: begin
                total = 0;
                if (denomination == 5 || denomination == 10) begin
                    total = denomination; 
                    next_state = ACCEPTING_COINS;
                end
            end
            
            ACCEPTING_COINS: begin
                if (denomination == 5 || denomination == 10) begin
                    total = total + denomination;
                end
                
                if (total >= 15) begin
                    next_state = DISPENSING_WATER;
                end
            end
            
            DISPENSING_WATER: begin
                water_dispensed = 1;
                if (total > 15) begin
                    next_state = RETURNING_CHANGE;
                end else begin
                    next_state = IDLE;
                end
            end
            
            RETURNING_CHANGE: begin
                change = total - 15;
                total = 0;
                next_state = IDLE;
            end
            
            default: begin
                next_state = IDLE;
            end
        endcase
    end

endmodule
