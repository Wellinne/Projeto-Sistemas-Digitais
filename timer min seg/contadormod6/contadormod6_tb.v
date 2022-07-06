`timescale 1ns/1ns
module contadormod6_tb();
reg [3:0] data_tb;
reg loadneg_tb=1,clearneg_tb=1,clk_tb=0,en_tb;
wire [3:0] out_tb;
wire tc_tb,zero_tb;
integer i;
contadormod6 DUT (.data(data_tb),.loadneg(loadneg_tb),.clearneg(clearneg_tb),.clk(clk_tb),.en(en_tb),.out(out_tb),.tc(tc_tb),.zero(zero_tb));
initial begin
	$dumpfile("contadormod6_tb.vcd");
	$dumpvars(0,contadormod6_tb);
	i=0;
	loadneg_tb=0; data_tb=5;
	en_tb=1;
	#200;
	data_tb=0;
	#200;
	data_tb=5;
	#200;
	loadneg_tb=1;
	#200;
	en_tb=0;
	#100;
	loadneg_tb=0; data_tb=9;
	en_tb=1;
	#10;
	loadneg_tb=1;
	#220;
	clearneg_tb=0;
	#10;
	clearneg_tb=1;
	en_tb=0;
	#50;
	en_tb=1;
end

always
	#5 clk_tb=~clk_tb;

initial
	#1000 $finish;
endmodule