module HammingCode(datain, dataout);

input [7:0] datain;
output [11:0] dataout;

assign dataout[11] = datain[7]^datain[6]^datain[4]^datain[3]^datain[1];
assign dataout[10] = datain[7]^datain[5]^datain[4]^datain[2]^datain[1];
assign dataout[9] = datain[7];
assign dataout[8] = datain[6]^datain[5]^datain[4]^datain[0];
assign dataout[7] = datain[6];
assign dataout[6] = datain[5];
assign dataout[5] = datain[4];
assign dataout[4] = datain[3]^datain[2]^datain[1]^datain[0];
assign dataout[3] = datain[3];
assign dataout[2] = datain[2];
assign dataout[1] = datain[1];
assign dataout[0] = datain[0]; 

endmodule