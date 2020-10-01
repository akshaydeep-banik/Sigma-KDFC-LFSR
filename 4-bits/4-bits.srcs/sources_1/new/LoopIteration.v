`timescale 1ns / 1ps

//Step no. 5 to 13 in Algorithm 1
module LoopIteration #(parameter ROW = 4, COLUMN = 4, t = 1) (
    input wire [1:COLUMN]inY_1,
    input wire [1:COLUMN]inY_2,
    input wire [1:COLUMN]inY_3,
    input wire [1:COLUMN]inY_4,
    input wire [1:COLUMN]L,
    input wire [1:ROW]R,
    output reg [1:COLUMN+1]outY_1,
    output reg [1:COLUMN+1]outY_2,
    output reg [1:COLUMN+1]outY_3,
    output reg [1:COLUMN+1]outY_4
);

reg [1:COLUMN+1]Y[1:ROW];
reg [1:COLUMN]c;
wire [1:COLUMN]lambda[1:COLUMN];
wire [1:COLUMN]y[1:ROW];
integer i;

LinearSolver #(.BITS(COLUMN)) linear_solver (
    .c(c),
    .a(L),
    .lambda_1(lambda[1]),
    .lambda_2(lambda[2]),
    .lambda_3(lambda[3]),
    .lambda_4(lambda[4]),
    .lambda_5(lambda[5]),
    .lambda_6(lambda[6]),
    .lambda_7(lambda[7]),
    .lambda_8(lambda[8])  
);

MatrixMultiplication #(.ROW(ROW), .COLUMN(COLUMN)) multiply (
    .matrix1_1(inY_1),            .matrix1_5(),     
    .matrix1_2(inY_2),            .matrix1_6(),     
    .matrix1_3(inY_3),            .matrix1_7(),     
    .matrix1_4(inY_4),            .matrix1_8(),
                    
    .matrix2_1(lambda[1]),
    .matrix2_2(lambda[2]),
    .matrix2_3(lambda[3]),
    .matrix2_4(lambda[4]),
    .matrix2_5(lambda[5]),
    .matrix2_6(lambda[6]),
    .matrix2_7(lambda[7]),
    .matrix2_8(lambda[8]),
    
    .out_1(y[1]),                 .out_5(),
    .out_2(y[2]),                 .out_6(),
    .out_3(y[3]),                 .out_7(),
    .out_4(y[4]),                  .out_8() 
);

always @ (*) begin
    if(t%(ROW+1) == 1)
        c = inY_1;
    else if(t%(ROW+1) == 2)
        c = inY_2;
    else if(t%(ROW+1) == 3)
        c = inY_3;
    else if(t%(ROW+1) == 4)
        c = inY_4;
    
    Y[1] = {y[1], 1'bx};
    Y[2] = {y[2], 1'bx};
    Y[3] = {y[3], 1'bx};
    Y[4] = {y[4], 1'bx};
    
    for(i=1; i<=ROW; i=i+1) begin
        Y[i][COLUMN+1] = R[i];
    end
    
    Y[t%(ROW+1)]=0;
    Y[t%(ROW+1)][COLUMN+1]=1;
    
    outY_1 = Y[1];
    outY_2 = Y[2];
    outY_3 = Y[3];
    outY_4 = Y[4];
    
end

endmodule
