dialog LeaveTableDialog(playerid, response) 
{
    new tableId = PlayerEnteredTableId[playerid];
    if (tableId == -1) return 1;

    if (!response)
    {
        SelectTextDraw(playerid, 0x3495EB55);
        return 1;
    }

    RemovePlayerFromDiceTable(playerid);

    for (new i = 0; i < sizeof(DicePerTableTextDraws[]); i++)
    {
        if (i < sizeof(DiceGlobalTextDraws))
            TextDrawHideForPlayer(playerid, DiceGlobalTextDraws[i]);

        TextDrawHideForPlayer(playerid, DicePerTableTextDraws[tableId][i]);
    }

    return 1;
}

dtempl TemplateOfLeaveTableDialog(playerid) 
{
    return Dialog_Open(playerid, 
        dfunc: LeaveTableDialog, 
        DIALOG_STYLE_MSGBOX, 
        !"{FFFFFF}Кости", 
        !"{FFFFFF} Вы точно хотите покинуть стол? Ваша ставка вернётся, если игра ещё не была начата.", 
        !"Да", 
        !"Нет"
    );
}