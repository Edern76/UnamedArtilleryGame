unit Game;

interface

Type Tile = record
	Blocked : boolean;
	end;

Type GameField = array[0..800, 0..600] of Tile;

function InitField() : GameField;

function GenerationBorder(x : Integer) : Real;

implementation

function GenerationBorder(x : Integer) : Real;
	BEGIN
	GenerationBorder := 300 * cos(x/350) + 200;
	END;

function InitField() : GameField;
	var i,j : Integer;
	BEGIN
	for i:=0 to 800 do
		BEGIN
		for j:=0 to 600 do
			BEGIN
			InitField[i][j].Blocked := (j >= GenerationBorder(i));
			END;
		END;
	END;

end.
