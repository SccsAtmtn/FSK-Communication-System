module Test_Bench(datain, checked, dataout);
    output reg [7:0] datain;
    output [7:0] dataout;
    output [8:0] checked;
    checkCode module1(.datain(datain), .dataout(checked));
    rCheckCode module2(.datain(checked), .dataout(dataout));
    
    initial begin 
        datain = 8'b00000000;
    end
    
    initial fork
        forever #5 datain = datain+1;
    join
    
    always @(datain) 
    begin
        if (datain==8'b11111111)
            datain <= 8'b00000000;
    end
endmodule
