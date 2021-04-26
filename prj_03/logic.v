// Name: logic.v
// Module: 
// Input: 
// Output: 
//
// Notes: Common definitions
// 
//
// Revision History:
//
// Version	Date		Who		email			note
//------------------------------------------------------------------------------------------
//  1.0     Sep 02, 2014	Kaushik Patra	kpatra@sjsu.edu		Initial creation
//------------------------------------------------------------------------------------------
//
// 64-bit two's complement
module TWOSCOMP64(Y,A);
//output list
output [63:0] Y;
//input list
input [63:0] A;
wire [31:0] X1, X2;

INV32_1x1 invInst1(.Y(X1), .A(A[31:0]));
INV32_1x1 invInst2(.Y(X2), .A(A[63:32]));
RC_ADD_SUB_64 adder64Inst(.Y(Y), .A({X2, X1}), .B(64'b1), .SnA(1'b0), .CO());

endmodule

// 32-bit two's complement
module TWOSCOMP32(Y,A);
//output list
output [31:0] Y;
//input list
input [31:0] A;
//wire list
wire [31:0] X;

INV32_1x1 invInst(.Y(X), .A(A));
RC_ADD_SUB_32 adderInst(.Y(Y), .A(X), .B(1), .SnA(1'b0), .CO());

endmodule

// 32-bit registere +ve edge, Reset on RESET=0
module REG32(Q, D, LOAD, CLK, RESET);
output [31:0] Q;

input CLK, LOAD;
input [31:0] D;
input RESET;

genvar i;
generate
	for(i=0; i<32; i=i+1)
	begin : regGen
	REG1 inst(.Q(Q[i]), .Qbar(), .D(D[i]), .L(LOAD), .C(CLK), .nP(1'b1), .nR(RESET));
	end
endgenerate

endmodule

// 32-bit register +ve edge, Reset to 0000 1000 on RESET=0
module PC_REG(Q, D, LOAD, CLK, RESET);
output [31:0] Q;

input CLK, LOAD;
input [31:0] D;
input RESET;

REG1 inst0(.Q(Q[0]), .Qbar(), .D(D[0]), .L(LOAD), .C(CLK), .nP(), .nR(RESET));
REG1 inst1(.Q(Q[1]), .Qbar(), .D(D[1]), .L(LOAD), .C(CLK), .nP(), .nR(RESET));
REG1 inst2(.Q(Q[2]), .Qbar(), .D(D[2]), .L(LOAD), .C(CLK), .nP(), .nR(RESET));
REG1 inst3(.Q(Q[3]), .Qbar(), .D(D[3]), .L(LOAD), .C(CLK), .nP(), .nR(RESET));
REG1 inst4(.Q(Q[4]), .Qbar(), .D(D[4]), .L(LOAD), .C(CLK), .nP(), .nR(RESET));
REG1 inst5(.Q(Q[5]), .Qbar(), .D(D[5]), .L(LOAD), .C(CLK), .nP(), .nR(RESET));
REG1 inst6(.Q(Q[6]), .Qbar(), .D(D[6]), .L(LOAD), .C(CLK), .nP(), .nR(RESET));
REG1 inst7(.Q(Q[7]), .Qbar(), .D(D[7]), .L(LOAD), .C(CLK), .nP(), .nR(RESET));
REG1 inst8(.Q(Q[8]), .Qbar(), .D(D[8]), .L(LOAD), .C(CLK), .nP(), .nR(RESET));
REG1 inst9(.Q(Q[9]), .Qbar(), .D(D[9]), .L(LOAD), .C(CLK), .nP(), .nR(RESET));
REG1 inst10(.Q(Q[10]), .Qbar(), .D(D[10]), .L(LOAD), .C(CLK), .nP(), .nR(RESET));
REG1 inst11(.Q(Q[11]), .Qbar(), .D(D[11]), .L(LOAD), .C(CLK), .nP(), .nR(RESET));
REG1 inst12(.Q(Q[12]), .Qbar(), .D(D[12]), .L(LOAD), .C(CLK), .nP(RESET), .nR());
REG1 inst13(.Q(Q[13]), .Qbar(), .D(D[13]), .L(LOAD), .C(CLK), .nP(), .nR(RESET));
REG1 inst14(.Q(Q[14]), .Qbar(), .D(D[14]), .L(LOAD), .C(CLK), .nP(), .nR(RESET));
REG1 inst15(.Q(Q[15]), .Qbar(), .D(D[15]), .L(LOAD), .C(CLK), .nP(), .nR(RESET));
REG1 inst16(.Q(Q[16]), .Qbar(), .D(D[16]), .L(LOAD), .C(CLK), .nP(), .nR(RESET));
REG1 inst17(.Q(Q[17]), .Qbar(), .D(D[17]), .L(LOAD), .C(CLK), .nP(), .nR(RESET));
REG1 inst18(.Q(Q[18]), .Qbar(), .D(D[18]), .L(LOAD), .C(CLK), .nP(), .nR(RESET));
REG1 inst19(.Q(Q[19]), .Qbar(), .D(D[19]), .L(LOAD), .C(CLK), .nP(), .nR(RESET));
REG1 inst20(.Q(Q[20]), .Qbar(), .D(D[20]), .L(LOAD), .C(CLK), .nP(), .nR(RESET));
REG1 inst21(.Q(Q[21]), .Qbar(), .D(D[21]), .L(LOAD), .C(CLK), .nP(), .nR(RESET));
REG1 inst22(.Q(Q[22]), .Qbar(), .D(D[22]), .L(LOAD), .C(CLK), .nP(), .nR(RESET));
REG1 inst23(.Q(Q[23]), .Qbar(), .D(D[23]), .L(LOAD), .C(CLK), .nP(), .nR(RESET));
REG1 inst24(.Q(Q[24]), .Qbar(), .D(D[24]), .L(LOAD), .C(CLK), .nP(), .nR(RESET));
REG1 inst25(.Q(Q[25]), .Qbar(), .D(D[25]), .L(LOAD), .C(CLK), .nP(), .nR(RESET));
REG1 inst26(.Q(Q[26]), .Qbar(), .D(D[26]), .L(LOAD), .C(CLK), .nP(), .nR(RESET));
REG1 inst27(.Q(Q[27]), .Qbar(), .D(D[27]), .L(LOAD), .C(CLK), .nP(), .nR(RESET));
REG1 inst28(.Q(Q[28]), .Qbar(), .D(D[28]), .L(LOAD), .C(CLK), .nP(), .nR(RESET));
REG1 inst29(.Q(Q[29]), .Qbar(), .D(D[29]), .L(LOAD), .C(CLK), .nP(), .nR(RESET));
REG1 inst30(.Q(Q[30]), .Qbar(), .D(D[30]), .L(LOAD), .C(CLK), .nP(), .nR(RESET));
REG1 inst31(.Q(Q[31]), .Qbar(), .D(D[31]), .L(LOAD), .C(CLK), .nP(), .nR(RESET));

endmodule

// 32-bit register +ve edge, Reset to 03ff ffff on RESET=0
module SP_REG(Q, D, LOAD, CLK, RESET);
output [31:0] Q;

input CLK, LOAD;
input [31:0] D;
input RESET;

REG1 inst0(.Q(Q[0]), .Qbar(), .D(D[0]), .L(LOAD), .C(CLK), .nP(RESET), .nR());
REG1 inst1(.Q(Q[1]), .Qbar(), .D(D[1]), .L(LOAD), .C(CLK), .nP(RESET), .nR());
REG1 inst2(.Q(Q[2]), .Qbar(), .D(D[2]), .L(LOAD), .C(CLK), .nP(RESET), .nR());
REG1 inst3(.Q(Q[3]), .Qbar(), .D(D[3]), .L(LOAD), .C(CLK), .nP(RESET), .nR());
REG1 inst4(.Q(Q[4]), .Qbar(), .D(D[4]), .L(LOAD), .C(CLK), .nP(RESET), .nR());
REG1 inst5(.Q(Q[5]), .Qbar(), .D(D[5]), .L(LOAD), .C(CLK), .nP(RESET), .nR());
REG1 inst6(.Q(Q[6]), .Qbar(), .D(D[6]), .L(LOAD), .C(CLK), .nP(RESET), .nR());
REG1 inst7(.Q(Q[7]), .Qbar(), .D(D[7]), .L(LOAD), .C(CLK), .nP(RESET), .nR());
REG1 inst8(.Q(Q[8]), .Qbar(), .D(D[8]), .L(LOAD), .C(CLK), .nP(RESET), .nR());
REG1 inst9(.Q(Q[9]), .Qbar(), .D(D[9]), .L(LOAD), .C(CLK), .nP(RESET), .nR());
REG1 inst10(.Q(Q[10]), .Qbar(), .D(D[10]), .L(LOAD), .C(CLK), .nP(RESET), .nR());
REG1 inst11(.Q(Q[11]), .Qbar(), .D(D[11]), .L(LOAD), .C(CLK), .nP(RESET), .nR());
REG1 inst12(.Q(Q[12]), .Qbar(), .D(D[12]), .L(LOAD), .C(CLK), .nP(RESET), .nR());
REG1 inst13(.Q(Q[13]), .Qbar(), .D(D[13]), .L(LOAD), .C(CLK), .nP(RESET), .nR());
REG1 inst14(.Q(Q[14]), .Qbar(), .D(D[14]), .L(LOAD), .C(CLK), .nP(RESET), .nR());
REG1 inst15(.Q(Q[15]), .Qbar(), .D(D[15]), .L(LOAD), .C(CLK), .nP(RESET), .nR());
REG1 inst16(.Q(Q[16]), .Qbar(), .D(D[16]), .L(LOAD), .C(CLK), .nP(RESET), .nR());
REG1 inst17(.Q(Q[17]), .Qbar(), .D(D[17]), .L(LOAD), .C(CLK), .nP(RESET), .nR());
REG1 inst18(.Q(Q[18]), .Qbar(), .D(D[18]), .L(LOAD), .C(CLK), .nP(RESET), .nR());
REG1 inst19(.Q(Q[19]), .Qbar(), .D(D[19]), .L(LOAD), .C(CLK), .nP(RESET), .nR());
REG1 inst20(.Q(Q[20]), .Qbar(), .D(D[20]), .L(LOAD), .C(CLK), .nP(RESET), .nR());
REG1 inst21(.Q(Q[21]), .Qbar(), .D(D[21]), .L(LOAD), .C(CLK), .nP(RESET), .nR());
REG1 inst22(.Q(Q[22]), .Qbar(), .D(D[22]), .L(LOAD), .C(CLK), .nP(RESET), .nR());
REG1 inst23(.Q(Q[23]), .Qbar(), .D(D[23]), .L(LOAD), .C(CLK), .nP(RESET), .nR());
REG1 inst24(.Q(Q[24]), .Qbar(), .D(D[24]), .L(LOAD), .C(CLK), .nP(RESET), .nR());
REG1 inst25(.Q(Q[25]), .Qbar(), .D(D[25]), .L(LOAD), .C(CLK), .nP(RESET), .nR());
REG1 inst26(.Q(Q[26]), .Qbar(), .D(D[26]), .L(LOAD), .C(CLK), .nP(), .nR(RESET));
REG1 inst27(.Q(Q[27]), .Qbar(), .D(D[27]), .L(LOAD), .C(CLK), .nP(), .nR(RESET));
REG1 inst28(.Q(Q[28]), .Qbar(), .D(D[28]), .L(LOAD), .C(CLK), .nP(), .nR(RESET));
REG1 inst29(.Q(Q[29]), .Qbar(), .D(D[29]), .L(LOAD), .C(CLK), .nP(), .nR(RESET));
REG1 inst30(.Q(Q[30]), .Qbar(), .D(D[30]), .L(LOAD), .C(CLK), .nP(), .nR(RESET));
REG1 inst31(.Q(Q[31]), .Qbar(), .D(D[31]), .L(LOAD), .C(CLK), .nP(), .nR(RESET));

endmodule

// 1 bit register +ve edge, 
// Preset on nP=0, nR=1, reset on nP=1, nR=0;
// Undefined nP=0, nR=0
// normal operation nP=1, nR=1
module REG1(Q, Qbar, D, L, C, nP, nR);
input D, C, L;
input nP, nR;
output Q,Qbar;
wire mr, res;

MUX1_2x1 mInst(.Y(mr), .I0(res), .I1(D), .S(L));
D_FF ffInst(.Q(res), .Qbar(Qbar), .D(mr), .C(C), .nP(nP), .nR(nR));
assign Q = res;
endmodule

// 1 bit flipflop +ve edge, 
// Preset on nP=0, nR=1, reset on nP=1, nR=0;
// Undefined nP=0, nR=0
// normal operation nP=1, nR=1
module D_FF(Q, Qbar, D, C, nP, nR);
input D, C;
input nP, nR;
output Q,Qbar;
wire no, n, d1, d2;

not(no, C);
not(n, no);
D_LATCH dInst(.Q(d1), .Qbar(d2), .D(D), .C(no), .nP(nP), .nR(nR));
SR_LATCH srInst(.Q(Q), .Qbar(Qbar), .S(d1), .R(d2), .C(n), .nP(nP), .nR(nR));

endmodule

// 1 bit D latch
// Preset on nP=0, nR=1, reset on nP=1, nR=0;
// Undefined nP=0, nR=0
// normal operation nP=1, nR=1
module D_LATCH(Q, Qbar, D, C, nP, nR);
input D, C;
input nP, nR;
output Q,Qbar;
wire no;

not(no, D);
SR_LATCH srInst(.Q(Q), .Qbar(Qbar), .S(D), .R(no), .C(C), .nP(nP), .nR(nR));

endmodule

// 1 bit SR latch
// Preset on nP=0, nR=1, reset on nP=1, nR=0;
// Undefined nP=0, nR=0
// normal operation nP=1, nR=1
module SR_LATCH(Q,Qbar, S, R, C, nP, nR);
input S, R, C;
input nP, nR;
output Q,Qbar;
wire n1, n2, n3, n4;

nand(n1, S, C);
nand(n2, C, R);
nand(n3, n4, n1, nP);
nand(n4, n3, n2, nR);
assign Q = n3;
assign Qbar = n4;

endmodule

// 5x32 Line decoder
module DECODER_5x32(D,I);
// output
output [31:0] D;
// input
input [4:0] I;
wire n4;
wire [15:0] d;

not(n4, I[4]);
DECODER_4x16 dInst(.D(d), .I(I[3:0]));
and(D[0], d[0], n4);
and(D[1], d[1], n4);
and(D[2], d[2], n4);
and(D[3], d[3], n4);
and(D[4], d[4], n4);
and(D[5], d[5], n4);
and(D[6], d[6], n4);
and(D[7], d[7], n4);
and(D[8], d[8], n4);
and(D[9], d[9], n4);
and(D[10], d[10], n4);
and(D[11], d[11], n4);
and(D[12], d[12], n4);
and(D[13], d[13], n4);
and(D[14], d[14], n4);
and(D[15], d[15], n4);
and(D[16], d[0], I[4]);
and(D[17], d[1], I[4]);
and(D[18], d[2], I[4]);
and(D[19], d[3], I[4]);
and(D[20], d[4], I[4]);
and(D[21], d[5], I[4]);
and(D[22], d[6], I[4]);
and(D[23], d[7], I[4]);
and(D[24], d[8], I[4]);
and(D[25], d[9], I[4]);
and(D[26], d[10], I[4]);
and(D[27], d[11], I[4]);
and(D[28], d[12], I[4]);
and(D[29], d[13], I[4]);
and(D[30], d[14], I[4]);
and(D[31], d[15], I[4]);

endmodule

// 4x16 Line decoder
module DECODER_4x16(D,I);
// output
output [15:0] D;
// input
input [3:0] I;
wire n3;
wire [7:0] d;

not(n3, I[3]);
DECODER_3x8 dInst(.D(d), .I(I[2:0]));
and(D[0], d[0], n3);
and(D[1], d[1], n3);
and(D[2], d[2], n3);
and(D[3], d[3], n3);
and(D[4], d[4], n3);
and(D[5], d[5], n3);
and(D[6], d[6], n3);
and(D[7], d[7], n3);
and(D[8], d[0], I[3]);
and(D[9], d[1], I[3]);
and(D[10], d[2], I[3]);
and(D[11], d[3], I[3]);
and(D[12], d[4], I[3]);
and(D[13], d[5], I[3]);
and(D[14], d[6], I[3]);
and(D[15], d[7], I[3]);

endmodule

// 3x8 Line decoder
module DECODER_3x8(D,I);
// output
output [7:0] D;
// input
input [2:0] I;
wire n2;
wire [3:0] d;

not(n2, I[2]);
DECODER_2x4 dInst(.D(d[3:0]), .I(I[1:0]));
and(D[0], d[0], n2);
and(D[1], d[1], n2);
and(D[2], d[2], n2);
and(D[3], d[3], n2);
and(D[4], d[0], I[2]);
and(D[5], d[1], I[2]);
and(D[6], d[2], I[2]);
and(D[7], d[3], I[2]);

endmodule

// 2x4 Line decoder
module DECODER_2x4(D,I);
// output
output [3:0] D;
// input
input [1:0] I;
wire n0, n1;

not(n0, I[0]);
not(n1, I[1]);
and(D[0], n0, n1);
and(D[1], I[0], n1);
and(D[2], n0, I[1]);
and(D[3], I[0], I[1]);

endmodule
