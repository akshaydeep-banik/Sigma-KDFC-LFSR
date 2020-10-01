`timescale 1ns / 1ps

// Generation of Full Rank Matrix Y (Algorithm 1)
// Inputs:
// (i) a matrix M (full-rank m x m matrix)
// (ii) n-m primitive polynomials of degrees {m, m+1, m+2, ... , n}
// (iii) Random binary vectors, outputs of SigmaLFSR
module FullRankMatrix #(parameter BITS=4, BLOCKS=2) (
    input wire [1:BITS]M_1,
    input wire [1:BITS]M_2,
    input wire [1:BITS]M_3,
    input wire [1:BITS]M_4,
    
    input wire [1:BITS+0]L4,
    input wire [1:BITS+1]L5,
    input wire [1:BITS+2]L6,
    input wire [1:BITS+3]L7,
    
    input wire [1:BITS]R1,
    input wire [1:BITS]R2,
    input wire [1:BITS]R3,
    input wire [1:BITS]R4,
    
    output reg [1:BITS*BLOCKS]Y_1,
    output reg [1:BITS*BLOCKS]Y_2,
    output reg [1:BITS*BLOCKS]Y_3,
    output reg [1:BITS*BLOCKS]Y_4
);

//reg [1:BITS*BLOCKS]L[1:BITS];
//reg [1:BITS]R[1:BITS];
//wire [1:BITS*BLOCKS]Y[0:BITS*BLOCKS-BITS][1:BITS];
//genvar i;

//generate
//for(i=1; i<= BITS*BLOCKS-BITS; i=i+1) begin: interation
//    LoopIteration #(.ROW(BITS), .COLUMN(BITS+i-1), .t(i)) interation (
//        .inY_1(Y[i-1][1]),
//        .inY_2(Y[i-1][2]),
//        .inY_3(Y[i-1][3]),
//        .inY_4(Y[i-1][4]),
//        .L(L[i]),
//        .R(R[i]),
//        .outY_1(Y[i][1]),
//        .outY_2(Y[i][2]),
//        .outY_3(Y[i][3]),
//        .outY_4(Y[i][4])
//    );
//end
//endgenerate

wire [1:BITS+1]Y1[1:BITS];
wire [1:BITS+2]Y2[1:BITS];
wire [1:BITS+3]Y3[1:BITS];
wire [1:BITS+4]Y4[1:BITS];

LoopIteration #(.ROW(BITS), .COLUMN(BITS), .t(1)) interation1 (
    .inY_1(M_1),
    .inY_2(M_2),
    .inY_3(M_3),
    .inY_4(M_4),
    .L(L4),
    .R(R1),
    .outY_1(Y1[1]),
    .outY_2(Y1[2]),
    .outY_3(Y1[3]),
    .outY_4(Y1[4])
);

LoopIteration #(.ROW(BITS), .COLUMN(BITS+1), .t(2)) interation2 (
    .inY_1(Y1[1]),
    .inY_2(Y1[2]),
    .inY_3(Y1[3]),
    .inY_4(Y1[4]),
    .L(L5),
    .R(R2),
    .outY_1(Y2[1]),
    .outY_2(Y2[2]),
    .outY_3(Y2[3]),
    .outY_4(Y2[4])
);

LoopIteration #(.ROW(BITS), .COLUMN(BITS+2), .t(3)) interation3 (
    .inY_1(Y2[1]),
    .inY_2(Y2[2]),
    .inY_3(Y2[3]),
    .inY_4(Y2[4]),
    .L(L6),
    .R(R3),
    .outY_1(Y3[1]),
    .outY_2(Y3[2]),
    .outY_3(Y3[3]),
    .outY_4(Y3[4])
);

LoopIteration #(.ROW(BITS), .COLUMN(BITS+3), .t(4)) interation4 (
    .inY_1(Y3[1]),
    .inY_2(Y3[2]),
    .inY_3(Y3[3]),
    .inY_4(Y3[4]),
    .L(L7),
    .R(R4),
    .outY_1(Y4[1]),
    .outY_2(Y4[2]),
    .outY_3(Y4[3]),
    .outY_4(Y4[4])
);

always @ (*) begin
    Y_1 = Y4[1];
    Y_2 = Y4[2];
    Y_3 = Y4[3];
    Y_4 = Y4[4];
end

endmodule
