module top(sysclk, reset, datain, dataout);

input sysclk, reset;
output reg [7:0] datain;
output wire [7:0] dataout;

wire [7:0] data_res0;
wire [7:0] logPCM, rLogPCM;
wire mainclk, clk2, clk32, clk288, clk384;
wire [11:0] checked, rfskdata;
wire fskdata;
wire [12:0] pcmlinear, rpcmlinear;

GenMainClk module8(.sysclk(sysclk), .reset(reset), .mainclk(mainclk));
GenClk module9(.mainclk(mainclk), .reset(reset), .clk2(clk2), .clk32(clk32), .clk288(clk288), .clk384(clk384));
GenData module10(.clk(clk384), .reset(reset), .dataout(data_res0));
EightToThirteen module6(.datain(data_res0), .dataout(pcmlinear));
LinToLogPCM module0(.pcmlinear(pcmlinear), .pcmlog(logPCM));
HammingCode module1(.datain(logPCM), .dataout(checked));
//CheckCode module1(.datain(logPCM), .dataout(checked));
FSK module2(.clk(clk2), .reset(reset), .datain(checked), .dataout(fskdata));
rFSK module3(.clk(clk32), .reset(reset), .datain(fskdata), .dataout(rfskdata));
//rCheckCode module4(.datain(rfskdata), .dataout(rLogPCM));
rHammingCode module4(.datain(rfskdata), .dataout(rLogPCM));
rLinToLogPCM module5(.pcmlog(rLogPCM), .pcmlinear(rpcmlinear));
rEightToThirteen module7(.datain(rpcmlinear), .dataout(dataout));


always @(posedge clk384) begin
	datain <= data_res0;
end
endmodule
