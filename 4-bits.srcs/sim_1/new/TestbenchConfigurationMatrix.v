`timescale 1ns / 1ps

module TestbenchConfigurationMatrix;

parameter BITS = 4, BLOCKS = 2;
reg [1:BITS*BLOCKS]p;
reg [1:BITS*BLOCKS]Y[1:BITS];
wire [1:BITS*BLOCKS]Cs[1:BITS*BLOCKS];

ConfrigurationMatrix #(.BITS(BITS), .BLOCKS(BLOCKS)) uut (
    .p(p),
     
    .Y_1(Y[1]),
    .Y_2(Y[2]),
    .Y_3(Y[3]),
    .Y_4(Y[4]),
    
    .Cs_1(Cs[1]),
    .Cs_2(Cs[2]),
    .Cs_3(Cs[3]),
    .Cs_4(Cs[4]),
    .Cs_5(Cs[5]),
    .Cs_6(Cs[6]),
    .Cs_7(Cs[7]),
    .Cs_8(Cs[8])
);

initial begin
    p = 8'b10111000;
    
    Y[1] = 8'b00100111;
    Y[2] = 8'b00000101;
    Y[3] = 8'b10011101;
    Y[4] = 8'b00000001;
end
endmodule
