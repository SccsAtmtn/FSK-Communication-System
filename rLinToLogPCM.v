module rLinToLogPCM(pcmlog, pcmlinear);

input [7:0] pcmlog;
output reg [12:0] pcmlinear;

always @(pcmlog)
begin
    pcmlinear[12]<=pcmlog[7];

    case (pcmlog[6:4])
        3'b000:
        begin
            pcmlinear[11:5]<=7'b0000000;
            pcmlinear[4:1]<=pcmlog[3:0];
            pcmlinear[0]<=1;
        end
        3'b001:            
        begin
            pcmlinear[11:5]<=7'b0000001;
            pcmlinear[4:1]<=pcmlog[3:0];
            pcmlinear[0]<=1;
        end
        3'b010:            
        begin
            pcmlinear[11:6]<=6'b000001;
            pcmlinear[5:2]<=pcmlog[3:0];
            pcmlinear[1:0]<=2'b10;
        end
        3'b011:            
        begin
            pcmlinear[11:7]<=5'b00001;
            pcmlinear[6:3]<=pcmlog[3:0];
            pcmlinear[2:0]<=3'b100;
        end
        3'b100:            
        begin
            pcmlinear[11:8]<=4'b0001;
            pcmlinear[7:4]<=pcmlog[3:0];
            pcmlinear[3:0]<=4'b1000;
        end
        3'b101:            
        begin
            pcmlinear[11:9]<=3'b001;
            pcmlinear[8:5]<=pcmlog[3:0];
            pcmlinear[4:0]<=5'b10000;
        end
        3'b110:            
        begin
            pcmlinear[11:10]<=2'b01;
            pcmlinear[9:6]<=pcmlog[3:0];
            pcmlinear[5:0]<=6'b100000;
        end
        3'b111:            
        begin
            pcmlinear[11]<=1;
            pcmlinear[10:7]<=pcmlog[3:0];
            pcmlinear[6:0]<=7'b1000000;
        end
    endcase
end
	
endmodule