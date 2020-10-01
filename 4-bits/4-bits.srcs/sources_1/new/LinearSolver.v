`timescale 1ns / 1ps

// Linear Solver (Algorithm 2)
// Inputs a vector c and another vector a having the coefficients of primitive polyinomals to build the companion matrix.
module LinearSolver #(parameter BITS=6) (
    input wire [1:BITS]c,
    input wire [1:BITS]a,
    
    output reg [1:BITS]lambda_1,
    output reg [1:BITS]lambda_2,
    output reg [1:BITS]lambda_3,
    output reg [1:BITS]lambda_4,
    output reg [1:BITS]lambda_5,
    output reg [1:BITS]lambda_6,
    output reg [1:BITS]lambda_7,
    output reg [1:BITS]lambda_8  
);

wire [1:BITS]A[1:BITS];
wire [1:BITS]X[1:BITS];
wire [1:BITS]lambda[1:BITS];
wire [1:BITS]y;

reg [1:BITS]e;
integer i;

CompanionMatrix #(.BITS(BITS)) companion_matrix (
    .in(a),           //primitive polynmial coefficients 
    .out_1(A[1]), 
    .out_2(A[2]), 
    .out_3(A[3]), 
    .out_4(A[4]),
    .out_5(A[5]), 
    .out_6(A[6]), 
    .out_7(A[7]), 
    .out_8(A[8])
);

Step1 #(.BITS(BITS)) create_X (
    .vector(c),
    .matrix_1(A[1]),        .out_1(X[1]),
    .matrix_2(A[2]),        .out_2(X[2]),
    .matrix_3(A[3]),        .out_3(X[3]),
    .matrix_4(A[4]),        .out_4(X[4]),
    .matrix_5(A[5]),        .out_5(X[5]),
    .matrix_6(A[6]),        .out_6(X[6]),
    .matrix_7(A[7]),        .out_7(X[7]),
    .matrix_8(A[8]),        .out_8(X[8])   
);

Step2 #(.BITS(BITS)) create_y (
    .vector(e),
    .matrix_1(X[1]),
    .matrix_2(X[2]),
    .matrix_3(X[3]),
    .matrix_4(X[4]),
    .matrix_5(X[5]),
    .matrix_6(X[6]),
    .matrix_7(X[7]),
    .matrix_8(X[8]),
    .out(y)
);

Step3 #(.BITS(BITS)) create_lambda (
    .vector(y),
    .matrix_1(X[1]),          .out_1(lambda[1]),
    .matrix_2(X[2]),          .out_2(lambda[2]),
    .matrix_3(X[3]),          .out_3(lambda[3]),
    .matrix_4(X[4]),          .out_4(lambda[4]),
    .matrix_5(X[5]),          .out_5(lambda[5]),
    .matrix_6(X[6]),          .out_6(lambda[6]),
    .matrix_7(X[7]),          .out_7(lambda[7]),
    .matrix_8(X[8]),          .out_8(lambda[8])   
);

always @ (*) begin
    
    for(i=1; i<=BITS-1; i=i+1) begin
        e[i] = 0;
    end
    e[BITS] = 1;
    
    lambda_1 = lambda[1];
    lambda_2 = lambda[2];
    lambda_3 = lambda[3];
    lambda_4 = lambda[4];
    lambda_5 = lambda[5];
    lambda_6 = lambda[6];
    lambda_7 = lambda[7];
    lambda_8 = lambda[8];
    
end

endmodule