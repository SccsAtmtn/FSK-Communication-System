module EightToThir(clk_AD, reset, datain, dataout)

input clk_AD, reset;
input [7:0] datain;
output [7:0] dataout;
reg [12:0] dataout;

always @(posedge clk_AD or negedge reset)
begin
	if(~reset) dataout <= 13'b0000000000000;
	else dataout <= {datain, 5'b00000};
end


endmodule
