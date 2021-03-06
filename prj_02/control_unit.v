// Name: control_unit.v
// Module: CONTROL_UNIT
// Output: RF_DATA_W  : Data to be written at register file address RF_ADDR_W
//         RF_ADDR_W  : Register file address of the memory location to be written
//         RF_ADDR_R1 : Register file address of the memory location to be read for RF_DATA_R1
//         RF_ADDR_R2 : Registere file address of the memory location to be read for RF_DATA_R2
//         RF_READ    : Register file Read signal
//         RF_WRITE   : Register file Write signal
//         ALU_OP1    : ALU operand 1
//         ALU_OP2    : ALU operand 2
//         ALU_OPRN   : ALU operation code
//         MEM_ADDR   : Memory address to be read in
//         MEM_READ   : Memory read signal
//         MEM_WRITE  : Memory write signal
//         
// Input:  RF_DATA_R1 : Data at ADDR_R1 address
//         RF_DATA_R2 : Data at ADDR_R1 address
//         ALU_RESULT    : ALU output data
//         CLK        : Clock signal
//         RST        : Reset signal
//
// INOUT: MEM_DATA    : Data to be read in from or write to the memory
//
// Notes: - Control unit synchronize operations of a processor
//
// Revision History:
//
// Version	Date		Who		email			note
//------------------------------------------------------------------------------------------
//  1.0     Sep 10, 2014	Kaushik Patra	kpatra@sjsu.edu		Initial creation
//  1.1     Oct 19, 2014        Kaushik Patra   kpatra@sjsu.edu         Added ZERO status output
//------------------------------------------------------------------------------------------
`include "prj_definition.v"
module CONTROL_UNIT(MEM_DATA, RF_DATA_W, RF_ADDR_W, RF_ADDR_R1, RF_ADDR_R2, RF_READ, RF_WRITE,
                    ALU_OP1, ALU_OP2, ALU_OPRN, MEM_ADDR, MEM_READ, MEM_WRITE,
                    RF_DATA_R1, RF_DATA_R2, ALU_RESULT, ZERO, CLK, RST); 

// Output signals
// Outputs for register file 
output [`DATA_INDEX_LIMIT:0] RF_DATA_W;
output [`REG_ADDR_INDEX_LIMIT:0] RF_ADDR_W, RF_ADDR_R1, RF_ADDR_R2;
output RF_READ, RF_WRITE;
// Outputs for ALU
output [`DATA_INDEX_LIMIT:0]  ALU_OP1, ALU_OP2;
output  [`ALU_OPRN_INDEX_LIMIT:0] ALU_OPRN;
// Outputs for memory
output [`ADDRESS_INDEX_LIMIT:0]  MEM_ADDR;
output MEM_READ, MEM_WRITE;

// Input signals
input [`DATA_INDEX_LIMIT:0] RF_DATA_R1, RF_DATA_R2, ALU_RESULT;
input ZERO, CLK, RST;

// Inout signal
inout [`DATA_INDEX_LIMIT:0] MEM_DATA;

// Define Registers
reg RF_READ, RF_WRITE, MEM_READ, MEM_WRITE;
reg [`ADDRESS_INDEX_LIMIT:0] PC_REG, SP_REG, MEM_ADDR;
reg [`DATA_INDEX_LIMIT:0] INST_REG, MEM_DATA_REG, RF_DATA_W, ALU_OP1, ALU_OP2;
reg [`ALU_OPRN_INDEX_LIMIT:0] ALU_OPRN;
reg [`REG_ADDR_INDEX_LIMIT:0] RF_ADDR_W, RF_ADDR_R1, RF_ADDR_R2;

// INSTRUCTION DECODE
reg [5:0] opcode;
reg [4:0] rs;
reg [4:0] rt;
reg [4:0] rd;
reg [4:0] shamt;
reg [5:0] funct;
reg [15:0] immediate;
reg [31:0] z_imm;
reg [31:0] s_imm;
reg [25:0] address;

assign MEM_DATA = ((MEM_READ===1'b0)&&(MEM_WRITE===1'b1))?MEM_DATA_REG:{`DATA_WIDTH{1'bz} };

// State nets
wire [2:0] proc_state;

PROC_SM state_machine(.STATE(proc_state),.CLK(CLK),.RST(RST));

initial
begin
PC_REG = `INST_START_ADDR;
SP_REG = `INIT_STACK_POINTER;
end

//PRINTING TASK
task print_instruction;
input [`DATA_INDEX_LIMIT:0] inst;
reg [5:0] opcode;
reg [4:0] rs;
reg [4:0] rt;
reg [4:0] rd;
reg [4:0] shamt;
reg [5:0] funct;
reg [15:0] immediate;
reg [25:0] address;
begin
// parse the instruction
// R-type
{opcode, rs, rt, rd, shamt, funct} = inst;
// I-type
{opcode, rs, rt, immediate } = inst;
// J-type
{opcode, address} = inst;
$write("@ %6dns -> [0X%08h] ", $time, inst);
case(opcode)
// R-Type
6'h00 : begin
case(funct)
6'h20: $write("add r[%02d], r[%02d], r[%02d];", rs, rt, rd);
6'h22: $write("sub r[%02d], r[%02d], r[%02d];", rs, rt, rd);
6'h2c: $write("mul r[%02d], r[%02d], r[%02d];", rs, rt, rd);
6'h24: $write("and r[%02d], r[%02d], r[%02d];", rs, rt, rd);
6'h25: $write("or r[%02d], r[%02d], r[%02d];", rs, rt, rd);
6'h27: $write("nor r[%02d], r[%02d], r[%02d];", rs, rt, rd);
6'h2a: $write("slt r[%02d], r[%02d], r[%02d];", rs, rt, rd);
6'h01: $write("sll r[%02d], %2d, r[%02d];", rs, shamt, rd);
6'h02: $write("srl r[%02d], 0X%02h, r[%02d];", rs, shamt, rd);
6'h08: $write("jr r[%02d];", rs);
default: $write("");
endcase
end
// I-type
6'h08 : $write("addi r[%02d], r[%02d], 0X%04h;", rs, rt, immediate);
6'h1d : $write("muli r[%02d], r[%02d], 0X%04h;", rs, rt, immediate);
6'h0c : $write("andi r[%02d], r[%02d], 0X%04h;", rs, rt, immediate);
6'h0d : $write("ori r[%02d], r[%02d], 0X%04h;", rs, rt, immediate);
6'h0f : $write("lui r[%02d], 0X%04h;", rt, immediate);
6'h0a : $write("slti r[%02d], r[%02d], 0X%04h;", rs, rt, immediate);
6'h04 : $write("beq r[%02d], r[%02d], 0X%04h;", rs, rt, immediate);
6'h05 : $write("bne r[%02d], r[%02d], 0X%04h;", rs, rt, immediate);
6'h23 : $write("lw r[%02d], r[%02d], 0X%04h;", rs, rt, immediate);
6'h2b : $write("sw r[%02d], r[%02d], 0X%04h;", rs, rt, immediate);
// J-Type
6'h02 : $write("jmp 0X%07h;", address);
6'h03 : $write("jal 0X%07h;", address);
6'h1b : $write("push;");
6'h1c : $write("pop;");
default: $write("");
endcase
$write("\n");
end
endtask

always @ (proc_state)
begin

if(proc_state === `PROC_FETCH)
begin
//Set mem addr to PC
//mem control set to read
//set RF control to hold(00 or 11)

MEM_ADDR = PC_REG;
MEM_READ = 1;
MEM_WRITE = 0;
RF_READ = 0;
RF_WRITE = 0;
end

else if(proc_state === `PROC_DECODE)
begin
INST_REG = MEM_DATA;
print_instruction(INST_REG);
// parse the instruction
// R-type
{opcode, rs, rt, rd, shamt, funct} = INST_REG;
// I-type
{opcode, rs, rt, immediate } = INST_REG;
// J-type
{opcode, address} = INST_REG;
z_imm = {{16{1'b0}}, immediate};
s_imm = {{16{immediate[15]}}, immediate};
RF_ADDR_R1 = rs;
RF_ADDR_R2 = rt;
RF_READ = 1;
RF_WRITE = 0;
end



else if(proc_state === `PROC_EXE)
begin
//set alu operands and op code depending on the opcode/funct
//lui, jmp, and jal don't need ALU so don't feed anything.
//For push, RF ADDR_R1 needs to be set to 0
//$write("@ %6dns -> [0X%08h] ", $time, inst);
case(opcode)

// R-Type
6'h00 : begin
case(funct)
6'h20:
begin
ALU_OP1 = RF_DATA_R1;
ALU_OP2 = RF_DATA_R2;
ALU_OPRN = `ALU_OPRN_WIDTH'h01;
end//$write("add r[%02d], r[%02d], r[%02d];", rs, rt, rd);
6'h22:
begin
ALU_OP1 = RF_DATA_R1;
ALU_OP2 = RF_DATA_R2;
ALU_OPRN = `ALU_OPRN_WIDTH'h02;
end//$write("sub r[%02d], r[%02d], r[%02d];", rs, rt, rd);
6'h2c:
begin
ALU_OP1 = RF_DATA_R1;
ALU_OP2 = RF_DATA_R2;
ALU_OPRN = `ALU_OPRN_WIDTH'h03;
end//$write("mul r[%02d], r[%02d], r[%02d];", rs, rt, rd);
6'h24:
begin
ALU_OP1 = RF_DATA_R1;
ALU_OP2 = RF_DATA_R2;
ALU_OPRN = `ALU_OPRN_WIDTH'h06;
end//$write("and r[%02d], r[%02d], r[%02d];", rs, rt, rd);
6'h25:
begin
ALU_OP1 = RF_DATA_R1;
ALU_OP2 = RF_DATA_R2;
ALU_OPRN = `ALU_OPRN_WIDTH'h07;
end//$write("or r[%02d], r[%02d], r[%02d];", rs, rt, rd);
6'h27:
begin
ALU_OP1 = RF_DATA_R1;
ALU_OP2 = RF_DATA_R2;
ALU_OPRN = `ALU_OPRN_WIDTH'h08;
end//$write("nor r[%02d], r[%02d], r[%02d];", rs, rt, rd);
6'h2a:
begin
ALU_OP1 = RF_DATA_R1;
ALU_OP2 = RF_DATA_R2;
ALU_OPRN = `ALU_OPRN_WIDTH'h09;
end//$write("slt r[%02d], r[%02d], r[%02d];", rs, rt, rd);
6'h01:
begin
ALU_OP1 = RF_DATA_R1;
ALU_OP2 = shamt;
ALU_OPRN = `ALU_OPRN_WIDTH'h04;
end//$write("sll r[%02d], %2d, r[%02d];", rs, shamt, rd);
6'h02:
begin
ALU_OP1 = RF_DATA_R1;
ALU_OP2 = shamt;
ALU_OPRN = `ALU_OPRN_WIDTH'h05;
end//$write("srl r[%02d], 0X%02h, r[%02d];", rs, shamt, rd);
6'h08:
begin
//DO NOTHING
end//$write("jr r[%02d];", rs);
default:;
endcase
end

// I-type
6'h08 :
begin
ALU_OP1 = RF_DATA_R1;
ALU_OP2 = s_imm;
ALU_OPRN = `ALU_OPRN_WIDTH'h01;
end//$write("addi r[%02d], r[%02d], 0X%04h;", rs, rt, immediate);
6'h1d :
begin
ALU_OP1 = RF_DATA_R1;
ALU_OP2 = s_imm;
ALU_OPRN = `ALU_OPRN_WIDTH'h03;
end//$write("muli r[%02d], r[%02d], 0X%04h;", rs, rt, immediate);
6'h0c :
begin
ALU_OP1 = RF_DATA_R1;
ALU_OP2 = z_imm;
ALU_OPRN = `ALU_OPRN_WIDTH'h06;
end//$write("andi r[%02d], r[%02d], 0X%04h;", rs, rt, immediate);
6'h0d :
begin
ALU_OP1 = RF_DATA_R1;
ALU_OP2 = z_imm;
ALU_OPRN = `ALU_OPRN_WIDTH'h07;
end//$write("ori r[%02d], r[%02d], 0X%04h;", rs, rt, immediate);
6'h0f :; //DO NOTHING $write("lui r[%02d], 0X%04h;", rt, immediate);
6'h0a :
begin
ALU_OP1 = RF_DATA_R1;
ALU_OP2 = s_imm;
ALU_OPRN = `ALU_OPRN_WIDTH'h09;
end//$write("slti r[%02d], r[%02d], 0X%04h;", rs, rt, immediate);
6'h04 :
begin//compare the zero line
ALU_OP1 = RF_DATA_R1;
ALU_OP2 = RF_DATA_R2;
ALU_OPRN = `ALU_OPRN_WIDTH'h02;
end//$write("beq r[%02d], r[%02d], 0X%04h;", rs, rt, immediate);
6'h05 :
begin//compare the zero line
ALU_OP1 = RF_DATA_R1;
ALU_OP2 = RF_DATA_R2;
ALU_OPRN = `ALU_OPRN_WIDTH'h02;
end//$write("bne r[%02d], r[%02d], 0X%04h;", rs, rt, immediate);
6'h23 :
begin
ALU_OP1 = RF_DATA_R1;
ALU_OP2 = s_imm;
ALU_OPRN = `ALU_OPRN_WIDTH'h01;
end//$write("lw r[%02d], r[%02d], 0X%04h;", rs, rt, immediate);
6'h2b :
begin
ALU_OP1 = RF_DATA_R1;
ALU_OP2 = s_imm;
ALU_OPRN = `ALU_OPRN_WIDTH'h01;
RF_ADDR_R1 = rt;
RF_READ = 1;
RF_WRITE = 0;
end//$write("sw r[%02d], r[%02d], 0X%04h;", rs, rt, immediate);

// J-Type
6'h02 :; //DO NOTHING $write("jmp 0X%07h;", address);
6'h03 :; //DO NOTHING $write("jal 0X%07h;", address);
6'h1b :
begin
RF_ADDR_R1 = 0;
RF_READ = 1;
RF_WRITE = 0;
end//$write("push;");
6'h1c :; //DO NOTHING $write("pop;");

default:;
endcase
end



else if(proc_state === `PROC_MEM)
begin

//default make mem operation to 00 or 11
//For lw,sw,push, and pop
case(opcode)
6'h00 : begin
case(funct)
6'h08:
begin
RF_READ = 1;
RF_WRITE = 0;
RF_ADDR_R1 = rs;
end//$write("jr r[%02d];", rs);
default:;
endcase
end
6'h1b : begin//$write("push;")
MEM_WRITE = 1;
MEM_READ = 0;
MEM_ADDR = SP_REG;
MEM_DATA_REG = RF_DATA_R1;//SOME WERID PROBLEM HERE, DON'T KNOW WHY BUT MEM_DATA CAN'T BE GIVEN A VALUE HERE.
SP_REG = SP_REG -1;
end
6'h1c : begin//$write("pop;")
MEM_WRITE = 0;
MEM_READ = 1;
MEM_ADDR = SP_REG;
SP_REG = SP_REG + 1;
end
6'h23 : begin//$write("lw r[%02d], r[%02d], 0X%04h;", rs, rt, immediate);
MEM_WRITE = 0;
MEM_READ = 1;
MEM_ADDR = ALU_RESULT;
end
6'h2b : begin//$write("sw r[%02d], r[%02d], 0X%04h;", rs, rt, immediate);
MEM_WRITE = 1;
MEM_READ = 0;
MEM_ADDR = ALU_RESULT;
MEM_DATA_REG = RF_DATA_R1;
end
default:begin
MEM_READ = 0;
MEM_WRITE = 0;
end
endcase
end

else if(proc_state === `PROC_WB)
begin
//increase PC by 1
//reset mem write to no-op(00 or 11)
//set RF write address,data, and control to write back into register file.
//For beq, bne, jmp, and jal modify PC according to the instruction.
case(opcode)
6'h00 : begin
case(funct)
6'h20: begin
RF_READ = 0;
RF_WRITE = 1;
RF_ADDR_W = rd;
RF_DATA_W = ALU_RESULT;
PC_REG = PC_REG + 1;
MEM_READ = 0;
MEM_WRITE = 0;
end//$write("add r[%02d], r[%02d], r[%02d];", rs, rt, rd);
6'h22: begin
RF_READ = 0;
RF_WRITE = 1;
RF_ADDR_W = rd;
RF_DATA_W = ALU_RESULT;
PC_REG = PC_REG + 1;
MEM_READ = 0;
MEM_WRITE = 0;
end//$write("sub r[%02d], r[%02d], r[%02d];", rs, rt, rd);
6'h2c: begin
RF_READ = 0;
RF_WRITE = 1;
RF_ADDR_W = rd;
RF_DATA_W = ALU_RESULT;
PC_REG = PC_REG + 1;
MEM_READ = 0;
MEM_WRITE = 0;
end//$write("mul r[%02d], r[%02d], r[%02d];", rs, rt, rd);
6'h24: begin
RF_READ = 0;
RF_WRITE = 1;
RF_ADDR_W = rd;
RF_DATA_W = ALU_RESULT;
PC_REG = PC_REG + 1;
MEM_READ = 0;
MEM_WRITE = 0;
end//$write("and r[%02d], r[%02d], r[%02d];", rs, rt, rd);
6'h25: begin
RF_READ = 0;
RF_WRITE = 1;
RF_ADDR_W = rd;
RF_DATA_W = ALU_RESULT;
PC_REG = PC_REG + 1;
MEM_READ = 0;
MEM_WRITE = 0;
end//$write("or r[%02d], r[%02d], r[%02d];", rs, rt, rd);
6'h27: begin
RF_READ = 0;
RF_WRITE = 1;
RF_ADDR_W = rd;
RF_DATA_W = ALU_RESULT;
PC_REG = PC_REG + 1;
MEM_READ = 0;
MEM_WRITE = 0;
end//$write("nor r[%02d], r[%02d], r[%02d];", rs, rt, rd);
6'h2a: begin
RF_READ = 0;
RF_WRITE = 1;
RF_ADDR_W = rd;
RF_DATA_W = ALU_RESULT;
PC_REG = PC_REG + 1;
MEM_READ = 0;
MEM_WRITE = 0;
end//$write("slt r[%02d], r[%02d], r[%02d];", rs, rt, rd);
6'h01: begin
RF_READ = 0;
RF_WRITE = 1;
RF_ADDR_W = rd;
RF_DATA_W = ALU_RESULT;
PC_REG = PC_REG + 1;
MEM_READ = 0;
MEM_WRITE = 0;
end//$write("sll r[%02d], %2d, r[%02d];", rs, shamt, rd);
6'h02: begin
RF_READ = 0;
RF_WRITE = 1;
RF_ADDR_W = rd;
RF_DATA_W = ALU_RESULT;
PC_REG = PC_REG + 1;
MEM_READ = 0;
MEM_WRITE = 0;
end//$write("srl r[%02d], 0X%02h, r[%02d];", rs, shamt, rd);
6'h08: begin
PC_REG = RF_DATA_R1;
MEM_READ = 0;
MEM_WRITE = 0;
end//$write("jr r[%02d];", rs);
default:; //$write("");
endcase
end
// I-type
6'h08 : begin
RF_READ = 0;
RF_WRITE = 1;
RF_ADDR_W = rt;
RF_DATA_W = ALU_RESULT;
PC_REG = PC_REG + 1;
MEM_READ = 0;
MEM_WRITE = 0;
end//$write("addi r[%02d], r[%02d], 0X%04h;", rs, rt, immediate);
6'h1d : begin
RF_READ = 0;
RF_WRITE = 1;
RF_ADDR_W = rt;
RF_DATA_W = ALU_RESULT;
PC_REG = PC_REG + 1;
MEM_READ = 0;
MEM_WRITE = 0;
end//$write("muli r[%02d], r[%02d], 0X%04h;", rs, rt, immediate);
6'h0c : begin
RF_READ = 0;
RF_WRITE = 1;
RF_ADDR_W = rt;
RF_DATA_W = ALU_RESULT;
PC_REG = PC_REG + 1;
MEM_READ = 0;
MEM_WRITE = 0;
end//$write("andi r[%02d], r[%02d], 0X%04h;", rs, rt, immediate);
6'h0d : begin
RF_READ = 0;
RF_WRITE = 1;
RF_ADDR_W = rt;
RF_DATA_W = ALU_RESULT;
PC_REG = PC_REG + 1;
MEM_READ = 0;
MEM_WRITE = 0;
end//$write("ori r[%02d], r[%02d], 0X%04h;", rs, rt, immediate);
6'h0f : begin
RF_READ = 0;
RF_WRITE = 1;
RF_ADDR_W = rt;
RF_DATA_W = {immediate, 16'b0};
PC_REG = PC_REG + 1;
MEM_READ = 0;
MEM_WRITE = 0;
end//$write("lui r[%02d], 0X%04h;", rt, immediate);
6'h0a : begin
RF_READ = 0;
RF_WRITE = 1;
RF_ADDR_W = rt;
RF_DATA_W = {immediate, 16'b0};
PC_REG = PC_REG + 1;
MEM_READ = 0;
MEM_WRITE = 0;
end//$write("slti r[%02d], r[%02d], 0X%04h;", rs, rt, immediate);
6'h04 : begin
if(ZERO)
begin
PC_REG = PC_REG + 1 + {{16{immediate[15]}}, immediate};
end
end//$write("beq r[%02d], r[%02d], 0X%04h;", rs, rt, immediate);
6'h05 : begin
if(!ZERO)
begin
PC_REG = PC_REG + 1 + {{16{immediate[15]}}, immediate};
end
end//$write("bne r[%02d], r[%02d], 0X%04h;", rs, rt, immediate);
6'h23 : begin
RF_READ = 0;
RF_WRITE = 1;
RF_ADDR_W = rt;
RF_DATA_W = MEM_DATA;
PC_REG = PC_REG + 1;
MEM_READ = 0;
MEM_WRITE = 0;
end//$write("lw r[%02d], r[%02d], 0X%04h;", rs, rt, immediate);
6'h2b : begin
RF_READ = 0;
RF_WRITE = 0;
PC_REG = PC_REG + 1;
MEM_READ = 0;
MEM_WRITE = 0;
end//$write("sw r[%02d], r[%02d], 0X%04h;", rs, rt, immediate);

// J-Type
6'h02 : begin
RF_READ = 0;
RF_WRITE = 0;
PC_REG = {6'b0, address};
MEM_READ = 0;
MEM_WRITE = 0;
end//$write("jmp 0X%07h;", address);
6'h03 : begin
RF_READ = 0;
RF_WRITE = 1;
RF_ADDR_W = 31;
RF_DATA_W = PC_REG + 1;
PC_REG = {6'b0, address};
MEM_READ = 0;
MEM_WRITE = 0;
end//$write("jal 0X%07h;", address);
6'h1b : begin
PC_REG = PC_REG + 1;
end//$write("push;");
6'h1c : begin
PC_REG = PC_REG + 1;
end//$write("pop;");
default:
begin
PC_REG = PC_REG + 1;
MEM_WRITE = 0;
MEM_READ = 0;
end
endcase

end
end

endmodule;



//------------------------------------------------------------------------------------------
// Module: CONTROL_UNIT
// Output: STATE      : State of the processor
//         
// Input:  CLK        : Clock signal
//         RST        : Reset signal
//
// INOUT: MEM_DATA    : Data to be read in from or write to the memory
//
// Notes: - Processor continuously cycle witnin fetch, decode, execute, 
//          memory, write back state. State values are in the prj_definition.v
//
// Revision History:
//
// Version	Date		Who		email			note
//------------------------------------------------------------------------------------------
//  1.0     Sep 10, 2014	Kaushik Patra	kpatra@sjsu.edu		Initial creation
//------------------------------------------------------------------------------------------
module PROC_SM(CLK,RST,STATE);
// list of inputs
input CLK, RST;
// list of outputs
output [2:0] STATE;
// reg
reg [2:0] STATE;
reg [2:0] next_state;

// TBD - implement the state machine here
initial
begin
STATE = 3'bxx;
next_state = `PROC_FETCH;
end

always @(negedge RST)
begin
STATE = 3'bxx;
next_state = `PROC_FETCH;
end

always @(posedge CLK)
begin
STATE = next_state;

if(STATE === `PROC_FETCH)
begin
next_state = `PROC_DECODE;
end

else if(STATE === `PROC_DECODE)
begin
next_state = `PROC_EXE;
end

else if(STATE === `PROC_EXE)
begin
next_state = `PROC_MEM;
end

else if(STATE === `PROC_MEM)
begin
next_state = `PROC_WB;
end

else if(STATE === `PROC_WB)
begin
next_state = `PROC_FETCH;
end

end

endmodule;
