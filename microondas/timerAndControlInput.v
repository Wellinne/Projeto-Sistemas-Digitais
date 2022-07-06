module timerAndControlInput(input wire [9:0] keypad,input wire enablen,clk,output wire loadn,pgt_1Hz,output wire [3:0] D);
wire inB,inA;//conectando a saída do clock/100 ao fio inB para colocar na entrada. para o inA, é a saída dos pulsos para colocar o dígito válido no timer
clkdiv100 U0 (.clk(clk),.clk100(inB));
priorityEncoder U1 (.keypad(keypad),.enablen(enablen),.out(D),.dataVal(loadn));
delaydebouncing U2 (.clk(clk),.clear(loadn),.key(inA));
mux U3 (.sel(enablen),.inA(inA),.inB(inB),.pgt_1Hz(pgt_1Hz));

endmodule