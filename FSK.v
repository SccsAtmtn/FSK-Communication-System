module FSK(clk, reset, datain, dataout);

input clk, reset;
input [8:0] datain;
output reg dataout;

reg flag;
reg [3:0] cnt, i;

always @(posedge clk or negedge reset)
begin 
    if (~reset) 
    begin
        flag <= 0;
        dataout <= 0;
        i <= 0;
        cnt <= 0;
    end
    else 
    begin
        if (cnt==15) 
        begin
            cnt <= 0;
            if (i==8)
            begin
                i <= 0;
            end
            else
            begin
                i <= i+1;
            end
        end
        else
        begin
            cnt <= cnt+1;
        end
        
        if (datain[i]==1)
        begin
            dataout <= ~dataout;
        end
        else
        begin
            if (flag==0)
            begin
                flag <= 1;
                dataout <= ~dataout;
            end
            else
            begin
                flag <= 0;
            end
        end
    end
end

endmodule