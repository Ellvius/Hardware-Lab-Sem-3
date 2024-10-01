# Hardware Lab Assignment 3

1. **Design and implement a Serial in Parallel out (SIPO) shift register using Verilog**
   
2. **Design and implement a register in Verilog for a custom processor's architecture with the following specifications:**
   - It should be a 16-bit register.
   - It should have one read port (`read_port_1`) and two write ports (`write_port_1` and `write_port_2`).
   - Only one operation, either read or write, can be performed at a time on the register. However, write operations can be performed from write ports alternatively; i.e., if a previous write is done using `write_port_1`, then the next write will be done using `write_port_2`, and vice versa.
   - Each read port should be able to access data from the register without any conflicts with write operations.

   *Please note that you should define the module with appropriate input and output ports and ensure that it meets all the specified requirements above.*

3. **Design and implement an up-down synchronous counter using Verilog**

4. **Design and implement a Binary Coded Decimal (BCD) counter using Verilog**
