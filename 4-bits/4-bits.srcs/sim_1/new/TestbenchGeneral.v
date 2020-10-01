`timescale 1ns / 1ps


module TestbenchGeneral;

parameter BITS = 4;
reg [1:BITS]c;
reg [1:BITS]a;
wire [1:BITS]lambda[1:BITS];

LinearSolver #(.BITS(BITS)) uut (
    .c(c),
    .a(a),
    
    .lambda_1(lambda[1]),
    .lambda_2(lambda[2]),
    .lambda_3(lambda[3]),
    .lambda_4(lambda[4]),
    .lambda_5(lambda[5]),
    .lambda_6(lambda[6]),
    .lambda_7(lambda[7]),
    .lambda_8(lambda[8])  
);

initial begin
c = 4'b1101;
a = 4'b1100;
end

endmodule
