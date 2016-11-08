module rCheckCode(datain, dataout);
input [8:0] datain;
output reg [7:0] dataout;

reg checkBit;
always @(*) 
begin
    checkBit = datain[8]^datain[7]^datain[6]^datain[5]^datain[4]^datain[3]^datain[2]^datain[1]^datain[0];
    dataout = (checkBit==1'b0)?datain[8:1]:8'b00000000;
end
 
endmodule