


module  Color_Mapper8Bit ( 	input Clk,
						input logic  [7:0]  memMappedValue,
						output logic [7:0]  Red, Green, Blue);



// maps 8-bit value to a set of 255 colors to create an image on the screen
always_comb
begin
	case(memMappedValue)
			// GRAY
			8'h00:
				begin
					Red		= 8'h7C;
					Green	= 8'h7C;
					Blue	= 8'h7C;
				end
			8'h01:
				begin
					Red		= 8'hBC;
					Green	= 8'hBC;
					Blue	= 8'hBC;
				end
			8'h02:
				begin
					Red		= 8'hF8;
					Green	= 8'hF8;
					Blue	= 8'hF8;
				end
			8'h03:
				begin
					Red		= 8'hFC;
					Green	= 8'hFC;
					Blue	= 8'hFC;
				end

			// BLUE
			8'h04:
				begin
					Red		= 8'h00;
					Green	= 8'h00;
					Blue	= 8'hFC;
				end
			8'h05:
				begin
					Red		= 8'h00;
					Green	= 8'h78;
					Blue	= 8'hF8;
				end
			8'h06:
				begin
					Red		= 8'h3C;
					Green	= 8'hBC;
					Blue	= 8'hFC;
				end
			8'h07:
				begin
					Red		= 8'hA4;
					Green	= 8'hE4;
					Blue	= 8'hFC;
				end

			// NAVY BLUE
			8'h09:
				begin
					Red		= 8'h00;
					Green	= 8'h00;
					Blue	= 8'hBC;
				end
			8'h0A:
				begin
					Red		= 8'h00;
					Green	= 8'h58;
					Blue	= 8'hF8;
				end
			8'h0B:
				begin
					Red		= 8'h68;
					Green	= 8'h88;
					Blue	= 8'hFC;
				end
			8'h0C:
				begin
					Red		= 8'hB8;
					Green	= 8'hB8;
					Blue	= 8'hF8;
				end

			// PURPLE
			8'h0D:
				begin
					Red		= 8'h44;
					Green	= 8'h28;
					Blue	= 8'hBC;
				end
			8'h0E:
				begin
					Red		= 8'h68;
					Green	= 8'h44;
					Blue	= 8'hFC;
				end
			8'h0F:
				begin
					Red		= 8'h98;
					Green	= 8'h78;
					Blue	= 8'hF8;
				end
			8'h10:
				begin
					Red		= 8'hD8;
					Green	= 8'hB8;
					Blue	= 8'hF8;
				end

			// PINK
			8'h11:
				begin
					Red		= 8'h94;
					Green	= 8'h00;
					Blue	= 8'h84;
				end
			8'h12:
				begin
					Red		= 8'hD8;
					Green	= 8'h00;
					Blue	= 8'hCC;
				end
			8'h13:
				begin
					Red		= 8'hF8;
					Green	= 8'h78;
					Blue	= 8'hF8;
				end
			8'h14:
				begin
					Red		= 8'hF8;
					Green	= 8'hB8;
					Blue	= 8'hF8;
				end

			// RED
			8'h15:
				begin
					Red		= 8'hA8;
					Green	= 8'h00;
					Blue	= 8'h20;
				end
			8'h16:
				begin
					Red		= 8'hE4;
					Green	= 8'h00;
					Blue	= 8'h58;
				end
			8'h17:
				begin
					Red		= 8'hF8;
					Green	= 8'h58;
					Blue	= 8'h98;
				end
			8'h18:
				begin
					Red		= 8'hF8;
					Green	= 8'hA4;
					Blue	= 8'hC0;
				end

			// ORANGE
			8'h19:
				begin
					Red		= 8'hA8;
					Green	= 8'h10;
					Blue	= 8'h00;
				end
			8'h1A:
				begin
					Red		= 8'hF8;
					Green	= 8'h38;
					Blue	= 8'h00;
				end
			8'h1B:
				begin
					Red		= 8'hF8;
					Green	= 8'h78;
					Blue	= 8'h58;
				end
			8'h1C:
				begin
					Red		= 8'hF0;
					Green	= 8'hD0;
					Blue	= 8'hB0;
				end

			// LIGHT ORANGE
			8'h1D:
				begin
					Red		= 8'h88;
					Green	= 8'h14;
					Blue	= 8'h00;
				end
			8'h1E:
				begin
					Red		= 8'hE4;
					Green	= 8'h5C;
					Blue	= 8'h10;
				end
			8'h1F:
				begin
					Red		= 8'hFC;
					Green	= 8'hA0;
					Blue	= 8'h44;
				end
			8'h20:
				begin
					Red		= 8'hFC;
					Green	= 8'hE0;
					Blue	= 8'hA8;
				end

			// DARK YELLOW
			8'h21:
				begin
					Red		= 8'h50;
					Green	= 8'h30;
					Blue	= 8'h00;
				end
			8'h22:
				begin
					Red		= 8'hAC;
					Green	= 8'h7C;
					Blue	= 8'h00;
				end
			8'h23:
				begin
					Red		= 8'hF8;
					Green	= 8'hB8;
					Blue	= 8'h00;
				end
			8'h24:
				begin
					Red		= 8'hF8;
					Green	= 8'hD8;
					Blue	= 8'h78;
				end

			// GREEN
			8'h25:
				begin
					Red		= 8'h00;
					Green	= 8'h78;
					Blue	= 8'h00;
				end
			8'h26:
				begin
					Red		= 8'h00;
					Green	= 8'hB8;
					Blue	= 8'h00;
				end
			8'h27:
				begin
					Red		= 8'hB8;
					Green	= 8'hF8;
					Blue	= 8'h18;
				end
			8'h28:
				begin
					Red		= 8'hD8;
					Green	= 8'hF8;
					Blue	= 8'h78;
				end

			// DARK GREEN
			8'h29:
				begin
					Red		= 8'h00;
					Green	= 8'h68;
					Blue	= 8'h00;
				end
			8'h2A:
				begin
					Red		= 8'h00;
					Green	= 8'hA8;
					Blue	= 8'h00;
				end
			8'h2B:
				begin
					Red		= 8'h58;
					Green	= 8'hD8;
					Blue	= 8'h54;
				end
			8'h2C:
				begin
					Red		= 8'hB8;
					Green	= 8'hF8;
					Blue	= 8'hB8;
				end

			//WEIRD GREEN
			8'h2D:
				begin
					Red		= 8'h00;
					Green	= 8'h58;
					Blue	= 8'h00;
				end
			8'h2E:
				begin
					Red		= 8'h00;
					Green	= 8'hA8;
					Blue	= 8'h44;
				end
			8'h2F:
				begin
					Red		= 8'h58;
					Green	= 8'hF8;
					Blue	= 8'h98;
				end
			8'h30:
				begin
					Red		= 8'hB8;
					Green	= 8'hF8;
					Blue	= 8'hD8;
				end

			// LIGHT BLUE
			8'h31:
				begin
					Red		= 8'h00;
					Green	= 8'h40;
					Blue	= 8'h58;
				end
			8'h32:
				begin
					Red		= 8'h00;
					Green	= 8'h88;
					Blue	= 8'h88;
				end
			8'h33:
				begin
					Red		= 8'h00;
					Green	= 8'hE8;
					Blue	= 8'hD8;
				end
			8'h34:
				begin
					Red		= 8'h00;
					Green	= 8'hFC;
					Blue	= 8'hFC;
				end

			// Miscellaneous COLORS
			8'h35:
				begin
					Red		= 8'h00;
					Green	= 8'h00;
					Blue	= 8'h00;
				end
			8'h36:
				begin
					Red		= 8'h00;
					Green	= 8'h00;
					Blue	= 8'h00;
				end
			8'h37:
				begin
					Red		= 8'h78;
					Green	= 8'h78;
					Blue	= 8'h78;
				end
			8'h38:
				begin
					Red		= 8'hF8;
					Green	= 8'hD8;
					Blue	= 8'hF8;
				end

			// BLACK
			8'h39:
				begin
					Red		= 8'h00;
					Green	= 8'h00;
					Blue	= 8'h00;
				end
			8'h3A:
				begin
					Red		= 8'h00;
					Green	= 8'h00;
					Blue	= 8'h00;
				end
			8'h3B:
				begin
					Red		= 8'h00;
					Green	= 8'h00;
					Blue	= 8'h00;
				end
			8'h3C:
				begin
					Red		= 8'h00;
					Green	= 8'h00;
					Blue	= 8'h00;
				end
			default:
				begin
							Red	= 8'h00;
							Green	= 8'h00;
							Blue	= 8'h00;
				end
	endcase
end

endmodule
