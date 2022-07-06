`timescale 1ns/1ns
module delaydebouncing_tb();
reg clk_tb=0,clear_tb=0;
wire key_tb;
integer i;
delaydebouncing DUT (.clk(clk_tb),.clear(clear_tb),.key(key_tb));
initial begin
	$dumpfile("delaydebouncing_tb.vcd");
	$dumpvars(0,delaydebouncing_tb);
	repeat(500)
		#5 clk_tb=~clk_tb;
end

initial begin// teste do clear
	#302;
	clear_tb=1;
	#5;
	clear_tb=0;
end

endmodule