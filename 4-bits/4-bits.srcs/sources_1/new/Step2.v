`timescale 1ns / 1ps

// Step 2 for Algorithm 2 (X x y = e)
// Solution of Linear Equation: matrix x out = vector => out = vector x matrix^-1 (Gauss Elimination Method used)
module Step2 #(parameter BITS = 4) (
    input wire [1:BITS]vector,
    
    input wire [1:BITS]matrix_1,
    input wire [1:BITS]matrix_2,
    input wire [1:BITS]matrix_3,
    input wire [1:BITS]matrix_4,
    input wire [1:BITS]matrix_5,
    input wire [1:BITS]matrix_6,
    input wire [1:BITS]matrix_7,
    input wire [1:BITS]matrix_8,
    
    output reg [1:BITS]out
);

reg [1:BITS+1]C[1:BITS];
reg [1:BITS+1]temp;
integer i, j, l, m, n;
reg flag;

always @ (*)
begin
    C[1] = {matrix_1, vector[1]};
    C[2] = {matrix_2, vector[2]};
    C[3] = {matrix_3, vector[3]};
    C[4] = {matrix_4, vector[4]};
    C[5] = {matrix_5, vector[5]};
    C[6] = {matrix_6, vector[6]};
    C[7] = {matrix_7, vector[7]};
    C[8] = {matrix_8, vector[8]};
    
    for(i=2; i<=BITS; i=i+1) begin
        
        //Partial Pivoting
        if (C[i-1][i-1]==0) begin
            flag = 0;
            for (n=i; n<=BITS; n=n+1) begin
                if (C[n][i-1] != 0 && flag == 0) begin
                    temp = C[i-1];
                    C[i-1] = C[n];
                    C[n] = temp;
                    flag = 1;
                end
            end
         end
         
         //Main Operation
         for (j=i; j<=BITS; j=j+1) begin
            if (C[j][i-1] != 0) begin
                C[j] = C[j] ^ C[i-1];
            end
         end
        
    end
    
    //Calculation of x
    for (l=BITS; l>=1; l=l-1) begin
        out[l] = C[l][BITS+1];
        for (m=l+1; m<=BITS; m=m+1) begin
            out[l] = (C[l][m] & out[m]) ^ out[l];
        end
    end

end

endmodule
