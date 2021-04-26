// Name: data_path.v
// Module: DATA_PATH
// Output:  DATA : Data to be written at address ADDR
//          ADDR : Address of the memory location to be accessed
//
// Input:   DATA : Data read out in the read operation
//          CLK  : Clock signal
//          RST  : Reset signal
//
// Notes: - 32 bit processor implementing cs147sec05 instruction set
//
// Revision History:
//
// Version	Date		Who		email			note
//------------------------------------------------------------------------------------------
//  1.0     Sep 10, 2014	Kaushik Patra	kpatra@sjsu.edu		Initial creation
//------------------------------------------------------------------------------------------
//
`include "prj_definition.v"
module DATA_PATH(DATA_OUT, ADDR, ZERO, INSTRUCTION, DATA_IN, CTRL, CLK, RST);

// output list
output [`ADDRESS_INDEX_LIMIT:0] ADDR;
output ZERO;
output [`DATA_INDEX_LIMIT:0] DATA_OUT, INSTRUCTION;

// input list
input [`CTRL_WIDTH_INDEX_LIMIT:0]  CTRL;
input CLK, RST;
input [`DATA_INDEX_LIMIT:0] DATA_IN;

/**
* CTRL description
* 0 - PC load
* 1 - IR load
* 2 - SP load
* 3 - reg write
* 4 - reg read
* (5-10) - ALU oprn
* 11 - PC s1
* 12 - PC s2
* 13 - PC s3
* 14 - Read addr s1
* 15 - Write addr s1
* 16 - Write addr s2
* 17 - Write addr s3
* 18 - Write data s1
* 19 - Write data s2
* 20 - Write data s3
* 21 - Op 1 s1
* 22 - Op 2 s1
* 23 - Op 2 s2
* 24 - Op 2 s3
* 25 - Op 2 s4
* 26 - Memory data s1
* 27 - Memory address s1
* 28 - Memory address s2
*/

// wire list
wire [31:0] w1, w2, w3, w4, w5, w6, w7, w8, w9;
wire [31:0] R1data, R2data, R1ad, Win, Wad, Oin1, Oin2, Aluout, instQ, pcQ, spQ;
wire [31:0] addO1, addO2, pc1O, pc2O, pc3O, wa1O, wa2O, wd1O, wd2O;
wire [31:0] op2s1O, op2s2O, op2s3O, ma1O;
wire [5:0] addrPre;
wire rst, override;

assign INSTRUCTION = instQ;

MUX32_2x1 pc1(.S(CTRL[11]), .I0(R1data), .I1(addO1), .Y(pc1O));
MUX32_2x1 pc2(.S(CTRL[12]), .I0(pc1O), .I1(addO2), .Y(pc2O));
MUX32_2x1 pc3(.S(CTRL[13]), .I0({{6{1'b0}}, instQ[25:0]}), .I1(pc2O), .Y(pc3O));
MUX32_2x1 ra1(.S(CTRL[14]), .I0({{27{1'b0}}, instQ[25:21]}), .I1(0), .Y(R1ad));
MUX32_2x1 wa1(.S(CTRL[15]), .I0({{27{1'b0}}, instQ[15:11]}), .I1({{27{1'b0}}, instQ[20:16]}), .Y(wa1O));
MUX32_2x1 wa2(.S(CTRL[16]), .I0(0), .I1(31), .Y(wa2O));
MUX32_2x1 wa3(.S(CTRL[17]), .I0(wa2O), .I1(wa1O), .Y(Wad));
MUX32_2x1 wd1(.S(CTRL[18]), .I0(Aluout), .I1(DATA_IN), .Y(wd1O));
MUX32_2x1 wd2(.S(CTRL[19]), .I0(wd1O), .I1({instQ[15:0], {16{1'b0}}}), .Y(wd2O));
MUX32_2x1 wd3(.S(CTRL[20]), .I0(addO1), .I1(wd2O), .Y(Win));
MUX32_2x1 op1s1(.S(CTRL[21]), .I0(R1data), .I1(spQ), .Y(Oin1));
MUX32_2x1 op2s1(.S(CTRL[22]), .I0({{27{1'b0}}, instQ[10:6]}), .I1(1), .Y(op2s1O));
MUX32_2x1 op2s2(.S(CTRL[23]), .I0({{16{1'b0}}, instQ[15:0]}), .I1({{16{instQ[15]}}, instQ[15:0]}), .Y(op2s2O));
MUX32_2x1 op2s3(.S(CTRL[24]), .I0(op2s2O), .I1(op2s1O), .Y(op2s3O));
MUX32_2x1 op2s4(.S(CTRL[25]), .I0(op2s3O), .I1(R2data), .Y(Oin2));
MUX32_2x1 md1(.S(CTRL[26]), .I0(R2data), .I1(R1data), .Y(DATA_OUT));
MUX32_2x1 ma1(.S(CTRL[27]), .I0(Aluout), .I1(spQ), .Y(ma1O));
MUX32_2x1 ma2(.S(CTRL[28]), .I0(ma1O), .I1(pcQ), .Y({addrPre, ADDR}));

RC_ADD_SUB_32 adder1(.Y(addO1), .CO(), .A(pcQ), .B(1), .SnA(1'b0));
RC_ADD_SUB_32 adder2(.Y(addO2), .CO(), .A(addO1), .B({{16{instQ[15]}}, instQ[15:0]}), .SnA(1'b0));

ALU alu(.OUT(Aluout), .ZERO(ZERO), .OP1(Oin1), .OP2(Oin2), .OPRN(CTRL[10:5]));
REGISTER_FILE_32x32 regFile(.DATA_R1(R1data), .DATA_R2(R2data), .ADDR_R1(R1ad[4:0]), .ADDR_R2(instQ[20:16]), .DATA_W(Win), .ADDR_W(Wad[4:0]), .READ(CTRL[4]), .WRITE(CTRL[3]), .CLK(CLK), .RST(RST));
REG32 instReg(.Q(instQ), .D(DATA_IN), .LOAD(CTRL[1]), .CLK(CLK), .RESET(RST));
not(override, CTRL[31]);
and(rst, RST, override);
PC_REG pc(.Q(pcQ), .D(pc2O), .LOAD(CTRL[0]), .CLK(CLK), .RESET(rst));
SP_REG sp(.Q(spQ), .D(Aluout), .LOAD(CTRL[2]), .CLK(CLK), .RESET(RST));

endmodule
