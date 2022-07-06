`timescale 1ms/1ms
module microwaveOven_tb();
reg [9:0]keypad_tb;
reg startn_tb=1,stopn_tb,clearn_tb,door_closed_tb,clock_tb=0;
wire mag_on_tb;
wire [6:0] sec_ones_segs_tb,sec_tens_segs_tb,min_segs_tb;
integer i;
microwaveOven DUT(.keypad(keypad_tb),.startn(startn_tb),.stopn(stopn_tb),.clearn(clearn_tb),.door_closed(door_closed_tb),.clock(clock_tb),.mag_on(mag_on_tb),.sec_ones_segs(sec_ones_segs_tb),.sec_tens_segs(sec_tens_segs_tb),.min_segs(min_segs_tb));
initial begin
	$dumpfile("microwaveOven_tb.vcd");
	$dumpvars(0,microwaveOven_tb);
	i=0;
	//tentativa de inserir digitos para a primeira contagem
	keypad_tb=10'b0000000100;//2
	#110;
	keypad_tb=10'b0000000001;//0
	#84;
	keypad_tb=10'b0001000000;//6
	#10;
	keypad_tb=10'b0000000000;// um valor inválido para evitar ficar colocando o numero 6 o tempo todo. Na prática outros valores não seriam inseridos acidentalmete porque esses dígitos só são válidos durante o pressionar do keypad
	// testando a contagem decrescente 
	#200;
	{startn_tb,stopn_tb,clearn_tb,door_closed_tb}=4'b0111;
	#180000;//3 minutos
	clearn_tb=0;// reset para voltar a inserir dígitos. No entanto, o start ainda está habilitado. Por conta disso, ele irá novamente decrementar começando de 9:59 até 0:00 novamente e parará até outro pulso de reset. Na prática, o start seria desabilitado ao darmos um reset para evitar a ativação acidental como ocorre
	#20;
	clearn_tb=1;
	#1;
end


always
	#5 clock_tb=~clock_tb;

initial//14:43 aproximadamente de minutos de funcionamento do microondas
	#883035 $finish;

endmodule

/*
0000000100//2
0000000001//0
0001000000//6