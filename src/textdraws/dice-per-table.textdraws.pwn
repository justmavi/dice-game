new Text: DicePerTableTextDraws[MAX_DICE_TABLES][13] = { { Text: INVALID_TEXT_DRAW, ... }, ... };

stock CreateDicePerTableTextdraws(tableid)
{
    new tableIdStr[3],
        tableHeader[6 + sizeof(tableIdStr) + 1] = "Table ";

    valstr(tableIdStr, tableid + 1);
    strcat(tableHeader, tableIdStr);

    DicePerTableTextDraws[tableid][0] = TextDrawCreate(549.4661, 187.9259, "1._--"); // РїСѓСЃС‚Рѕ
    TextDrawLetterSize(DicePerTableTextDraws[tableid][0], 0.1550, 0.8000);
    TextDrawAlignment(DicePerTableTextDraws[tableid][0], 1);
    TextDrawColor(DicePerTableTextDraws[tableid][0], -1);
    TextDrawBackgroundColor(DicePerTableTextDraws[tableid][0], 255);
    TextDrawFont(DicePerTableTextDraws[tableid][0], 1);
    TextDrawSetProportional(DicePerTableTextDraws[tableid][0], 1);
    TextDrawSetShadow(DicePerTableTextDraws[tableid][0], 0);

    DicePerTableTextDraws[tableid][1] = TextDrawCreate(624.00, 188.00, "--"); // РїСѓСЃС‚Рѕ
    TextDrawLetterSize(DicePerTableTextDraws[tableid][1], 0.1550, 0.8000);
    TextDrawAlignment(DicePerTableTextDraws[tableid][1], 2);
    TextDrawColor(DicePerTableTextDraws[tableid][1], -1);
    TextDrawBackgroundColor(DicePerTableTextDraws[tableid][1], 255);
    TextDrawFont(DicePerTableTextDraws[tableid][1], 1);
    TextDrawSetProportional(DicePerTableTextDraws[tableid][1], 1);
    TextDrawSetShadow(DicePerTableTextDraws[tableid][1], 0);

    DicePerTableTextDraws[tableid][2] = TextDrawCreate(549.7993, 196.9264, "2._--"); // РїСѓСЃС‚Рѕ
    TextDrawLetterSize(DicePerTableTextDraws[tableid][2], 0.1550, 0.8000);
    TextDrawAlignment(DicePerTableTextDraws[tableid][2], 1);
    TextDrawColor(DicePerTableTextDraws[tableid][2], -1);
    TextDrawBackgroundColor(DicePerTableTextDraws[tableid][2], 255);
    TextDrawFont(DicePerTableTextDraws[tableid][2], 1);
    TextDrawSetProportional(DicePerTableTextDraws[tableid][2], 1);
    TextDrawSetShadow(DicePerTableTextDraws[tableid][2], 0);

    DicePerTableTextDraws[tableid][3] = TextDrawCreate(624.00, 197.00, "--"); // РїСѓСЃС‚Рѕ
    TextDrawLetterSize(DicePerTableTextDraws[tableid][3], 0.1550, 0.8000);
    TextDrawAlignment(DicePerTableTextDraws[tableid][3], 2);
    TextDrawColor(DicePerTableTextDraws[tableid][3], -1);
    TextDrawBackgroundColor(DicePerTableTextDraws[tableid][3], 255);
    TextDrawFont(DicePerTableTextDraws[tableid][3], 1);
    TextDrawSetProportional(DicePerTableTextDraws[tableid][3], 1);
    TextDrawSetShadow(DicePerTableTextDraws[tableid][3], 0);

    DicePerTableTextDraws[tableid][4] = TextDrawCreate(549.7993, 205.5269, "3._--"); // РїСѓСЃС‚Рѕ
    TextDrawLetterSize(DicePerTableTextDraws[tableid][4], 0.1550, 0.8000);
    TextDrawAlignment(DicePerTableTextDraws[tableid][4], 1);
    TextDrawColor(DicePerTableTextDraws[tableid][4], -1);
    TextDrawBackgroundColor(DicePerTableTextDraws[tableid][4], 255);
    TextDrawFont(DicePerTableTextDraws[tableid][4], 1);
    TextDrawSetProportional(DicePerTableTextDraws[tableid][4], 1);
    TextDrawSetShadow(DicePerTableTextDraws[tableid][4], 0);

    DicePerTableTextDraws[tableid][5] = TextDrawCreate(624.00, 205.00, "--"); // РїСѓСЃС‚Рѕ
    TextDrawLetterSize(DicePerTableTextDraws[tableid][5], 0.1550, 0.8000);
    TextDrawAlignment(DicePerTableTextDraws[tableid][5], 2);
    TextDrawColor(DicePerTableTextDraws[tableid][5], -1);
    TextDrawBackgroundColor(DicePerTableTextDraws[tableid][5], 255);
    TextDrawFont(DicePerTableTextDraws[tableid][5], 1);
    TextDrawSetProportional(DicePerTableTextDraws[tableid][5], 1);
    TextDrawSetShadow(DicePerTableTextDraws[tableid][5], 0);

    DicePerTableTextDraws[tableid][6] = TextDrawCreate(549.7993, 214.3274, "4._--"); // РїСѓСЃС‚Рѕ
    TextDrawLetterSize(DicePerTableTextDraws[tableid][6], 0.1550, 0.8000);
    TextDrawAlignment(DicePerTableTextDraws[tableid][6], 1);
    TextDrawColor(DicePerTableTextDraws[tableid][6], -1);
    TextDrawBackgroundColor(DicePerTableTextDraws[tableid][6], 255);
    TextDrawFont(DicePerTableTextDraws[tableid][6], 1);
    TextDrawSetProportional(DicePerTableTextDraws[tableid][6], 1);
    TextDrawSetShadow(DicePerTableTextDraws[tableid][6], 0);

    DicePerTableTextDraws[tableid][7] = TextDrawCreate(624.00, 214.00, "--"); // РїСѓСЃС‚Рѕ
    TextDrawLetterSize(DicePerTableTextDraws[tableid][7], 0.1550, 0.8000);
    TextDrawAlignment(DicePerTableTextDraws[tableid][7], 2);
    TextDrawColor(DicePerTableTextDraws[tableid][7], -1);
    TextDrawBackgroundColor(DicePerTableTextDraws[tableid][7], 255);
    TextDrawFont(DicePerTableTextDraws[tableid][7], 1);
    TextDrawSetProportional(DicePerTableTextDraws[tableid][7], 1);
    TextDrawSetShadow(DicePerTableTextDraws[tableid][7], 0);

    DicePerTableTextDraws[tableid][8] = TextDrawCreate(549.7993, 223.8280, "5._--"); // РїСѓСЃС‚Рѕ
    TextDrawLetterSize(DicePerTableTextDraws[tableid][8], 0.1550, 0.8000);
    TextDrawAlignment(DicePerTableTextDraws[tableid][8], 1);
    TextDrawColor(DicePerTableTextDraws[tableid][8], -1);
    TextDrawBackgroundColor(DicePerTableTextDraws[tableid][8], 255);
    TextDrawFont(DicePerTableTextDraws[tableid][8], 1);
    TextDrawSetProportional(DicePerTableTextDraws[tableid][8], 1);
    TextDrawSetShadow(DicePerTableTextDraws[tableid][8], 0);

    DicePerTableTextDraws[tableid][9] = TextDrawCreate(624.00, 224.00, "--"); // РїСѓСЃС‚Рѕ
    TextDrawLetterSize(DicePerTableTextDraws[tableid][9], 0.1550, 0.8000);
    TextDrawAlignment(DicePerTableTextDraws[tableid][9], 2);
    TextDrawColor(DicePerTableTextDraws[tableid][9], -1);
    TextDrawBackgroundColor(DicePerTableTextDraws[tableid][9], 255);
    TextDrawFont(DicePerTableTextDraws[tableid][9], 1);
    TextDrawSetProportional(DicePerTableTextDraws[tableid][9], 1);
    TextDrawSetShadow(DicePerTableTextDraws[tableid][9], 0);

    DicePerTableTextDraws[tableid][10] = TextDrawCreate(628.0000, 256.5004, "0"); // РїСѓСЃС‚Рѕ
    TextDrawTextSize(DicePerTableTextDraws[tableid][10], 628.0000, 256.5004);
    TextDrawLetterSize(DicePerTableTextDraws[tableid][10], 0.2000, 0.8700);
    TextDrawAlignment(DicePerTableTextDraws[tableid][10], 3);
    TextDrawColor(DicePerTableTextDraws[tableid][10], -1);
    TextDrawBackgroundColor(DicePerTableTextDraws[tableid][10], 255);
    TextDrawFont(DicePerTableTextDraws[tableid][10], 1);
    TextDrawSetProportional(DicePerTableTextDraws[tableid][10], 1);
    TextDrawSetShadow(DicePerTableTextDraws[tableid][10], 0);

    DicePerTableTextDraws[tableid][11] = TextDrawCreate(628.0000, 248.5000, "0"); // РїСѓСЃС‚Рѕ
    TextDrawTextSize(DicePerTableTextDraws[tableid][11], 628.0000, 248.5000);
    TextDrawLetterSize(DicePerTableTextDraws[tableid][11], 0.2000, 0.8700);
    TextDrawAlignment(DicePerTableTextDraws[tableid][11], 3);
    TextDrawColor(DicePerTableTextDraws[tableid][11], -1);
    TextDrawBackgroundColor(DicePerTableTextDraws[tableid][11], 255);
    TextDrawFont(DicePerTableTextDraws[tableid][11], 1);
    TextDrawSetProportional(DicePerTableTextDraws[tableid][11], 1);
    TextDrawSetShadow(DicePerTableTextDraws[tableid][11], 0);

    DicePerTableTextDraws[tableid][12] = TextDrawCreate(571.3334, 164.2814, tableHeader); // РїСѓСЃС‚Рѕ
	TextDrawLetterSize(DicePerTableTextDraws[tableid][12], 0.4000, 1.6000);
	TextDrawAlignment(DicePerTableTextDraws[tableid][12], 1);
	TextDrawColor(DicePerTableTextDraws[tableid][12], 90351871);
	TextDrawBackgroundColor(DicePerTableTextDraws[tableid][12], 255);
	TextDrawFont(DicePerTableTextDraws[tableid][12], 0);
	TextDrawSetProportional(DicePerTableTextDraws[tableid][12], 1);
	TextDrawSetShadow(DicePerTableTextDraws[tableid][12], 0);
}