`timescale 1ns / 1ps

//Add two matrices
module MatrixAddition #(parameter BITS=4) (
    input wire [1:BITS]matrix1_1,
    input wire [1:BITS]matrix1_2,
    input wire [1:BITS]matrix1_3,
    input wire [1:BITS]matrix1_4,
    input wire [1:BITS]matrix1_5,
    input wire [1:BITS]matrix1_6,
    input wire [1:BITS]matrix1_7,
    input wire [1:BITS]matrix1_8,
    
    input wire [1:BITS]matrix2_1,
    input wire [1:BITS]matrix2_2,
    input wire [1:BITS]matrix2_3,
    input wire [1:BITS]matrix2_4,
    input wire [1:BITS]matrix2_5,
    input wire [1:BITS]matrix2_6,
    input wire [1:BITS]matrix2_7,
    input wire [1:BITS]matrix2_8,
    
    output reg [1:BITS]out_1,
    output reg [1:BITS]out_2,
    output reg [1:BITS]out_3,
    output reg [1:BITS]out_4,
    output reg [1:BITS]out_5,
    output reg [1:BITS]out_6,
    output reg [1:BITS]out_7,
    output reg [1:BITS]out_8
);

reg [1:BITS]a[1:BITS];
reg [1:BITS]b[1:BITS];
reg [1:BITS]c[1:BITS];
integer i, j;

always @ (*) begin

    a[1] = matrix1_1;             b[1] = matrix2_1;               c[1] = 0;
    a[2] = matrix1_2;             b[2] = matrix2_2;               c[2] = 0;
    a[3] = matrix1_3;             b[3] = matrix2_3;               c[3] = 0;
    a[4] = matrix1_4;             b[4] = matrix2_4;               c[4] = 0;
    a[5] = matrix1_5;             b[5] = matrix2_5;               c[5] = 0;
    a[6] = matrix1_6;             b[6] = matrix2_6;               c[6] = 0;
    a[7] = matrix1_7;             b[7] = matrix2_7;               c[7] = 0;
    a[8] = matrix1_8;             b[8] = matrix2_8;               c[8] = 0;
    
    
    //Matrix Addition
    for(i=1; i<=BITS; i=i+1) begin                         //row
        for(j=1; j<=BITS; j=j+1) begin                     //column
            c[i][j] = a[i][j] ^ b[i][j];
        end
    end
    
    out_1 = c[1]; 
    out_2 = c[2]; 
    out_3 = c[3]; 
    out_4 = c[4]; 
    out_5 = c[5]; 
    out_6 = c[6]; 
    out_7 = c[7]; 
    out_8 = c[8];
        
end

endmodule
