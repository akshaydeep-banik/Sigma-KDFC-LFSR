`timescale 1ns / 1ps

module TestbenchSigmaLFSR;
parameter BITS = 4;
reg clock, reset;
wire [1:BITS]out;

initial begin
    clock = 0;
    reset = 1;
    #25;
    
    reset = 0;
end

always begin
    #25;
    clock = ~clock;
end

SigmaLFSR uut(
    .clock(clock),
    .reset(reset),
    .out(out)
);

endmodule