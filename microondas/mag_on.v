module mag_on(
  input wire STARTN, STOPN, CLEARN, DOOR, timer_done,
  output wire mag
);
  
  wire nq, SET, RESET;
  
  assign RESET = STARTN | !STOPN | !CLEARN | !DOOR | timer_done;
  assign SET = !STARTN & STOPN & CLEARN & DOOR & !timer_done;
  
  nor g1(mag, RESET, nq);
  nor g2(nq, SET, mag);
endmodule

