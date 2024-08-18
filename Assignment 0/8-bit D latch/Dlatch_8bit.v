`timescale 1ns / 1ps  

module D_latch(d, enable, rst, res);
	input d;
	input enable, rst;
	output res;

	wire Q,Qn,nd,nrst,w1,w2,w3,w4;

	not n1(nd,d);
	not n2(nrst,rst);
	and a3(w3,w1,rst);
	or or1(w4,w2,nrst);
	and a1(w1,enable,d);
	and a2(w2,enable,nd);
	nor nor1(Qn,Q,w3);
	nor nor2(Q,Qn,w4);

	or o1(res,Q,1'b0);

endmodule


module Dlatch_8bit(d,enable,reset,result);
	input [7:0]d;
	input enable;
	input reset;
	output [7:0]result;

	D_latch dl1(d[0],enable, reset, result[0]);
	D_latch dl2(d[1],enable, reset, result[1]);
	D_latch dl3(d[2],enable, reset, result[2]);
	D_latch dl4(d[3],enable, reset, result[3]);
	
	D_latch dl5(d[4],enable, reset, result[4]);
	D_latch dl6(d[5],enable, reset, result[5]);
	D_latch dl7(d[6],enable, reset, result[6]);
	D_latch dl8(d[7],enable, reset, result[7]);

endmodule
