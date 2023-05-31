stock SetPlayerMoney(playerid, money) 
{
    PlayerData[playerid][pMoney] += money;

    ResetPlayerMoney(playerid);
    GivePlayerMoney(playerid, PlayerData[playerid][pMoney]);

    new str[14];
    format(str, sizeof(str), "%c%d$", money > 0 ? '+' : '-', Abs(money));

    GameTextForPlayer(playerid, str, 8000, 1);

    if (DiceTablePlayerTextDraw[playerid] != PlayerText: INVALID_TEXT_DRAW)
    {
        new moneystr[11];
        valstr(moneystr, PlayerData[playerid][pMoney]);

        PlayerTextDrawSetString(playerid, DiceTablePlayerTextDraw[playerid], moneystr);
        PlayerTextDrawShow(playerid, DiceTablePlayerTextDraw[playerid]);
    }

    PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);

    return 1;
}