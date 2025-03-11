// Author: Alessio Caviglia
// File: rca.v
// Description: A 4-bit ripple carry adder in Verilog
// Module: ripple_carry_adder
// Inputs: A, B, Cin
// Outputs: Sum, Cout

module ripple_carry_adder (A, B, Cin, Sum, Cout);

// Define the input and output ports
input [3:0] A, B;       // 4-bit inputs A and B
input Cin;              // Carry-in input (initial carry)
output [3:0] Sum;       // 4-bit Sum output
output Cout;            // Carry-out output

// Define IO wires
wire [3:0] A, B;        // 4-bit inputs A and B
wire Cin;               // Carry-in input
wire [3:0] Sum;         // 4-bit Sum output
wire Cout;              // Carry-out output

// Internal wires for connecting carries between full adders
wire C1, C2, C3;

// Instantiate the Full Adders
full_adder fa0 (
    .a(A[0]), .b(B[0]), .cin(Cin), .sum(Sum[0]), .cout(C1)
);

full_adder fa1 (
    .a(A[1]), .b(B[1]), .cin(C1), .sum(Sum[1]), .cout(C2)
);

full_adder fa2 (
    .a(A[2]), .b(B[2]), .cin(C2), .sum(Sum[2]), .cout(C3)
);

full_adder fa3 (
    .a(A[3]), .b(B[3]), .cin(C3), .sum(Sum[3]), .cout(Cout)
);

endmodule
