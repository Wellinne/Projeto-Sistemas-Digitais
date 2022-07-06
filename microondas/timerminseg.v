module timerminseg(input wire [3:0] data, input wire loadn,clrn,clock,enable,output wire zero,output wire [3:0] sec_ones,sec_tens,mins);

wire tcSecOnes,tcSecTens,tcMins,zeroSecOnes,zeroSecTens,zeroMins;
wire tcSecTenstoMins;// feito por conta do minuto estar sendo decrementado na hora errada. agora só decrementa quando os segundos terminarem
assign tcSecTenstoMins=zeroSecOnes&zeroSecTens&tcSecOnes; 
contadormod10 U0 (.data(data),.loadneg(loadn),.clearneg(clrn),.clk(clock),.en(enable),.tc(tcSecOnes),.zero(zeroSecOnes),.out(sec_ones));
contadormod6 U1 (.data(sec_ones),.loadneg(loadn),.clearneg(clrn),.clk(clock),.en(tcSecOnes),.tc(tcSecTens),.zero(zeroSecTens),.out(sec_tens));
contadormod10 U2 (.data(sec_tens),.loadneg(loadn),.clearneg(clrn),.clk(clock),.en(tcSecTenstoMins),.tc(tcMins),.zero(zeroMins),.out(mins));
assign zero =  zeroSecOnes & zeroSecTens & zeroMins;

endmodule