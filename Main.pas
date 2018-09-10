{$IFDEF DARWIN}
{$linkframework Cocoa}
{$linklib SDL2}
{$linkframework OpenGL}
{$linklib SDL2_image}
{$ENDIF}
Program Main;

uses SDL2, Display, Game;

var Field : GameField;

BEGIN
Field := InitField();
InitializeDisplay();
Update(Field);

END.

