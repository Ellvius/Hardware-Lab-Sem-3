// 8-bit adder with sum and carry as output
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


// Half adder
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



