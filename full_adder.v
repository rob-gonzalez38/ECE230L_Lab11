// Implement module called full_adder
module full_adder(
    // Declare inputs
input wire A, B, Cin,

    // Declare outputs
output Y, Cout

);

    // Enter logic equation here
assign Y = A ^ B ^ Cin;
assign Cout = (A & B) | (A & Cin) | (B & Cin);

endmodule