module mux(input wire sel,inA,inB,output wire pgt_1Hz);
	assign pgt_1Hz= (!sel&inA)|(sel&inB);// implementação de um mux com portas lógicas
endmodule