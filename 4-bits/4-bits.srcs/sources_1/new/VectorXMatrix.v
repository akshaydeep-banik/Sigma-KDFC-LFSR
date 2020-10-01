`timescale 1ns / 1ps


//Vector x Matrix (1x4 vector multiplied with 4x4 matrix)
module VectorXMatrix #(parameter BITS = 8) (
    input wire [1:BITS]vector,
    input wire [1:BITS]matrix_1,          input wire [1:BITS]matrix_5,
    input wire [1:BITS]matrix_2,          input wire [1:BITS]matrix_6,
    input wire [1:BITS]matrix_3,          input wire [1:BITS]matrix_7,
    input wire [1:BITS]matrix_4,          input wire [1:BITS]matrix_8,
    output reg [1:BITS]out
);

reg [1:BITS]B[1:BITS];
integer i, j;

always @ (*) begin
    
    out = 0;
    B[1] = matrix_1;          B[5] = matrix_5;
    B[2] = matrix_2;          B[6] = matrix_6;
    B[3] = matrix_3;          B[7] = matrix_7;
    B[4] = matrix_4;          B[8] = matrix_8;
    
    for(j=1; j<=BITS; j=j+1) begin
        for(i=1; i<=BITS; i=i+1) begin
            out[j] = (out[j])^(vector[i]&B[i][j]);
        end
    end
    
end

endmodule
