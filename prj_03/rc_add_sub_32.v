// Name: rc_add_sub_32.v
// Module: RC_ADD_SUB_32
//
// Output: Y : Output 32-bit
//         CO : Carry Out
//         
//
// Input: A : 32-bit input
//        B : 32-bit input
//        SnA : if SnA=0 it is add, subtraction otherwise
//
// Notes: 32-bit adder / subtractor implementaiton.
// 
//
// Revision History:
//
// Version	Date		Who		email			note
//------------------------------------------------------------------------------------------
//  1.0     Sep 10, 2014	Kaushik Patra	kpatra@sjsu.edu		Initial creation
//------------------------------------------------------------------------------------------
`include "prj_definition.v"

module RC_ADD_SUB_64(Y, CO, A, B, SnA);
// output list
output [63:0] Y;
output CO;
// input list
input [63:0] A;
input [63:0] B;
input SnA;
// wire list
wire [63:0] BX;
wire [63:0] C;

xor(BX[0], B[0], SnA);
xor(BX[1], B[1], SnA);
xor(BX[2], B[2], SnA);
xor(BX[3], B[3], SnA);
xor(BX[4], B[4], SnA);
xor(BX[5], B[5], SnA);
xor(BX[6], B[6], SnA);
xor(BX[7], B[7], SnA);
xor(BX[8], B[8], SnA);
xor(BX[9], B[9], SnA);
xor(BX[10], B[10], SnA);
xor(BX[11], B[11], SnA);
xor(BX[12], B[12], SnA);
xor(BX[13], B[13], SnA);
xor(BX[14], B[14], SnA);
xor(BX[15], B[15], SnA);
xor(BX[16], B[16], SnA);
xor(BX[17], B[17], SnA);
xor(BX[18], B[18], SnA);
xor(BX[19], B[19], SnA);
xor(BX[20], B[20], SnA);
xor(BX[21], B[21], SnA);
xor(BX[22], B[22], SnA);
xor(BX[23], B[23], SnA);
xor(BX[24], B[24], SnA);
xor(BX[25], B[25], SnA);
xor(BX[26], B[26], SnA);
xor(BX[27], B[27], SnA);
xor(BX[28], B[28], SnA);
xor(BX[29], B[29], SnA);
xor(BX[30], B[30], SnA);
xor(BX[31], B[31], SnA);
xor(BX[32], B[32], SnA);
xor(BX[33], B[33], SnA);
xor(BX[34], B[34], SnA);
xor(BX[35], B[35], SnA);
xor(BX[36], B[36], SnA);
xor(BX[37], B[37], SnA);
xor(BX[38], B[38], SnA);
xor(BX[39], B[39], SnA);
xor(BX[40], B[40], SnA);
xor(BX[41], B[41], SnA);
xor(BX[42], B[42], SnA);
xor(BX[43], B[43], SnA);
xor(BX[44], B[44], SnA);
xor(BX[45], B[45], SnA);
xor(BX[46], B[46], SnA);
xor(BX[47], B[47], SnA);
xor(BX[48], B[48], SnA);
xor(BX[49], B[49], SnA);
xor(BX[50], B[50], SnA);
xor(BX[51], B[51], SnA);
xor(BX[52], B[52], SnA);
xor(BX[53], B[53], SnA);
xor(BX[54], B[54], SnA);
xor(BX[55], B[55], SnA);
xor(BX[56], B[56], SnA);
xor(BX[57], B[57], SnA);
xor(BX[58], B[58], SnA);
xor(BX[59], B[59], SnA);
xor(BX[60], B[60], SnA);
xor(BX[61], B[61], SnA);
xor(BX[62], B[62], SnA);
xor(BX[63], B[63], SnA);

FULL_ADDER add0(.S(Y[0]), .CO(C[0]), .A(A[0]), .B(BX[0]), .CI(SnA));
FULL_ADDER add1(.S(Y[1]), .CO(C[1]), .A(A[1]), .B(BX[1]), .CI(C[0]));
FULL_ADDER add2(.S(Y[2]), .CO(C[2]), .A(A[2]), .B(BX[2]), .CI(C[1]));
FULL_ADDER add3(.S(Y[3]), .CO(C[3]), .A(A[3]), .B(BX[3]), .CI(C[2]));
FULL_ADDER add4(.S(Y[4]), .CO(C[4]), .A(A[4]), .B(BX[4]), .CI(C[3]));
FULL_ADDER add5(.S(Y[5]), .CO(C[5]), .A(A[5]), .B(BX[5]), .CI(C[4]));
FULL_ADDER add6(.S(Y[6]), .CO(C[6]), .A(A[6]), .B(BX[6]), .CI(C[5]));
FULL_ADDER add7(.S(Y[7]), .CO(C[7]), .A(A[7]), .B(BX[7]), .CI(C[6]));
FULL_ADDER add8(.S(Y[8]), .CO(C[8]), .A(A[8]), .B(BX[8]), .CI(C[7]));
FULL_ADDER add9(.S(Y[9]), .CO(C[9]), .A(A[9]), .B(BX[9]), .CI(C[8]));
FULL_ADDER add10(.S(Y[10]), .CO(C[10]), .A(A[10]), .B(BX[10]), .CI(C[9]));
FULL_ADDER add11(.S(Y[11]), .CO(C[11]), .A(A[11]), .B(BX[11]), .CI(C[10]));
FULL_ADDER add12(.S(Y[12]), .CO(C[12]), .A(A[12]), .B(BX[12]), .CI(C[11]));
FULL_ADDER add13(.S(Y[13]), .CO(C[13]), .A(A[13]), .B(BX[13]), .CI(C[12]));
FULL_ADDER add14(.S(Y[14]), .CO(C[14]), .A(A[14]), .B(BX[14]), .CI(C[13]));
FULL_ADDER add15(.S(Y[15]), .CO(C[15]), .A(A[15]), .B(BX[15]), .CI(C[14]));
FULL_ADDER add16(.S(Y[16]), .CO(C[16]), .A(A[16]), .B(BX[16]), .CI(C[15]));
FULL_ADDER add17(.S(Y[17]), .CO(C[17]), .A(A[17]), .B(BX[17]), .CI(C[16]));
FULL_ADDER add18(.S(Y[18]), .CO(C[18]), .A(A[18]), .B(BX[18]), .CI(C[17]));
FULL_ADDER add19(.S(Y[19]), .CO(C[19]), .A(A[19]), .B(BX[19]), .CI(C[18]));
FULL_ADDER add20(.S(Y[20]), .CO(C[20]), .A(A[20]), .B(BX[20]), .CI(C[19]));
FULL_ADDER add21(.S(Y[21]), .CO(C[21]), .A(A[21]), .B(BX[21]), .CI(C[20]));
FULL_ADDER add22(.S(Y[22]), .CO(C[22]), .A(A[22]), .B(BX[22]), .CI(C[21]));
FULL_ADDER add23(.S(Y[23]), .CO(C[23]), .A(A[23]), .B(BX[23]), .CI(C[22]));
FULL_ADDER add24(.S(Y[24]), .CO(C[24]), .A(A[24]), .B(BX[24]), .CI(C[23]));
FULL_ADDER add25(.S(Y[25]), .CO(C[25]), .A(A[25]), .B(BX[25]), .CI(C[24]));
FULL_ADDER add26(.S(Y[26]), .CO(C[26]), .A(A[26]), .B(BX[26]), .CI(C[25]));
FULL_ADDER add27(.S(Y[27]), .CO(C[27]), .A(A[27]), .B(BX[27]), .CI(C[26]));
FULL_ADDER add28(.S(Y[28]), .CO(C[28]), .A(A[28]), .B(BX[28]), .CI(C[27]));
FULL_ADDER add29(.S(Y[29]), .CO(C[29]), .A(A[29]), .B(BX[29]), .CI(C[28]));
FULL_ADDER add30(.S(Y[30]), .CO(C[30]), .A(A[30]), .B(BX[30]), .CI(C[29]));
FULL_ADDER add31(.S(Y[31]), .CO(C[31]), .A(A[31]), .B(BX[31]), .CI(C[30]));
FULL_ADDER add32(.S(Y[32]), .CO(C[32]), .A(A[32]), .B(BX[32]), .CI(C[31]));
FULL_ADDER add33(.S(Y[33]), .CO(C[33]), .A(A[33]), .B(BX[33]), .CI(C[32]));
FULL_ADDER add34(.S(Y[34]), .CO(C[34]), .A(A[34]), .B(BX[34]), .CI(C[33]));
FULL_ADDER add35(.S(Y[35]), .CO(C[35]), .A(A[35]), .B(BX[35]), .CI(C[34]));
FULL_ADDER add36(.S(Y[36]), .CO(C[36]), .A(A[36]), .B(BX[36]), .CI(C[35]));
FULL_ADDER add37(.S(Y[37]), .CO(C[37]), .A(A[37]), .B(BX[37]), .CI(C[36]));
FULL_ADDER add38(.S(Y[38]), .CO(C[38]), .A(A[38]), .B(BX[38]), .CI(C[37]));
FULL_ADDER add39(.S(Y[39]), .CO(C[39]), .A(A[39]), .B(BX[39]), .CI(C[38]));
FULL_ADDER add40(.S(Y[40]), .CO(C[40]), .A(A[40]), .B(BX[40]), .CI(C[39]));
FULL_ADDER add41(.S(Y[41]), .CO(C[41]), .A(A[41]), .B(BX[41]), .CI(C[40]));
FULL_ADDER add42(.S(Y[42]), .CO(C[42]), .A(A[42]), .B(BX[42]), .CI(C[41]));
FULL_ADDER add43(.S(Y[43]), .CO(C[43]), .A(A[43]), .B(BX[43]), .CI(C[42]));
FULL_ADDER add44(.S(Y[44]), .CO(C[44]), .A(A[44]), .B(BX[44]), .CI(C[43]));
FULL_ADDER add45(.S(Y[45]), .CO(C[45]), .A(A[45]), .B(BX[45]), .CI(C[44]));
FULL_ADDER add46(.S(Y[46]), .CO(C[46]), .A(A[46]), .B(BX[46]), .CI(C[45]));
FULL_ADDER add47(.S(Y[47]), .CO(C[47]), .A(A[47]), .B(BX[47]), .CI(C[46]));
FULL_ADDER add48(.S(Y[48]), .CO(C[48]), .A(A[48]), .B(BX[48]), .CI(C[47]));
FULL_ADDER add49(.S(Y[49]), .CO(C[49]), .A(A[49]), .B(BX[49]), .CI(C[48]));
FULL_ADDER add50(.S(Y[50]), .CO(C[50]), .A(A[50]), .B(BX[50]), .CI(C[49]));
FULL_ADDER add51(.S(Y[51]), .CO(C[51]), .A(A[51]), .B(BX[51]), .CI(C[50]));
FULL_ADDER add52(.S(Y[52]), .CO(C[52]), .A(A[52]), .B(BX[52]), .CI(C[51]));
FULL_ADDER add53(.S(Y[53]), .CO(C[53]), .A(A[53]), .B(BX[53]), .CI(C[52]));
FULL_ADDER add54(.S(Y[54]), .CO(C[54]), .A(A[54]), .B(BX[54]), .CI(C[53]));
FULL_ADDER add55(.S(Y[55]), .CO(C[55]), .A(A[55]), .B(BX[55]), .CI(C[54]));
FULL_ADDER add56(.S(Y[56]), .CO(C[56]), .A(A[56]), .B(BX[56]), .CI(C[55]));
FULL_ADDER add57(.S(Y[57]), .CO(C[57]), .A(A[57]), .B(BX[57]), .CI(C[56]));
FULL_ADDER add58(.S(Y[58]), .CO(C[58]), .A(A[58]), .B(BX[58]), .CI(C[57]));
FULL_ADDER add59(.S(Y[59]), .CO(C[59]), .A(A[59]), .B(BX[59]), .CI(C[58]));
FULL_ADDER add60(.S(Y[60]), .CO(C[60]), .A(A[60]), .B(BX[60]), .CI(C[59]));
FULL_ADDER add61(.S(Y[61]), .CO(C[61]), .A(A[61]), .B(BX[61]), .CI(C[60]));
FULL_ADDER add62(.S(Y[62]), .CO(C[62]), .A(A[62]), .B(BX[62]), .CI(C[61]));
FULL_ADDER add63(.S(Y[63]), .CO(CO), .A(A[63]), .B(BX[63]), .CI(C[62]));

endmodule

module RC_ADD_SUB_32(Y, CO, A, B, SnA);
// output list
output [31:0] Y;
output CO;
// input list
input [31:0] A;
input [31:0] B;
input SnA;
// wire list
wire [31:0] BX;
wire [31:0] C;

xor(BX[0], B[0], SnA);
xor(BX[1], B[1], SnA);
xor(BX[2], B[2], SnA);
xor(BX[3], B[3], SnA);
xor(BX[4], B[4], SnA);
xor(BX[5], B[5], SnA);
xor(BX[6], B[6], SnA);
xor(BX[7], B[7], SnA);
xor(BX[8], B[8], SnA);
xor(BX[9], B[9], SnA);

xor(BX[10], B[10], SnA);
xor(BX[11], B[11], SnA);
xor(BX[12], B[12], SnA);
xor(BX[13], B[13], SnA);
xor(BX[14], B[14], SnA);
xor(BX[15], B[15], SnA);
xor(BX[16], B[16], SnA);
xor(BX[17], B[17], SnA);
xor(BX[18], B[18], SnA);
xor(BX[19], B[19], SnA);

xor(BX[20], B[20], SnA);
xor(BX[21], B[21], SnA);
xor(BX[22], B[22], SnA);
xor(BX[23], B[23], SnA);
xor(BX[24], B[24], SnA);
xor(BX[25], B[25], SnA);
xor(BX[26], B[26], SnA);
xor(BX[27], B[27], SnA);
xor(BX[28], B[28], SnA);
xor(BX[29], B[29], SnA);

xor(BX[30], B[30], SnA);
xor(BX[31], B[31], SnA);

FULL_ADDER add0(.S(Y[0]), .CO(C[0]), .A(A[0]), .B(BX[0]), .CI(SnA));
FULL_ADDER add1(.S(Y[1]), .CO(C[1]), .A(A[1]), .B(BX[1]), .CI(C[0]));
FULL_ADDER add2(.S(Y[2]), .CO(C[2]), .A(A[2]), .B(BX[2]), .CI(C[1]));
FULL_ADDER add3(.S(Y[3]), .CO(C[3]), .A(A[3]), .B(BX[3]), .CI(C[2]));
FULL_ADDER add4(.S(Y[4]), .CO(C[4]), .A(A[4]), .B(BX[4]), .CI(C[3]));
FULL_ADDER add5(.S(Y[5]), .CO(C[5]), .A(A[5]), .B(BX[5]), .CI(C[4]));
FULL_ADDER add6(.S(Y[6]), .CO(C[6]), .A(A[6]), .B(BX[6]), .CI(C[5]));
FULL_ADDER add7(.S(Y[7]), .CO(C[7]), .A(A[7]), .B(BX[7]), .CI(C[6]));
FULL_ADDER add8(.S(Y[8]), .CO(C[8]), .A(A[8]), .B(BX[8]), .CI(C[7]));
FULL_ADDER add9(.S(Y[9]), .CO(C[9]), .A(A[9]), .B(BX[9]), .CI(C[8]));

FULL_ADDER add10(.S(Y[10]), .CO(C[10]), .A(A[10]), .B(BX[10]), .CI(C[9]));
FULL_ADDER add11(.S(Y[11]), .CO(C[11]), .A(A[11]), .B(BX[11]), .CI(C[10]));
FULL_ADDER add12(.S(Y[12]), .CO(C[12]), .A(A[12]), .B(BX[12]), .CI(C[11]));
FULL_ADDER add13(.S(Y[13]), .CO(C[13]), .A(A[13]), .B(BX[13]), .CI(C[12]));
FULL_ADDER add14(.S(Y[14]), .CO(C[14]), .A(A[14]), .B(BX[14]), .CI(C[13]));
FULL_ADDER add15(.S(Y[15]), .CO(C[15]), .A(A[15]), .B(BX[15]), .CI(C[14]));
FULL_ADDER add16(.S(Y[16]), .CO(C[16]), .A(A[16]), .B(BX[16]), .CI(C[15]));
FULL_ADDER add17(.S(Y[17]), .CO(C[17]), .A(A[17]), .B(BX[17]), .CI(C[16]));
FULL_ADDER add18(.S(Y[18]), .CO(C[18]), .A(A[18]), .B(BX[18]), .CI(C[17]));
FULL_ADDER add19(.S(Y[19]), .CO(C[19]), .A(A[19]), .B(BX[19]), .CI(C[18]));

FULL_ADDER add20(.S(Y[20]), .CO(C[20]), .A(A[20]), .B(BX[20]), .CI(C[19]));
FULL_ADDER add21(.S(Y[21]), .CO(C[21]), .A(A[21]), .B(BX[21]), .CI(C[20]));
FULL_ADDER add22(.S(Y[22]), .CO(C[22]), .A(A[22]), .B(BX[22]), .CI(C[21]));
FULL_ADDER add23(.S(Y[23]), .CO(C[23]), .A(A[23]), .B(BX[23]), .CI(C[22]));
FULL_ADDER add24(.S(Y[24]), .CO(C[24]), .A(A[24]), .B(BX[24]), .CI(C[23]));
FULL_ADDER add25(.S(Y[25]), .CO(C[25]), .A(A[25]), .B(BX[25]), .CI(C[24]));
FULL_ADDER add26(.S(Y[26]), .CO(C[26]), .A(A[26]), .B(BX[26]), .CI(C[25]));
FULL_ADDER add27(.S(Y[27]), .CO(C[27]), .A(A[27]), .B(BX[27]), .CI(C[26]));
FULL_ADDER add28(.S(Y[28]), .CO(C[28]), .A(A[28]), .B(BX[28]), .CI(C[27]));
FULL_ADDER add29(.S(Y[29]), .CO(C[29]), .A(A[29]), .B(BX[29]), .CI(C[28]));

FULL_ADDER add30(.S(Y[30]), .CO(C[30]), .A(A[30]), .B(BX[30]), .CI(C[29]));
FULL_ADDER add31(.S(Y[31]), .CO(CO), .A(A[31]), .B(BX[31]), .CI(C[30]));


endmodule

