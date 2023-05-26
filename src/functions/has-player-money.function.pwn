stock HasPlayerMoney(playerid, money) 
{
	return PlayerData[playerid][pMoney] >= money;
}