`timescale 1ns / 1ps

module InverseOfMatrix #(parameter BITS=8) (
input wire [1:BITS]in_1,                output reg [1:BITS]out_1, 
input wire [1:BITS]in_2,                output reg [1:BITS]out_2, 
input wire [1:BITS]in_3,                output reg [1:BITS]out_3, 
input wire [1:BITS]in_4,                output reg [1:BITS]out_4, 
input wire [1:BITS]in_5,                output reg [1:BITS]out_5, 
input wire [1:BITS]in_6,                output reg [1:BITS]out_6, 
input wire [1:BITS]in_7,                output reg [1:BITS]out_7, 
input wire [1:BITS]in_8,                output reg [1:BITS]out_8
);

reg [1:BITS]A[1:BITS];
reg [1:BITS]I[1:BITS];
reg [1:BITS] temp1, temp2;
integer i, j, k, l, m;

always @ (*) begin

    A[1] = in_1;
    A[2] = in_2;
    A[3] = in_3;
    A[4] = in_4;
    A[5] = in_5; 
    A[6] = in_6; 
    A[7] = in_7; 
    A[8] = in_8; 
    
    //Identity Matrix
    for(l=1; l<=BITS; l=l+1) begin
        for(m=1; m<=BITS; m=m+1) begin
            if(l == m) begin
                I[l][m] = 1;
            end
            else begin
                I[l][m] = 0;
            end
        end 
    end
    
    //Inverse Operation
    for(i=1; i<=BITS; i=i+1) begin
        
        if(A[i][i]!=1) begin
            for(k=i+1; k<=BITS; k=k+1) begin
                if(A[k][i]==1) begin
                   temp1 = A[i];
                   temp2 = I[i];
                   A[i] = A[k];
                   I[i] = I[k];
                   A[k] = temp1;
                   I[k] = temp2;
                end
            end
        end
        
        for(j=i+1; j<=BITS; j=j+1) begin
            if(A[j][i]!=0) begin
                A[j] = A[j]^A[i];
                I[j] = I[j]^I[i];
            end
        end
        
        for(j=1; j<=i-1; j=j+1) begin
            if(A[j][i]!=0) begin
                A[j] = A[j]^A[i];
                I[j] = I[j]^I[i];
            end
        end
        
    end
    
    //Assigning the Output
    out_1 = I[1];
    out_2 = I[2];
    out_3 = I[3];
    out_4 = I[4];
    out_5 = I[5];
    out_6 = I[6];
    out_7 = I[7];
    out_8 = I[8];
    
end

endmodule