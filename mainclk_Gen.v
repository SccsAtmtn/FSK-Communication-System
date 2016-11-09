module mainclk_Gen(sysclk, reset, mainclk)
input sysclk, reset;
output mainclk;
reg mainclk;
reg [1:0] count;

always @(posedge sysclk or negedge reset) begin

	if(~reset) begin 
		mainclk <= 0;
		count <= 2'b00;
	end
	else begin
		if(count == 2'b10) begin
			mainclk <= ~mainclk;
			count <= 2'b00;
		end
		else count <= count + 1;
	end

end
endmodule
