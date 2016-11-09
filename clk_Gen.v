module clk_Gen(mainclk, reset, clk2, clk32, clk288)

input mainclk, reset;
output clk2, clk32, clk288;
reg clk2, clk32, clk288;

reg count;
reg [4:0] count32;
reg [8:0] count288;

always@(posedge mainclk or negedge reset)
begin
	if(~reset) begin
		clk2 <= 0;
		clk32 <= 0;
		clk288 <= 0;
		count <= 1'b0;
		count32 <= 5'b00000;
		count288 <= 9'b000000000;
	end
	else begin
		if(count == 1'b1) begin
			clk2 <= ~clk2;
			count <= 1'b0
		end
		else count <= count + 1;
		
		if(count32 == 5'b10000) begin
			clk32 <= ~clk32;
			count32 <= 5'b00000;
		end
		else count32 <= count32 + 1;
		
		if(count288 == 9'b010010000) begin
			clk288 <= ~clk288;
			count288 <= 9'b000000000;
		end
		else count288 <= count288 + 1;
	end
end

endmodule