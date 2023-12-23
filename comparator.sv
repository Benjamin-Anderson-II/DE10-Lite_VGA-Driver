module comparator
	#(parameter N,
	parameter   M)
	(input logic[N-1:0] a,
	output logic a_lt_M);
	
	assign a_lt_M = (a < M);
endmodule
