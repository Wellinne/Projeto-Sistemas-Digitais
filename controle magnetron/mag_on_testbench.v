`timescale 1ms/1ms
module mag_on_testbench();
  reg startn_test, stopn_test,  clearn_test, doorn_test, timerDone_test;
  wire mag_test;
  integer i;
  mag_on ut(startn_test, stopn_test, clearn_test, doorn_test, timerDone_test, mag_test);
  //como a variação são de 5 bits, 2^5=32, então:
  initial 
        begin
        $dumpfile("mag_on_testbench.vcd");
        $dumpvars(0,mag_on_testbench);
        i=0;
          for(i=0;i<32;i=i+1)//verificando todas as possibilidades para garantir que o magnetron funcione com a combinação correta
          #1 {startn_test,stopn_test,clearn_test,doorn_test,timerDone_test}=i;

        end
endmodule

