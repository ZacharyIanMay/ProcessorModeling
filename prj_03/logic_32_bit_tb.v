`timescale 1ns/1ps

module logic_32_bit_tb;
reg [31:0] A, B;
wire [31:0] a, i, n, o;

NOR32_2x1 norInst(.Y(n), .A(A), .B(B));
AND32_2x1 andInst(.Y(a), .A(A), .B(B));
INV32_1x1 invInst(.Y(i), .A(A));
OR32_2x1 orInst(.Y(o), .A(A), .B(B));
initial
begin
A=0;
B=0;
#10	A=1;
	B=0;
#10	A=0;
	B=1;
#10	A=1;
	B=1;
#10	A=92;
	B=14;
#10	A=9001;
	B=42;
#10;
end

endmodule;
