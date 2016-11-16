module pcm_lin2log(input pcmlinear,output pcmlog);

	reg [7:0] a=0;
	
	a[7]<=pcmlinear[12];
	
	if(pcmlinear[11:5]==7'b0000000) 
	begin
		a[6:4]<=3'b000";
		a[3:0]<=pcmlinear[4:1];
	end
	else if (pcmlinear[11:5]==7'b0000001)
	begin
		a[6:4]<=3'b001;
		a[3:0]<=pcmlinear[4:1];
	end
	else if (pcmlinear[11:6]==6'b000001)
	begin
		a[6:4]<=3'b010;
		a[3:0]<=pcmlinear[5:2];
	end
	else if (pcmlinear[11:7]==5'b00001)
	begin
		a[6:4]<=3'b011;
		a[3:0]<=pcmlinear[6:3];
	end
	else if (pcmlinear[11:8]==4'b0001)
	begin
		a[6:4]<=3'b100;
		a[3:0]<=pcmlinear[7:4];
	end
	else if (pcmlinear[11:9]==3'b001)
	begin
		a[6:4]<=3'b101;
		a[3:0]<=pcmlinear[8:5];
	end
	else if (pcmlinear[11:10]==2'b01)
	begin
		a[6:4]<=3'b110;
		a[3:0]<=pcmlinear[9:6];
	end
	else if (pcmlinear[11]==1)
	begin
		a[6:4]<=3'b111;
		a[3:0]<=pcmlinear[10:7];
	end
	
	pcmlog[7:0] <= a[7:0];
endmodule
