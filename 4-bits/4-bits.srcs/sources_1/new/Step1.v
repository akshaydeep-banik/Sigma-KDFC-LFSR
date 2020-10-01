`timescale 1ns / 1ps

// Step 1 for Algorithm 2
// Builds the Matrix X
module Step1 #(parameter BITS = 4) (
    input wire [1:BITS]vector,
    
    input wire [1:BITS]matrix_1,
    input wire [1:BITS]matrix_2,
    input wire [1:BITS]matrix_3,
    input wire [1:BITS]matrix_4,
    input wire [1:BITS]matrix_5,
    input wire [1:BITS]matrix_6,
    input wire [1:BITS]matrix_7,
    input wire [1:BITS]matrix_8,
    
    output reg [1:BITS]out_1,
    output reg [1:BITS]out_2,
    output reg [1:BITS]out_3,
    output reg [1:BITS]out_4,
    output reg [1:BITS]out_5,
    output reg [1:BITS]out_6,
    output reg [1:BITS]out_7,
    output reg [1:BITS]out_8
);

wire [1:BITS]power[1:BITS-1][1:BITS];
wire [1:BITS]x[1:BITS-1];
genvar i;

MatrixPowers #(.BITS(BITS)) calculate_powers(

.power1_1(power[1][1]),     .power2_1(power[2][1]),      .power3_1(power[3][1]),      .power4_1(power[4][1]), 
.power1_2(power[1][2]),     .power2_2(power[2][2]),      .power3_2(power[3][2]),      .power4_2(power[4][2]), 
.power1_3(power[1][3]),     .power2_3(power[2][3]),      .power3_3(power[3][3]),      .power4_3(power[4][3]), 
.power1_4(power[1][4]),     .power2_4(power[2][4]),      .power3_4(power[3][4]),      .power4_4(power[4][4]),
.power1_5(power[1][5]),     .power2_5(power[2][5]),      .power3_5(power[3][5]),      .power4_5(power[4][5]),
.power1_6(power[1][6]),     .power2_6(power[2][6]),      .power3_6(power[3][6]),      .power4_6(power[4][6]),
.power1_7(power[1][7]),     .power2_7(power[2][7]),      .power3_7(power[3][7]),      .power4_7(power[4][7]),
.power1_8(power[1][8]),     .power2_8(power[2][8]),      .power3_8(power[3][8]),      .power4_8(power[4][8]),

.power5_1(power[5][1]),     .power6_1(power[6][1]),      .power7_1(power[7][1]),      .in_1(matrix_1),
.power5_2(power[5][2]),     .power6_2(power[6][2]),      .power7_2(power[7][2]),      .in_2(matrix_2),
.power5_3(power[5][3]),     .power6_3(power[6][3]),      .power7_3(power[7][3]),      .in_3(matrix_3),
.power5_4(power[5][4]),     .power6_4(power[6][4]),      .power7_4(power[7][4]),      .in_4(matrix_4),
.power5_5(power[5][5]),     .power6_5(power[6][5]),      .power7_5(power[7][5]),      .in_5(matrix_5),
.power5_6(power[5][6]),     .power6_6(power[6][6]),      .power7_6(power[7][6]),      .in_6(matrix_6),
.power5_7(power[5][7]),     .power6_7(power[6][7]),      .power7_7(power[7][7]),      .in_7(matrix_7),
.power5_8(power[5][8]),     .power6_8(power[6][8]),      .power7_8(power[7][8]),      .in_8(matrix_8)

);

generate
for(i=1; i<=BITS-1; i=i+1) begin: row
    VectorXMatrix #(.BITS(BITS)) create_rows(
        .vector(vector),
        .matrix_1(power[i][1]), 
        .matrix_2(power[i][2]), 
        .matrix_3(power[i][3]), 
        .matrix_4(power[i][4]),
        .matrix_5(power[i][5]), 
        .matrix_6(power[i][6]), 
        .matrix_7(power[i][7]), 
        .matrix_8(power[i][8]),
        .out(x[i])
    );
end
endgenerate

always @ (*) begin
    out_1  = vector;       out_5  = x[4];   
    out_2  = x[1];         out_6  = x[5];
    out_3  = x[2];         out_7  = x[6];
    out_4  = x[3];         out_8  = x[7];
end

endmodule
