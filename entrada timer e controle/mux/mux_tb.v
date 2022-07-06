`timescale 1ns/1ns
module mux_tb();
reg sel_tb=0,inA_tb,inB_tb;
wire pgt_1Hz_tb;
integer i;
mux DUT(.sel(sel_tb),.inA(inA_tb),.inB(inB_tb),.pgt_1Hz(pgt_1Hz_tb));
initial begin
	$dumpfile("mux_tb.vcd");
	$dumpvars(0,mux_tb);
	i=0;
	repeat(2)begin
		for(i=0;i<4;i=i+1)begin
			{inA_tb,inB_tb}=i;
			#10;
		end
		sel_tb=sel_tb^1;//como inicialmente o sel_tb é 0. 0 xor(^) 1 = 1. 
	end
end
endmodule