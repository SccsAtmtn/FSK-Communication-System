module EightToThirteen(datain, dataout);

input [7:0] datain;
output [12:0] dataout;

assign dataout = {datain, 5'b00000};

endmodule
