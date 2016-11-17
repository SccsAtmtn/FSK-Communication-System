module GenData(clkData, reset, dataout);
input clkData, reset;
output [7:0] dataout;
reg [7:0] dataout;

always@(posedge clkData or negedge reset) begin
	if(~reset) begin
		dataout <= 8'b00000000;
	end
	else begin
		if(dataout == 8'b11111111) dataout <= 8'b00000000;
		else dataout <= dataout+1;
	end

end

endmodule