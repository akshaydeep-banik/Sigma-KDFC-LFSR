`timescale 1ns / 1ps

//                   _          _
//  _        _      |            |        _        _    
// |          |     |            |       |          |               a = ROW
// |_        _|     |            |   =   |_        _|               b = COLUMN
//           a x b  |            |                a x b
//                  |_          _|
//                              b x b

module MatrixMultiplication #(parameter ROW = 8, COLUMN=8) (
    input wire [1:COLUMN]matrix1_1,                 
    input wire [1:COLUMN]matrix1_2,                 
    input wire [1:COLUMN]matrix1_3,                 
    input wire [1:COLUMN]matrix1_4,
    input wire [1:COLUMN]matrix1_5,                 
    input wire [1:COLUMN]matrix1_6,                 
    input wire [1:COLUMN]matrix1_7,                 
    input wire [1:COLUMN]matrix1_8,                
                                         
    input wire [1:COLUMN]matrix2_1,
    input wire [1:COLUMN]matrix2_2,
    input wire [1:COLUMN]matrix2_3,
    input wire [1:COLUMN]matrix2_4,
    input wire [1:COLUMN]matrix2_5,
    input wire [1:COLUMN]matrix2_6,
    input wire [1:COLUMN]matrix2_7,
    input wire [1:COLUMN]matrix2_8,
    
    output reg [1:COLUMN]out_1,
    output reg [1:COLUMN]out_2,
    output reg [1:COLUMN]out_3,                                     
    output reg [1:COLUMN]out_4,
    output reg [1:COLUMN]out_5,
    output reg [1:COLUMN]out_6,
    output reg [1:COLUMN]out_7,                                     
    output reg [1:COLUMN]out_8                                      
);

reg [1:COLUMN]a[1:ROW];
reg [1:COLUMN]b[1:COLUMN];
reg [1:COLUMN]ab[1:ROW];
integer i, j, k;

always @ (*) begin

    a[1] = matrix1_1;         b[1] = matrix2_1;         ab[1] = 0;
    a[2] = matrix1_2;         b[2] = matrix2_2;         ab[2] = 0;
    a[3] = matrix1_3;         b[3] = matrix2_3;         ab[3] = 0;
    a[4] = matrix1_4;         b[4] = matrix2_4;         ab[4] = 0;
    a[5] = matrix1_5;         b[5] = matrix2_5;         ab[5] = 0;
    a[6] = matrix1_6;         b[6] = matrix2_6;         ab[6] = 0;
    a[7] = matrix1_7;         b[7] = matrix2_7;         ab[7] = 0;
    a[8] = matrix1_8;         b[8] = matrix2_8;         ab[8] = 0;
    
    //Matrix Multiplication
    for(i=1; i<=ROW; i=i+1) begin                            //row
        for(j=1; j<=COLUMN; j=j+1) begin                     //column
            for(k=1; k<=COLUMN; k=k+1) begin
                ab[i][j] = (ab[i][j])^(a[i][k]&b[k][j]);
            end
        end
    end
    
    out_1 = ab[1];          out_5 = ab[5]; 
    out_2 = ab[2];          out_6 = ab[6];
    out_3 = ab[3];          out_7 = ab[7];
    out_4 = ab[4];          out_8 = ab[8];
    
end

endmodule