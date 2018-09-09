unit Display;

interface

uses sdl2, sdl2_image, sysutils, Game;

var mainWindow : PSDL_Window;
	mainRenderer : PSDL_Renderer;
	tileTexture : PSDL_Texture;

procedure ExceptionHandler();
procedure InitializeDisplay();
procedure Update(field : GameField); //Draws a frame.
	

implementation

procedure ExceptionHandler();
	BEGIN
	SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_ERROR, 'Fatal Error !', SDL_GetError, nil);
	HALT;
	END;

procedure InitializeDisplay();
	BEGIN
	if SDL_INIT(SDL_INIT_VIDEO) <> 0 then ExceptionHandler(); //All SDL initialization functions return a return code. If it is different from 0, then an error occured during initialization, so we deliberately close the game and display said error to prevent potential issues from occuring later on, which would be hard to diagnose.
	if SDL_CreateWindowAndRenderer(800, 600, SDL_WINDOW_SHOWN or SDL_WINDOW_BORDERLESS, @mainWindow, @mainRenderer) <> 0 then ExceptionHandler();  // The 'or' operator allows us to combine flags. Hence here the window will be displayed (SDL_WINDOW_SHOWN) and borderless (SDL_WINDOW_BORDERLESS) for testing purposes.
	tileTexture := IMG_LoadTexture(mainRenderer, Pchar(GetCurrentDir() + '/Assets/Sprites/placeholderTile.png'));
	END;
	
procedure Update(field : GameField);
	var x,y : Integer;
		destination : TSDL_Rect;
	BEGIN
	for x:=0 to 800 do
		for y:=0 to 600 do
			if (field[x,y].Blocked) then
				BEGIN
				destination.x := x;
				destination.y := y;
				destination.h := 1;
				destination.w := 1;
				SDL_RenderCopy(mainRenderer, tileTexture, nil, @destination);
				END;
				
	SDL_RenderPresent(mainRenderer);
	SDL_Delay(10000);
 
	SDL_DestroyRenderer(mainRenderer);
	SDL_DestroyWindow (mainWindow);
 
	SDL_Quit;
	END;
	
end.
