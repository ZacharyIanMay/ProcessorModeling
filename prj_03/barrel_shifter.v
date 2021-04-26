// Name: barrel_shifter.v
// Module: SHIFT32_L , SHIFT32_R, SHIFT32
//
// Notes: 32-bit barrel shifter
// 
//
// Revision History:
//
// Version	Date		Who		email			note
//------------------------------------------------------------------------------------------
//  1.0     Sep 10, 2014	Kaushik Patra	kpatra@sjsu.edu		Initial creation
//------------------------------------------------------------------------------------------
`include "prj_definition.v"

// 32-bit shift amount shifter
module SHIFT32(Y,D,S, LnR);
// output list
output [31:0] Y;
// input list
input [31:0] D;
input [31:0] S;
input LnR;
//wire list
wire g;
wire [31:0] r;

or(g, S[31:5]);
BARREL_SHIFTER32 shift(.Y(r), .D(D), .S(S[4:0]), .LnR(LnR));
MUX32_2x1 mux(.Y(Y), .I0(r), .I1(32'b0), .S(g));

endmodule

// Shift with control L or R shift
module BARREL_SHIFTER32(Y,D,S, LnR);
// output list
output [31:0] Y;
// input list
input [31:0] D;
input [4:0] S;
input LnR;
// wire list
wire [31:0] rr, rl;

SHIFT32_R rs(.D(D), .S(S), .Y(rr));
SHIFT32_L ls(.D(D), .S(S), .Y(rl));
MUX32_2x1 mux(.Y(Y), .I0(rr), .I1(rl), .S(LnR));

endmodule

// Right shifter
module SHIFT32_R(Y,D,S);
// output list
output [31:0] Y;
// input list
input [31:0] D;
input [4:0] S;
// wire list
//layer 1
wire o1, o2, o3, o4, o5, o6, o7, o8, o9, o10, o11, o12, o13, o14, o15, o16, o17, o18, o19, o20, o21, o22, o23, o24, o25;
wire o26, o27, o28, o29, o30, o31, o32;
//layer 2
wire tw1, tw2, tw3, tw4, tw5, tw6, tw7, tw8, tw9, tw10, tw11, tw12, tw13, tw14, tw15, tw16, tw17, tw18, tw19, tw20, tw21;
wire tw22, tw23, tw24, tw25, tw26, tw27, tw28, tw29, tw30, tw31, tw32;
//layer 3
wire th1, th2, th3, th4, th5, th6, th7, th8, th9, th10, th11, th12, th13, th14, th15, th16, th17, th18, th19, th20, th21;
wire th22, th23, th24, th25, th26, th27, th28, th29, th30, th31, th32;
//layer 4
wire fo1, fo2, fo3, fo4, fo5, fo6, fo7, fo8, fo9, fo10, fo11, fo12, fo13, fo14, fo15, fo16, fo17, fo18, fo19, fo20, fo21;
wire fo22, fo23, fo24, fo25, fo26, fo27, fo28, fo29, fo30, fo31, fo32;

// layer 1
MUX1_2x1 muxo0(.Y(o1), .S(S[0]), .I0(D[0]), .I1(D[1]));
MUX1_2x1 muxo1(.Y(o2), .S(S[0]), .I0(D[1]), .I1(D[2]));
MUX1_2x1 muxo2(.Y(o3), .S(S[0]), .I0(D[2]), .I1(D[3]));
MUX1_2x1 muxo3(.Y(o4), .S(S[0]), .I0(D[3]), .I1(D[4]));
MUX1_2x1 muxo4(.Y(o5), .S(S[0]), .I0(D[4]), .I1(D[5]));
MUX1_2x1 muxo5(.Y(o6), .S(S[0]), .I0(D[5]), .I1(D[6]));
MUX1_2x1 muxo6(.Y(o7), .S(S[0]), .I0(D[6]), .I1(D[7]));
MUX1_2x1 muxo7(.Y(o8), .S(S[0]), .I0(D[7]), .I1(D[8]));
MUX1_2x1 muxo8(.Y(o9), .S(S[0]), .I0(D[8]), .I1(D[9]));
MUX1_2x1 muxo9(.Y(o10), .S(S[0]), .I0(D[9]), .I1(D[10]));
MUX1_2x1 muxo10(.Y(o11), .S(S[0]), .I0(D[10]), .I1(D[11]));
MUX1_2x1 muxo11(.Y(o12), .S(S[0]), .I0(D[11]), .I1(D[12]));
MUX1_2x1 muxo12(.Y(o13), .S(S[0]), .I0(D[12]), .I1(D[13]));
MUX1_2x1 muxo13(.Y(o14), .S(S[0]), .I0(D[13]), .I1(D[14]));
MUX1_2x1 muxo14(.Y(o15), .S(S[0]), .I0(D[14]), .I1(D[15]));
MUX1_2x1 muxo15(.Y(o16), .S(S[0]), .I0(D[15]), .I1(D[16]));
MUX1_2x1 muxo16(.Y(o17), .S(S[0]), .I0(D[16]), .I1(D[17]));
MUX1_2x1 muxo17(.Y(o18), .S(S[0]), .I0(D[17]), .I1(D[18]));
MUX1_2x1 muxo18(.Y(o19), .S(S[0]), .I0(D[18]), .I1(D[19]));
MUX1_2x1 muxo19(.Y(o20), .S(S[0]), .I0(D[19]), .I1(D[20]));
MUX1_2x1 muxo20(.Y(o21), .S(S[0]), .I0(D[20]), .I1(D[21]));
MUX1_2x1 muxo21(.Y(o22), .S(S[0]), .I0(D[21]), .I1(D[22]));
MUX1_2x1 muxo22(.Y(o23), .S(S[0]), .I0(D[22]), .I1(D[23]));
MUX1_2x1 muxo23(.Y(o24), .S(S[0]), .I0(D[23]), .I1(D[24]));
MUX1_2x1 muxo24(.Y(o25), .S(S[0]), .I0(D[24]), .I1(D[25]));
MUX1_2x1 muxo25(.Y(o26), .S(S[0]), .I0(D[25]), .I1(D[26]));
MUX1_2x1 muxo26(.Y(o27), .S(S[0]), .I0(D[26]), .I1(D[27]));
MUX1_2x1 muxo27(.Y(o28), .S(S[0]), .I0(D[27]), .I1(D[28]));
MUX1_2x1 muxo28(.Y(o29), .S(S[0]), .I0(D[28]), .I1(D[29]));
MUX1_2x1 muxo29(.Y(o30), .S(S[0]), .I0(D[29]), .I1(D[30]));
MUX1_2x1 muxo30(.Y(o31), .S(S[0]), .I0(D[30]), .I1(D[31]));
MUX1_2x1 muxo31(.Y(o32), .S(S[0]), .I0(D[31]), .I1(1'b0));

// layer 2
MUX1_2x1 muxtw0(.Y(tw1), .S(S[1]), .I0(o1), .I1(o3));
MUX1_2x1 muxtw1(.Y(tw2), .S(S[1]), .I0(o2), .I1(o4));
MUX1_2x1 muxtw2(.Y(tw3), .S(S[1]), .I0(o3), .I1(o5));
MUX1_2x1 muxtw3(.Y(tw4), .S(S[1]), .I0(o4), .I1(o6));
MUX1_2x1 muxtw4(.Y(tw5), .S(S[1]), .I0(o5), .I1(o7));
MUX1_2x1 muxtw5(.Y(tw6), .S(S[1]), .I0(o6), .I1(o8));
MUX1_2x1 muxtw6(.Y(tw7), .S(S[1]), .I0(o7), .I1(o9));
MUX1_2x1 muxtw7(.Y(tw8), .S(S[1]), .I0(o8), .I1(o10));
MUX1_2x1 muxtw8(.Y(tw9), .S(S[1]), .I0(o9), .I1(o11));
MUX1_2x1 muxtw9(.Y(tw10), .S(S[1]), .I0(o10), .I1(o12));
MUX1_2x1 muxtw10(.Y(tw11), .S(S[1]), .I0(o11), .I1(o13));
MUX1_2x1 muxtw11(.Y(tw12), .S(S[1]), .I0(o12), .I1(o14));
MUX1_2x1 muxtw12(.Y(tw13), .S(S[1]), .I0(o13), .I1(o15));
MUX1_2x1 muxtw13(.Y(tw14), .S(S[1]), .I0(o14), .I1(o16));
MUX1_2x1 muxtw14(.Y(tw15), .S(S[1]), .I0(o15), .I1(o17));
MUX1_2x1 muxtw15(.Y(tw16), .S(S[1]), .I0(o16), .I1(o18));
MUX1_2x1 muxtw16(.Y(tw17), .S(S[1]), .I0(o17), .I1(o19));
MUX1_2x1 muxtw17(.Y(tw18), .S(S[1]), .I0(o18), .I1(o20));
MUX1_2x1 muxtw18(.Y(tw19), .S(S[1]), .I0(o19), .I1(o21));
MUX1_2x1 muxtw19(.Y(tw20), .S(S[1]), .I0(o20), .I1(o22));
MUX1_2x1 muxtw20(.Y(tw21), .S(S[1]), .I0(o21), .I1(o23));
MUX1_2x1 muxtw21(.Y(tw22), .S(S[1]), .I0(o22), .I1(o24));
MUX1_2x1 muxtw22(.Y(tw23), .S(S[1]), .I0(o23), .I1(o25));
MUX1_2x1 muxtw23(.Y(tw24), .S(S[1]), .I0(o24), .I1(o26));
MUX1_2x1 muxtw24(.Y(tw25), .S(S[1]), .I0(o25), .I1(o27));
MUX1_2x1 muxtw25(.Y(tw26), .S(S[1]), .I0(o26), .I1(o28));
MUX1_2x1 muxtw26(.Y(tw27), .S(S[1]), .I0(o27), .I1(o29));
MUX1_2x1 muxtw27(.Y(tw28), .S(S[1]), .I0(o28), .I1(o30));
MUX1_2x1 muxtw28(.Y(tw29), .S(S[1]), .I0(o29), .I1(o31));
MUX1_2x1 muxtw29(.Y(tw30), .S(S[1]), .I0(o30), .I1(o32));
MUX1_2x1 muxtw30(.Y(tw31), .S(S[1]), .I0(o31), .I1(1'b0));
MUX1_2x1 muxtw31(.Y(tw32), .S(S[1]), .I0(o32), .I1(1'b0));

// layer 3
MUX1_2x1 muxth0(.Y(th1), .S(S[2]), .I0(tw1), .I1(tw5));
MUX1_2x1 muxth1(.Y(th2), .S(S[2]), .I0(tw2), .I1(tw6));
MUX1_2x1 muxth2(.Y(th3), .S(S[2]), .I0(tw3), .I1(tw7));
MUX1_2x1 muxth3(.Y(th4), .S(S[2]), .I0(tw4), .I1(tw8));
MUX1_2x1 muxth4(.Y(th5), .S(S[2]), .I0(tw5), .I1(tw9));
MUX1_2x1 muxth5(.Y(th6), .S(S[2]), .I0(tw6), .I1(tw10));
MUX1_2x1 muxth6(.Y(th7), .S(S[2]), .I0(tw7), .I1(tw11));
MUX1_2x1 muxth7(.Y(th8), .S(S[2]), .I0(tw8), .I1(tw12));
MUX1_2x1 muxth8(.Y(th9), .S(S[2]), .I0(tw9), .I1(tw13));
MUX1_2x1 muxth9(.Y(th10), .S(S[2]), .I0(tw10), .I1(tw14));
MUX1_2x1 muxth10(.Y(th11), .S(S[2]), .I0(tw11), .I1(tw15));
MUX1_2x1 muxth11(.Y(th12), .S(S[2]), .I0(tw12), .I1(tw16));
MUX1_2x1 muxth12(.Y(th13), .S(S[2]), .I0(tw13), .I1(tw17));
MUX1_2x1 muxth13(.Y(th14), .S(S[2]), .I0(tw14), .I1(tw18));
MUX1_2x1 muxth14(.Y(th15), .S(S[2]), .I0(tw15), .I1(tw19));
MUX1_2x1 muxth15(.Y(th16), .S(S[2]), .I0(tw16), .I1(tw20));
MUX1_2x1 muxth16(.Y(th17), .S(S[2]), .I0(tw17), .I1(tw21));
MUX1_2x1 muxth17(.Y(th18), .S(S[2]), .I0(tw18), .I1(tw22));
MUX1_2x1 muxth18(.Y(th19), .S(S[2]), .I0(tw19), .I1(tw23));
MUX1_2x1 muxth19(.Y(th20), .S(S[2]), .I0(tw20), .I1(tw24));
MUX1_2x1 muxth20(.Y(th21), .S(S[2]), .I0(tw21), .I1(tw25));
MUX1_2x1 muxth21(.Y(th22), .S(S[2]), .I0(tw22), .I1(tw26));
MUX1_2x1 muxth22(.Y(th23), .S(S[2]), .I0(tw23), .I1(tw27));
MUX1_2x1 muxth23(.Y(th24), .S(S[2]), .I0(tw24), .I1(tw28));
MUX1_2x1 muxth24(.Y(th25), .S(S[2]), .I0(tw25), .I1(tw29));
MUX1_2x1 muxth25(.Y(th26), .S(S[2]), .I0(tw26), .I1(tw30));
MUX1_2x1 muxth26(.Y(th27), .S(S[2]), .I0(tw27), .I1(tw31));
MUX1_2x1 muxth27(.Y(th28), .S(S[2]), .I0(tw28), .I1(tw32));
MUX1_2x1 muxth28(.Y(th29), .S(S[2]), .I0(tw29), .I1(1'b0));
MUX1_2x1 muxth29(.Y(th30), .S(S[2]), .I0(tw30), .I1(1'b0));
MUX1_2x1 muxth30(.Y(th31), .S(S[2]), .I0(tw31), .I1(1'b0));
MUX1_2x1 muxth31(.Y(th32), .S(S[2]), .I0(tw32), .I1(1'b0));

// layer 4
MUX1_2x1 muxfo0(.Y(fo1), .S(S[3]), .I0(th1), .I1(th9));
MUX1_2x1 muxfo1(.Y(fo2), .S(S[3]), .I0(th2), .I1(th10));
MUX1_2x1 muxfo2(.Y(fo3), .S(S[3]), .I0(th3), .I1(th11));
MUX1_2x1 muxfo3(.Y(fo4), .S(S[3]), .I0(th4), .I1(th12));
MUX1_2x1 muxfo4(.Y(fo5), .S(S[3]), .I0(th5), .I1(th13));
MUX1_2x1 muxfo5(.Y(fo6), .S(S[3]), .I0(th6), .I1(th14));
MUX1_2x1 muxfo6(.Y(fo7), .S(S[3]), .I0(th7), .I1(th15));
MUX1_2x1 muxfo7(.Y(fo8), .S(S[3]), .I0(th8), .I1(th16));
MUX1_2x1 muxfo8(.Y(fo9), .S(S[3]), .I0(th9), .I1(th17));
MUX1_2x1 muxfo9(.Y(fo10), .S(S[3]), .I0(th10), .I1(th18));
MUX1_2x1 muxfo10(.Y(fo11), .S(S[3]), .I0(th11), .I1(th19));
MUX1_2x1 muxfo11(.Y(fo12), .S(S[3]), .I0(th12), .I1(th20));
MUX1_2x1 muxfo12(.Y(fo13), .S(S[3]), .I0(th13), .I1(th21));
MUX1_2x1 muxfo13(.Y(fo14), .S(S[3]), .I0(th14), .I1(th22));
MUX1_2x1 muxfo14(.Y(fo15), .S(S[3]), .I0(th15), .I1(th23));
MUX1_2x1 muxfo15(.Y(fo16), .S(S[3]), .I0(th16), .I1(th24));
MUX1_2x1 muxfo16(.Y(fo17), .S(S[3]), .I0(th17), .I1(th25));
MUX1_2x1 muxfo17(.Y(fo18), .S(S[3]), .I0(th18), .I1(th26));
MUX1_2x1 muxfo18(.Y(fo19), .S(S[3]), .I0(th19), .I1(th27));
MUX1_2x1 muxfo19(.Y(fo20), .S(S[3]), .I0(th20), .I1(th28));
MUX1_2x1 muxfo20(.Y(fo21), .S(S[3]), .I0(th21), .I1(th29));
MUX1_2x1 muxfo21(.Y(fo22), .S(S[3]), .I0(th22), .I1(th30));
MUX1_2x1 muxfo22(.Y(fo23), .S(S[3]), .I0(th23), .I1(th31));
MUX1_2x1 muxfo23(.Y(fo24), .S(S[3]), .I0(th24), .I1(th32));
MUX1_2x1 muxfo24(.Y(fo25), .S(S[3]), .I0(th25), .I1(1'b0));
MUX1_2x1 muxfo25(.Y(fo26), .S(S[3]), .I0(th26), .I1(1'b0));
MUX1_2x1 muxfo26(.Y(fo27), .S(S[3]), .I0(th27), .I1(1'b0));
MUX1_2x1 muxfo27(.Y(fo28), .S(S[3]), .I0(th28), .I1(1'b0));
MUX1_2x1 muxfo28(.Y(fo29), .S(S[3]), .I0(th29), .I1(1'b0));
MUX1_2x1 muxfo29(.Y(fo30), .S(S[3]), .I0(th30), .I1(1'b0));
MUX1_2x1 muxfo30(.Y(fo31), .S(S[3]), .I0(th31), .I1(1'b0));
MUX1_2x1 muxfo31(.Y(fo32), .S(S[3]), .I0(th32), .I1(1'b0));

// layer 5
MUX1_2x1 muxfi0(.Y(Y[0]), .S(S[4]), .I0(fo1), .I1(fo17));
MUX1_2x1 muxfi1(.Y(Y[1]), .S(S[4]), .I0(fo2), .I1(fo18));
MUX1_2x1 muxfi2(.Y(Y[2]), .S(S[4]), .I0(fo3), .I1(fo19));
MUX1_2x1 muxfi3(.Y(Y[3]), .S(S[4]), .I0(fo4), .I1(fo20));
MUX1_2x1 muxfi4(.Y(Y[4]), .S(S[4]), .I0(fo5), .I1(fo21));
MUX1_2x1 muxfi5(.Y(Y[5]), .S(S[4]), .I0(fo6), .I1(fo22));
MUX1_2x1 muxfi6(.Y(Y[6]), .S(S[4]), .I0(fo7), .I1(fo23));
MUX1_2x1 muxfi7(.Y(Y[7]), .S(S[4]), .I0(fo8), .I1(fo24));
MUX1_2x1 muxfi8(.Y(Y[8]), .S(S[4]), .I0(fo9), .I1(fo25));
MUX1_2x1 muxfi9(.Y(Y[9]), .S(S[4]), .I0(fo10), .I1(fo26));
MUX1_2x1 muxfi10(.Y(Y[10]), .S(S[4]), .I0(fo11), .I1(fo27));
MUX1_2x1 muxfi11(.Y(Y[11]), .S(S[4]), .I0(fo12), .I1(fo28));
MUX1_2x1 muxfi12(.Y(Y[12]), .S(S[4]), .I0(fo13), .I1(fo29));
MUX1_2x1 muxfi13(.Y(Y[13]), .S(S[4]), .I0(fo14), .I1(fo30));
MUX1_2x1 muxfi14(.Y(Y[14]), .S(S[4]), .I0(fo15), .I1(fo31));
MUX1_2x1 muxfi15(.Y(Y[15]), .S(S[4]), .I0(fo16), .I1(fo32));
MUX1_2x1 muxfi16(.Y(Y[16]), .S(S[4]), .I0(fo17), .I1(1'b0));
MUX1_2x1 muxfi17(.Y(Y[17]), .S(S[4]), .I0(fo18), .I1(1'b0));
MUX1_2x1 muxfi18(.Y(Y[18]), .S(S[4]), .I0(fo19), .I1(1'b0));
MUX1_2x1 muxfi19(.Y(Y[19]), .S(S[4]), .I0(fo20), .I1(1'b0));
MUX1_2x1 muxfi20(.Y(Y[20]), .S(S[4]), .I0(fo21), .I1(1'b0));
MUX1_2x1 muxfi21(.Y(Y[21]), .S(S[4]), .I0(fo22), .I1(1'b0));
MUX1_2x1 muxfi22(.Y(Y[22]), .S(S[4]), .I0(fo23), .I1(1'b0));
MUX1_2x1 muxfi23(.Y(Y[23]), .S(S[4]), .I0(fo24), .I1(1'b0));
MUX1_2x1 muxfi24(.Y(Y[24]), .S(S[4]), .I0(fo25), .I1(1'b0));
MUX1_2x1 muxfi25(.Y(Y[25]), .S(S[4]), .I0(fo26), .I1(1'b0));
MUX1_2x1 muxfi26(.Y(Y[26]), .S(S[4]), .I0(fo27), .I1(1'b0));
MUX1_2x1 muxfi27(.Y(Y[27]), .S(S[4]), .I0(fo28), .I1(1'b0));
MUX1_2x1 muxfi28(.Y(Y[28]), .S(S[4]), .I0(fo29), .I1(1'b0));
MUX1_2x1 muxfi29(.Y(Y[29]), .S(S[4]), .I0(fo30), .I1(1'b0));
MUX1_2x1 muxfi30(.Y(Y[30]), .S(S[4]), .I0(fo31), .I1(1'b0));
MUX1_2x1 muxfi31(.Y(Y[31]), .S(S[4]), .I0(fo32), .I1(1'b0));

endmodule

// Left shifter
module SHIFT32_L(Y,D,S);
// output list
output [31:0] Y;
// input list
input [31:0] D;
input [4:0] S;
// wire list
//layer 1
wire o1, o2, o3, o4, o5, o6, o7, o8, o9, o10, o11, o12, o13, o14, o15, o16, o17, o18, o19, o20, o21, o22, o23, o24, o25;
wire o26, o27, o28, o29, o30, o31, o32;
//layer 2
wire tw1, tw2, tw3, tw4, tw5, tw6, tw7, tw8, tw9, tw10, tw11, tw12, tw13, tw14, tw15, tw16, tw17, tw18, tw19, tw20, tw21;
wire tw22, tw23, tw24, tw25, tw26, tw27, tw28, tw29, tw30, tw31, tw32;
//layer 3
wire th1, th2, th3, th4, th5, th6, th7, th8, th9, th10, th11, th12, th13, th14, th15, th16, th17, th18, th19, th20, th21;
wire th22, th23, th24, th25, th26, th27, th28, th29, th30, th31, th32;
//layer 4
wire fo1, fo2, fo3, fo4, fo5, fo6, fo7, fo8, fo9, fo10, fo11, fo12, fo13, fo14, fo15, fo16, fo17, fo18, fo19, fo20, fo21;
wire fo22, fo23, fo24, fo25, fo26, fo27, fo28, fo29, fo30, fo31, fo32;

// layer 1
MUX1_2x1 muxo0(.Y(o1), .S(S[0]), .I0(D[0]), .I1(1'b0));
MUX1_2x1 muxo1(.Y(o2), .S(S[0]), .I0(D[1]), .I1(D[0]));
MUX1_2x1 muxo2(.Y(o3), .S(S[0]), .I0(D[2]), .I1(D[1]));
MUX1_2x1 muxo3(.Y(o4), .S(S[0]), .I0(D[3]), .I1(D[2]));
MUX1_2x1 muxo4(.Y(o5), .S(S[0]), .I0(D[4]), .I1(D[3]));
MUX1_2x1 muxo5(.Y(o6), .S(S[0]), .I0(D[5]), .I1(D[4]));
MUX1_2x1 muxo6(.Y(o7), .S(S[0]), .I0(D[6]), .I1(D[5]));
MUX1_2x1 muxo7(.Y(o8), .S(S[0]), .I0(D[7]), .I1(D[6]));
MUX1_2x1 muxo8(.Y(o9), .S(S[0]), .I0(D[8]), .I1(D[7]));
MUX1_2x1 muxo9(.Y(o10), .S(S[0]), .I0(D[9]), .I1(D[8]));
MUX1_2x1 muxo10(.Y(o11), .S(S[0]), .I0(D[10]), .I1(D[9]));
MUX1_2x1 muxo11(.Y(o12), .S(S[0]), .I0(D[11]), .I1(D[10]));
MUX1_2x1 muxo12(.Y(o13), .S(S[0]), .I0(D[12]), .I1(D[11]));
MUX1_2x1 muxo13(.Y(o14), .S(S[0]), .I0(D[13]), .I1(D[12]));
MUX1_2x1 muxo14(.Y(o15), .S(S[0]), .I0(D[14]), .I1(D[13]));
MUX1_2x1 muxo15(.Y(o16), .S(S[0]), .I0(D[15]), .I1(D[14]));
MUX1_2x1 muxo16(.Y(o17), .S(S[0]), .I0(D[16]), .I1(D[15]));
MUX1_2x1 muxo17(.Y(o18), .S(S[0]), .I0(D[17]), .I1(D[16]));
MUX1_2x1 muxo18(.Y(o19), .S(S[0]), .I0(D[18]), .I1(D[17]));
MUX1_2x1 muxo19(.Y(o20), .S(S[0]), .I0(D[19]), .I1(D[18]));
MUX1_2x1 muxo20(.Y(o21), .S(S[0]), .I0(D[20]), .I1(D[19]));
MUX1_2x1 muxo21(.Y(o22), .S(S[0]), .I0(D[21]), .I1(D[20]));
MUX1_2x1 muxo22(.Y(o23), .S(S[0]), .I0(D[22]), .I1(D[21]));
MUX1_2x1 muxo23(.Y(o24), .S(S[0]), .I0(D[23]), .I1(D[22]));
MUX1_2x1 muxo24(.Y(o25), .S(S[0]), .I0(D[24]), .I1(D[23]));
MUX1_2x1 muxo25(.Y(o26), .S(S[0]), .I0(D[25]), .I1(D[24]));
MUX1_2x1 muxo26(.Y(o27), .S(S[0]), .I0(D[26]), .I1(D[25]));
MUX1_2x1 muxo27(.Y(o28), .S(S[0]), .I0(D[27]), .I1(D[26]));
MUX1_2x1 muxo28(.Y(o29), .S(S[0]), .I0(D[28]), .I1(D[27]));
MUX1_2x1 muxo29(.Y(o30), .S(S[0]), .I0(D[29]), .I1(D[28]));
MUX1_2x1 muxo30(.Y(o31), .S(S[0]), .I0(D[30]), .I1(D[29]));
MUX1_2x1 muxo31(.Y(o32), .S(S[0]), .I0(D[31]), .I1(D[30]));

// layer 2
MUX1_2x1 muxtw0(.Y(tw1), .S(S[1]), .I0(o1), .I1(1'b0));
MUX1_2x1 muxtw1(.Y(tw2), .S(S[1]), .I0(o2), .I1(1'b0));
MUX1_2x1 muxtw2(.Y(tw3), .S(S[1]), .I0(o3), .I1(o1));
MUX1_2x1 muxtw3(.Y(tw4), .S(S[1]), .I0(o4), .I1(o2));
MUX1_2x1 muxtw4(.Y(tw5), .S(S[1]), .I0(o5), .I1(o3));
MUX1_2x1 muxtw5(.Y(tw6), .S(S[1]), .I0(o6), .I1(o4));
MUX1_2x1 muxtw6(.Y(tw7), .S(S[1]), .I0(o7), .I1(o5));
MUX1_2x1 muxtw7(.Y(tw8), .S(S[1]), .I0(o8), .I1(o6));
MUX1_2x1 muxtw8(.Y(tw9), .S(S[1]), .I0(o9), .I1(o7));
MUX1_2x1 muxtw9(.Y(tw10), .S(S[1]), .I0(o10), .I1(o8));
MUX1_2x1 muxtw10(.Y(tw11), .S(S[1]), .I0(o11), .I1(o9));
MUX1_2x1 muxtw11(.Y(tw12), .S(S[1]), .I0(o12), .I1(o10));
MUX1_2x1 muxtw12(.Y(tw13), .S(S[1]), .I0(o13), .I1(o11));
MUX1_2x1 muxtw13(.Y(tw14), .S(S[1]), .I0(o14), .I1(o12));
MUX1_2x1 muxtw14(.Y(tw15), .S(S[1]), .I0(o15), .I1(o13));
MUX1_2x1 muxtw15(.Y(tw16), .S(S[1]), .I0(o16), .I1(o14));
MUX1_2x1 muxtw16(.Y(tw17), .S(S[1]), .I0(o17), .I1(o15));
MUX1_2x1 muxtw17(.Y(tw18), .S(S[1]), .I0(o18), .I1(o16));
MUX1_2x1 muxtw18(.Y(tw19), .S(S[1]), .I0(o19), .I1(o17));
MUX1_2x1 muxtw19(.Y(tw20), .S(S[1]), .I0(o20), .I1(o18));
MUX1_2x1 muxtw20(.Y(tw21), .S(S[1]), .I0(o21), .I1(o19));
MUX1_2x1 muxtw21(.Y(tw22), .S(S[1]), .I0(o22), .I1(o20));
MUX1_2x1 muxtw22(.Y(tw23), .S(S[1]), .I0(o23), .I1(o21));
MUX1_2x1 muxtw23(.Y(tw24), .S(S[1]), .I0(o24), .I1(o22));
MUX1_2x1 muxtw24(.Y(tw25), .S(S[1]), .I0(o25), .I1(o23));
MUX1_2x1 muxtw25(.Y(tw26), .S(S[1]), .I0(o26), .I1(o24));
MUX1_2x1 muxtw26(.Y(tw27), .S(S[1]), .I0(o27), .I1(o25));
MUX1_2x1 muxtw27(.Y(tw28), .S(S[1]), .I0(o28), .I1(o26));
MUX1_2x1 muxtw28(.Y(tw29), .S(S[1]), .I0(o29), .I1(o27));
MUX1_2x1 muxtw29(.Y(tw30), .S(S[1]), .I0(o30), .I1(o28));
MUX1_2x1 muxtw30(.Y(tw31), .S(S[1]), .I0(o31), .I1(o29));
MUX1_2x1 muxtw31(.Y(tw32), .S(S[1]), .I0(o32), .I1(o30));

// layer 3
MUX1_2x1 muxth0(.Y(th1), .S(S[2]), .I0(tw1), .I1(1'b0));
MUX1_2x1 muxth1(.Y(th2), .S(S[2]), .I0(tw2), .I1(1'b0));
MUX1_2x1 muxth2(.Y(th3), .S(S[2]), .I0(tw3), .I1(1'b0));
MUX1_2x1 muxth3(.Y(th4), .S(S[2]), .I0(tw4), .I1(1'b0));
MUX1_2x1 muxth4(.Y(th5), .S(S[2]), .I0(tw5), .I1(tw1));
MUX1_2x1 muxth5(.Y(th6), .S(S[2]), .I0(tw6), .I1(tw2));
MUX1_2x1 muxth6(.Y(th7), .S(S[2]), .I0(tw7), .I1(tw3));
MUX1_2x1 muxth7(.Y(th8), .S(S[2]), .I0(tw8), .I1(tw4));
MUX1_2x1 muxth8(.Y(th9), .S(S[2]), .I0(tw9), .I1(tw5));
MUX1_2x1 muxth9(.Y(th10), .S(S[2]), .I0(tw10), .I1(tw6));
MUX1_2x1 muxth10(.Y(th11), .S(S[2]), .I0(tw11), .I1(tw7));
MUX1_2x1 muxth11(.Y(th12), .S(S[2]), .I0(tw12), .I1(tw8));
MUX1_2x1 muxth12(.Y(th13), .S(S[2]), .I0(tw13), .I1(tw9));
MUX1_2x1 muxth13(.Y(th14), .S(S[2]), .I0(tw14), .I1(tw10));
MUX1_2x1 muxth14(.Y(th15), .S(S[2]), .I0(tw15), .I1(tw11));
MUX1_2x1 muxth15(.Y(th16), .S(S[2]), .I0(tw16), .I1(tw12));
MUX1_2x1 muxth16(.Y(th17), .S(S[2]), .I0(tw17), .I1(tw13));
MUX1_2x1 muxth17(.Y(th18), .S(S[2]), .I0(tw18), .I1(tw14));
MUX1_2x1 muxth18(.Y(th19), .S(S[2]), .I0(tw19), .I1(tw15));
MUX1_2x1 muxth19(.Y(th20), .S(S[2]), .I0(tw20), .I1(tw16));
MUX1_2x1 muxth20(.Y(th21), .S(S[2]), .I0(tw21), .I1(tw17));
MUX1_2x1 muxth21(.Y(th22), .S(S[2]), .I0(tw22), .I1(tw18));
MUX1_2x1 muxth22(.Y(th23), .S(S[2]), .I0(tw23), .I1(tw19));
MUX1_2x1 muxth23(.Y(th24), .S(S[2]), .I0(tw24), .I1(tw20));
MUX1_2x1 muxth24(.Y(th25), .S(S[2]), .I0(tw25), .I1(tw21));
MUX1_2x1 muxth25(.Y(th26), .S(S[2]), .I0(tw26), .I1(tw22));
MUX1_2x1 muxth26(.Y(th27), .S(S[2]), .I0(tw27), .I1(tw23));
MUX1_2x1 muxth27(.Y(th28), .S(S[2]), .I0(tw28), .I1(tw24));
MUX1_2x1 muxth28(.Y(th29), .S(S[2]), .I0(tw29), .I1(tw25));
MUX1_2x1 muxth29(.Y(th30), .S(S[2]), .I0(tw30), .I1(tw26));
MUX1_2x1 muxth30(.Y(th31), .S(S[2]), .I0(tw31), .I1(tw27));
MUX1_2x1 muxth31(.Y(th32), .S(S[2]), .I0(tw32), .I1(tw28));

// layer 4
MUX1_2x1 muxfo0(.Y(fo1), .S(S[3]), .I0(th1), .I1(1'b0));
MUX1_2x1 muxfo1(.Y(fo2), .S(S[3]), .I0(th2), .I1(1'b0));
MUX1_2x1 muxfo2(.Y(fo3), .S(S[3]), .I0(th3), .I1(1'b0));
MUX1_2x1 muxfo3(.Y(fo4), .S(S[3]), .I0(th4), .I1(1'b0));
MUX1_2x1 muxfo4(.Y(fo5), .S(S[3]), .I0(th5), .I1(1'b0));
MUX1_2x1 muxfo5(.Y(fo6), .S(S[3]), .I0(th6), .I1(1'b0));
MUX1_2x1 muxfo6(.Y(fo7), .S(S[3]), .I0(th7), .I1(1'b0));
MUX1_2x1 muxfo7(.Y(fo8), .S(S[3]), .I0(th8), .I1(1'b0));
MUX1_2x1 muxfo8(.Y(fo9), .S(S[3]), .I0(th9), .I1(th1));
MUX1_2x1 muxfo9(.Y(fo10), .S(S[3]), .I0(th10), .I1(th2));
MUX1_2x1 muxfo10(.Y(fo11), .S(S[3]), .I0(th11), .I1(th3));
MUX1_2x1 muxfo11(.Y(fo12), .S(S[3]), .I0(th12), .I1(th4));
MUX1_2x1 muxfo12(.Y(fo13), .S(S[3]), .I0(th13), .I1(th5));
MUX1_2x1 muxfo13(.Y(fo14), .S(S[3]), .I0(th14), .I1(th6));
MUX1_2x1 muxfo14(.Y(fo15), .S(S[3]), .I0(th15), .I1(th7));
MUX1_2x1 muxfo15(.Y(fo16), .S(S[3]), .I0(th16), .I1(th8));
MUX1_2x1 muxfo16(.Y(fo17), .S(S[3]), .I0(th17), .I1(th9));
MUX1_2x1 muxfo17(.Y(fo18), .S(S[3]), .I0(th18), .I1(th10));
MUX1_2x1 muxfo18(.Y(fo19), .S(S[3]), .I0(th19), .I1(th11));
MUX1_2x1 muxfo19(.Y(fo20), .S(S[3]), .I0(th20), .I1(th12));
MUX1_2x1 muxfo20(.Y(fo21), .S(S[3]), .I0(th21), .I1(th13));
MUX1_2x1 muxfo21(.Y(fo22), .S(S[3]), .I0(th22), .I1(th14));
MUX1_2x1 muxfo22(.Y(fo23), .S(S[3]), .I0(th23), .I1(th15));
MUX1_2x1 muxfo23(.Y(fo24), .S(S[3]), .I0(th24), .I1(th16));
MUX1_2x1 muxfo24(.Y(fo25), .S(S[3]), .I0(th25), .I1(th17));
MUX1_2x1 muxfo25(.Y(fo26), .S(S[3]), .I0(th26), .I1(th18));
MUX1_2x1 muxfo26(.Y(fo27), .S(S[3]), .I0(th27), .I1(th19));
MUX1_2x1 muxfo27(.Y(fo28), .S(S[3]), .I0(th28), .I1(th20));
MUX1_2x1 muxfo28(.Y(fo29), .S(S[3]), .I0(th29), .I1(th21));
MUX1_2x1 muxfo29(.Y(fo30), .S(S[3]), .I0(th30), .I1(th22));
MUX1_2x1 muxfo30(.Y(fo31), .S(S[3]), .I0(th31), .I1(th23));
MUX1_2x1 muxfo31(.Y(fo32), .S(S[3]), .I0(th32), .I1(th24));

// layer 5
MUX1_2x1 muxfi0(.Y(Y[0]), .S(S[4]), .I0(fo1), .I1(1'b0));
MUX1_2x1 muxfi1(.Y(Y[1]), .S(S[4]), .I0(fo2), .I1(1'b0));
MUX1_2x1 muxfi2(.Y(Y[2]), .S(S[4]), .I0(fo3), .I1(1'b0));
MUX1_2x1 muxfi3(.Y(Y[3]), .S(S[4]), .I0(fo4), .I1(1'b0));
MUX1_2x1 muxfi4(.Y(Y[4]), .S(S[4]), .I0(fo5), .I1(1'b0));
MUX1_2x1 muxfi5(.Y(Y[5]), .S(S[4]), .I0(fo6), .I1(1'b0));
MUX1_2x1 muxfi6(.Y(Y[6]), .S(S[4]), .I0(fo7), .I1(1'b0));
MUX1_2x1 muxfi7(.Y(Y[7]), .S(S[4]), .I0(fo8), .I1(1'b0));
MUX1_2x1 muxfi8(.Y(Y[8]), .S(S[4]), .I0(fo9), .I1(1'b0));
MUX1_2x1 muxfi9(.Y(Y[9]), .S(S[4]), .I0(fo10), .I1(1'b0));
MUX1_2x1 muxfi10(.Y(Y[10]), .S(S[4]), .I0(fo11), .I1(1'b0));
MUX1_2x1 muxfi11(.Y(Y[11]), .S(S[4]), .I0(fo12), .I1(1'b0));
MUX1_2x1 muxfi12(.Y(Y[12]), .S(S[4]), .I0(fo13), .I1(1'b0));
MUX1_2x1 muxfi13(.Y(Y[13]), .S(S[4]), .I0(fo14), .I1(1'b0));
MUX1_2x1 muxfi14(.Y(Y[14]), .S(S[4]), .I0(fo15), .I1(1'b0));
MUX1_2x1 muxfi15(.Y(Y[15]), .S(S[4]), .I0(fo16), .I1(1'b0));
MUX1_2x1 muxfi16(.Y(Y[16]), .S(S[4]), .I0(fo17), .I1(fo1));
MUX1_2x1 muxfi17(.Y(Y[17]), .S(S[4]), .I0(fo18), .I1(fo2));
MUX1_2x1 muxfi18(.Y(Y[18]), .S(S[4]), .I0(fo19), .I1(fo3));
MUX1_2x1 muxfi19(.Y(Y[19]), .S(S[4]), .I0(fo20), .I1(fo4));
MUX1_2x1 muxfi20(.Y(Y[20]), .S(S[4]), .I0(fo21), .I1(fo5));
MUX1_2x1 muxfi21(.Y(Y[21]), .S(S[4]), .I0(fo22), .I1(fo6));
MUX1_2x1 muxfi22(.Y(Y[22]), .S(S[4]), .I0(fo23), .I1(fo7));
MUX1_2x1 muxfi23(.Y(Y[23]), .S(S[4]), .I0(fo24), .I1(fo8));
MUX1_2x1 muxfi24(.Y(Y[24]), .S(S[4]), .I0(fo25), .I1(fo9));
MUX1_2x1 muxfi25(.Y(Y[25]), .S(S[4]), .I0(fo26), .I1(fo10));
MUX1_2x1 muxfi26(.Y(Y[26]), .S(S[4]), .I0(fo27), .I1(fo11));
MUX1_2x1 muxfi27(.Y(Y[27]), .S(S[4]), .I0(fo28), .I1(fo12));
MUX1_2x1 muxfi28(.Y(Y[28]), .S(S[4]), .I0(fo29), .I1(fo13));
MUX1_2x1 muxfi29(.Y(Y[29]), .S(S[4]), .I0(fo30), .I1(fo14));
MUX1_2x1 muxfi30(.Y(Y[30]), .S(S[4]), .I0(fo31), .I1(fo15));
MUX1_2x1 muxfi31(.Y(Y[31]), .S(S[4]), .I0(fo32), .I1(fo16));

endmodule

