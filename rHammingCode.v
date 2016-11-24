module rHammingCode(datain, dataout);

input [11:0] datain;
output reg [7:0] dataout;

reg [3:0] cnt;
reg [11:0] datain0;
reg [7:0] data;

always @(datain) 
begin
    cnt=0;
    if (datain[11]^datain[9]^datain[7]^datain[5]^datain[3]^datain[1]==1)
        cnt = cnt+1;
    if (datain[10]^datain[9]^datain[6]^datain[5]^datain[2]^datain[1]==1)
        cnt = cnt+2;
    if (datain[8]^datain[7]^datain[6]^datain[5]^datain[0]==1)
        cnt = cnt+4;
    if (datain[4]^datain[3]^datain[2]^datain[1]^datain[0]==1)
        cnt = cnt+8;
    datain0 = datain;
    if (cnt>0)
        if(cnt<=12)
            datain0[12-cnt] = ~datain0[12-cnt];
    data[7] = datain0[9];
    data[6] = datain0[7];
    data[5] = datain0[6];
    data[4] = datain0[5];
    data[3] = datain0[3];
    data[2] = datain0[2];
    data[1] = datain0[1];
    data[0] = datain0[0];
    dataout = data;
end

endmodule