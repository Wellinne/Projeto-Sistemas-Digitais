`timescale 1ns/1ns
module priorityEncoder_tb();
reg [9:0] keypad_tb=1;
reg enablen_tb;
wire [3:0] out_tb;
wire dataVal_tb;
integer i;
priorityEncoder DUT (.keypad(keypad_tb),.enablen(enablen_tb),.out(out_tb),.dataVal(dataVal_tb));
initial begin
    $dumpfile("priorityEncoder_tb.vcd");
    $dumpvars(0,priorityEncoder_tb);
    enablen_tb=0;
    repeat(10) begin
        #10;
        keypad_tb=keypad_tb<<1;
    end
    keypad_tb=15;
    enablen_tb=0;
    #10;
    keypad_tb=1;
    enablen_tb=1;

    repeat(10) begin
        #10;
        keypad_tb=keypad_tb<<1;
    end
end
endmodule