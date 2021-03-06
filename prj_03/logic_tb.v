`timescale 1ns/1ps

module logic_tb;
//reg [63:0] C;
//wire [63:0] Y;
reg D, np, nr, load;
wire c, Q, Qb;

CLK_GENERATOR clk_gen_inst(.CLK(c));
REG1 rInst(.Q(Q), .Qbar(Qb), .D(D), .L(load), .C(c), .nP(np), .nR(nr));
//TWOSCOMP64 test(.Y(Y),.A(C));

initial
begin
/**
	load=0;
	D=1;
	np=0;
	nr=1;
#10	D=1;
	np=1;
	nr=0;
#10	D=1;
	np=1;
	nr=1;
#10	D=1;
	np=0;
	nr=0;
#10	D=0;
	np=0;
	nr=1;
#10	D=0;
	np=1;
	nr=0;
#10	D=0;
	np=1;
	nr=1;
#10	D=0;
	np=0;
	nr=0;
*/
	np=1;
	nr=0;
#5	load = 1;
	np=1;
	nr=1;
	D=1;
#15	D=0;
#5	D=1;
#5	D=0;
#10;
$stop;
end

endmodule;


//test written by Zachary Ian May