module AddressConverter
	#(
	parameter LEN = 16,
	parameter ROW_LEN = 256)
	(input logic[9:0] row,
	input  logic[9:0] col,
	output logic[LEN-1:0] address);
	assign address = (row[9:0] * ROW_LEN) + col[9:0];
endmodule
