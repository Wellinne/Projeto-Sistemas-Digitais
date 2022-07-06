module mag_on(
  input wire STARTN, STOPN, CLEARN, DOOR, timer_done,
  output wire mag
);
  
  wire nq, SET, RESET;
  
  assign RESET = STARTN | !STOPN | !CLEARN | !DOOR | timer_done;// todos os outros casos sem ser o da ativação
  assign SET = !STARTN & STOPN & CLEARN & DOOR & !timer_done; // funciona somente com o start==0, stop==1, clear==1, door(door_closed)==1 e timer_done==0. Isso considerando que algumas portas funcionam somente ativas em nível BAIXO
  
  //descrição comportamental do Latch SR
  nor g1(mag, RESET, nq);
  nor g2(nq, SET, mag);
endmodule

