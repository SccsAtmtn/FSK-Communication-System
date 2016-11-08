module checkCode(
input [7:0] datain,
output [8:0] dataout
);

assign dataout[8:1] = datain[7:0];
assign dataout[0] = datain[7]^datain[6]^datain[5]^datain[4]^datain[3]^datain[2]^datain[1]^datain[0];

endmodule
