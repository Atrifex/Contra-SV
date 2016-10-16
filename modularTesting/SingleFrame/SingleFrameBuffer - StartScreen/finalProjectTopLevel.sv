
module  finalProjectTopLevel( 	input         CLOCK_50,
											input[3:0]    KEY, //bit 0 is set up as Reset
											input[1:0]	  SW,
											output [6:0]  HEX0, HEX1,// HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
										  //output [8:0]  LEDG,
										  //output [17:0] LEDR,
										  // VGA Interface
											output [7:0]  VGA_R,					//VGA Red
															 VGA_G,					//VGA Green
															 VGA_B,					//VGA Blue
											output        VGA_CLK,				//VGA Clock
															 VGA_SYNC_N,			//VGA Sync signal
															 VGA_BLANK_N,			//VGA Blank signal
															 VGA_VS,					//VGA virtical sync signal
															 VGA_HS					//VGA horizontal sync signal
				
											);

    logic Reset_h, Reset_sh, vssig, Clk;
    logic [9:0] drawxsig, drawysig, ballxsig, ballysig, ballsizesig;
	
	enum logic[1:0] {Wait, PressKey,KeyRelease} keyCur, keyNext;
	logic[10:0] address;
	
	logic [4:0] buffPixel, pixelOut;
	logic [1:0] gameStateWire;
	logic[7:0] keycode;
	logic[6:0] FrameCountWire;
	
	logic[4:0] spriteVal;
	
	assign keycode ={5'b0, ~(KEY[2]), ~(KEY[1]), ~(KEY[0])};
	assign Clk = CLOCK_50;
	assign Reset= ~(KEY[3]);  // The push buttons are active low



	//The connections for nios_system might be named different depending on how you set up Qsys
	

	//Fill in the connections for the rest of the modules
    vga_controller vgasync_instance
	 (
										.Clk(Clk),
										.Reset(Reset),
										.hs(VGA_HS),
										.vs(VGA_VS),
										.pixel_clk(VGA_CLK),
										.blank(VGA_BLANK_N),
										.sync(VGA_SYNC_N),
										.DrawX(drawxsig),
										.DrawY(drawysig)

	 );

	StartScreenMux startScreen_instance
	(
										.frame_Clk(VGA_CLK), 
										.Reset(Reset),
										.FrameCount(FrameCountWire),
										.DrawX(drawxsig),
										.DrawY(drawysig),
										.gameState(gameStateWire),
										.pixelIn(buffPixel),
										.pixelOut(pixelOut)	
	);
	
	 Color_Mapper5Bit color_instance
	 (
										.memMappedValue(pixelOut),
										.Red(VGA_R),
										.Green(VGA_G),
										.Blue(VGA_B)
	 );

	GameController gameControllerInst
	(
										.Clk(Clk),
										.Reset(Reset),
										.keycode(keycode),
										.playerDead(       ),
										.gameState(gameStateWire)
	);

	
	Sprites hero_SpritesInst
	(
										.Clk(Clk),
										.DrawX(drawxsig),
										.DrawY(drawysig),
										.pixelData(spriteVal)
	);
	
	
	FrameCounter frameCount
	(
										.frame_Clk(VGA_CLK),
										.Reset(Reset), 
										.VS(VGA_VS),
										
										.FrameCount(FrameCountWire)
	);
	
	
	FrameBuffer frameBufferInst
	(
	
										.Clk(Clk), 
										.frame_Clk(VGA_CLK),
										.blank(VGA_BLANK_N),
										.Reset(Reset),
										.DrawX(drawxsig),
										.DrawY(drawysig),
										.pixelIn(5'h15),
										.pixelOut(buffPixel)	// this is the pixel data that we output ----> encoded bit	
	);
	
	
	
	
	always_ff @ (posedge Clk)
	begin
		if(Reset)
			address <= 11'b0;
		else
			begin
			keyCur <= keyNext;
			if(keyCur == PressKey)
				address <= address + 11'b00000000001;
			else
				address <= address;
			end
	end
	
	
	always_comb
	begin
		keyNext = keyCur;
		case(keyCur)
			Wait: 		
				begin
					if(~KEY[2])
						keyNext = PressKey;
				end
			PressKey: keyNext = KeyRelease;
			KeyRelease:  		
				begin
					if(KEY[2])
						keyNext = Wait;
				end
		endcase
	end

	 HexDriver hex_inst_0 (spriteVal[3:0], HEX0);
	 HexDriver hex_inst_1 ({3'b0, spriteVal[4]}, HEX1);

	
endmodule
