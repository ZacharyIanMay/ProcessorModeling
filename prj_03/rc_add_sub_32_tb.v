`include "prj_definition.v"

module rc_add_sub_32_tb;
reg [`DATA_INDEX_LIMIT:0] A, B;
reg SnA;
wire [`DATA_INDEX_LIMIT:0] Y;
wire CO;
wire [63:0] test, a, b;

assign a = {{32{A[31]}}, A};
assign b = {{32{B[31]}}, B};

RC_ADD_SUB_32 addsub(.Y(Y), .CO(CO), .A(A), .B(B), .SnA(SnA));
RC_ADD_SUB_64 addtest(.Y(test), .CO(CO), .A(a), .B(b), .SnA(SnA));

initial
begin

// test of addition
	A=22;
	B=1;
	SnA=0;
// test of subtraction
#10	A=11;
	B=9;
	SnA=1;
// test of negative number
#10	A=9;
	B=11;
	SnA=1;
// test of addition of negative numbers
#10	A=-1;
	B=1;
	SnA=0;
#10	A=1;
	B=-1;
	SnA=0;
// test of negative number subtraction
#10	A=-2;
	B=1;
	SnA=0;
// test of addition of zero
#10	A=1;
	B=0;
	SnA=0;
// test of subtraction of zero
#10	A=1;
	B=0;
	SnA=1;
#10;
end

endmodule;
