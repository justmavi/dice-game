new PlayerText: DiceTablePlayerTextDraw[MAX_PLAYERS] = { PlayerText: INVALID_TEXT_DRAW, ... };

stock CreateDiceTablePlayerTextDraw(playerid, moneystr[])
{
	DiceTablePlayerTextDraw[playerid] = CreatePlayerTextDraw(playerid, 628.0000, 263.6009, moneystr);
    PlayerTextDrawTextSize(playerid, DiceTablePlayerTextDraw[playerid], 628.0000, 263.6009);
    PlayerTextDrawLetterSize(playerid, DiceTablePlayerTextDraw[playerid], 0.2000, 0.8700);
    PlayerTextDrawAlignment(playerid, DiceTablePlayerTextDraw[playerid], 3);
    PlayerTextDrawColor(playerid, DiceTablePlayerTextDraw[playerid], -1);
    PlayerTextDrawBackgroundColor(playerid, DiceTablePlayerTextDraw[playerid], 255);
    PlayerTextDrawFont(playerid, DiceTablePlayerTextDraw[playerid], 1);
    PlayerTextDrawSetProportional(playerid, DiceTablePlayerTextDraw[playerid], 1);
    PlayerTextDrawSetShadow(playerid, DiceTablePlayerTextDraw[playerid], 0);
	PlayerTextDrawSetSelectable(playerid, DiceTablePlayerTextDraw[playerid], true);
}