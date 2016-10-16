module  Player 
( 
				input	 Reset, frame_clk, Clk, VS, frameCount,	// frame_clk is useful
				input logic[7:0]   keycode,		// WILL BE BASED ON PUSH BUTTONS FOR NOW
				input logic keyPress,

				input logic [1:0]   gameState, 	// makes sure that the player module ignores keycodes if we are not in the play state.
				input logic[9:0] DrawX, DrawY, PlayerX, PlayerY,
				
				output logic [4:0] playerPixels,
				output logic [9:0] playerHeight, playerWidth,
				output logic playerOn
);


logic[9:0]  playerposXWire, playerposYWire;
logic[4:0] spriteVal;				
logic playerMovingWire, directionWire;
logic [31:0] animationOffsetWire, spriteAddressWire;
logic [2:0] directionStateNum;

	playerMovement playerMovementInst
	(									// INPUTS
										.Clk(Clk),
										.Reset(Reset),
										.frame_clk(frame_clk),
										.VS(VS),
										.keycode(keycode),
										.keyPress(keyPress),
										.gameState(gameState),
										
										//OUTPUTS
										.PlayerX(playerposXWire),
										.PlayerY(playerposYWire),
										.PlayerHeight(playerHeight),
										.PlayerWidth(playerWidth),
										.Lives(),
										.Direction(directionWire),
										.playerMoving(playerMovingWire)
	);

	
	playerSprites heroInst
	(									//INPUTS
										.Reset(Reset),
										.frame_Clk(frame_clk),
										.playerDirection(directionWire),
										.DrawX(DrawX),
										.DrawY(DrawY),
										.PlayerX(playerposXWire),
										.PlayerY(playerposYWire),
										.PlayerHeight(10'd72),
										.PlayerWidth(10'd48),
										.animationOffset(animationOffsetWire),
										
										//OUTPUTS
										.playerOn(playerOn),
										.spriteAddress(spriteAddressWire)
	);
	
	playerROM playerROMInst
	(									//INPUTS
										.we(1'b0),
										.Clk(Clk),
										.data_In(5'h15),
										.write_address(32'b0),
										.read_address(spriteAddressWire),
										
										//OUTPUTS
										.data_Out(playerPixels)
	);

	
	playerAnimation playerAnimationInst
	(									//INPUTS
										.Reset(Reset),
										.frameCounter_0(frameCount),
										.moving(playerMovingWire),
										.playerHeight(10'd72),
										.playerWidth(10'd48),
										//.gameState(gameState),
										
										//OUTPUTS
										.animationOffset(animationOffsetWire)
	);

	


endmodule 