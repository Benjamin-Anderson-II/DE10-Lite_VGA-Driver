module VGA_driver (
	input  logic		 clk,
	input  logic		 rst,
	input  logic[11:0] RGB_in,
	output logic		 Hsync,
	output logic		 Vsync,
	output logic[11:0] RGB_out,
	output logic[9:0]  HCount,
	output logic[9:0]  VCount);
	
	logic HDisplay;
	logic VDisplay;
	
	logic clkShort;
	
	divBy2 clkMod(clk, rst, clkShort);
	
	VGAmux Rmux(RGB_in[11:8], {HDisplay, VDisplay}, RGB_in[11:8]);
	VGAmux Gmux(RGB_in[7:4],  {HDisplay, VDisplay}, RGB_in[7:4]);
	VGAmux Bmux(RGB_in[3:0],  {HDisplay, VDisplay}, RGB_in[3:0]);
	
	SyncCount s(clkShort, rst, Hsync, Vsync, HDisplay, VDisplay, HCount[9:0], VCount[9:0]);
	
endmodule
