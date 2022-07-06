module clkdiv100(input wire clk, output reg clk100);
reg [5:0] count;
initial begin
	clk100<=0;
	count<=0;
end
always @(posedge clk) begin
	case(count) //verifico se o contador é 49. 49 porque é necessário um clock de 1Hz(ou seja, um período de 1s compostdo de clk100=1 quando tempo=0.5s e clk100=0 quando tempo=1s)
		6'b110001:begin count<=0; clk100<=clk100^1; end// clk100 == clk100 xor 1 (o comportamento é fazer o valor de clk100 ser '1' e depois '0'). O valor binário é 49(base10)
		default:count<=count+1;
	endcase
end
endmodule