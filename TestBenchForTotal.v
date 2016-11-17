module TestBenchForTotal(sysclk, mainclk, clk2, clk32, clk288, datain, dataout, pcmlinear, rpcmlinear, logPCM, rLogPCM, checked, rfskdata, fskdata);

output [7:0] datain;
output [7:0] dataout;

output wire [7:0] logPCM, rLogPCM;
output wire mainclk, clk2, clk32, clk288;
output wire [8:0] checked, rfskdata;
output reg sysclk;
output wire fskdata;
output wire [12:0] pcmlinear, rpcmlinear;

reg reset;

GenMainClk module8(.sysclk(sysclk), .reset(reset), .mainclk(mainclk));
GenClk module9(.mainclk(mainclk), .reset(reset), .clk2(clk2), .clk32(clk32), .clk288(clk288));
GenData module10(.clk288(clk288), .reset(reset), .dataout(datain));
EightToThirteen module6(.datain(datain), .dataout(pcmlinear));
LinToLogPCM module0(.pcmlinear(pcmlinear), .pcmlog(logPCM));
CheckCode module1(.datain(logPCM), .dataout(checked));
FSK module2(.clk(clk2), .reset(reset), .datain(checked), .dataout(fskdata));
rFSK module3(.clk(clk32), .reset(reset), .datain(fskdata), .dataout(rfskdata));
rCheckCode module4(.datain(rfskdata), .dataout(rLogPCM));
rLinToLogPCM module5(.pcmlog(rLogPCM), .pcmlinear(rpcmlinear));
rEightToThirteen module7(.datain(rpcmlinear), .dataout(dataout));

initial 
begin 
    reset = 1;
    sysclk = 0;
end

initial 
fork
    forever #5 sysclk = ~sysclk;
    #1 reset = 0;
    #2 reset = 1;
    #80000 reset = 0;
    #80001 reset = 1;
join

endmodule
