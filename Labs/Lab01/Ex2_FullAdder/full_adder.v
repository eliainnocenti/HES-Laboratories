// Author: Alessio Caviglia
// File: full_adder.v
// Description: A simple full adder in Verilog
// Module: full_adder
// Inputs: a, b, cin
// Outputs: sum, cout

module full_adder (a, b, cin, sum, cout);

// Define the input and output ports
input a, b, cin;                        // Inputs
output sum, cout;                       // Outputs

// Define IO wires and registers
wire a, b, cin;                         // INPUTS - defined as wires
wire sum, cout;                          // OUTPUTS - defined as wire since they are assigned in an assign block

// Logic for sum and carry-out
assign sum = a ^ b ^ cin;               // XOR for sum
assign cout = (a & b) | (b & cin) | (a & cin);  // Carry-out logic

endmodule
