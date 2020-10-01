`timescale 1ns / 1ps

// Algorithm 3
module ConfrigurationMatrix #(parameter BITS=4, BLOCKS=2) (
    input wire [1:BITS*BLOCKS]p,
    
    input wire [1:BITS*BLOCKS]Y_1,
    input wire [1:BITS*BLOCKS]Y_2,
    input wire [1:BITS*BLOCKS]Y_3,
    input wire [1:BITS*BLOCKS]Y_4,
    
    output reg [1:BITS*BLOCKS]Cs_1,
    output reg [1:BITS*BLOCKS]Cs_2,
    output reg [1:BITS*BLOCKS]Cs_3,
    output reg [1:BITS*BLOCKS]Cs_4,
    output reg [1:BITS*BLOCKS]Cs_5,
    output reg [1:BITS*BLOCKS]Cs_6,
    output reg [1:BITS*BLOCKS]Cs_7,
    output reg [1:BITS*BLOCKS]Cs_8
);

wire [1:BITS*BLOCKS]P[1:BITS*BLOCKS];
reg [1:BITS*BLOCKS]Q[1:BITS*BLOCKS];
wire [1:BITS*BLOCKS]inverseQ[1:BITS*BLOCKS];
wire [1:BITS*BLOCKS]Cs[1:BITS*BLOCKS];

reg [1:BITS*BLOCKS]Y[1:BITS];
wire [1:BITS*BLOCKS]q[1:BITS];
wire [1:BITS*BLOCKS]k[1:BITS*BLOCKS];

genvar i;

CompanionMatrix #(.BITS(BITS*BLOCKS)) companion_matrix (
    .in(p),           //primitive polynmial coefficients 
    .out_1(P[1]), 
    .out_2(P[2]), 
    .out_3(P[3]), 
    .out_4(P[4]),
    .out_5(P[5]), 
    .out_6(P[6]), 
    .out_7(P[7]), 
    .out_8(P[8])
);

generate
for(i=1; i<=BITS; i=i+1) begin: multiply
    VectorXMatrix #(.BITS(BITS*BLOCKS)) multiply (
        .vector(Y[i]),
        .matrix_1(P[1]), 
        .matrix_2(P[2]), 
        .matrix_3(P[3]), 
        .matrix_4(P[4]),
        .matrix_5(P[5]), 
        .matrix_6(P[6]), 
        .matrix_7(P[7]), 
        .matrix_8(P[8]),
        .out(q[i])
    );
end
endgenerate

InverseOfMatrix #(.BITS(BITS*BLOCKS)) inverse_of_Q (
    .in_1(Q[1]),                .out_1(inverseQ[1]), 
    .in_2(Q[2]),                .out_2(inverseQ[2]), 
    .in_3(Q[3]),                .out_3(inverseQ[3]), 
    .in_4(Q[4]),                .out_4(inverseQ[4]), 
    .in_5(Q[5]),                .out_5(inverseQ[5]), 
    .in_6(Q[6]),                .out_6(inverseQ[6]), 
    .in_7(Q[7]),                .out_7(inverseQ[7]), 
    .in_8(Q[8]),                .out_8(inverseQ[8])
);

MatrixMultiplication #(.ROW(BITS*BLOCKS), .COLUMN(BITS*BLOCKS)) final_step1 (
    .matrix1_1(Q[1]),            .matrix2_1(P[1]),           .out_1(k[1]),                 
    .matrix1_2(Q[2]),            .matrix2_2(P[2]),           .out_2(k[2]),                 
    .matrix1_3(Q[3]),            .matrix2_3(P[3]),           .out_3(k[3]),                 
    .matrix1_4(Q[4]),            .matrix2_4(P[4]),           .out_4(k[4]),                 
    .matrix1_5(Q[5]),            .matrix2_5(P[5]),           .out_5(k[5]),
    .matrix1_6(Q[6]),            .matrix2_6(P[6]),           .out_6(k[6]),
    .matrix1_7(Q[7]),            .matrix2_7(P[7]),           .out_7(k[7]),
    .matrix1_8(Q[8]),            .matrix2_8(P[8]),           .out_8(k[8])     
);

MatrixMultiplication #(.ROW(BITS*BLOCKS), .COLUMN(BITS*BLOCKS)) final_step2 (
    .matrix1_1(k[1]),            .matrix2_1(inverseQ[1]),           .out_1(Cs[1]),                 
    .matrix1_2(k[2]),            .matrix2_2(inverseQ[2]),           .out_2(Cs[2]),                 
    .matrix1_3(k[3]),            .matrix2_3(inverseQ[3]),           .out_3(Cs[3]),                 
    .matrix1_4(k[4]),            .matrix2_4(inverseQ[4]),           .out_4(Cs[4]),                 
    .matrix1_5(k[5]),            .matrix2_5(inverseQ[5]),           .out_5(Cs[5]),
    .matrix1_6(k[6]),            .matrix2_6(inverseQ[6]),           .out_6(Cs[6]),
    .matrix1_7(k[7]),            .matrix2_7(inverseQ[7]),           .out_7(Cs[7]),
    .matrix1_8(k[8]),            .matrix2_8(inverseQ[8]),           .out_8(Cs[8])     
);

always @ (*) begin
    
    Y[1] = Y_1;
    Y[2] = Y_2;
    Y[3] = Y_3;
    Y[4] = Y_4;
    
    Q[1] = Y[1];
    Q[2] = Y[2];
    Q[3] = Y[3];
    Q[4] = Y[4];
    Q[5] = q[1];
    Q[6] = q[2];
    Q[7] = q[3];
    Q[8] = q[4];
    
    Cs_1 = Cs[1];
    Cs_2 = Cs[2];
    Cs_3 = Cs[3];
    Cs_4 = Cs[4];
    Cs_5 = Cs[5];
    Cs_6 = Cs[6];
    Cs_7 = Cs[7];
    Cs_8 = Cs[8];    
end

endmodule
