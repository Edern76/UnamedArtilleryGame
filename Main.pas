Program Main;

uses SDL2, Display, Game;

var Field : GameField;

BEGIN
Field := InitField();
InitializeDisplay();
Update(Field);

END.

