CMD:givemoney(playerid, const params[])
{
	if (!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_GREY, !"Вам недоступна эта функция!");
	extract params -> new player: targetId, money; else return SendClientMessage(playerid, -1, !"Введите: /givemoney [id] [сумма]");

	if (!IsPlayerConnected(targetId)) return SendClientMessage(playerid, COLOR_GREY, !"Игрока нет в сети");

	SetPlayerMoney(targetId, money);

	SendClientMessage(playerid, COLOR_GREEN, !"Сумма зачислена на счёт игрока");
	return 1;
}