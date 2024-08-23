module Sequence_detector_tb;

    reg clk;
    reg rst;
    reg data_in;
    wire sequence_detected;

    // Instantiate the sequence detector
    Sequence_detector uut (
        .clk(clk),
        .rst(rst),
        .data_in(data_in),
        .sequence_detected(sequence_detected)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    initial begin
        // Initialize signals
        clk = 0;
        rst = 0;
        data_in = 0;

        // Apply reset
        rst = 1;
        #10;
        rst = 0;

        #10 data_in = 1;  
        #10 data_in = 1;  
        #10 data_in = 0;  
        #10 data_in = 1;  
        #10 data_in = 1;  
        #10 data_in = 0;  
        #10 data_in = 1;  

        #10 $finish;
    end

    // Monitor the signals
    initial begin
        $monitor("%t: data_in = %b, detected = %b", $time, data_in, sequence_detected);
    end

endmodule
