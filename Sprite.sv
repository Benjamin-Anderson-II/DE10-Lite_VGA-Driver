module Sprite
	(input logic clock,
	input  logic reset,
	output logic HSync,
	output logic VSync,
	output logic[11:0] RGB_out);
	
	logic[9:0]  VCount;
	logic[9:0]  HCount;
	logic[15:0] index;
	logic[11:0] rom_out;
	logic[11:0] background_color;
	logic[11:0] RGB_pixel;
	
	logic	row_good;
	logic	col_good;
	logic	display_select;
	
	assign display_select = row_good && col_good;
	assign background_color = 12'hFFF; // white
	
	AddressConverter #(16, 256) getIndex(VCount[9:0], HCount[9:0], index[15:0]);
	zabloing_rom rom(index[15:0], clock, rom_out[11:0]);
	comparator #(10, 256) rowComp(VCount, row_good);
	comparator #(10, 256) colComp(HCount, col_good);
	displayMux disMux(rom_out[11:0], background_color[11:0], display_select, RGB_pixel);
	
	VGA_driver driver(clock, reset, RGB_pixel, HSync, VSync, RGB_out[11:0], HCount[9:0], VCount[9:0]);
endmodule
