`timescale 1ns/1ns
module bcd_7segmentos_tb();
reg [3:0]mins_tb,sec_tens_tb,sec_ones_tb;
wire [6:0]min_segs_tb,sec_tens_segs_tb,sec_ones_segs_tb;
integer i;
bcd_7segmentos DUT(.mins(mins_tb),.sec_tens(sec_tens_tb),.sec_ones(sec_ones_tb),.min_segs(min_segs_tb),.sec_ones_segs(sec_ones_segs_tb),.sec_tens_segs(sec_tens_segs_tb));
initial begin
    $dumpfile("bcd_7segmentos_tb.vcd");
    $dumpvars(0,bcd_7segmentos_tb);
    i=0;
    for(i=0;i<4096;i=i+1)// testando todas as possibilidades
    #10 {mins_tb,sec_tens_tb,sec_ones_tb}=i;

end

endmodule