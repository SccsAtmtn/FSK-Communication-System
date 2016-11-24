module GenClk(mainclk, reset, clk2, clk32, clk288, clk384);

input mainclk, reset;
output reg clk2, clk32, clk288, clk384;

reg count;
reg [4:0] count32;
reg [8:0] count288, count384;
reg flag;
always@(posedge mainclk or negedge reset)
begin
	if(~reset) begin
		clk2 <= 0;
		clk32 <= 0;
		clk288 <= 0;
		clk384 <= 0;
		count <= 1'b0;
		count32 <= 5'b00000;
		count288 <= 9'b000000000;
		count384 <= 9'b000000000;
        flag <= 1;
	end
    else if (flag==1) begin
        clk2 <= ~clk2;
        clk32 <= ~clk32;
        clk288 <= ~clk288;
		  clk384 <= ~clk384;
        count <= 1'b0;
		count32 <= 5'b00000;
		count288 <= 9'b000000000;
				count384 <= 9'b000000000;
        flag <= 0;
    end
	else begin
		if(count == 1'b1) begin
			clk2 <= ~clk2;
			count <= 1'b0;
		end
		else count <= count + 1;
		
		if(count32 == 5'b11111) begin
			clk32 <= ~clk32;
			count32 <= 5'b00000;
		end
		else count32 <= count32 + 1;
		
		if(count288 == 9'b100011111) begin
			clk288 <= ~clk288;
			count288 <= 9'b000000000;
		end
		else count288 <= count288 + 1;
		
				
		if(count384 == 9'b101111111) begin
			clk384 <= ~clk384;
			count384 <= 9'b000000000;
		end
		else count384 <= count384 + 1;
	end
end

endmodule