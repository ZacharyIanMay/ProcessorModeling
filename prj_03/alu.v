// Name: alu.v
// Module: ALU
// Input: OP1[32] - operand 1
//        OP2[32] - operand 2
//        OPRN[6] - operation code
// Output: OUT[32] - output result for the operation
//
// Notes: 32 bit combinatorial ALU
// 
// Supports the following functions
//	- Integer add (0x1), sub(0x2), mul(0x3)
//	- Integer shift_rigth (0x4), shift_left (0x5)
//	- Bitwise and (0x6), or (0x7), nor (0x8)
//  - set less than (0x9)
//
// Revision History:
//
// Version	Date		Who		email			note
//------------------------------------------------------------------------------------------
//  1.0     Sep 10, 2014	Kaushik Patra	kpatra@sjsu.edu		Initial creation
//------------------------------------------------------------------------------------------
//
module ALU(OUT, ZERO, OP1, OP2, OPRN);
// input list
input [31:0] OP1; // operand 1
input [31:0] OP2; // operand 2
input [5:0] OPRN; // operation code

// output list
output [31:0] OUT; // result of the operation.
output ZERO;

// wire list
wire nr, ar, orr, CO;
wire [31:0] I1, I2, I3, I4, I5, I6, I7, I8, I9, res;

and(ar, OPRN[3], OPRN[0]);
not(nr, OPRN[0]);
or(orr, ar, nr);

RC_ADD_SUB_32 addSubSlt(.Y(I1), .CO(CO), .A(OP1), .B(OP2), .SnA(orr));
assign I2 = I1;
assign I9 = {{31{1'b0}}, I1[31]};
MULT32 multiplier(.HI(), .LO(I3), .A(OP1), .B(OP2));
SHIFT32 shifter(.Y(I4), .D(OP1), .S(OP2), .LnR(OPRN[0]));
assign I5=I4;
AND32_2x1 ander(.Y(I6), .A(OP1), .B(OP2));
OR32_2x1 orer(.Y(I7), .A(OP1), .B(OP2));
NOR32_2x1 norer(.Y(I8), .A(OP1), .B(OP2));

MUX32_16x1 mux(.Y(res), .I0(0), .I1(I1), .I2(I2), .I3(I3), .I4(I4), .I5(I5), .I6(I6), .I7(I7), .I8(I8), .I9(I9), .I10(0), .I11(0), .I12(0), .I13(0), .I14(0), .I15(0), .S(OPRN[3:0]));

nor(ZERO, res[0], res[1], res[2], res[3], res[4], res[5], res[6], res[7], res[8], res[9], res[10], res[11], res[12], res[13], res[14], res[15], res[16], res[17], res[18], res[19], res[20], res[21], res[22], res[23], res[24], res[25], res[26], res[27], res[28], res[29], res[30], res[31]);
assign OUT = res;

endmodule