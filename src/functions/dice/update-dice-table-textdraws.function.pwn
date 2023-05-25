stock UpdateDiceTableTextDraws(tableid, E_DICE_TABLE_TD_UPDATE_TYPE: updateType, slotId = -1)
{
    switch(updateType)
    {
        case UPDATE_TYPE_BET:
        {
            new bet[10];
            valstr(bet, DiceTableInfo[tableid][dtBet]);

            TextDrawSetString(DicePerTableTextDraws[tableid][DICE_TABLE_BET_TD_IDX], bet);
        }
        case UPDATE_TYPE_BANK:
        {
            new bank[11];
            valstr(bank, DiceTableInfo[tableid][dtBank]);

            TextDrawSetString(DicePerTableTextDraws[tableid][DICE_TABLE_BANK_TD_IDX], bank);
        }
        case UPDATE_TYPE_PLAYERS:
        {     
            if (slotId == -1)
            {
                for (new i = 0; i < MAX_DICE_TABLE_PLAYES; i++) UpdateDiceTablePlayerRow(tableid, i);
            }
            else 
            {
                UpdateDiceTablePlayerRow(tableid, slotId);
            }
        }
        case UPDATE_TYPE_BANK_AND_PLAYERS:
        {
            new bank[11];
            valstr(bank, DiceTableInfo[tableid][dtBank]);

            TextDrawSetString(DicePerTableTextDraws[tableid][DICE_TABLE_BANK_TD_IDX], bank);

            if (slotId == -1)
            {
                for (new i = 0; i < MAX_DICE_TABLE_PLAYES; i++) UpdateDiceTablePlayerRow(tableid, i);
            }
            else 
            {
                UpdateDiceTablePlayerRow(tableid, slotId);
            }
        }
        case UPDATE_TYPE_ALL:
        {
            new str[11];

            valstr(str, DiceTableInfo[tableid][dtBet]);
            TextDrawSetString(DicePerTableTextDraws[tableid][DICE_TABLE_BET_TD_IDX], str);

            valstr(str, DiceTableInfo[tableid][dtBank]);
            TextDrawSetString(DicePerTableTextDraws[tableid][DICE_TABLE_BANK_TD_IDX], str);

            for (new i = 0; i < MAX_DICE_TABLE_PLAYES; i++) UpdateDiceTablePlayerRow(tableid, i);
        }
    }

    foreach (new playerid : DiceTablePlayers[tableid])
    {
        if (updateType == UPDATE_TYPE_BET) ShowTableBetTextDrawForPlayer(playerid, tableid);
        else if (updateType == UPDATE_TYPE_BANK) ShowTableBankTextDrawForPlayer(playerid, tableid);
        else if (updateType == UPDATE_TYPE_PLAYERS) 
        {
            if (slotId == -1)
            {
                for (new i = 0; i < MAX_DICE_TABLE_PLAYES; i++) ShowTableRowTextDrawForPlayer(playerid, tableid, i);
            }
            else 
            {
                ShowTableRowTextDrawForPlayer(playerid, tableid, slotId);
            }
        }
        else if (updateType == UPDATE_TYPE_BANK_AND_PLAYERS) 
        {
            ShowTableBankTextDrawForPlayer(playerid, tableid);

            if (slotId == -1)
            {
                for (new i = 0; i < MAX_DICE_TABLE_PLAYES; i++) ShowTableRowTextDrawForPlayer(playerid, tableid, i);
            }
            else 
            {
                ShowTableRowTextDrawForPlayer(playerid, tableid, slotId);
            }
        }
        else if (updateType == UPDATE_TYPE_ALL)
        {
            ShowTableBetTextDrawForPlayer(playerid, tableid);
            ShowTableBankTextDrawForPlayer(playerid, tableid);
            for (new i = 0; i < MAX_DICE_TABLE_PLAYES; i++) ShowTableRowTextDrawForPlayer(playerid, tableid, i);
        }
    }
}


stock UpdateDiceTablePlayerRow(tableid, rowid)
{
    new 
        nick[MAX_PLAYER_NAME + 1] = "--", 
        rowPlayerNick[3 + sizeof(nick)],
        resultStr[3],
        playerid = DiceTableInfo[tableid][dtPlayers][rowid],
        result = DiceTableInfo[tableid][dtPlayerResults][rowid];

    if (playerid != INVALID_PLAYER_ID)
    {
        nick[0] = EOS;
        strcat(nick, PlayerData[playerid][pName]);
    }

    format(rowPlayerNick, sizeof(rowPlayerNick), "%i. %s", rowid + 1, nick);

    if (!result) resultStr = "--";
    else valstr(resultStr, result);

    TextDrawSetString(DicePerTableTextDraws[tableid][DICE_TABLE_PLAYER_NAME_TD_IDX + 2 * rowid], rowPlayerNick);
    TextDrawSetString(DicePerTableTextDraws[tableid][DICE_TABLE_PLAYER_RESULT_TD_IDX + 2 * rowid], resultStr);
}

stock ShowTableBankTextDrawForPlayer(playerid, tableid)
{
    TextDrawShowForPlayer(playerid, DicePerTableTextDraws[tableid][DICE_TABLE_BANK_TD_IDX]);
}

stock ShowTableBetTextDrawForPlayer(playerid, tableid)
{
    TextDrawShowForPlayer(playerid, DicePerTableTextDraws[tableid][DICE_TABLE_BET_TD_IDX]);
}

stock ShowTableRowTextDrawForPlayer(playerid, tableid, rowid)
{
    TextDrawShowForPlayer(playerid, DicePerTableTextDraws[tableid][DICE_TABLE_PLAYER_NAME_TD_IDX + rowid]);
    TextDrawShowForPlayer(playerid, DicePerTableTextDraws[tableid][DICE_TABLE_PLAYER_RESULT_TD_IDX + rowid]);
}