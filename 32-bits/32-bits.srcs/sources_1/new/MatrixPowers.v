`timescale 1ns / 1ps

/////////////////////////////////////////////////////////
module MatrixPowers #(parameter BITS = 4, POWER = BITS-1) (

input wire [1:BITS]in_1, in_2, in_3, in_4, in_5, in_6, in_7, in_8,

output reg [1:BITS]power1_1, power1_2, power1_3, power1_4, power1_5, power1_6, power1_7, power1_8,    
output reg [1:BITS]power2_1, power2_2, power2_3, power2_4, power2_5, power2_6, power2_7, power2_8,
output reg [1:BITS]power3_1, power3_2, power3_3, power3_4, power3_5, power3_6, power3_7, power3_8,
output reg [1:BITS]power4_1, power4_2, power4_3, power4_4, power4_5, power4_6, power4_7, power4_8,
output reg [1:BITS]power5_1, power5_2, power5_3, power5_4, power5_5, power5_6, power5_7, power5_8,
output reg [1:BITS]power6_1, power6_2, power6_3, power6_4, power6_5, power6_6, power6_7, power6_8,
output reg [1:BITS]power7_1, power7_2, power7_3, power7_4, power7_5, power7_6, power7_7, power7_8            
);


reg [1:BITS]a[1:BITS];
reg [1:BITS]b[1:BITS][1:BITS];
reg [1:BITS]ab[1:BITS];
integer i, j, k, l, m, n;

always @ (*) begin

    a[1] = in_1;          a[5] = in_5;
    a[2] = in_2;          a[6] = in_6;
    a[3] = in_3;          a[7] = in_7;
    a[4] = in_4;          a[8] = in_8;
    
    //b=a and ab=0
    for(l=1; l<=BITS; l=l+1) begin
        b[1][l] = a[l];
        ab[l] = 0;
    end
    
    //power operation starts
    for(m=2; m<=POWER; m=m+1) begin
        for(i=1; i<=BITS; i=i+1) begin                         //row
            for(j=1; j<=BITS; j=j+1) begin                     //column
                for(k=1; k<=BITS; k=k+1) begin
                    ab[i][j] = (ab[i][j])^(a[i][k]&b[m-1][k][j]);
                end
            end
        end
        for(n=1; n<=BITS; n=n+1) begin
            b[m][n] = ab[n];
            ab[n] = 0;
        end
    end
    
    //Assigning the Output
    power1_1 = b[1][1];         power2_1 = b[2][1];         power3_1 = b[3][1];         power4_1 = b[4][1];
    power1_2 = b[1][2];         power2_2 = b[2][2];         power3_2 = b[3][2];         power4_2 = b[4][2];
    power1_3 = b[1][3];         power2_3 = b[2][3];         power3_3 = b[3][3];         power4_3 = b[4][3];
    power1_4 = b[1][4];         power2_4 = b[2][4];         power3_4 = b[3][4];         power4_4 = b[4][4];
    power1_5 = b[1][5];         power2_5 = b[2][5];         power3_5 = b[3][5];         power4_5 = b[4][5];
    power1_6 = b[1][6];         power2_6 = b[2][6];         power3_6 = b[3][6];         power4_6 = b[4][6];
    power1_7 = b[1][7];         power2_7 = b[2][7];         power3_7 = b[3][7];         power4_7 = b[4][7];
    power1_8 = b[1][8];         power2_8 = b[2][8];         power3_8 = b[3][8];         power4_8 = b[4][8];
    
    power5_1 = b[5][1];         power6_1 = b[6][1];         power7_1 = b[7][1];
    power5_2 = b[5][2];         power6_2 = b[6][2];         power7_2 = b[7][2];
    power5_3 = b[5][3];         power6_3 = b[6][3];         power7_3 = b[7][3];
    power5_4 = b[5][4];         power6_4 = b[6][4];         power7_4 = b[7][4];
    power5_5 = b[5][5];         power6_5 = b[6][5];         power7_5 = b[7][5];
    power5_6 = b[5][6];         power6_6 = b[6][6];         power7_6 = b[7][6];
    power5_7 = b[5][7];         power6_7 = b[6][7];         power7_7 = b[7][7];
    power5_8 = b[5][8];         power6_8 = b[6][8];         power7_8 = b[7][8];

end

endmodule
