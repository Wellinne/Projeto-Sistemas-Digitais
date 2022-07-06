`timescale 1ms/1ms
module clkdiv100_tb();
reg clk_tb=0;
wire clk100_tb;
integer i;
clkdiv100 DUT (.clk(clk_tb),.clk100(clk100_tb));
initial begin
	$dumpfile("clkdiv100_tb.vcd");
	$dumpvars(0,clkdiv100_tb);
	repeat(1000)//variando o pulso de clock
		#5 clk_tb=~clk_tb;
end

endmodule