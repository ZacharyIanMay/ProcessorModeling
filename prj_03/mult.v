// Name: mult.v
// Module: MULT32 , MULT32_U
//
// Output: HI: 32 higher bits
//         LO: 32 lower bits
//         
//
// Input: A : 32-bit input
//        B : 32-bit input
//
// Notes: 32-bit multiplication
// 
//
// Revision History:
//
// Version	Date		Who		email			note
//------------------------------------------------------------------------------------------
//  1.0     Sep 10, 2014	Kaushik Patra	kpatra@sjsu.edu		Initial creation
//------------------------------------------------------------------------------------------
`include "prj_definition.v"

module MULT32(HI, LO, A, B);
// output list
output [31:0] HI;
output [31:0] LO;
// input list
input [31:0] A;
input [31:0] B;

wire [31:0] c1, c2, l, h, m1, m2, ml, mh;
wire [63:0] r;
wire s;

TWOSCOMP32 inst1(.Y(c1), .A(A));
MUX32_2x1 mux1(.Y(m1), .I0(A), .I1(c1), .S(A[31]));
TWOSCOMP32 inst2(.Y(c2), .A(B));
MUX32_2x1 mux2(.Y(m2), .I0(B), .I1(c2), .S(B[31]));

MULT32_U mult(.HI(h), .LO(l), .A(m1), .B(m2));
xor(s, A[31], B[31]);

TWOSCOMP64 inst3(.Y(r), .A({h, l}));
MUX32_2x1 mux3(.Y(LO), .I0(l), .I1(r[31:0]), .S(s));
MUX32_2x1 mux4(.Y(HI), .I0(h), .I1(r[63:32]), .S(s));

endmodule

module MULT32_U(HI, LO, A, B);
// output list
output [31:0] HI;
output [31:0] LO;
// output registers
wire [31:0] HI, LO;
// input list
input [31:0] A;//MCND
input [31:0] B;//MLPR

// wire list
wire [31:0] AR0, AR1, AR2, AR3, AR4, AR5, AR6, AR7, AR8, AR9, AR10, AR11, AR12, AR13, AR14, AR15, AR16, AR17, AR18, AR19;
wire [31:0] AR20, AR21, AR22, AR23, AR24, AR25, AR26, AR27, AR28, AR29, AR30, AR31;
wire [31:0] S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14, S15, S16, S17, S18, S19;
wire [31:0] S20, S21, S22, S23, S24, S25, S26, S27, S28, S29, S30, S31;
wire CO0, CO1, CO2, CO3, CO4, CO5, CO6, CO7, CO8, CO9, CO10, CO11, CO12, CO13, CO14, CO15, CO16, CO17, CO18, CO19;
wire CO20, CO21, CO22, CO23, CO24, CO25, CO26, CO27, CO28, CO29, CO30, CO31;

AND32_2x1 andInst0(.Y(AR0), .A(A), .B({32{B[0]}}));
AND32_2x1 andInst1(.Y(AR1), .A(A), .B({32{B[1]}}));
RC_ADD_SUB_32 addInst0(.Y(S0), .A(AR1), .B({1'b0, AR0[31:1]}), .CO(CO0), .SnA(1'b0));

AND32_2x1 andInst2(.Y(AR2), .A(A), .B({32{B[2]}}));
RC_ADD_SUB_32 addInst1(.Y(S1), .A(AR2), .B({CO0, S0[31:1]}), .CO(CO1), .SnA(1'b0));
AND32_2x1 andInst3(.Y(AR3), .A(A), .B({32{B[3]}}));
RC_ADD_SUB_32 addInst2(.Y(S2), .A(AR3), .B({CO1, S1[31:1]}), .CO(CO2), .SnA(1'b0));
AND32_2x1 andInst4(.Y(AR4), .A(A), .B({32{B[4]}}));
RC_ADD_SUB_32 addInst3(.Y(S3), .A(AR4), .B({CO2, S2[31:1]}), .CO(CO3), .SnA(1'b0));
AND32_2x1 andInst5(.Y(AR5), .A(A), .B({32{B[5]}}));
RC_ADD_SUB_32 addInst4(.Y(S4), .A(AR5), .B({CO3, S3[31:1]}), .CO(CO4), .SnA(1'b0));
AND32_2x1 andInst6(.Y(AR6), .A(A), .B({32{B[6]}}));
RC_ADD_SUB_32 addInst5(.Y(S5), .A(AR6), .B({CO4, S4[31:1]}), .CO(CO5), .SnA(1'b0));
AND32_2x1 andInst7(.Y(AR7), .A(A), .B({32{B[7]}}));
RC_ADD_SUB_32 addInst6(.Y(S6), .A(AR7), .B({CO5, S5[31:1]}), .CO(CO6), .SnA(1'b0));
AND32_2x1 andInst8(.Y(AR8), .A(A), .B({32{B[8]}}));
RC_ADD_SUB_32 addInst7(.Y(S7), .A(AR8), .B({CO6, S6[31:1]}), .CO(CO7), .SnA(1'b0));
AND32_2x1 andInst9(.Y(AR9), .A(A), .B({32{B[9]}}));
RC_ADD_SUB_32 addInst8(.Y(S8), .A(AR9), .B({CO7, S7[31:1]}), .CO(CO8), .SnA(1'b0));
AND32_2x1 andInst10(.Y(AR10), .A(A), .B({32{B[10]}}));
RC_ADD_SUB_32 addInst9(.Y(S9), .A(AR10), .B({CO8, S8[31:1]}), .CO(CO9), .SnA(1'b0));
AND32_2x1 andInst11(.Y(AR11), .A(A), .B({32{B[11]}}));
RC_ADD_SUB_32 addInst10(.Y(S10), .A(AR11), .B({CO9, S9[31:1]}), .CO(CO10), .SnA(1'b0));
AND32_2x1 andInst12(.Y(AR12), .A(A), .B({32{B[12]}}));
RC_ADD_SUB_32 addInst11(.Y(S11), .A(AR12), .B({CO10, S10[31:1]}), .CO(CO11), .SnA(1'b0));
AND32_2x1 andInst13(.Y(AR13), .A(A), .B({32{B[13]}}));
RC_ADD_SUB_32 addInst12(.Y(S12), .A(AR13), .B({CO11, S11[31:1]}), .CO(CO12), .SnA(1'b0));
AND32_2x1 andInst14(.Y(AR14), .A(A), .B({32{B[14]}}));
RC_ADD_SUB_32 addInst13(.Y(S13), .A(AR14), .B({CO12, S12[31:1]}), .CO(CO13), .SnA(1'b0));
AND32_2x1 andInst15(.Y(AR15), .A(A), .B({32{B[15]}}));
RC_ADD_SUB_32 addInst14(.Y(S14), .A(AR15), .B({CO13, S13[31:1]}), .CO(CO14), .SnA(1'b0));
AND32_2x1 andInst16(.Y(AR16), .A(A), .B({32{B[16]}}));
RC_ADD_SUB_32 addInst15(.Y(S15), .A(AR16), .B({CO14, S14[31:1]}), .CO(CO15), .SnA(1'b0));
AND32_2x1 andInst17(.Y(AR17), .A(A), .B({32{B[17]}}));
RC_ADD_SUB_32 addInst16(.Y(S16), .A(AR17), .B({CO15, S15[31:1]}), .CO(CO16), .SnA(1'b0));
AND32_2x1 andInst18(.Y(AR18), .A(A), .B({32{B[18]}}));
RC_ADD_SUB_32 addInst17(.Y(S17), .A(AR18), .B({CO16, S16[31:1]}), .CO(CO17), .SnA(1'b0));
AND32_2x1 andInst19(.Y(AR19), .A(A), .B({32{B[19]}}));
RC_ADD_SUB_32 addInst18(.Y(S18), .A(AR19), .B({CO17, S17[31:1]}), .CO(CO18), .SnA(1'b0));
AND32_2x1 andInst20(.Y(AR20), .A(A), .B({32{B[20]}}));
RC_ADD_SUB_32 addInst19(.Y(S19), .A(AR20), .B({CO18, S18[31:1]}), .CO(CO19), .SnA(1'b0));
AND32_2x1 andInst21(.Y(AR21), .A(A), .B({32{B[21]}}));
RC_ADD_SUB_32 addInst20(.Y(S20), .A(AR21), .B({CO19, S19[31:1]}), .CO(CO20), .SnA(1'b0));
AND32_2x1 andInst22(.Y(AR22), .A(A), .B({32{B[22]}}));
RC_ADD_SUB_32 addInst21(.Y(S21), .A(AR22), .B({CO20, S20[31:1]}), .CO(CO21), .SnA(1'b0));
AND32_2x1 andInst23(.Y(AR23), .A(A), .B({32{B[23]}}));
RC_ADD_SUB_32 addInst22(.Y(S22), .A(AR23), .B({CO21, S21[31:1]}), .CO(CO22), .SnA(1'b0));
AND32_2x1 andInst24(.Y(AR24), .A(A), .B({32{B[24]}}));
RC_ADD_SUB_32 addInst23(.Y(S23), .A(AR24), .B({CO22, S22[31:1]}), .CO(CO23), .SnA(1'b0));
AND32_2x1 andInst25(.Y(AR25), .A(A), .B({32{B[25]}}));
RC_ADD_SUB_32 addInst24(.Y(S24), .A(AR25), .B({CO23, S23[31:1]}), .CO(CO24), .SnA(1'b0));
AND32_2x1 andInst26(.Y(AR26), .A(A), .B({32{B[26]}}));
RC_ADD_SUB_32 addInst25(.Y(S25), .A(AR26), .B({CO24, S24[31:1]}), .CO(CO25), .SnA(1'b0));
AND32_2x1 andInst27(.Y(AR27), .A(A), .B({32{B[27]}}));
RC_ADD_SUB_32 addInst26(.Y(S26), .A(AR27), .B({CO25, S25[31:1]}), .CO(CO26), .SnA(1'b0));
AND32_2x1 andInst28(.Y(AR28), .A(A), .B({32{B[28]}}));
RC_ADD_SUB_32 addInst27(.Y(S27), .A(AR28), .B({CO26, S26[31:1]}), .CO(CO27), .SnA(1'b0));
AND32_2x1 andInst29(.Y(AR29), .A(A), .B({32{B[29]}}));
RC_ADD_SUB_32 addInst28(.Y(S28), .A(AR29), .B({CO27, S27[31:1]}), .CO(CO28), .SnA(1'b0));
AND32_2x1 andInst30(.Y(AR30), .A(A), .B({32{B[30]}}));
RC_ADD_SUB_32 addInst29(.Y(S29), .A(AR30), .B({CO28, S28[31:1]}), .CO(CO29), .SnA(1'b0));
AND32_2x1 andInst31(.Y(AR31), .A(A), .B({32{B[31]}}));
RC_ADD_SUB_32 addInst30(.Y(S30), .A(AR31), .B({CO29, S29[31:1]}), .CO(CO30), .SnA(1'b0));

assign LO = {S30[0], S29[0], S28[0], S27[0], S26[0], S25[0], S24[0], S23[0], S22[0], S21[0], S20[0], S19[0], S18[0], S17[0], S16[0], S15[0], S14[0], S13[0], S12[0], S11[0], S10[0], S9[0], S8[0], S7[0], S6[0], S5[0], S4[0], S3[0], S2[0], S1[0], S0[0], AR0[0]};
assign HI = {CO30, S30[31:0]};

endmodule
