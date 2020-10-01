`timescale 1ns / 1ps


//4-input, 4-output, 2-delay block Sigma-LFSR
module SigmaLFSR #(parameter BITS = 4, BLOCKS = 2) (
    input wire clock, reset,
    output reg [1:BITS]out
);

reg [1:BITS]D[1:BLOCKS];                    //Delay Blocks
reg [1:BITS]B[1:BLOCKS][1:BITS];            //Gain Matrices
wire [1:BITS]product[1:BLOCKS];
wire [1:BITS]feedback;
integer j, k, l, m;
genvar i;

//Initialization
initial begin
    D[1] = 4'hf;
    D[2] = 4'h7;
    
    B[1][1] = 4'hb;         B[2][1] = 4'h3;         // B[3][1] = 4'h2;         B[4][1] = 4'ha;
    B[1][2] = 4'hd;         B[2][2] = 4'h5;         // B[3][2] = 4'h4;         B[4][2] = 4'hb;
    B[1][3] = 4'hf;         B[2][3] = 4'h7;         // B[3][3] = 4'h6;         B[4][3] = 4'hc;
    B[1][4] = 4'h1;         B[2][4] = 4'h9;         // B[3][4] = 4'h8;         B[4][4] = 4'hd;
end


generate
for(i=1; i<=BLOCKS; i=i+1) begin: multiply
    VectorXMatrix #(.BITS(BITS)) multiply (
        .vector(D[i]),
        .matrix_1(B[i][1]), 
        .matrix_2(B[i][2]), 
        .matrix_3(B[i][3]), 
        .matrix_4(B[i][4]),
        .matrix_5(), 
        .matrix_6(), 
        .matrix_7(), 
        .matrix_8(),
        .out(product[i])
    );
end
endgenerate

assign feedback = product[1] ^ product[2];      //Addition in GF(2)

always @ (posedge clock or posedge reset) begin

    if (reset) begin
        out = 0;
    end
    else begin
        out = D[1];
        for(j=1; j<BLOCKS; j=j+1) begin
            D[j] = D[j+1];
        end
        D[BLOCKS] = feedback;
    end
    
end

endmodule
