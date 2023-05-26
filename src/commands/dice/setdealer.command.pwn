CMD:setdealer(playerid, const params[]) 
{
	if (!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_GREY, !"Вам недоступна эта функция!");
	extract params -> new player: targetId; else return SendClientMessage(playerid, -1, !"Введите: /setdealer [id]");

	if (!IsPlayerConnected(targetId)) return SendClientMessage(playerid, COLOR_GREY, !"Игрока нет в сети");

	PlayerData[targetId][pDiller] = !PlayerData[targetId][pDiller];

	SendClientMessage(playerid, COLOR_GREEN, !"Изменения сохранены");
	return 1;
}