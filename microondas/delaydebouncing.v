module delaydebouncing(input wire clear, clk,output reg key);
reg [2:0] count;
initial begin
	count<=0;
	key<=0;
end
always @(posedge clk or posedge clear) begin
	if (clear) begin
		count<=0;
		key<=0;
	end
	case(count)
		3'b011:begin key<=1; count<=count+1; end// considerando o 011(2)==3(10) porque a mudança só acontece após o pulso de clock
		3'b110:begin key<=0; count<=count+1; end// mesma consideração aqui
		3'b111:count<=0;
		default:count<=count+1;
	endcase
end
endmodule
