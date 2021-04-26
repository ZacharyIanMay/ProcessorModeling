`timescale 1ns/1ps

module mux_tb;
reg [31:0] a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, S;
wire [31:0] Y16, Y8, Y4, Y2;

MUX32_16x1 muxInst1(.Y(Y16), .I0(a), .I1(b), .I2(c), .I3(d), .I4(e), .I5(f), .I6(g), .I7(h), .I8(i), .I9(j), .I10(k), .I11(l), .I12(m), .I13(n), .I14(o), .I15(p), .S(S));
MUX32_8x1 muxInst2(.Y(Y8), .I0(a), .I1(b), .I2(c), .I3(d), .I4(e), .I5(f), .I6(g), .I7(h), .S(S));
MUX32_4x1 muxInst3(.Y(Y4), .I0(a), .I1(b), .I2(c), .I3(d), .S(S));
MUX32_2x1 muxInst4(.Y(Y2), .I0(a), .I1(b), .S(S));
initial
begin
a=0;
b=1;
c=2;
d=3;
e=4;
f=5;
g=6;
h=7;
i=8;
j=9;
k=10;
l=11;
m=12;
n=13;
o=14;
p=15;
S=0;
#10	S=1;
#10	S=2;
#10	S=3;
#10	S=4;
#10	S=5;
#10	S=6;
#10	S=7;
#10	S=8;
#10	S=9;
#10	S=10;
#10	S=11;
#10	S=12;
#10	S=13;
#10	S=14;
#10	S=15;
#10;
end

endmodule;
