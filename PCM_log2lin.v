module pcm_log2lin(input pcmlog,output pcmlinear);
	reg [12:0] a =0;
	
	a[12]<=pcmlog[7];
	
	case (pcmlog[6:4])
		3'b000:
			a[11:5]<=7'b0000000;
			a[4:1]<=pcmlog[3:0];
			a[0]<=1;
		3'b001:
			a[11:5]<=7'b0000001;
			a[4:1]<=pcmlog[3:0];
			a[0]<=1;
		3'b010:
			a[11:6]<=6'b000001;
			a[5:2]<=pcmlog[3:0];
			a[1:0]<=2'b10;
		3'b011:
			a[11:7]<=5'b00001;
			a[6:3]<=pcmlog[3:0];
			a[2:0]<=3'b100;
		3'b100:
			a[11:8]<=4'b0001;
			a[7:4]<=pcmlog[3:0];
			a[3:0]<=4'b1000;
		3'b101:
			a[11:9]<=3'b001;
			a[8:5]<=pcmlog[3:0];
			a[4:0]<=5'b10000;
		3'b110:
			a[11:10]<=2'b01;
			a[9:6]<=pcmlog[3:0];
			a[5:0]<=6'b100000;
		3'b111:
			a[11]<=1;
			a[10:7]<=pcmlog[3:0];
			a[6:0]<=7'b1000000;
		default:;
	endcase
	
	pcmlinear[12:0]<=a[12:0];
	
endmodule