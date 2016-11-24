module GenMainClk(sysclk, reset, mainclk);

input sysclk, reset;
output reg mainclk;
reg [15:0] count;

always @(posedge sysclk or negedge reset) 
begin
	if(~reset) 
    begin 
		mainclk <= 0;
		count <= 0;
	end
	else 
    begin
		if(count==16'b1111111111111111) 
        begin
			mainclk <= ~mainclk;
			count <= 0;
		end
		else count <= count+1;
	end
end

endmodule
