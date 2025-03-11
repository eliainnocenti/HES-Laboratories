// Author: Alessio Caviglia
// File: full_adder.v
// Description: A simple full adder in Verilog
// Module: full_adder
// Inputs: a, b, cin
// Outputs: sum, cout

module counter_4bit (clk, reset, count);

// Define the input and output ports
input clk, reset;                       // Inputs
output [3:0] count;                     // Outputs

// Define IO wires and registers
wire clk, reset;                        // INPUTS - defined as wires
reg [3:0] count;                        // OUTPUT - defined as reg since it is assigned in an always block

// On the rising edge of the clock or when reset is asserted
always @(posedge clk or posedge reset) begin
    if (reset) begin
        count <= 4'b0000;  // Reset counter to 0000
    end else begin
        count <= count + 1;  // Increment counter
    end
end

endmodule
