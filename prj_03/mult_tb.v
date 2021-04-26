`timescale 1ns/1ps

module mult_tb;
reg [31:0] A, B;
wire [31:0] HI, HI1, LO, LO1;

//MULT32_U multInst(.HI(HI), .LO(LO), .A(A), .B(B));
MULT32 multSInst(.HI(HI1), .LO(LO1), .A(A), .B(B));
initial
begin
A=0;
B=0;
#10	A=-1;
	B=0;
#10	A=0;
	B=-1;
#10	A=-1;
	B=1;
#10	A=0;
	B=1;
#10	A=-1;
	B=-1;
#10	A=2;
	B=-2;
#10	A=-8;
	B=8;
#10	A=-4;
	B=-8;

#10;
end

endmodule;