module TestBenchForCheckCode(sysclk, clk16, datain, checked, dataout, fskdata, rfskdata);

output reg [7:0] datain;
output [7:0] dataout;
output [8:0] checked, rfskdata;
output reg sysclk, clk16;
output fskdata;

reg reset;


//GenMainClk module0(.sysclk(sysclk), .reset(reset), .mainclk(clk));
CheckCode module1(.datain(datain), .dataout(checked));
FSK module2(.clk(sysclk), .reset(reset), .datain(checked), .dataout(fskdata));
rFSK module3(.clk(clk16), .reset(reset), .datain(fskdata), .dataout(rfskdata));
rCheckCode module4(.datain(rfskdata), .dataout(dataout));

initial 
begin 
    reset = 1;
    sysclk = 0;
    #5 clk16 = 1;
    forever #80 clk16 = ~clk16;
end

initial 
begin
    #5 datain = 8'b00000000;
    forever #1440 datain = datain+1;
end

initial 
fork
    forever #5 sysclk = ~sysclk;
    #1 reset = 0;
    #2 reset = 1;
join

always @(datain) 
begin
    if (datain==8'b11111111)
        datain <= 8'b00000000;
end

endmodule
