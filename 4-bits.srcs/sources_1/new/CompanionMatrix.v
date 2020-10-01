`timescale 1ns / 1ps


//Convert a given set of coeffecients of a primitive polynoimial to M-Companion Matrix
module CompanionMatrix #(parameter BITS = 4) (
    input wire [1:BITS]in,           //primitive polynmial coefficients 
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
integer i, j;

always @ (*) begin

    for(i=1; i<=BITS; i=i+1) begin
        for(j=1; j<=BITS; j=j+1) begin
            if(j==i-1)
                a[i][j] = 1;
            else if(j == BITS)
                a[i][j] = in[i];     
            else
                a[i][j] = 0;
        end
    end
    
    out_1 = a[1];  
    out_2 = a[2];  
    out_3 = a[3];  
    out_4 = a[4];
    out_5 = a[5];  
    out_6 = a[6];  
    out_7 = a[7];  
    out_8 = a[8];
    
end

endmodule

