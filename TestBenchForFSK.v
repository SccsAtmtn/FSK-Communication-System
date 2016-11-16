module TestBenchForFSK(sysclk, datain, fskdata, rfskdata, clk16);

output reg [8:0] datain;
output [8:0] rfskdata;
output reg sysclk, clk16;
output fskdata;

reg reset;


FSK module2(.clk(sysclk), .reset(reset), .datain(datain), .dataout(fskdata));
rFSK module3(.clk(clk16), .reset(reset), .datain(fskdata), .dataout(rfskdata));

initial 
begin 
    reset = 1;
    sysclk = 0;
    #5 clk16 = 1;
    forever #80 clk16 = ~clk16;
end

initial 
begin
    #5 datain = 9'b000000000;
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
    if (datain==9'b111111111)
        datain <= 9'b000000000;
end

endmodule
