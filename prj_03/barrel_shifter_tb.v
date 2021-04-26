`timescale 1ns/1ps

module barrel_shifter_tb;
reg [31:0] D, s;
reg [4:0] S;
reg LnR;
wire [31:0] Y, Yl, Yr, Yb;

SHIFT32 fullTestInst(.Y(Y), .D(D), .S(s), .LnR(LnR));
BARREL_SHIFTER32 barrelShiftInst(.Y(Yb), .D(D), .S(S), .LnR(LnR));
SHIFT32_L leftShiftInst(.Y(Yl), .D(D), .S(S));
SHIFT32_R rightShiftInst(.Y(Yr), .D(D), .S(S));

initial
begin
	LnR = 0;
	D=11;
	S=1;
	s=S;
#10	LnR = 1;
#10	LnR = 0;
	D=1;
	S=0;
	s=S;
#10	LnR = 1;
#10	LnR = 0;
	D=1;
	S=2;
	s=40;
#10	LnR = 1;
#10	LnR = 0;
	D=1;
	S=31;
	s=S;
#10	LnR = 1;
#10	LnR = 0;
	D=1;
	S=7;
	s=S;
#10	LnR = 1;
#10	LnR = 0;
	D=5;
	S=11;
	s=S;
#10;
end

endmodule;
