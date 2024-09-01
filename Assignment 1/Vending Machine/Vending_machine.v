module Vending_machine(
    input wire clk,
    input wire rst,
    input wire denomination,  // Assume 1 for Rs. 5, 0 for Rs. 10
    output reg water_dispensed,
    output reg change
);

// State declarations
parameter IDLE = 2'b00,
          ACCEPTING_COINS = 2'b01,
          DISPENSING_WATER = 2'b10,
          RETURNING_CHANGE = 2'b11;

// Registers used for state and total amount    
reg [1:0] current_state, next_state;    
reg [4:0] total;  // Use 5 bits to store values from 0 to 20

// Sequential State Transition    
always @(posedge clk or posedge rst) begin
    if (rst)
        current_state <= IDLE;
    else
        current_state <= next_state;
end    

// Next state logic and output logic
always @(*) begin
    // Default outputs
    water_dispensed = 0;
    change = 0;
    next_state = current_state;  // Keep the current state by default
    
    case (current_state)
        IDLE: begin
            total = 0;

            if (denomination)  // Rs. 5 coin inserted
                total = 5;
            else  // Rs. 10 coin inserted
                total = 10;
            
            next_state = ACCEPTING_COINS;
        end
        
        ACCEPTING_COINS: begin
            if (denomination)  // Rs. 5 coin inserted
                total = total + 5;
            else  // Rs. 10 coin inserted
                total = total + 10;
                
            if (total >= 15)
                next_state = DISPENSING_WATER;
        end
        
        DISPENSING_WATER: begin
            water_dispensed = 1;
            if (total > 15)
                next_state = RETURNING_CHANGE;
            else
                next_state = IDLE;
        end
        
        RETURNING_CHANGE: begin
            change = 1;
            total = 0;
            next_state = IDLE;
        end
        
        default: begin
            next_state = IDLE;
        end
    endcase
end

endmodule
