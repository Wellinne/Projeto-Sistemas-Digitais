module priorityEncoder(input wire [9:0] keypad,input wire enablen, output reg [3:0] out,output reg dataVal);
always@* begin
	if(!enablen)begin
	    case(keypad)
	    	10'b0000000001:begin out=4'b0000; dataVal=1'b0; end
	    	10'b0000000010:begin out=4'b0001; dataVal=1'b0; end
	    	10'b0000000100:begin out=4'b0010; dataVal=1'b0; end
	    	10'b0000001000:begin out=4'b0011; dataVal=1'b0; end
	    	10'b0000010000:begin out=4'b0100; dataVal=1'b0; end
	    	10'b0000100000:begin out=4'b0101; dataVal=1'b0; end
	    	10'b0001000000:begin out=4'b0110; dataVal=1'b0; end
	    	10'b0010000000:begin out=4'b0111; dataVal=1'b0; end
	    	10'b0100000000:begin out=4'b1000; dataVal=1'b0; end
	    	10'b1000000000:begin out=4'b1001; dataVal=1'b0; end
	    	default:begin out=4'bXXXX; dataVal=1'b1; end
	    endcase
	end
	else begin
		out=4'bXXXX; dataVal=1'b1;
	end
end
endmodule