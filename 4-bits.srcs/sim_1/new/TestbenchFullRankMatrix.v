`timescale 1ns / 1ps


module TestbenchFullRankMatrix;

parameter BITS=4, BLOCKS=2;
reg [1:BITS]M[1:BITS];
reg [1:BITS+0]L4;
reg [1:BITS+1]L5;
reg [1:BITS+2]L6;
reg [1:BITS+3]L7;
reg [1:BITS]R[1:BITS];
wire [1:BITS*BLOCKS]Y[1:BITS];

FullRankMatrix #(.BITS(BITS), .BLOCKS(BLOCKS)) uut (
    .M_1(M[1]),
    .M_2(M[2]),
    .M_3(M[3]),
    .M_4(M[4]),
    
    .L4(L4),
    .L5(L5),
    .L6(L6),
    .L7(L7),
    
    .R1(R[1]),
    .R2(R[2]),
    .R3(R[3]),
    .R4(R[4]),
    
    .Y_1(Y[1]),
    .Y_2(Y[2]),
    .Y_3(Y[3]),
    .Y_4(Y[4])
);

initial begin
    M[1] = 4'b1101;         L4 = 4'b0011;           R[1] = 4'b0110;
    M[2] = 4'b0100;         L5 = 5'b00101;          R[2] = 4'b1010;
    M[3] = 4'b1011;         L6 = 6'b000011;         R[3] = 4'b1011;
    M[4] = 4'b0001;         L7 = 7'b0000011;        R[4] = 4'b1110;
end

endmodule
