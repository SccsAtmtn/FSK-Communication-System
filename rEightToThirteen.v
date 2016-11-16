module rEightToThirteen(datain, dataout);
input [12:0] datain;
output [7:0] dataout;

assign dataout = datain[12:5];

endmodule

