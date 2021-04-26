// Name: register_file.v
// Module: REGISTER_FILE_32x32
// Input:  DATA_W : Data to be written at address ADDR_W
//         ADDR_W : Address of the memory location to be written
//         ADDR_R1 : Address of the memory location to be read for DATA_R1
//         ADDR_R2 : Address of the memory location to be read for DATA_R2
//         READ    : Read signal
//         WRITE   : Write signal
//         CLK     : Clock signal
//         RST     : Reset signal
// Output: DATA_R1 : Data at ADDR_R1 address
//         DATA_R2 : Data at ADDR_R1 address
//
// Notes: - 32 bit word accessible dual read register file having 32 regsisters.
//        - Reset is done at -ve edge of the RST signal
//        - Rest of the operation is done at the +ve edge of the CLK signal
//        - Read operation is done if READ=1 and WRITE=0
//        - Write operation is done if WRITE=1 and READ=0
//        - X is the value at DATA_R* if both READ and WRITE are 0 or 1
//
// Revision History:
//
// Version	Date		Who		email			note
//------------------------------------------------------------------------------------------
//  1.0     Sep 10, 2014	Kaushik Patra	kpatra@sjsu.edu		Initial creation
//------------------------------------------------------------------------------------------
//
`include "prj_definition.v"

// This is going to be +ve edge clock triggered register file.
// Reset on RST=0
module REGISTER_FILE_32x32(DATA_R1, DATA_R2, ADDR_R1, ADDR_R2, 
                            DATA_W, ADDR_W, READ, WRITE, CLK, RST);

// input list
input READ, WRITE, CLK, RST;
input [`DATA_INDEX_LIMIT:0] DATA_W;
input [`REG_ADDR_INDEX_LIMIT:0] ADDR_R1, ADDR_R2, ADDR_W;

// output list
output [`DATA_INDEX_LIMIT:0] DATA_R1;
output [`DATA_INDEX_LIMIT:0] DATA_R2;

// wire list
wire [31:0] decO, L, q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16, q17, q18, q19, q20, q21, q22, q23, q24, q25, q26, q27, q28, q29, q30, q31, res1, res2;

DECODER_5x32 dInst(.D(decO), .I(ADDR_W));
AND32_2x1 aInst(.Y(L), .A(decO), .B({32{WRITE}}));

REG32 rInst0(.Q(q0), .D(DATA_W), .LOAD(L[0]), .CLK(CLK), .RESET(RST));
REG32 rInst1(.Q(q1), .D(DATA_W), .LOAD(L[1]), .CLK(CLK), .RESET(RST));
REG32 rInst2(.Q(q2), .D(DATA_W), .LOAD(L[2]), .CLK(CLK), .RESET(RST));
REG32 rInst3(.Q(q3), .D(DATA_W), .LOAD(L[3]), .CLK(CLK), .RESET(RST));
REG32 rInst4(.Q(q4), .D(DATA_W), .LOAD(L[4]), .CLK(CLK), .RESET(RST));
REG32 rInst5(.Q(q5), .D(DATA_W), .LOAD(L[5]), .CLK(CLK), .RESET(RST));
REG32 rInst6(.Q(q6), .D(DATA_W), .LOAD(L[6]), .CLK(CLK), .RESET(RST));
REG32 rInst7(.Q(q7), .D(DATA_W), .LOAD(L[7]), .CLK(CLK), .RESET(RST));
REG32 rInst8(.Q(q8), .D(DATA_W), .LOAD(L[8]), .CLK(CLK), .RESET(RST));
REG32 rInst9(.Q(q9), .D(DATA_W), .LOAD(L[9]), .CLK(CLK), .RESET(RST));
REG32 rInst10(.Q(q10), .D(DATA_W), .LOAD(L[10]), .CLK(CLK), .RESET(RST));
REG32 rInst11(.Q(q11), .D(DATA_W), .LOAD(L[11]), .CLK(CLK), .RESET(RST));
REG32 rInst12(.Q(q12), .D(DATA_W), .LOAD(L[12]), .CLK(CLK), .RESET(RST));
REG32 rInst13(.Q(q13), .D(DATA_W), .LOAD(L[13]), .CLK(CLK), .RESET(RST));
REG32 rInst14(.Q(q14), .D(DATA_W), .LOAD(L[14]), .CLK(CLK), .RESET(RST));
REG32 rInst15(.Q(q15), .D(DATA_W), .LOAD(L[15]), .CLK(CLK), .RESET(RST));
REG32 rInst16(.Q(q16), .D(DATA_W), .LOAD(L[16]), .CLK(CLK), .RESET(RST));
REG32 rInst17(.Q(q17), .D(DATA_W), .LOAD(L[17]), .CLK(CLK), .RESET(RST));
REG32 rInst18(.Q(q18), .D(DATA_W), .LOAD(L[18]), .CLK(CLK), .RESET(RST));
REG32 rInst19(.Q(q19), .D(DATA_W), .LOAD(L[19]), .CLK(CLK), .RESET(RST));
REG32 rInst20(.Q(q20), .D(DATA_W), .LOAD(L[20]), .CLK(CLK), .RESET(RST));
REG32 rInst21(.Q(q21), .D(DATA_W), .LOAD(L[21]), .CLK(CLK), .RESET(RST));
REG32 rInst22(.Q(q22), .D(DATA_W), .LOAD(L[22]), .CLK(CLK), .RESET(RST));
REG32 rInst23(.Q(q23), .D(DATA_W), .LOAD(L[23]), .CLK(CLK), .RESET(RST));
REG32 rInst24(.Q(q24), .D(DATA_W), .LOAD(L[24]), .CLK(CLK), .RESET(RST));
REG32 rInst25(.Q(q25), .D(DATA_W), .LOAD(L[25]), .CLK(CLK), .RESET(RST));
REG32 rInst26(.Q(q26), .D(DATA_W), .LOAD(L[26]), .CLK(CLK), .RESET(RST));
REG32 rInst27(.Q(q27), .D(DATA_W), .LOAD(L[27]), .CLK(CLK), .RESET(RST));
REG32 rInst28(.Q(q28), .D(DATA_W), .LOAD(L[28]), .CLK(CLK), .RESET(RST));
REG32 rInst29(.Q(q29), .D(DATA_W), .LOAD(L[29]), .CLK(CLK), .RESET(RST));
REG32 rInst30(.Q(q30), .D(DATA_W), .LOAD(L[30]), .CLK(CLK), .RESET(RST));
REG32 rInst31(.Q(q31), .D(DATA_W), .LOAD(L[31]), .CLK(CLK), .RESET(RST));

MUX32_32x1 muxInst1(.S(ADDR_R1), .Y(res1), .I0(q0), .I1(q1), .I2(q2), .I3(q3), .I4(q4), .I5(q5), .I6(q6), .I7(q7), .I8(q8), .I9(q9), .I10(q10), .I11(q11), .I12(q12), .I13(q13), .I14(q14), .I15(q15), .I16(q16), .I17(q17), .I18(q18), .I19(q19), .I20(q20), .I21(q21), .I22(q22), .I23(q23), .I24(q24), .I25(q25), .I26(q26), .I27(q27), .I28(q28), .I29(q29), .I30(q30), .I31(q31));
MUX32_32x1 muxInst2(.S(ADDR_R2), .Y(res2), .I0(q0), .I1(q1), .I2(q2), .I3(q3), .I4(q4), .I5(q5), .I6(q6), .I7(q7), .I8(q8), .I9(q9), .I10(q10), .I11(q11), .I12(q12), .I13(q13), .I14(q14), .I15(q15), .I16(q16), .I17(q17), .I18(q18), .I19(q19), .I20(q20), .I21(q21), .I22(q22), .I23(q23), .I24(q24), .I25(q25), .I26(q26), .I27(q27), .I28(q28), .I29(q29), .I30(q30), .I31(q31));

MUX32_2x1 musInst3(.S(READ), .Y(DATA_R1), .I0(32'bZ), .I1(res1));
MUX32_2x1 musInst4(.S(READ), .Y(DATA_R2), .I0(32'bZ), .I1(res2));

endmodule
