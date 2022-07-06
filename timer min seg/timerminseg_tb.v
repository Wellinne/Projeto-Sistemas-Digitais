`timescale 1ms/1ms
module timerminseg_tb();
reg[3:0] data_tb;
reg loadn_tb=1,clrn_tb=1,clock_tb=0,enable_tb;
wire [3:0] sec_ones_tb,sec_tens_tb,mins_tb;
wire zero_tb;
timerminseg DUT (.data(data_tb),.loadn(loadn_tb),.clrn(clrn_tb),.clock(clock_tb),.enable(enable_tb),.sec_ones(sec_ones_tb),.sec_tens(sec_tens_tb),.mins(mins_tb),.zero(zero_tb));
initial begin
	$dumpfile("timerminseg_tb.vcd");
	$dumpvars(0,timerminseg_tb);
	enable_tb=0;
	data_tb=2; loadn_tb=0;
	#20;
	loadn_tb=1;
	#20;
	data_tb=0; loadn_tb=0;
	#20;
	loadn_tb=1;
	#20;
	data_tb=6; loadn_tb=0;
	#20;
	loadn_tb=1;
	#40;
	enable_tb=1;
	#356;
	clrn_tb=0;
	#10;
	clrn_tb=1;
	#346;
	enable_tb=0;



	
end

always 
	#5 clock_tb=~clock_tb;


initial
	#50000 $finish;
endmodule