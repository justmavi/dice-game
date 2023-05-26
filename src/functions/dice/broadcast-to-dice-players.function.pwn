stock BroadcastToTablePlayersOnly(tableid, E_TABLE_MESSAGE_TYPE: messageType, const text[], color = -1, time = 1000, style = 6) 
{
	for (new i = 0; i < MAX_DICE_TABLE_PLAYES; i++)
	{
		if (DiceTableInfo[tableid][dtPlayers][i] == INVALID_PLAYER_ID) continue;

		if (messageType == MESSAGE_TYPE_CHAT_TEXT) SendClientMessage(DiceTableInfo[tableid][dtPlayers][i], color, text);
		else if (messageType == MESSAGE_TYPE_GAME_TEXT) GameTextForPlayer(DiceTableInfo[tableid][dtPlayers][i], text, time, style);
	}

	return 1;
}