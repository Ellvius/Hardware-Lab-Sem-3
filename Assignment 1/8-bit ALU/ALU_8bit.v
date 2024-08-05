
///       8 - bit ALU       ///
module ALU_8bit(a,b,op,res);
//port declaration
input [7:0]a,b;
input [1:0]op;
output [7:0]res;
wire [7:0]sum,dif,bxor,lshift;
wire carry,borrow;

// all possible functions
adder_8bit add(a,b,sum,carry);
subtractor_8bit sub(a,b,dif,borrow);
bitwise_xor btxor(a,b,bxor);
left_shift ls(a,lshift);

// selecting functions according to the operation code
MUX_4x1 m1(sum[0],dif[0],bxor[0],lshift[0],op,res[0]);
MUX_4x1 m2(sum[1],dif[1],bxor[1],lshift[1],op,res[1]);
MUX_4x1 m3(sum[2],dif[2],bxor[2],lshift[2],op,res[2]);
MUX_4x1 m4(sum[3],dif[3],bxor[3],lshift[3],op,res[3]);

MUX_4x1 m5(sum[4],dif[4],bxor[4],lshift[4],op,res[4]);
MUX_4x1 m6(sum[5],dif[5],bxor[5],lshift[5],op,res[5]);
MUX_4x1 m7(sum[6],dif[6],bxor[6],lshift[6],op,res[6]);
MUX_4x1 m8(sum[7],dif[7],bxor[7],lshift[7],op,res[7]);

endmodule


/// 8-bit adder ///
module adder_8bit(a,b,sum,carry);
input [7:0]a,b;
output [7:0]sum;
output carry;
wire c1,c2,c3,c4,c5,c6,c7;

full_adder f1(a[0],b[0],1'b0,sum[0],c1);
full_adder f2(a[1],b[1],c1,sum[1],c2);
full_adder f3(a[2],b[2],c2,sum[2],c3);
full_adder f4(a[3],b[3],c3,sum[3],c4);

full_adder f5(a[4],b[4],c4,sum[4],c5);
full_adder f6(a[5],b[5],c5,sum[5],c6);
full_adder f7(a[6],b[6],c6,sum[6],c7);
full_adder f8(a[7],b[7],c7,sum[7],carry);

endmodule


/// 8-bit subtractor ///
module subtractor_8bit(a,b,dif,borrow);
input [7:0]a,b;
output [7:0]dif;
output borrow;
wire b1,b2,b3,b4,b5,b6,b7;
wire [7:0]w;

not n1(w[0],b[0]);
not n2(w[1],b[1]);
not n3(w[2],b[2]);
not n4(w[3],b[3]);

not n5(w[4],b[4]);
not n6(w[5],b[5]);
not n7(w[6],b[6]);
not n8(w[7],b[7]);

full_adder f1(a[0],w[0],1'b1,dif[0],b1);
full_adder f2(a[1],w[1],b1,dif[1],b2);
full_adder f3(a[2],w[2],b2,dif[2],b3);
full_adder f4(a[3],w[3],b3,dif[3],b4);

full_adder f5(a[4],w[4],b4,dif[4],b5);
full_adder f6(a[5],w[5],b5,dif[5],b6);
full_adder f7(a[6],w[6],b6,dif[6],b7);
full_adder f8(a[7],w[7],b7,dif[7],borrow);

endmodule


/// Bitwise XOR ///
module bitwise_xor(a,b,res);
input [7:0]a,b;
output [7:0]res;

xor x1(res[0],a[0],b[0]);
xor x2(res[1],a[1],b[1]);
xor x3(res[2],a[2],b[2]);
xor x4(res[3],a[3],b[3]);

xor x5(res[4],a[4],b[4]);
xor x6(res[5],a[5],b[5]);
xor x7(res[6],a[6],b[6]);
xor x8(res[7],a[7],b[7]);

endmodule


// Left shift operator ///
module left_shift(a,res);
input [7:0]a;
output [7:0]res;

buf b1(res[0],1'b0);
buf b2(res[1],a[0]);
buf b3(res[2],a[1]);
buf b4(res[3],a[2]);

buf b5(res[4],a[3]);
buf b6(res[5],a[4]);
buf b7(res[6],a[5]);
buf b8(res[7],a[6]);

endmodule


// 2x1 MUX ///
module MUX_2x1(a,b,s,res);
input a,b,s;
output res;
wire w1,w2,w3;

not n1(w1,s);
and a1(w2,a,w1);
and a2(w3,b,s);
or o(res,w2,w3);

endmodule


/// 4x1 MUX ///
module MUX_4x1(a,b,c,d,s,res);
input a,b,c,d;
input [1:0]s;
output res;
wire w1,w2;

MUX_2x1 m1(a,b,s[0],w1);
MUX_2x1 m2(c,d,s[0],w2);
MUX_2x1 m3(w1,w2,s[1],res);

endmodule


/// Half adder ///
module half_adder(a,b,sum,carry);
input a,b;
output sum,carry;

xor x1(sum,a,b);
and a1(carry,a,b);

endmodule


/// Full adder ///
module full_adder(a,b,cin,sum,carry);
input a,b,cin;
output sum,carry;
wire w1,w2,w3;

half_adder h1(a,b,w1,w2);
half_adder h2(w1,cin,sum,w3);
or o1(carry,w2,w3);

endmodule