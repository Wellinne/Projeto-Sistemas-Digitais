module contadormod10(input wire [3:0] data, input wire loadneg,clearneg,clk,en,output reg [3:0] out,output reg tc,zero);
initial begin
	out<=0;
	zero<=1;
	tc<=0;
end
always @(posedge clk or negedge clearneg) begin
	if(!clearneg)begin
		out<=0; zero<=1; tc<=1;
	end
	else if(!loadneg)begin
		out<=data; zero<=(data==0)?1:0;
	end
	else begin
		if(en) begin
			out<=out-1;
			case(out)
				4'b0001:begin zero<=1; tc<=1; end// esta definido no 1 porque a alteração so ocorre no próximo pulso de clock
				4'b0000:begin out<=9;zero<=0; tc<=0; end// explicação análoga a da linha acima
				default:begin zero<=0; tc<=0; end
			endcase
		end
		else begin
			out<=out; tc<=0; 
		end
	end
end
endmodule