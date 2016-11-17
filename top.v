module top(sysclk, reset, datain, dataout);

input sysclk, reset;
output wire [7:0] datain;
output wire [7:0] dataout;

wire [7:0] logPCM, rLogPCM;
wire mainclk, clk2, clk32, clk288;
wire [8:0] checked, rfskdata;
wire fskdata;
wire [12:0] pcmlinear, rpcmlinear;

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

endmodule
