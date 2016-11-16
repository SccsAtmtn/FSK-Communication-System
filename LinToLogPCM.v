module LinToLogPCM(input [12:0] pcmlinear, output reg [7:0] pcmlog);

always @(pcmlinear)
begin
    pcmlog[7]<=pcmlinear[12];
     
    if (pcmlinear[11:5]==7'b0000000) 
    begin
        pcmlog[6:4]<=3'b000;
        pcmlog[3:0]<=pcmlinear[4:1];
    end
    else if (pcmlinear[11:5]==7'b0000001)
    begin
        pcmlog[6:4]<=3'b001;
        pcmlog[3:0]<=pcmlinear[4:1];
    end
    else if (pcmlinear[11:6]==6'b000001)
    begin
        pcmlog[6:4]<=3'b010;
        pcmlog[3:0]<=pcmlinear[5:2];
    end
    else if (pcmlinear[11:7]==5'b00001)
    begin
        pcmlog[6:4]<=3'b011;
        pcmlog[3:0]<=pcmlinear[6:3];
    end
    else if (pcmlinear[11:8]==4'b0001)
    begin
        pcmlog[6:4]<=3'b100;
        pcmlog[3:0]<=pcmlinear[7:4];
    end
    else if (pcmlinear[11:9]==3'b001)
    begin
        pcmlog[6:4]<=3'b101;
        pcmlog[3:0]<=pcmlinear[8:5];
    end
    else if (pcmlinear[11:10]==2'b01)
    begin
        pcmlog[6:4]<=3'b110;
        pcmlog[3:0]<=pcmlinear[9:6];
    end
    else if (pcmlinear[11]==1)
    begin
        pcmlog[6:4]<=3'b111;
        pcmlog[3:0]<=pcmlinear[10:7];
    end
end

endmodule