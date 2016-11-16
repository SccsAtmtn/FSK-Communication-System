module EightToThirteen(clk_AD, reset, datain, dataout);

input clk_AD, reset;
input [7:0] datain;
output [7:0] dataout;
reg [12:0] dataout;

always @(negedge reset)
begin
    dataout <= 13'b0000000000000;
end

always @(datain)
begin
    dataout <= {datain, 5'b00000};
end

endmodule
