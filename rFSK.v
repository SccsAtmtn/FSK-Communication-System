module rFSK(clk, reset, datain, dataout);

input clk, reset, datain;
output reg [8:0] dataout;

reg [8:0] data;
reg [3:0] k, j;
reg flag;

always @(posedge datain or negedge reset) 
begin
    if (~reset) 
    begin
        k <= 0;
        flag <= 0;
        j <= 0;
    end
    else 
    begin
        if (clk==1)
        begin
            if (flag==1)
            begin
                if (k==8)
                begin
                    k <= 0;
                    dataout <= data;    
                end
                else
                    k <= k+1;
            end
            j <= j+1;
            flag <= 0;
        end
        else 
        begin
            if (j>3)
            begin
                if (flag==0)
                begin
                    data[k] <= 1;
                    flag <= 1;
                end
            end
            else
            begin
                if (flag==0)
                begin
                    data[k] <= 0;
                    flag <= 1;
                end
            end
            j <= 0;
        end
    end
end

endmodule