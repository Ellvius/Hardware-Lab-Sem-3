
module Vending_machine_tb;
        reg clk;
    reg rst;
    reg denomination;
    
    wire water_dispensed;
    wire change;
    
    // Instantiate the Vending Machine module
    Vending_machine uut (
        .clk(clk),
        .rst(rst),
        .denomination(denomination),
        .water_dispensed(water_dispensed),
        .change(change)
    );
    
    // Clock generation
    always begin
        #5 clk = ~clk; 
    end
    
    initial begin
        clk = 0;
        rst = 0;
        denomination = 0;

        // Apply reset
        rst = 1;
        #10;
        rst = 0;
        #10;
        
        denomination = 1; #10;
        denomination = 1; #10;
        denomination = 1; #10;
        denomination = 0; #10; 
        
        #30;
        
        denomination = 0; #10;
        denomination = 0; #10;
        denomination = 0; #10; 
        
        #30;
        
        denomination = 1; #10;
        denomination = 0; #10;
        denomination = 0; #10; 
        
        #30;
        
        denomination = 0; #10;
        denomination = 1; #10;
        denomination = 0; #10; 
        
        #30;
        
        denomination = 1; #10;
        denomination = 1; #10;
        denomination = 0; #10;
        
        #30;
        
        $finish;
    end
    
endmodule
