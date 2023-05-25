static const TableLabelPattern[] = "{E3980E}Стол №: {FFFFFF}%d\n{E3980E}Ставка: {FFFFFF}%d\n{E3980E}Банк: {FFFFFF}%d\n{E3980E}Крупье: {FFFFFF}%s\n{E3980E}Игроков: {FFFFFF}%d\n{E3980E}Наблюдают: {FFFFFF}%d";

stock UpdateDiceTable3DText(tableid) 
{
    new text3d[sizeof(TableLabelPattern) - (6 * 2) + 10 + 11 + MAX_PLAYER_NAME + 3 + 1 + 3 + 1];
    
    new dillerId = DiceTableInfo[tableid][dtDillerId];
    new dillerNick[MAX_PLAYER_NAME + 1] = "Нет";
    if (dillerId != INVALID_PLAYER_ID) 
    {
        dillerNick[0] = EOS;
        strcat(dillerNick, PlayerData[dillerId][pName]);
    }

    format(text3d, sizeof(text3d), TableLabelPattern, DiceTableInfo[tableid][dtId], 
        DiceTableInfo[tableid][dtBet], 
        DiceTableInfo[tableid][dtBank], 
        dillerNick,
        DiceTableInfo[tableid][dtPlayersCount], 
        Iter_Count(DiceTablePlayers[tableid]) - DiceTableInfo[tableid][dtPlayersCount] - (dillerId == INVALID_PLAYER_ID ? 0 : 1)
    );

    new Float: x = DiceTableInfo[tableid][dtTableObjectCoords][cX],
        Float: y = DiceTableInfo[tableid][dtTableObjectCoords][cY],
        Float: z = DiceTableInfo[tableid][dtTableObjectCoords][cZ];

    if (_:DiceTableInfo[tableid][dtTableObjectLabelId] == INVALID_3DTEXT_ID)
    {
        DiceTableInfo[tableid][dtTableObjectLabelId] = CreateDynamic3DTextLabel(text3d, -1, x, y, z, 10.0);
    }
    else 
    {
        UpdateDynamic3DTextLabelText(DiceTableInfo[tableid][dtTableObjectLabelId], -1, text3d);
    }
}