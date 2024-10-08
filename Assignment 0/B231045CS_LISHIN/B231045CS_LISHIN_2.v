
// 8-bit subtractor with difference and borrow as output
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


//Half adder
module half_adder(a,b,sum,carry);
input a,b;
output sum,carry;

xor x1(sum,a,b);
and a1(carry,a,b);

endmodule

// Full adder
module full_adder(a,b,cin,sum,carry);
input a,b,cin;
output sum,carry;
wire w1,w2,w3;

half_adder h1(a,b,w1,w2);
half_adder h2(w1,cin,sum,w3);
or o1(carry,w2,w3);

endmodule
