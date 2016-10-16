module pixelLogic
(						
						input Clk, Reset, playerOn,
						input[4:0] playerPixel, PlayerX, PlayerY, DrawX, DrawY, playerHeight, playerWidth,
						
						output logic [4:0] pixelOut


);


always_ff @(posedge Clk)
begin
	if(Reset)
		pixelOut <= 5'h15;
	else
		begin
			if(playerOn)
			begin
				if(playerPixel != 5'h15)
					pixelOut <= playerPixel;
				else
					pixelOut <= 5'h11;
			end
			else
				pixelOut <= 5'h11;
		end

end

endmodule
