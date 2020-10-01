`timescale 1ns / 1ps


//Add four 4-bit Vectors
module VectorAddition #(parameter BITS=4) (
    input wire [1:BITS]in1,
    input wire [1:BITS]in2,
    input wire [1:BITS]in3,
    input wire [1:BITS]in4,
    output reg [1:BITS]out
);

always @ (*) begin
    out = in1 ^ in2;
    out = out ^ in3;
    out = out ^ in4;
end

endmodule