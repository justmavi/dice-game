new Text: DiceGlobalTextDraws[7] = { Text: INVALID_TEXT_DRAW, ... };

stock CreateDiceGlobalTextDraws()
{
	DiceGlobalTextDraws[1-1] = TextDrawCreate(547.6665, 165.1110, "Box"); // пусто
	TextDrawLetterSize(DiceGlobalTextDraws[1-1], 0.0000, 17.7000);
	TextDrawTextSize(DiceGlobalTextDraws[1-1], 632.0000, 0.0000);
	TextDrawAlignment(DiceGlobalTextDraws[1-1], 1);
	TextDrawColor(DiceGlobalTextDraws[1-1], -723987457);
	TextDrawUseBox(DiceGlobalTextDraws[1-1], 1);
	TextDrawBoxColor(DiceGlobalTextDraws[1-1], -1077952683);
	TextDrawBackgroundColor(DiceGlobalTextDraws[1-1], -1061109505);
	TextDrawFont(DiceGlobalTextDraws[1-1], 1);
	TextDrawSetProportional(DiceGlobalTextDraws[1-1], 1);
	TextDrawSetShadow(DiceGlobalTextDraws[1-1], 0);

	DiceGlobalTextDraws[2-1] = TextDrawCreate(589.6666, 279.5999, "SET_BET"); // пусто
	TextDrawLetterSize(DiceGlobalTextDraws[2-1], 0.3023, 0.9570);
	TextDrawTextSize(DiceGlobalTextDraws[2-1], 9.000, 84.0000);
	TextDrawAlignment(DiceGlobalTextDraws[2-1], 2);
	TextDrawColor(DiceGlobalTextDraws[2-1], -1);
	TextDrawUseBox(DiceGlobalTextDraws[2-1], 1);
	TextDrawBoxColor(DiceGlobalTextDraws[2-1], -1077952683);
	TextDrawBackgroundColor(DiceGlobalTextDraws[2-1], -1077952683);
	TextDrawFont(DiceGlobalTextDraws[2-1], 1);
	TextDrawSetProportional(DiceGlobalTextDraws[2-1], 1);
	TextDrawSetShadow(DiceGlobalTextDraws[2-1], 0);
	TextDrawSetSelectable(DiceGlobalTextDraws[2-1], true);

	DiceGlobalTextDraws[3-1] = TextDrawCreate(589.6666, 291.6296, "DICE"); // пусто
	TextDrawLetterSize(DiceGlobalTextDraws[3-1], 0.3023, 0.9570);
	TextDrawTextSize(DiceGlobalTextDraws[3-1], 9.0000, 84.0000);
	TextDrawAlignment(DiceGlobalTextDraws[3-1], 2);
	TextDrawColor(DiceGlobalTextDraws[3-1], -1);
	TextDrawUseBox(DiceGlobalTextDraws[3-1], 1);
	TextDrawBoxColor(DiceGlobalTextDraws[3-1], -1077952683);
	TextDrawBackgroundColor(DiceGlobalTextDraws[3-1], -1077952683);
	TextDrawFont(DiceGlobalTextDraws[3-1], 1);
	TextDrawSetProportional(DiceGlobalTextDraws[3-1], 1);
	TextDrawSetShadow(DiceGlobalTextDraws[3-1], 0);
	TextDrawSetSelectable(DiceGlobalTextDraws[3-1], true);

	DiceGlobalTextDraws[4-1] = TextDrawCreate(589.6666, 307.0305, "EXIT"); // пусто
	TextDrawLetterSize(DiceGlobalTextDraws[4-1], 0.3023, 0.9570);
	TextDrawTextSize(DiceGlobalTextDraws[4-1], 9.0000, 84.0000);
	TextDrawAlignment(DiceGlobalTextDraws[4-1], 2);
	TextDrawColor(DiceGlobalTextDraws[4-1], -1);
	TextDrawUseBox(DiceGlobalTextDraws[4-1], 1);
	TextDrawBoxColor(DiceGlobalTextDraws[4-1], -1077952683);
	TextDrawBackgroundColor(DiceGlobalTextDraws[4-1], -1077952683);
	TextDrawFont(DiceGlobalTextDraws[4-1], 1);
	TextDrawSetProportional(DiceGlobalTextDraws[4-1], 1);
	TextDrawSetShadow(DiceGlobalTextDraws[4-1], 0);
	TextDrawSetSelectable(DiceGlobalTextDraws[4-1], true);

	DiceGlobalTextDraws[5-1] = TextDrawCreate(550.3331, 248.4888, "Bet:"); // пусто
	TextDrawLetterSize(DiceGlobalTextDraws[5-1], 0.2000, 0.8700);
	TextDrawAlignment(DiceGlobalTextDraws[5-1], 1);
	TextDrawColor(DiceGlobalTextDraws[5-1], -1);
	TextDrawBackgroundColor(DiceGlobalTextDraws[5-1], 255);
	TextDrawFont(DiceGlobalTextDraws[5-1], 1);
	TextDrawSetProportional(DiceGlobalTextDraws[5-1], 1);
	TextDrawSetShadow(DiceGlobalTextDraws[5-1], 0);

	DiceGlobalTextDraws[6-1] = TextDrawCreate(550.3331, 256.2893, "Bank:"); // пусто
	TextDrawLetterSize(DiceGlobalTextDraws[6-1], 0.2000, 0.8700);
	TextDrawAlignment(DiceGlobalTextDraws[6-1], 1);
	TextDrawColor(DiceGlobalTextDraws[6-1], -1);
	TextDrawBackgroundColor(DiceGlobalTextDraws[6-1], 255);
	TextDrawFont(DiceGlobalTextDraws[6-1], 1);
	TextDrawSetProportional(DiceGlobalTextDraws[6-1], 1);
	TextDrawSetShadow(DiceGlobalTextDraws[6-1], 0);

	DiceGlobalTextDraws[7-1] = TextDrawCreate(550.3331, 263.7897, "Balance:"); // пусто
	TextDrawLetterSize(DiceGlobalTextDraws[7-1], 0.2000, 0.8700);
	TextDrawAlignment(DiceGlobalTextDraws[7-1], 1);
	TextDrawColor(DiceGlobalTextDraws[7-1], -1);
	TextDrawBackgroundColor(DiceGlobalTextDraws[7-1], 255);
	TextDrawFont(DiceGlobalTextDraws[7-1], 1);
	TextDrawSetProportional(DiceGlobalTextDraws[7-1], 1);
	TextDrawSetShadow(DiceGlobalTextDraws[7-1], 0);
}