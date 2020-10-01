`timescale 1ns / 1ps

module TBGeneral;

reg [1:4]a1, a2;
wire [1:4]b;

assign b = a2;

initial begin
    a2 = 4'b1111;
end

endmodule
