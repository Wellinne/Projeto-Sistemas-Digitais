module microwaveOven(input wire [9:0]keypad,input wire startn,stopn,clearn,door_closed,clock, output wire mag_on,output wire [6:0] sec_ones_segs,sec_tens_segs,min_segs);
reg count=0;// variável para auxiliar no processo de reativação do contador do microondas
wire [3:0] D_out,sec_ones_out,sec_tens_out,mins_out;
wire loadn_out,pgt_1Hz_out,zero_out,pgt_1Hz_out_canPulse;
reg canPulse=1;// estado inicial. tudo normal

assign pgt_1Hz_out_canPulse = canPulse & pgt_1Hz_out;

timerAndControlInput U0(.keypad(keypad),.enablen(mag_on),.clk(clock),.loadn(loadn_out),.pgt_1Hz(pgt_1Hz_out),.D(D_out));
mag_on U1(.STARTN(startn),.STOPN(stopn),.CLEARN(clearn),.DOOR(door_closed),.timer_done(zero_out),.mag(mag_on));
timerminseg U2(.data(D_out),.loadn(loadn_out),.clrn(clearn),.clock(pgt_1Hz_out_canPulse),.enable(mag_on),.zero(zero_out),.sec_ones(sec_ones_out),.sec_tens(sec_tens_out),.mins(mins_out));
bcd_7segmentos U3(.sec_ones(sec_ones_out),.sec_tens(sec_tens_out),.mins(mins_out),.sec_ones_segs(sec_ones_segs),.sec_tens_segs(sec_tens_segs),.min_segs(min_segs));

always @(negedge clearn) begin// o microondas só voltará a funcionar caso seja dado um clear nele
	canPulse<=1;
	count<=1;
end

always @( posedge zero_out) begin// bloqueia o incremento das variáveis sec_tens e sec_mins que ocorriam por engano e faziam com que o microondas fosse ativado novamente mesmo após o término do tempo
	canPulse =(count==1)?0:1; //necessito da troca "instantânea" dessa variável. por isso a atribuição bloqueante
	count<=~count;
end
endmodule