module displayMux
	(input logic[11:0]d1,
	input  logic[11:0]d0,
	input  logic s,
	output logic[11:0]y);
	
	assign y[11:0] = (s) ? d1[11:0]: d0[11:0];
endmodule
