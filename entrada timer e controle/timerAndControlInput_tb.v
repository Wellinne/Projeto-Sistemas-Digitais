`timescale 1ms/1ms
module timerAndControlInput_tb();
reg [9:0] keypad_tb;
reg enablen_tb,clk_tb=0;
wire loadn_tb,pgt_1Hz_tb;
wire [3:0] D_tb;
integer i;
timerAndControlInput DUT(.keypad(keypad_tb),.enablen(enablen_tb),.clk(clk_tb),.loadn(loadn_tb),.pgt_1Hz(pgt_1Hz_tb),.D(D_tb));
initial begin
	$dumpfile("timerAndControlInput_tb.vcd");
	$dumpvars(0,timerAndControlInput_tb);
	keypad_tb=1;enablen_tb=0;
	repeat(10)//contando até 1024(2^10) eu consigo testar diversas vezes o bloco antes de chegar em 5 segundos
		#1000 keypad_tb=keypad_tb<<1;
	enablen_tb=1;
	keypad_tb=1;
	repeat(10)//contando até 1024(2^10) eu consigo testar diversas vezes o bloco antes de chegar em 5 segundos
		#1000 keypad_tb=keypad_tb<<1;
end

always
	#5 clk_tb=~clk_tb;//10 ms de periodo== 100Hz de freq de clock

initial
	#30000 $finish;

endmodule