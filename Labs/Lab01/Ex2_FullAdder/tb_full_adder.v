// Author: Alessio Caviglia
// File: tb_full_adder.v
// Description: Testbench for a simple full adder in Verilog
// Module: tb_full_adder
// Inputs: none
// Outputs: none

module tb_full_adder;
    
// Declare variables to drive the inputs
reg a;
reg b;
reg cin;
wire sum;
wire cout;

// Instantiate the full_adder module
full_adder dut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
);

// Create a VCD file for waveform dumping
initial begin
    $dumpfile("full_adder.vcd");            // Specify the name of the VCD file
    $dumpvars(0, tb_full_adder);    // Dump all variables in the testbench

    // Test case 1: a = 0, b = 0, cin = 0
    a = 0; b = 0; cin = 0;
    #10;  // Wait for 10 time units
    // Test case 2: a = 0, b = 0, cin = 1
    a = 0; b = 0; cin = 1;
    #10;
    // Test case 3: a = 0, b = 1, cin = 0
    a = 0; b = 1; cin = 0;
    #10;
    // Test case 4: a = 0, b = 1, cin = 1
    a = 0; b = 1; cin = 1;
    #10;
    // Test case 5: a = 1, b = 0, cin = 0
    a = 1; b = 0; cin = 0;
    #10;
    // Test case 6: a = 1, b = 0, cin = 1
    a = 1; b = 0; cin = 1;
    #10;
    // Test case 7: a = 1, b = 1, cin = 0
    a = 1; b = 1; cin = 0;
    #10;
    // Test case 8: a = 1, b = 1, cin = 1
    a = 1; b = 1; cin = 1;
    #10;
    // End the simulation
    $finish;
end

endmodule
