module TestBenchForLinToLogPCM(sysclk, clk16, datain, checked, dataout, fskdata, rfskdata, logPCM, rLogPCM);

output reg [12:0] datain;
output [7:0] logPCM, rLogPCM;
output [12:0] dataout;
output [8:0] checked, rfskdata;
output reg sysclk, clk16;
output fskdata;

reg reset;

LinToLogPCM module0(.pcmlinear(datain), .pcmlog(logPCM));
CheckCode module1(.datain(logPCM), .dataout(checked));
FSK module2(.clk(sysclk), .reset(reset), .datain(checked), .dataout(fskdata));
rFSK module3(.clk(clk16), .reset(reset), .datain(fskdata), .dataout(rfskdata));
rCheckCode module4(.datain(rfskdata), .dataout(rLogPCM));
rLinToLogPCM module5(.pcmlog(rLogPCM), .pcmlinear(dataout));

initial 
begin 
    reset = 1;
    sysclk = 0;
    #5 clk16 = 1;
    forever #80 clk16 = ~clk16;
end

initial 
begin
    datain = 13'b0000000000000;
    #5 datain = 13'b0000000011111;
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
    if (datain==13'b1111111111111)
        datain <= 13'b0000000000000;
end

endmodule
