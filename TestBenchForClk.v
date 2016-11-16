module TestBenchForClk(sysclk, reset, mainclk, clk2, clk32, clk288);

output reg sysclk, reset;
output mainclk, clk2, clk32, clk288;

GenMainClk module1(.sysclk(sysclk), .reset(reset), .mainclk(mainclk));
GenClk module2(.mainclk(mainclk), .reset(reset), .clk2(clk2), .clk32(clk32), .clk288(clk288));

initial 
begin
    sysclk = 0;
    reset = 1;
end

initial 
fork
    #1 reset = 0;
    #2 reset = 1;
    forever #5 sysclk = ~sysclk;
join

endmodule