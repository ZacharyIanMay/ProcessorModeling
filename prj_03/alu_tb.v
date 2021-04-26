`include "prj_definition.v"
module ALU_TB;

// registers and wire to handle input and output
reg [`ALU_OPRN_INDEX_LIMIT:0] oprn_reg;
reg [`DATA_INDEX_LIMIT:0] op1_reg;
reg [`DATA_INDEX_LIMIT:0] op2_reg;
reg r;
wire [`DATA_INDEX_LIMIT:0] rslt_net;
wire outpt_net;
wire clk;
wire [2:0] s;

// instantiate the ALU
ALU ALU_INST_1 (.OUT(rslt_net), .ZERO(outpt_net), .OP1(op1_reg), .OP2(op2_reg), .OPRN(oprn_reg));

// instantiation of the state machine
CLK_GENERATOR clk_gen_inst(.CLK(clk));
PROC_SM SM(.STATE(s),.CLK(clk),.RST(r));

initial
begin
// test cases
#5  op1_reg = 0;
    op2_reg = 0;
    oprn_reg=`ALU_OPRN_WIDTH'h01;
    r = 1;

#5  op1_reg = 1;
    op2_reg = 0;
    oprn_reg=`ALU_OPRN_WIDTH'h01;
    r = 0;

#5  op1_reg = 5;
    op2_reg = 5;
    oprn_reg=`ALU_OPRN_WIDTH'h02;

#5  op1_reg=15;
    op2_reg=3;
    oprn_reg=`ALU_OPRN_WIDTH'h01;

#5  op1_reg=15;
    op2_reg=5;
    oprn_reg=`ALU_OPRN_WIDTH'h02;

#5  op1_reg=15;
    op2_reg=-5;
    oprn_reg=`ALU_OPRN_WIDTH'h01;

#5  op1_reg=5;
    op2_reg=15;
    oprn_reg=`ALU_OPRN_WIDTH'h02;

#5  op1_reg=7;
    op2_reg=3;
    oprn_reg=`ALU_OPRN_WIDTH'h03;

#5  op1_reg=7;
    op2_reg=-3;
    oprn_reg=`ALU_OPRN_WIDTH'h03;

#5  op1_reg=7;
    op2_reg=2;
    oprn_reg=`ALU_OPRN_WIDTH'h04;

#5  op1_reg=7;
    op2_reg=2;
    oprn_reg=`ALU_OPRN_WIDTH'h05;

#5  op1_reg=7;
    op2_reg=3;
    oprn_reg=`ALU_OPRN_WIDTH'h06;

#5  op1_reg=7;
    op2_reg=8;
    oprn_reg=`ALU_OPRN_WIDTH'h07;

#5  op1_reg=8;
    op2_reg=7;
    oprn_reg=`ALU_OPRN_WIDTH'h08;

#5  op1_reg=15;
    op2_reg=5;
    oprn_reg=`ALU_OPRN_WIDTH'h09;

#5  op1_reg=-1;
    op2_reg=5;
    oprn_reg=`ALU_OPRN_WIDTH'h09;
     r = 1;

#5  op1_reg=1;
    op2_reg=1;
    oprn_reg=`ALU_OPRN_WIDTH'h01;
    r = 0;

#5  op1_reg=1;
    op2_reg=5;
    oprn_reg=`ALU_OPRN_WIDTH'h09;
$stop;
end

endmodule 